@interface ATXCurrentABGroupDetails
- (ATXCurrentABGroupDetails)init;
- (ATXCurrentABGroupDetails)initWithAssetMapping:(id)a3;
- (NSMutableDictionary)subTypeToABGroup;
- (NSMutableDictionary)subTypeToFinalSubscore;
- (id)abGroupIdentifierForConsumerSubType:(unsigned __int8)a3;
- (id)abGroupIdentifierForFilename:(id)a3;
- (id)finalSubScoreForConsumerSubType:(unsigned __int8)a3;
- (void)loadAssetFromAssetMapping:(id)a3;
- (void)setABGroupFromFilename:(id)a3 subType:(unsigned __int8)a4 filenameToABGroup:(id)a5;
- (void)setFinalSubscore:(id)a3 subType:(unsigned __int8)a4;
@end

@implementation ATXCurrentABGroupDetails

- (ATXCurrentABGroupDetails)init
{
  v3 = [MEMORY[0x1E4F4AEE8] sharedInstanceWithMobileAssets];
  v4 = [(ATXCurrentABGroupDetails *)self initWithAssetMapping:v3];

  return v4;
}

- (ATXCurrentABGroupDetails)initWithAssetMapping:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXCurrentABGroupDetails;
  v5 = [(ATXCurrentABGroupDetails *)&v11 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    subTypeToABGroup = v5->_subTypeToABGroup;
    v5->_subTypeToABGroup = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_opt_new();
    subTypeToFinalSubscore = v5->_subTypeToFinalSubscore;
    v5->_subTypeToFinalSubscore = (NSMutableDictionary *)v8;

    [(ATXCurrentABGroupDetails *)v5 loadAssetFromAssetMapping:v4];
  }

  return v5;
}

- (void)loadAssetFromAssetMapping:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  uint64_t v6 = (void *)MEMORY[0x1E4F4B680];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__ATXCurrentABGroupDetails_loadAssetFromAssetMapping___block_invoke;
  v9[3] = &unk_1E68B57C0;
  id v10 = v4;
  objc_super v11 = self;
  id v12 = v5;
  id v7 = v5;
  id v8 = v4;
  [v6 iterConsumerSubTypesWithBlock:v9];
}

void __54__ATXCurrentABGroupDetails_loadAssetFromAssetMapping___block_invoke(uint64_t a1, uint64_t a2)
{
  id v8 = [*(id *)(a1 + 32) getAssetFileAndSubscoreForConsumerSubType:a2];
  id v4 = *(void **)(a1 + 40);
  v5 = [v8 second];
  [v4 setFinalSubscore:v5 subType:a2];

  uint64_t v6 = *(void **)(a1 + 40);
  id v7 = [v8 first];
  [v6 setABGroupFromFilename:v7 subType:a2 filenameToABGroup:*(void *)(a1 + 48)];
}

- (void)setFinalSubscore:(id)a3 subType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v6 = (__CFString *)a3;
  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v4];
    id v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ATXCurrentABGroupDetails setFinalSubscore:subType:]((uint64_t)v7, v8);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"'subscore' value not specified for consumerSubType of '%@'", v7 format];
    uint64_t v6 = @"TotalScore";
  }
  v9 = [(ATXCurrentABGroupDetails *)self subTypeToFinalSubscore];
  id v10 = [NSNumber numberWithUnsignedChar:v4];
  [v9 setObject:v6 forKeyedSubscript:v10];
}

- (void)setABGroupFromFilename:(id)a3 subType:(unsigned __int8)a4 filenameToABGroup:(id)a5
{
  uint64_t v6 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [v9 objectForKeyedSubscript:v8];

  if (!v10)
  {
    objc_super v11 = [(ATXCurrentABGroupDetails *)self abGroupIdentifierForFilename:v8];
    [v9 setObject:v11 forKeyedSubscript:v8];
  }
  id v12 = [v9 objectForKeyedSubscript:v8];
  v13 = [(ATXCurrentABGroupDetails *)self subTypeToABGroup];
  v14 = [NSNumber numberWithUnsignedChar:v6];
  [v13 setObject:v12 forKeyedSubscript:v14];

  v15 = __atxlog_handle_default();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = [v9 objectForKeyedSubscript:v8];
    v17 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v6];
    int v18 = 138412546;
    v19 = v16;
    __int16 v20 = 2112;
    v21 = v17;
    _os_log_debug_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEBUG, "_ATXAppPredictor ABGroup set to %@ for consumerSubType of '%@'", (uint8_t *)&v18, 0x16u);
  }
}

- (id)abGroupIdentifierForFilename:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F4AF10]);
  v5 = [MEMORY[0x1E4F4AE28] abGroupOverride];
  uint64_t v6 = (void *)[v4 initWithAssetsForResource:v3 ofType:@"plplist" specifiedABGroup:v5];

  if (!v6)
  {
    id v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[ATXCurrentABGroupDetails abGroupIdentifierForFilename:]((uint64_t)v3, v7);
    }
  }
  id v8 = [v6 groupIdentifier];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F4AE28] abGroupNilString];
  }
  objc_super v11 = v10;

  return v11;
}

- (id)abGroupIdentifierForConsumerSubType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v4 = [(ATXCurrentABGroupDetails *)self subTypeToABGroup];
  v5 = [NSNumber numberWithUnsignedChar:v3];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (id)finalSubScoreForConsumerSubType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v4 = [(ATXCurrentABGroupDetails *)self subTypeToFinalSubscore];
  v5 = [NSNumber numberWithUnsignedChar:v3];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (NSMutableDictionary)subTypeToABGroup
{
  return self->_subTypeToABGroup;
}

- (NSMutableDictionary)subTypeToFinalSubscore
{
  return self->_subTypeToFinalSubscore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subTypeToFinalSubscore, 0);
  objc_storeStrong((id *)&self->_subTypeToABGroup, 0);
}

- (void)setFinalSubscore:(uint64_t)a1 subType:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "'subscore' value not specified for consumerSubType of '%@'", (uint8_t *)&v2, 0xCu);
}

- (void)abGroupIdentifierForFilename:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "Couldn't find file %@", (uint8_t *)&v2, 0xCu);
}

@end