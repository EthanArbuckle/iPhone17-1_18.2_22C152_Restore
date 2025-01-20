@interface HKUCUMUnitDisplayConverter
+ (id)sharedConverter;
- (HKUCUMUnitDisplayConverter)init;
- (NSDictionary)hkUnitNameLookupTable;
- (NSDictionary)synonymLookupTable;
- (id)hkUnitNameForUCUMUnitCode:(id)a3;
- (id)synonymForUCUMUnitString:(id)a3;
- (void)setHkUnitNameLookupTable:(id)a3;
- (void)setSynonymLookupTable:(id)a3;
@end

@implementation HKUCUMUnitDisplayConverter

- (HKUCUMUnitDisplayConverter)init
{
  v3.receiver = self;
  v3.super_class = (Class)HKUCUMUnitDisplayConverter;
  return [(HKUCUMUnitDisplayConverter *)&v3 init];
}

+ (id)sharedConverter
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__HKUCUMUnitDisplayConverter_sharedConverter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedConverter_onceToken != -1) {
    dispatch_once(&sharedConverter_onceToken, block);
  }
  v2 = (void *)sharedConverter_sharedUCUMUnitDisplayConverter;

  return v2;
}

uint64_t __45__HKUCUMUnitDisplayConverter_sharedConverter__block_invoke(uint64_t a1)
{
  sharedConverter_sharedUCUMUnitDisplayConverter = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (NSDictionary)synonymLookupTable
{
  synonymLookupTable = self->_synonymLookupTable;
  if (synonymLookupTable)
  {
    objc_super v3 = synonymLookupTable;
  }
  else
  {
    v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v6 = [v5 pathForResource:@"ucum-synonyms" ofType:@"plist"];
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v6];
    [(HKUCUMUnitDisplayConverter *)self setSynonymLookupTable:v7];

    objc_super v3 = self->_synonymLookupTable;
  }

  return v3;
}

- (NSDictionary)hkUnitNameLookupTable
{
  hkUnitNameLookupTable = self->_hkUnitNameLookupTable;
  if (hkUnitNameLookupTable)
  {
    objc_super v3 = hkUnitNameLookupTable;
  }
  else
  {
    v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v6 = [v5 pathForResource:@"ucum-to-hkunit-mapping" ofType:@"plist"];
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v6];
    [(HKUCUMUnitDisplayConverter *)self setHkUnitNameLookupTable:v7];

    objc_super v3 = self->_hkUnitNameLookupTable;
  }

  return v3;
}

- (id)synonymForUCUMUnitString:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"HKUCUMUnitDisplayConverter.m", 60, @"Invalid parameter not satisfying: %@", @"unitString != nil" object file lineNumber description];
  }
  v6 = [(HKUCUMUnitDisplayConverter *)self synonymLookupTable];
  v7 = [v6 objectForKey:v5];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    v9 = [v5 stringByReplacingOccurrencesOfString:@"10*" withString:@"10^"];
    v10 = [v9 stringByReplacingOccurrencesOfString:@" {" withString:@" "];
    v11 = [v10 stringByReplacingOccurrencesOfString:@"} " withString:@" "];
    v12 = [v11 stringByReplacingOccurrencesOfString:@"{" withString:&stru_1EEC60288];
    v13 = [v12 stringByReplacingOccurrencesOfString:@"}" withString:&stru_1EEC60288];

    uint64_t v20 = 0;
    v14 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\s+" options:1 error:&v20];
    v15 = objc_msgSend(v14, "stringByReplacingMatchesInString:options:range:withTemplate:", v13, 0, 0, objc_msgSend(v13, "length"), @" ");

    v16 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v17 = [v15 stringByTrimmingCharactersInSet:v16];

    id v8 = v17;
  }

  return v8;
}

- (id)hkUnitNameForUCUMUnitCode:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(HKUCUMUnitDisplayConverter *)self hkUnitNameLookupTable];
    uint64_t v6 = [v5 objectForKeyedSubscript:v4];
    v7 = (void *)v6;
    if (v6) {
      id v8 = (void *)v6;
    }
    else {
      id v8 = v4;
    }
    id v9 = v8;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)setSynonymLookupTable:(id)a3
{
}

- (void)setHkUnitNameLookupTable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hkUnitNameLookupTable, 0);

  objc_storeStrong((id *)&self->_synonymLookupTable, 0);
}

@end