@interface CATLocalizationHelper
+ (id)helperForBundle:(id)a3;
- (CATLocalizationHelper)initWithBundle:(id)a3;
- (NSBundle)bundle;
- (id)stringByKeyForTableName:(id)a3;
- (id)stringsForKey:(id)a3 value:(id)a4 table:(id)a5;
@end

@implementation CATLocalizationHelper

+ (id)helperForBundle:(id)a3
{
  id v5 = a3;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __41__CATLocalizationHelper_helperForBundle___block_invoke;
  v11 = &__block_descriptor_48_e5_v8__0l;
  id v12 = a1;
  SEL v13 = a2;
  if (helperForBundle__onceToken != -1) {
    dispatch_once(&helperForBundle__onceToken, &v8);
  }
  objc_msgSend((id)helperForBundle__lock, "lock", v8, v9, v10, v11, v12, v13);
  v6 = [(id)helperForBundle__helperByBundle objectForKey:v5];
  if (!v6)
  {
    v6 = [[CATLocalizationHelper alloc] initWithBundle:v5];
    [(id)helperForBundle__helperByBundle setObject:v6 forKey:v5];
  }
  [(id)helperForBundle__lock unlock];

  return v6;
}

void __41__CATLocalizationHelper_helperForBundle___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
  v3 = (void *)helperForBundle__helperByBundle;
  helperForBundle__helperByBundle = v2;

  uint64_t v4 = objc_opt_new();
  id v5 = (void *)helperForBundle__lock;
  helperForBundle__lock = v4;

  v6 = NSString;
  uint64_t v7 = *(void *)(a1 + 32);
  NSStringFromSelector(*(SEL *)(a1 + 40));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v6 stringWithFormat:@"%@.%@", v7, v9];
  [(id)helperForBundle__lock setName:v8];
}

- (CATLocalizationHelper)initWithBundle:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CATLocalizationHelper;
  id v5 = [(CATLocalizationHelper *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_bundle, v4);
    uint64_t v7 = objc_opt_new();
    mLock = v6->mLock;
    v6->mLock = (NSLock *)v7;

    id v9 = [NSString stringWithFormat:@"%@.%p", objc_opt_class(), v6];
    [(NSLock *)v6->mLock setName:v9];

    uint64_t v10 = objc_opt_new();
    mStringByKeyByTableName = v6->mStringByKeyByTableName;
    v6->mStringByKeyByTableName = (NSMutableDictionary *)v10;
  }
  return v6;
}

- (id)stringByKeyForTableName:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"CATLocalizationHelper.m", 98, @"Invalid parameter not satisfying: %@", @"tableName" object file lineNumber description];
  }
  [(NSLock *)self->mLock lock];
  v6 = [(NSMutableDictionary *)self->mStringByKeyByTableName objectForKeyedSubscript:v5];
  if (!v6)
  {
    uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 URLForResource:v5 withExtension:@"strings" subdirectory:@"/" localization:@"en"];
    if (v8)
    {
      id v9 = (void *)v8;
    }
    else
    {
      uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v9 = [v10 URLForResource:v5 withExtension:@"strings" subdirectory:@"/" localization:@"English"];

      if (!v9)
      {
        v6 = 0;
LABEL_15:
        if (v6) {
          v15 = v6;
        }
        else {
          v15 = (void *)MEMORY[0x263EFFA78];
        }
        [(NSMutableDictionary *)self->mStringByKeyByTableName setObject:v15 forKeyedSubscript:v5];

        goto LABEL_19;
      }
    }
    id v19 = 0;
    v11 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfURL:v9 options:2 error:&v19];
    id v12 = v19;
    if (!v11
      || (id v18 = 0,
          [MEMORY[0x263F08AC0] propertyListWithData:v11 options:0 format:0 error:&v18],
          v6 = objc_claimAutoreleasedReturnValue(),
          id v13 = v18,
          v12,
          id v12 = v13,
          !v6))
    {
      if (_CATLogGeneral_onceToken_1 != -1) {
        dispatch_once(&_CATLogGeneral_onceToken_1, &__block_literal_global_3);
      }
      v14 = (void *)_CATLogGeneral_logObj_1;
      if (os_log_type_enabled((os_log_t)_CATLogGeneral_logObj_1, OS_LOG_TYPE_ERROR)) {
        [(CATLocalizationHelper *)(uint64_t)v9 stringByKeyForTableName:v12];
      }
      v6 = 0;
    }

    goto LABEL_15;
  }
LABEL_19:
  [(NSLock *)self->mLock unlock];

  return v6;
}

- (id)stringsForKey:(id)a3 value:(id)a4 table:(id)a5
{
  v24[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  v11 = (__CFString *)a5;
  if (!v9)
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"CATLocalizationHelper.m", 125, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  if (v11) {
    id v12 = v11;
  }
  else {
    id v12 = @"Localizable";
  }
  id v13 = [(CATLocalizationHelper *)self stringByKeyForTableName:v12];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bundle);
  v15 = [WeakRetained localizedStringForKey:v9 value:v10 table:v11];

  uint64_t v16 = [v13 objectForKey:v9];
  v17 = (void *)v16;
  if (v10) {
    id v18 = v10;
  }
  else {
    id v18 = v9;
  }
  if (v16) {
    id v18 = (void *)v16;
  }
  id v19 = v18;

  v23[0] = @"NSLocalizedDescription";
  v23[1] = @"NSDescription";
  v24[0] = v15;
  v24[1] = v19;
  v20 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];

  return v20;
}

- (NSBundle)bundle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bundle);

  return (NSBundle *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_bundle);
  objc_storeStrong((id *)&self->mLock, 0);

  objc_storeStrong((id *)&self->mStringByKeyByTableName, 0);
}

- (void)stringByKeyForTableName:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = [a3 verboseDescription];
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  id v10 = v6;
  _os_log_error_impl(&dword_213B7F000, v5, OS_LOG_TYPE_ERROR, "There was an error reading %@: %@", (uint8_t *)&v7, 0x16u);
}

@end