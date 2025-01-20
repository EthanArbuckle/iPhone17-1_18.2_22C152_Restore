@interface MSUserDefaultsBucketBarConfigurationProvider
- (MSBucketBarConfigurationProviderDelegate)delegate;
- (MSUserDefaultsBucketBarConfigurationProvider)init;
- (MSUserDefaultsBucketBarConfigurationProvider)initWithUserDefaults:(id)a3 delegate:(id)a4;
- (id)bucketBarConfiguration;
- (id)bucketSelectionConfiguration;
- (void)setDelegate:(id)a3;
- (void)storeBucketBarConfiguration:(id)a3;
- (void)storeBucketSelectionConfiguration:(id)a3;
@end

@implementation MSUserDefaultsBucketBarConfigurationProvider

- (MSBucketBarConfigurationProviderDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___MSUserDefaultsBucketBarConfigurationProvider_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1C18A8380](v2);
  return (MSBucketBarConfigurationProviderDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (MSUserDefaultsBucketBarConfigurationProvider)init
{
  id v3 = objc_msgSend(self, sel_em_userDefaults);
  if (v3)
  {
    v4 = v3;
    v5 = [(MSUserDefaultsBucketBarConfigurationProvider *)self initWithUserDefaults:v3 delegate:0];

    return v5;
  }
  else
  {
    result = (MSUserDefaultsBucketBarConfigurationProvider *)sub_1BF38B288();
    __break(1u);
  }
  return result;
}

- (MSUserDefaultsBucketBarConfigurationProvider)initWithUserDefaults:(id)a3 delegate:(id)a4
{
  id v4 = a3;
  swift_unknownObjectRetain();
  return (MSUserDefaultsBucketBarConfigurationProvider *)MSUserDefaultsBucketBarConfigurationProvider.init(userDefaults:delegate:)(v4);
}

- (id)bucketBarConfiguration
{
  return sub_1BF38A3C4(self, (uint64_t)a2, (void (*)(void))MSUserDefaultsBucketBarConfigurationProvider.bucketBarConfiguration());
}

- (void)storeBucketBarConfiguration:(id)a3
{
  sub_1BF389484(0, (unint64_t *)&unk_1EB83DAB8);
  uint64_t v4 = sub_1BF38B0B8();
  v5 = self;
  MSUserDefaultsBucketBarConfigurationProvider.storeBucketBarConfiguration(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (id)bucketSelectionConfiguration
{
  return sub_1BF38A3C4(self, (uint64_t)a2, (void (*)(void))MSUserDefaultsBucketBarConfigurationProvider.bucketSelectionConfiguration());
}

- (void)storeBucketSelectionConfiguration:(id)a3
{
  sub_1BF389484(0, (unint64_t *)&unk_1EB83DAB8);
  sub_1BF38B0B8();
  uint64_t v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MSUserDefaultsBucketBarConfigurationProvider_userDefaults);
  v5 = self;
  v6 = (void *)sub_1BF38B0A8();
  id v7 = (id)sub_1BF38B0C8();
  objc_msgSend(v4, sel_setObject_forKey_, v6, v7);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  sub_1BF38A710((uint64_t)self + OBJC_IVAR___MSUserDefaultsBucketBarConfigurationProvider_delegate);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
}

@end