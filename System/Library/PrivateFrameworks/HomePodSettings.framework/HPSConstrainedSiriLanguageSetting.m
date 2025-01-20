@interface HPSConstrainedSiriLanguageSetting
+ (BOOL)supportsSecureCoding;
- (HPSConstrainedSiriLanguageSetting)initWithCoder:(id)a3;
- (HPSConstrainedSiriLanguageSetting)initWithKeyPath:(id)a3 items:(id)a4;
- (HPSConstrainedSiriLanguageSetting)initWithKeyPath:(id)a3 languageValue:(id)a4 items:(id)a5;
- (NSArray)items;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HPSConstrainedSiriLanguageSetting

- (HPSConstrainedSiriLanguageSetting)initWithKeyPath:(id)a3 languageValue:(id)a4 items:(id)a5
{
  id v8 = a5;
  v9 = [(HPSSiriLanguageSetting *)self initWithKeyPath:a3 languageValue:a4];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    items = v9->_items;
    v9->_items = (NSArray *)v10;
  }
  return v9;
}

- (HPSConstrainedSiriLanguageSetting)initWithKeyPath:(id)a3 items:(id)a4
{
  id v6 = a4;
  v7 = [(HPSSiriLanguageSetting *)self initWithKeyPath:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    items = v7->_items;
    v7->_items = (NSArray *)v8;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)HPSConstrainedSiriLanguageSetting;
  [(HPSSetting *)&v6 encodeWithCoder:v4];
  v5 = [(HPSConstrainedSiriLanguageSetting *)self items];
  if (v5) {
    [v4 encodeObject:v5 forKey:@"setting.items"];
  }
}

- (HPSConstrainedSiriLanguageSetting)initWithCoder:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HPSConstrainedSiriLanguageSetting;
  v5 = [(HPSSetting *)&v21 initWithCoder:v4];
  if (!v5 || ![v4 containsValueForKey:@"setting.items"])
  {
LABEL_13:
    uint64_t v10 = v5;
    goto LABEL_14;
  }
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), v6, 0);
  uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"setting.items"];
  items = v5->_items;
  v5->_items = (NSArray *)v8;

  objc_opt_class();
  uint64_t v10 = 0;
  if (objc_opt_isKindOfClass())
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v11 = v5->_items;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      while (2)
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            uint64_t v10 = 0;
            goto LABEL_14;
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    goto LABEL_13;
  }
LABEL_14:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
}

@end