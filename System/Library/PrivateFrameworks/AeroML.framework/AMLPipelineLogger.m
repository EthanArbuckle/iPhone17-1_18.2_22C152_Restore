@interface AMLPipelineLogger
+ (BOOL)supportsSecureCoding;
- (AMLFeaturesConfiguration)featuresConfiguration;
- (AMLPipelineLogger)init;
- (AMLPipelineLogger)initWithCoder:(id)a3;
- (AMLPipelineLogger)initWithFeaturesConfiguration:(id)a3;
- (id)copyWithZone:(void *)a3;
- (id)logPipeline:(id)a3 features:(id)a4 metadata:(id)a5 async:(BOOL)a6;
- (id)logPipelineAsync:(id)a3 features:(id)a4 metadata:(id)a5 async:(BOOL)a6;
- (void)encodeWithCoder:(id)a3;
- (void)setFeaturesConfiguration:(id)a3;
@end

@implementation AMLPipelineLogger

- (AMLFeaturesConfiguration)featuresConfiguration
{
  id v2 = sub_247775F4C();

  return (AMLFeaturesConfiguration *)v2;
}

- (void)setFeaturesConfiguration:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_247775FB8((uint64_t)v4);
}

- (AMLPipelineLogger)initWithFeaturesConfiguration:(id)a3
{
  return (AMLPipelineLogger *)AMLPipelineLogger.init(featuresConfiguration:)((uint64_t)a3);
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  AMLPipelineLogger.copy(with:)(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  id v4 = (void *)sub_2477BDA88();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  AMLPipelineLogger.encode(with:)((NSCoder)v4);
}

- (AMLPipelineLogger)initWithCoder:(id)a3
{
  return (AMLPipelineLogger *)AMLPipelineLogger.init(coder:)(a3);
}

- (id)logPipeline:(id)a3 features:(id)a4 metadata:(id)a5 async:(BOOL)a6
{
  uint64_t v8 = sub_2477BD6D8();
  uint64_t v10 = v9;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269262900);
  uint64_t v11 = sub_2477BD698();
  id v12 = a5;
  v13 = self;
  sub_247776418(v8, v10, v11, v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v14 = (void *)sub_2477BD6C8();
  swift_bridgeObjectRelease();

  return v14;
}

- (id)logPipelineAsync:(id)a3 features:(id)a4 metadata:(id)a5 async:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v9 = sub_2477BD6D8();
  uint64_t v11 = v10;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269262900);
  uint64_t v12 = sub_2477BD698();
  id v13 = a5;
  v14 = self;
  sub_247776B40(v9, v11, v12, v13, v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v15 = (void *)sub_2477BD6C8();
  swift_bridgeObjectRelease();

  return v15;
}

- (AMLPipelineLogger)init
{
}

- (void).cxx_destruct
{
}

@end