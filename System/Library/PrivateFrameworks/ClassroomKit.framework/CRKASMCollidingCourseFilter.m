@interface CRKASMCollidingCourseFilter
+ (id)coursesByFilteringCollidingCoursesFromArray:(id)a3;
@end

@implementation CRKASMCollidingCourseFilter

+ (id)coursesByFilteringCollidingCoursesFromArray:(id)a3
{
  v32[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"identifier.stringValue" ascending:1];
  v32[0] = v4;
  v5 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"name" ascending:1];
  v32[1] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
  v23 = v3;
  v7 = [v3 sortedArrayUsingDescriptors:v6];

  v24 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v26;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v25 + 1) + 8 * v13);
        uint64_t v15 = [v14 identifier];
        if (v15 | v11
          && (v16 = (void *)v15,
              [v14 identifier],
              v17 = objc_claimAutoreleasedReturnValue(),
              char v18 = [v17 isEqual:v11],
              v17,
              v16,
              (v18 & 1) == 0))
        {
          [v24 addObject:v14];
          uint64_t v20 = [v14 identifier];

          uint64_t v11 = v20;
        }
        else
        {
          if (_CRKLogASM_onceToken_0 != -1) {
            dispatch_once(&_CRKLogASM_onceToken_0, &__block_literal_global_1);
          }
          v19 = (void *)_CRKLogASM_logObj_0;
          if (os_log_type_enabled((os_log_t)_CRKLogASM_logObj_0, OS_LOG_TYPE_ERROR)) {
            +[CRKASMCollidingCourseFilter coursesByFilteringCollidingCoursesFromArray:](v29, v19, v14, &v30);
          }
        }
        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v11 = 0;
  }

  v21 = (void *)[v24 copy];

  return v21;
}

+ (void)coursesByFilteringCollidingCoursesFromArray:(void *)a3 .cold.1(uint8_t *a1, void *a2, void *a3, void *a4)
{
  v7 = a2;
  id v8 = [a3 name];
  *(_DWORD *)a1 = 138412290;
  *a4 = v8;
  _os_log_error_impl(&dword_224C00000, v7, OS_LOG_TYPE_ERROR, "Found ClassKit class with colliding identifier. Not vending it. Class name: %@", a1, 0xCu);
}

@end