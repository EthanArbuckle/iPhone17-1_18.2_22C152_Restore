@interface FSFFeatureStoreService
+ (id)interactionIdForInjection;
+ (id)retrieveCodingWithInteractionId:(id)a3 klass:(Class)a4 error:(id *)a5;
+ (void)insertCodingWithInteractionId:(id)a3 item:(id)a4;
+ (void)insertPBCodableWithInteractionId:(id)a3 item:(id)a4;
- (FSFFeatureStoreService)init;
@end

@implementation FSFFeatureStoreService

+ (id)retrieveCodingWithInteractionId:(id)a3 klass:(Class)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = NSStringFromClass(a4);
  v9 = +[FSFCurareInteractionStream getWithStreamId:v8 sourceType:0];

  v10 = [MEMORY[0x263EFFA08] setWithObject:v7];
  v11 = [v9 retrieve:v10];

  v12 = [v11 objectForKeyedSubscript:v7];

  v13 = [v12 objectAtIndexedSubscript:0];

  v14 = [MEMORY[0x263F08928] unarchivedObjectOfClass:a4 fromData:v13 error:a5];

  return v14;
}

+ (id)interactionIdForInjection
{
  uint64_t v2 = static FeatureStoreService.interactionIdForInjection()();
  if (v3)
  {
    v4 = (void *)MEMORY[0x223C0D7E0](v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (FSFFeatureStoreService)init
{
  return (FSFFeatureStoreService *)FeatureStoreService.init()();
}

+ (void)insertCodingWithInteractionId:(id)a3 item:(id)a4
{
}

+ (void)insertPBCodableWithInteractionId:(id)a3 item:(id)a4
{
}

@end