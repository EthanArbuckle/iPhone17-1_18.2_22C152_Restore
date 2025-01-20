@interface DebugHierarchyMetaDataAction
- (BOOL)matchesEnumsForProviderClass:(Class)a3;
- (BOOL)matchesOptionsForProviderClass:(Class)a3;
- (BOOL)metaDataProviderClassesForEnumsAreExclusive;
- (BOOL)metaDataProviderClassesForOptionsAreExclusive;
- (NSArray)metaDataProviderClassesForEnums;
- (NSArray)metaDataProviderClassesForOptions;
- (id)keysToArchiveViaKVC;
- (void)performInContext:(id)a3;
- (void)setMetaDataProviderClassesForEnums:(id)a3;
- (void)setMetaDataProviderClassesForEnums:(id)a3 exclusive:(BOOL)a4;
- (void)setMetaDataProviderClassesForEnumsAreExclusive:(BOOL)a3;
- (void)setMetaDataProviderClassesForOptions:(id)a3;
- (void)setMetaDataProviderClassesForOptions:(id)a3 exclusive:(BOOL)a4;
- (void)setMetaDataProviderClassesForOptionsAreExclusive:(BOOL)a3;
@end

@implementation DebugHierarchyMetaDataAction

- (void)setMetaDataProviderClassesForEnums:(id)a3 exclusive:(BOOL)a4
{
  BOOL v4 = a4;
  [(DebugHierarchyMetaDataAction *)self setMetaDataProviderClassesForEnums:a3];
  [(DebugHierarchyMetaDataAction *)self setMetaDataProviderClassesForEnumsAreExclusive:v4];
}

- (void)setMetaDataProviderClassesForOptions:(id)a3 exclusive:(BOOL)a4
{
  BOOL v4 = a4;
  [(DebugHierarchyMetaDataAction *)self setMetaDataProviderClassesForOptions:a3];
  [(DebugHierarchyMetaDataAction *)self setMetaDataProviderClassesForOptionsAreExclusive:v4];
}

- (id)keysToArchiveViaKVC
{
  v4[0] = @"metaDataProviderClassesForEnums";
  v4[1] = @"metaDataProviderClassesForEnumsAreExclusive";
  v4[2] = @"metaDataProviderClassesForOptions";
  v4[3] = @"metaDataProviderClassesForOptionsAreExclusive";
  v2 = +[NSArray arrayWithObjects:v4 count:4];
  return v2;
}

- (void)performInContext:(id)a3
{
  id v4 = a3;
  DebugHierarchyMetaDataProviderClasses();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v19;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if ([(DebugHierarchyMetaDataAction *)self matchesEnumsForProviderClass:v8]
          && +[DebugHierarchyMetaDataProviderProtocolHelper classImplementsRequiredEnumDescriptionMethods:v8])
        {
          v9 = +[DebugHierarchyMetaDataProviderProtocolHelper debugHierarchyEnumDescriptionsOnClass:v8];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v10 = [v4 metaData];
            id v11 = [v10 objectForKeyedSubscript:@"metaDataEnums"];

            if (v11)
            {
              [v11 addEntriesFromDictionary:v9];
            }
            else
            {
              id v11 = [v9 mutableCopy];
              v12 = [v4 metaData];
              [v12 setObject:v11 forKeyedSubscript:@"metaDataEnums"];
            }
          }
        }
        if ([(DebugHierarchyMetaDataAction *)self matchesOptionsForProviderClass:v8]|| +[DebugHierarchyMetaDataProviderProtocolHelper classImplementsRequiredOptionDescriptionMethods:v8])
        {
          v13 = +[DebugHierarchyMetaDataProviderProtocolHelper debugHierarchyOptionDescriptionsOnClass:v8];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v14 = [v4 metaData];
            id v15 = [v14 objectForKeyedSubscript:@"metaDataOptions"];

            if (v15)
            {
              [v15 addEntriesFromDictionary:v13];
            }
            else
            {
              id v15 = [v13 mutableCopy];
              v16 = [v4 metaData];
              [v16 setObject:v15 forKeyedSubscript:@"metaDataOptions"];
            }
          }
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
}

- (BOOL)matchesEnumsForProviderClass:(Class)a3
{
  id v5 = [(DebugHierarchyMetaDataAction *)self metaDataProviderClassesForEnums];

  if (!v5) {
    return 1;
  }
  uint64_t v6 = [(DebugHierarchyMetaDataAction *)self metaDataProviderClassesForEnums];
  v7 = NSStringFromClass(a3);
  unsigned __int8 v8 = [v6 containsObject:v7];

  return v8 ^ [(DebugHierarchyMetaDataAction *)self metaDataProviderClassesForEnumsAreExclusive] ^ 1;
}

- (BOOL)matchesOptionsForProviderClass:(Class)a3
{
  id v5 = [(DebugHierarchyMetaDataAction *)self metaDataProviderClassesForOptions];

  if (!v5) {
    return 1;
  }
  uint64_t v6 = [(DebugHierarchyMetaDataAction *)self metaDataProviderClassesForOptions];
  v7 = NSStringFromClass(a3);
  unsigned __int8 v8 = [v6 containsObject:v7];

  return v8 ^ [(DebugHierarchyMetaDataAction *)self metaDataProviderClassesForOptionsAreExclusive] ^ 1;
}

- (NSArray)metaDataProviderClassesForEnums
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMetaDataProviderClassesForEnums:(id)a3
{
}

- (BOOL)metaDataProviderClassesForEnumsAreExclusive
{
  return self->_metaDataProviderClassesForEnumsAreExclusive;
}

- (void)setMetaDataProviderClassesForEnumsAreExclusive:(BOOL)a3
{
  self->_metaDataProviderClassesForEnumsAreExclusive = a3;
}

- (NSArray)metaDataProviderClassesForOptions
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMetaDataProviderClassesForOptions:(id)a3
{
}

- (BOOL)metaDataProviderClassesForOptionsAreExclusive
{
  return self->_metaDataProviderClassesForOptionsAreExclusive;
}

- (void)setMetaDataProviderClassesForOptionsAreExclusive:(BOOL)a3
{
  self->_metaDataProviderClassesForOptionsAreExclusive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaDataProviderClassesForOptions, 0);
  objc_storeStrong((id *)&self->_metaDataProviderClassesForEnums, 0);
}

@end