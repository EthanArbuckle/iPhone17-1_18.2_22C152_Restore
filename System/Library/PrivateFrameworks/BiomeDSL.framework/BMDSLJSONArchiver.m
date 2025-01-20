@interface BMDSLJSONArchiver
+ (id)archiveCompatibleObjectWithObject:(id)a3 options:(unint64_t)a4 userInfo:(id)a5;
+ (id)archivedDataWithDSL:(id)a3;
+ (id)archivedDataWithObject:(id)a3;
+ (id)archivedStringWithDSL:(id)a3;
+ (id)archivedStringWithObject:(id)a3;
+ (void)registerJSONTransformers;
@end

@implementation BMDSLJSONArchiver

+ (id)archivedStringWithDSL:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() archivedDataWithDSL:v3];

  v5 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
  return v5;
}

+ (id)archivedDataWithDSL:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_class();
  v8 = @"dsl";
  v9[0] = v3;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  v6 = [v4 archivedDataWithObject:v5];

  return v6;
}

+ (id)archivedStringWithObject:(id)a3
{
  id v3 = [a1 archivedDataWithObject:a3];
  if (v3) {
    v4 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
  }
  else {
    v4 = 0;
  }

  return v4;
}

+ (id)archivedDataWithObject:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(BMDSLJSONCoder);
  v5 = [(BMDSLJSONCoder *)v4 encodeDataFromRootObject:v3];

  return v5;
}

+ (id)archiveCompatibleObjectWithObject:(id)a3 options:(unint64_t)a4 userInfo:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = [[BMDSLJSONCoder alloc] initWithOptions:a4];
  [(BMDSLJSONCoder *)v9 setUserInfo:v7];

  v10 = [(BMDSLJSONCoder *)v9 encodingCompatibleObjectFromRootObject:v8];

  return v10;
}

+ (void)registerJSONTransformers
{
  if (registerJSONTransformers_onceToken != -1) {
    dispatch_once(&registerJSONTransformers_onceToken, &__block_literal_global_0);
  }
}

uint64_t __58__BMDSLJSONArchiver_CustomTypes__registerJSONTransformers__block_invoke()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t result = [MEMORY[0x1E4F1CC08] countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)v10;
    id v3 = (void *)MEMORY[0x1E4F1CC08];
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v10 != v2) {
          objc_enumerationMutation(v3);
        }
        v5 = *(void **)(*((void *)&v9 + 1) + 8 * v4);
        v6 = (void *)MEMORY[0x1E4F29248];
        id v7 = [v3 objectForKeyedSubscript:v5];
        id v8 = BMDSLRegisterJSONTransformerNameFromEncodingDescriptor(v5);
        [v6 setValueTransformer:v7 forName:v8];

        ++v4;
      }
      while (v1 != v4);
      uint64_t result = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v1 = result;
    }
    while (result);
  }
  return result;
}

@end