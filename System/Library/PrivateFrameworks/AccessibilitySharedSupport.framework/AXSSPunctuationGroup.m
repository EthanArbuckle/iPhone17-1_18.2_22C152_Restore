@interface AXSSPunctuationGroup
+ (id)punctuationGroupFromJSONRepresentation:(id)a3;
- (AXSSPunctuationGroup)init;
- (BOOL)inCloud;
- (BOOL)inDatabase;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSystemPunctuationGroup;
- (NSArray)entries;
- (NSData)jsonRepresentation;
- (NSDate)ckRecordProcessDate;
- (NSDate)lastModifiedDate;
- (NSDictionary)jsonDictionary;
- (NSSet)autoSwitchContexts;
- (NSString)ckChangeTag;
- (NSString)name;
- (NSUUID)basePunctuationUUID;
- (NSUUID)uuid;
- (id)description;
- (unsigned)version;
- (void)jsonRepresentation;
- (void)setAutoSwitchContexts:(id)a3;
- (void)setBasePunctuationUUID:(id)a3;
- (void)setCkChangeTag:(id)a3;
- (void)setCkRecordProcessDate:(id)a3;
- (void)setEntries:(id)a3;
- (void)setInCloud:(BOOL)a3;
- (void)setInDatabase:(BOOL)a3;
- (void)setLastModifiedDate:(id)a3;
- (void)setName:(id)a3;
- (void)setUuid:(id)a3;
- (void)setVersion:(unsigned __int16)a3;
@end

@implementation AXSSPunctuationGroup

- (AXSSPunctuationGroup)init
{
  v5.receiver = self;
  v5.super_class = (Class)AXSSPunctuationGroup;
  v2 = [(AXSSPunctuationGroup *)&v5 init];
  v3 = [MEMORY[0x1E4F29128] UUID];
  [(AXSSPunctuationGroup *)v2 setUuid:v3];

  [(AXSSPunctuationGroup *)v2 setBasePunctuationUUID:AXSSVoiceOverPunctuationGroupSome];
  [(AXSSPunctuationGroup *)v2 setInDatabase:0];
  [(AXSSPunctuationGroup *)v2 setVersion:1];
  return v2;
}

+ (id)punctuationGroupFromJSONRepresentation:(id)a3
{
  id v22 = 0;
  v3 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:1 error:&v22];
  id v4 = v22;
  if (v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v8 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[AXSSPunctuationGroup punctuationGroupFromJSONRepresentation:v8];
    }
    objc_super v5 = 0;
  }
  else
  {
    objc_super v5 = [[AXSSPunctuationGroup alloc] init];
    v6 = [v3 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [v3 objectForKeyedSubscript:@"name"];
      [(AXSSPunctuationGroup *)v5 setName:v7];
    }
    else
    {
      [(AXSSPunctuationGroup *)v5 setName:&stru_1F0C5BA58];
    }

    v10 = [v3 objectForKeyedSubscript:@"version"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [v3 objectForKeyedSubscript:@"version"];
      -[AXSSPunctuationGroup setVersion:](v5, "setVersion:", (unsigned __int16)[v11 intValue]);
    }
    else
    {
      [(AXSSPunctuationGroup *)v5 setVersion:1];
    }

    v12 = [v3 objectForKeyedSubscript:@"uuid"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = objc_alloc(MEMORY[0x1E4F29128]);
      v14 = [v3 objectForKeyedSubscript:@"uuid"];
      v15 = (void *)[v13 initWithUUIDString:v14];
      [(AXSSPunctuationGroup *)v5 setUuid:v15];
    }
    else
    {
      [(AXSSPunctuationGroup *)v5 setUuid:0];
    }

    v16 = [v3 objectForKeyedSubscript:@"basePunctuationUUID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = objc_alloc(MEMORY[0x1E4F29128]);
      v18 = [v3 objectForKeyedSubscript:@"basePunctuationUUID"];
      v19 = (void *)[v17 initWithUUIDString:v18];
      [(AXSSPunctuationGroup *)v5 setBasePunctuationUUID:v19];
    }
    else
    {
      [(AXSSPunctuationGroup *)v5 setBasePunctuationUUID:0];
    }

    v8 = [v3 objectForKeyedSubscript:@"entries"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = [v3 objectForKeyedSubscript:@"entries"];
      v21 = objc_msgSend(v20, "ax_mappedArrayUsingBlock:", &__block_literal_global_8);
      [(AXSSPunctuationGroup *)v5 setEntries:v21];
    }
    else
    {
      [(AXSSPunctuationGroup *)v5 setEntries:0];
    }
  }

  return v5;
}

id __63__AXSSPunctuationGroup_punctuationGroupFromJSONRepresentation___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[AXSSPunctuationEntry punctuationEntryFromJSONDictionary:a2];
  if (!v2) {
    v2 = objc_opt_new();
  }

  return v2;
}

- (void)setCkRecordProcessDate:(id)a3
{
}

