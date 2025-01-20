@interface CNAutocompleteAggdProbe
+ (id)preparedBundleIdentifier:(id)a3;
- (CNAutocompleteAggdProbe)init;
- (CNAutocompleteAggdProbe)initWithKeyPrefix:(id)a3;
- (CNAutocompleteAggdProbe)initWithKeyPrefix:(id)a3 bundleIdentifier:(id)a4;
- (NSMutableDictionary)addData;
- (NSMutableDictionary)setData;
- (NSString)bundleID;
- (NSString)keyPrefix;
- (id)fullKey:(id)a3;
- (void)recordAddValue:(id)a3 forKey:(id)a4;
- (void)recordSetValue:(id)a3 forKey:(id)a4;
- (void)sendData;
- (void)setAddData:(id)a3;
- (void)setSetData:(id)a3;
@end

@implementation CNAutocompleteAggdProbe

+ (id)preparedBundleIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"com.apple."])
  {
    v4 = [v3 substringFromIndex:objc_msgSend(@"com.apple.", "length")];
  }
  else
  {
    v4 = @"unknown";
  }

  return v4;
}

- (CNAutocompleteAggdProbe)init
{
  return [(CNAutocompleteAggdProbe *)self initWithKeyPrefix:&stru_1F1A2F2D8 bundleIdentifier:0];
}

- (CNAutocompleteAggdProbe)initWithKeyPrefix:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  v6 = [v4 mainBundle];
  v7 = [v6 bundleIdentifier];
  v8 = [(CNAutocompleteAggdProbe *)self initWithKeyPrefix:v5 bundleIdentifier:v7];

  return v8;
}

- (CNAutocompleteAggdProbe)initWithKeyPrefix:(id)a3 bundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CNAutocompleteAggdProbe;
  v9 = [(CNAutocompleteAggdProbe *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyPrefix, a3);
    uint64_t v11 = [(id)objc_opt_class() preparedBundleIdentifier:v8];
    bundleID = v10->_bundleID;
    v10->_bundleID = (NSString *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    setData = v10->_setData;
    v10->_setData = (NSMutableDictionary *)v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
    addData = v10->_addData;
    v10->_addData = (NSMutableDictionary *)v15;
  }
  return v10;
}

- (id)fullKey:(id)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CNAutocompleteAggdProbe *)self keyPrefix];
  v6 = [(CNAutocompleteAggdProbe *)self bundleID];
  v11[2] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];

  v9 = CNAutocompleteProbeBuildKey(v7, v8);

  return v9;
}

- (void)recordSetValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(CNAutocompleteAggdProbe *)self setData];
  id v8 = [(CNAutocompleteAggdProbe *)self fullKey:v6];

  [v9 setObject:v7 forKeyedSubscript:v8];
}

- (void)recordAddValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(CNAutocompleteAggdProbe *)self addData];
  id v8 = [(CNAutocompleteAggdProbe *)self fullKey:v6];

  [v9 setObject:v7 forKeyedSubscript:v8];
}

- (void)sendData
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(CNAutocompleteAggdProbe *)self addData];
  id v4 = [(CNAutocompleteAggdProbe *)self setData];
  +[CNAutocompleteAggdProbeAggdWrapper ADClientBatchKeysAddKeys:v3 setKeys:v4];

  id v5 = CNALoggingContextProbes();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(CNAutocompleteAggdProbe *)self addData];
    id v7 = [(CNAutocompleteAggdProbe *)self setData];
    int v10 = 138412546;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_impl(&dword_1BEF57000, v5, OS_LOG_TYPE_DEFAULT, "PROBES: add: %@ set: %@", (uint8_t *)&v10, 0x16u);
  }
  id v8 = [(CNAutocompleteAggdProbe *)self addData];
  [v8 removeAllObjects];

  id v9 = [(CNAutocompleteAggdProbe *)self setData];
  [v9 removeAllObjects];
}

- (NSString)keyPrefix
{
  return self->_keyPrefix;
}

- (NSMutableDictionary)setData
{
  return self->_setData;
}

- (void)setSetData:(id)a3
{
}

- (NSMutableDictionary)addData
{
  return self->_addData;
}

- (void)setAddData:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_addData, 0);
  objc_storeStrong((id *)&self->_setData, 0);
  objc_storeStrong((id *)&self->_keyPrefix, 0);
}

@end