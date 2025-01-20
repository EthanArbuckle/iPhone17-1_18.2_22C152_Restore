@interface MSBucketBarConfigurationController
- (BOOL)isBucketBarHiddenForMailboxes:(id)a3;
- (BOOL)setBucketBarHidden:(BOOL)a3 forMailboxes:(id)a4;
- (MSBucketBarConfigurationController)init;
- (MSBucketBarConfigurationController)initWithProvider:(id)a3;
- (id)stateCaptureInformation;
- (int64_t)selectedBucketForMailboxes:(id)a3;
- (void)addConfigurationObserver:(id)a3;
- (void)bucketBarConfigurationProvider:(id)a3 didChangeConfiguration:(id)a4;
- (void)removeConfigurationObserver:(id)a3;
- (void)setSelectedBucket:(int64_t)a3 mailboxes:(id)a4;
@end

@implementation MSBucketBarConfigurationController

- (MSBucketBarConfigurationController)initWithProvider:(id)a3
{
  return (MSBucketBarConfigurationController *)MSBucketBarConfigurationController.init(provider:)(a3);
}

- (BOOL)isBucketBarHiddenForMailboxes:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB83DAB0);
  uint64_t v4 = sub_1BF38B138();
  v5 = self;
  Swift::Bool v6 = MSBucketBarConfigurationController.isBucketBarHidden(forMailboxes:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (BOOL)setBucketBarHidden:(BOOL)a3 forMailboxes:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB83DAB0);
  uint64_t v6 = sub_1BF38B138();
  v7 = self;
  Swift::Bool v8 = MSBucketBarConfigurationController.setBucketBarHidden(_:forMailboxes:)(a3, (Swift::OpaquePointer)v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (int64_t)selectedBucketForMailboxes:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB83DAB0);
  uint64_t v4 = sub_1BF38B138();
  v5 = self;
  Swift::Int v6 = MSBucketBarConfigurationController.selectedBucket(forMailboxes:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (void)setSelectedBucket:(int64_t)a3 mailboxes:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB83DAB0);
  uint64_t v6 = sub_1BF38B138();
  v7 = self;
  MSBucketBarConfigurationController.setSelectedBucket(_:mailboxes:)(a3, (Swift::OpaquePointer)v6);

  swift_bridgeObjectRelease();
}

- (void)addConfigurationObserver:(id)a3
{
}

- (void)removeConfigurationObserver:(id)a3
{
}

- (id)stateCaptureInformation
{
  v2 = self;
  MSBucketBarConfigurationController.stateCaptureInformation()();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA147098);
  v3 = (void *)sub_1BF38B0A8();
  swift_bridgeObjectRelease();
  return v3;
}

- (MSBucketBarConfigurationController)init
{
  result = (MSBucketBarConfigurationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
}

- (void)bucketBarConfigurationProvider:(id)a3 didChangeConfiguration:(id)a4
{
  sub_1BF389484(0, (unint64_t *)&unk_1EB83DAB8);
  uint64_t v5 = sub_1BF38B0B8();
  swift_unknownObjectRetain();
  uint64_t v6 = self;
  sub_1BF389174(v5);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end