- (NSDictionary)jsonDictionary
{
  v22[5] = *MEMORY[0x1E4F143B8];
  v21[0] = @"name";
  v20 = [(AXSSPunctuationGroup *)self name];
  v22[0] = v20;
  v21[1] = @"basePunctuationUUID";
  v3 = +[AXSSPunctuationManager sharedDatabase];
  id v4 = [v3 mostBasePunctuationGroupForGroup:self];
  uint64_t v5 = [v4 UUIDString];
  v6 = (void *)v5;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = &stru_1F0C5BA58;
  }
  v22[1] = v7;
  v21[2] = @"uuid";
  v8 = [(AXSSPunctuationGroup *)self uuid];
  uint64_t v9 = [v8 UUIDString];
  v10 = (void *)v9;
  if (v9) {
    v11 = (__CFString *)v9;
  }
  else {
    v11 = &stru_1F0C5BA58;
  }
  v22[2] = v11;
  v21[3] = @"version";
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[AXSSPunctuationGroup version](self, "version"));
  v22[3] = v12;
  v21[4] = @"entries";
  id v13 = [(AXSSPunctuationGroup *)self entries];
  uint64_t v14 = objc_msgSend(v13, "ax_mappedArrayUsingBlock:", &__block_literal_global_27);
  v15 = (void *)v14;
  uint64_t v16 = MEMORY[0x1E4F1CBF0];
  if (v14) {
    uint64_t v16 = v14;
  }
  v22[4] = v16;
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:5];
  v18 = (void *)[v17 mutableCopy];

  return (NSDictionary *)v18;
}

uint64_t __38__AXSSPunctuationGroup_jsonDictionary__block_invoke(uint64_t a1, void *a2)
{
  return [a2 jsonDictionary];
}

- (NSString)name
{
  v3 = [(AXSSPunctuationGroup *)self uuid];
  int v4 = [v3 isEqual:AXSSVoiceOverPunctuationGroupNone];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
    v6 = v5;
    v7 = @"PUNCTUATION_GROUP_NONE";
LABEL_7:
    v12 = [v5 localizedStringForKey:v7 value:&stru_1F0C5BA58 table:@"AccessibilitySharedSupport"];

    goto LABEL_8;
  }
  v8 = [(AXSSPunctuationGroup *)self uuid];
  int v9 = [v8 isEqual:AXSSVoiceOverPunctuationGroupSome];

  if (v9)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
    v6 = v5;
    v7 = @"PUNCTUATION_GROUP_SOME";
    goto LABEL_7;
  }
  v10 = [(AXSSPunctuationGroup *)self uuid];
  int v11 = [v10 isEqual:AXSSVoiceOverPunctuationGroupAll];

  if (v11)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
    v6 = v5;
    v7 = @"PUNCTUATION_GROUP_ALL";
    goto LABEL_7;
  }
  v12 = self->_name;
LABEL_8:

  return v12;
}

- (NSData)jsonRepresentation
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(AXSSPunctuationGroup *)self jsonDictionary];
  id v8 = 0;
  int v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  id v5 = v8;

  if (v5)
  {
    v6 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(AXSSPunctuationGroup *)(uint64_t)v5 jsonRepresentation];
    }
  }

  return (NSData *)v4;
}

- (BOOL)isSystemPunctuationGroup
{
  v3 = +[AXSSPunctuationManager sharedDatabase];
  int v4 = [(AXSSPunctuationGroup *)self uuid];
  char v5 = [v3 isBasePunctuationGroup:v4];

  return v5;
}

- (id)description
{
  v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)AXSSPunctuationGroup;
  int v4 = [(AXSSPunctuationGroup *)&v12 description];
  BOOL v5 = [(AXSSPunctuationGroup *)self inCloud];
  v6 = [(AXSSPunctuationGroup *)self ckChangeTag];
  v7 = [(AXSSPunctuationGroup *)self name];
  id v8 = [(AXSSPunctuationGroup *)self autoSwitchContexts];
  int v9 = [(AXSSPunctuationGroup *)self entries];
  v10 = [v3 stringWithFormat:@"%@[%d/%@]: name: %@, contexts: %@, entries: %@", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [v4 uuid];
    v6 = [(AXSSPunctuationGroup *)self uuid];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (NSArray)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
}

- (NSSet)autoSwitchContexts
{
  return self->_autoSwitchContexts;
}

- (void)setAutoSwitchContexts:(id)a3
{
}

- (NSUUID)basePunctuationUUID
{
  return self->_basePunctuationUUID;
}

- (void)setBasePunctuationUUID:(id)a3
{
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned __int16)a3
{
  self->_version = a3;
}

- (BOOL)inCloud
{
  return self->_inCloud;
}

- (void)setInCloud:(BOOL)a3
{
  self->_inCloud = a3;
}

- (NSString)ckChangeTag
{
  return self->_ckChangeTag;
}

- (void)setCkChangeTag:(id)a3
{
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (void)setLastModifiedDate:(id)a3
{
}

- (NSDate)ckRecordProcessDate
{
  return self->_ckRecordProcessDate;
}

- (BOOL)inDatabase
{
  return self->_inDatabase;
}

- (void)setInDatabase:(BOOL)a3
{
  self->_inDatabase = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckRecordProcessDate, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_ckChangeTag, 0);
  objc_storeStrong((id *)&self->_basePunctuationUUID, 0);
  objc_storeStrong((id *)&self->_autoSwitchContexts, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (void)punctuationGroupFromJSONRepresentation:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1B3B9D000, log, OS_LOG_TYPE_ERROR, "Could not json: %@ %@", (uint8_t *)&v3, 0x16u);
}

- (void)jsonRepresentation
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B3B9D000, a2, OS_LOG_TYPE_ERROR, "Could not json: %@", (uint8_t *)&v2, 0xCu);
}

@end