@interface AMLStorageFeatures
- (AMLStorageFeatures)init;
- (AMLStorageFeatures)initWithFeatureProvider:(id)a3 batchProvider:(id)a4 arrayProvider:(id)a5;
- (MLArrayBatchProvider)arrayProvider;
- (MLBatchProvider)batchProvider;
- (MLFeatureProvider)featureProvider;
- (void)setArrayProvider:(id)a3;
- (void)setBatchProvider:(id)a3;
- (void)setFeatureProvider:(id)a3;
@end

@implementation AMLStorageFeatures

- (MLFeatureProvider)featureProvider
{
  v2 = (void *)sub_24776B4F0();

  return (MLFeatureProvider *)v2;
}

- (void)setFeatureProvider:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_24776B55C((uint64_t)a3);
}

- (MLBatchProvider)batchProvider
{
  v2 = (void *)sub_24776B59C();

  return (MLBatchProvider *)v2;
}

- (void)setBatchProvider:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_24776B608((uint64_t)a3);
}

- (MLArrayBatchProvider)arrayProvider
{
  v2 = sub_24776B648();

  return (MLArrayBatchProvider *)v2;
}

- (void)setArrayProvider:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_24776B6D4((uint64_t)a3);
}

- (AMLStorageFeatures)initWithFeatureProvider:(id)a3 batchProvider:(id)a4 arrayProvider:(id)a5
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v8 = a5;
  return (AMLStorageFeatures *)AMLStorageFeatures.init(featureProvider:batchProvider:arrayProvider:)((uint64_t)a3, (uint64_t)a4, a5);
}

- (AMLStorageFeatures)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMLStorageFeatures_arrayProvider);
}

@end