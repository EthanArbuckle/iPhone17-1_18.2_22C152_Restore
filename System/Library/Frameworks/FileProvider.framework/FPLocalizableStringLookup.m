@interface FPLocalizableStringLookup
- (NSArray)tableNames;
- (NSBundle)bundle;
- (NSString)tableName;
- (id)cfBundle;
- (id)localizedStringForKey:(id)a3;
- (void)setBundle:(id)a3;
- (void)setCfBundle:(id)a3;
- (void)setTableName:(id)a3;
- (void)setTableNames:(id)a3;
@end

@implementation FPLocalizableStringLookup

- (void)setTableNames:(id)a3
{
}

- (void)setCfBundle:(id)a3
{
}

- (id)localizedStringForKey:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [(FPLocalizableStringLookup *)self tableNames];
  uint64_t v21 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v23;
    CFStringRef v5 = @"UNLOCALIZED_FALLBACK_MARKER";
    while (2)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id cfBundle = self->_cfBundle;
        v9 = self->_bundle;
        v10 = (__CFBundle *)cfBundle;
        v11 = v7;
        id v12 = v4;
        v13 = (__CFString *)v4;
        if (v10)
        {
          v14 = (void *)CFBundleCopyLocalizedString(v10, v13, v5, v11);
        }
        else
        {
          v14 = [(NSBundle *)v9 localizedStringForKey:v13 value:v5 table:v11];
        }
        v15 = v14;
        CFStringRef v16 = v5;
        if ([v14 isEqualToString:v5]) {
          id v17 = 0;
        }
        else {
          id v17 = v15;
        }

        if (v17)
        {

          id v4 = v12;
          goto LABEL_17;
        }
        id v4 = v12;
        CFStringRef v5 = v16;
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }

  id v17 = v4;
LABEL_17:

  return v17;
}

- (NSArray)tableNames
{
  return self->_tableNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableNames, 0);
  objc_storeStrong(&self->_cfBundle, 0);

  objc_storeStrong((id *)&self->_bundle, 0);
}

- (void)setTableName:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v7 count:1];

  -[FPLocalizableStringLookup setTableNames:](self, "setTableNames:", v6, v7, v8);
}

- (NSString)tableName
{
  v2 = [(FPLocalizableStringLookup *)self tableNames];
  v3 = [v2 lastObject];

  return (NSString *)v3;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
}

- (id)cfBundle
{
  return self->_cfBundle;
}

@end