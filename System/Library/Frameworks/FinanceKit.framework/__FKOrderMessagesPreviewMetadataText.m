@interface __FKOrderMessagesPreviewMetadataText
- (CGColor)overrideColor;
- (NSString)text;
- (__FKOrderMessagesPreviewMetadataText)init;
@end

@implementation __FKOrderMessagesPreviewMetadataText

- (NSString)text
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2439582A0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (CGColor)overrideColor
{
  return (CGColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR_____FKOrderMessagesPreviewMetadataText_overrideColor));
}

- (__FKOrderMessagesPreviewMetadataText)init
{
  result = (__FKOrderMessagesPreviewMetadataText *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR_____FKOrderMessagesPreviewMetadataText_overrideColor);
}

@end