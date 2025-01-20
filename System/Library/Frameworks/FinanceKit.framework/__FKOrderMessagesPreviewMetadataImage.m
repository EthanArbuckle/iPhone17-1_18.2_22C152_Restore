@interface __FKOrderMessagesPreviewMetadataImage
- (NSData)data;
- (__FKOrderMessagesPreviewMetadataImage)init;
- (unsigned)kind;
@end

@implementation __FKOrderMessagesPreviewMetadataImage

- (NSData)data
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR_____FKOrderMessagesPreviewMetadataImage_data);
  unint64_t v3 = *(void *)&self->data[OBJC_IVAR_____FKOrderMessagesPreviewMetadataImage_data];
  sub_243403DD0(v2, v3);
  v4 = (void *)sub_2439570A0();
  sub_2433807F0(v2, v3);

  return (NSData *)v4;
}

- (unsigned)kind
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR_____FKOrderMessagesPreviewMetadataImage_kind);
}

- (__FKOrderMessagesPreviewMetadataImage)init
{
  result = (__FKOrderMessagesPreviewMetadataImage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end