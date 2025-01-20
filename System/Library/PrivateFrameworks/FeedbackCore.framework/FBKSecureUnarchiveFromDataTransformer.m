@interface FBKSecureUnarchiveFromDataTransformer
+ (id)allowedTopLevelClasses;
+ (void)initialize;
@end

@implementation FBKSecureUnarchiveFromDataTransformer

+ (void)initialize
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__FBKSecureUnarchiveFromDataTransformer_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, block);
  }
}

void __51__FBKSecureUnarchiveFromDataTransformer_initialize__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = objc_alloc_init(FBKSecureUnarchiveFromDataTransformer);
  [v1 setValueTransformer:v2 forName:@"FBKSecureUnarchiveFromDataTransformer"];
}

+ (id)allowedTopLevelClasses
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__FBKSecureUnarchiveFromDataTransformer_allowedTopLevelClasses__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allowedTopLevelClasses_onceToken != -1) {
    dispatch_once(&allowedTopLevelClasses_onceToken, block);
  }
  v2 = (void *)allowedTopLevelClasses_classes;

  return v2;
}

void __63__FBKSecureUnarchiveFromDataTransformer_allowedTopLevelClasses__block_invoke(uint64_t a1)
{
  v8[6] = *MEMORY[0x263EF8340];
  v1 = (void *)MEMORY[0x263EFF980];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___FBKSecureUnarchiveFromDataTransformer;
  v2 = objc_msgSendSuper2(&v7, sel_allowedTopLevelClasses);
  v3 = [v1 arrayWithArray:v2];

  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  v8[2] = objc_opt_class();
  v8[3] = objc_opt_class();
  v8[4] = objc_opt_class();
  v8[5] = objc_opt_class();
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:6];
  [v3 addObjectsFromArray:v4];

  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithArray:v3];
  v6 = (void *)allowedTopLevelClasses_classes;
  allowedTopLevelClasses_classes = v5;
}

@end