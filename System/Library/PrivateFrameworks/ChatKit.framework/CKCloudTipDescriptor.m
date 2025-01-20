@interface CKCloudTipDescriptor
- (_TtC7ChatKit20CKCloudTipDescriptor)init;
- (int64_t)tipType;
@end

@implementation CKCloudTipDescriptor

- (int64_t)tipType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit20CKCloudTipDescriptor_tipType);
}

- (_TtC7ChatKit20CKCloudTipDescriptor)init
{
  result = (_TtC7ChatKit20CKCloudTipDescriptor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end