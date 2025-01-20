@interface UILargeContentViewerItemBridge
- (BOOL)scalesLargeContentImage;
- (BOOL)showsLargeContentViewer;
- (NSString)largeContentTitle;
- (UIEdgeInsets)largeContentImageInsets;
- (UIImage)largeContentImage;
- (_TtC7SwiftUIP33_1C25C4B203EEAC6A19839AC5BDB6A34530UILargeContentViewerItemBridge)init;
@end

@implementation UILargeContentViewerItemBridge

- (NSString)largeContentTitle
{
  uint64_t v2 = *(void *)&self->largeContentTitle[OBJC_IVAR____TtC7SwiftUIP33_1C25C4B203EEAC6A19839AC5BDB6A34530UILargeContentViewerItemBridge_largeContentTitle];
  if (v2)
  {
    uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                    + OBJC_IVAR____TtC7SwiftUIP33_1C25C4B203EEAC6A19839AC5BDB6A34530UILargeContentViewerItemBridge_largeContentTitle);
    swift_bridgeObjectRetain();
    v4 = (void *)MEMORY[0x18C115780](v3, v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (UIImage)largeContentImage
{
  return (UIImage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC7SwiftUIP33_1C25C4B203EEAC6A19839AC5BDB6A34530UILargeContentViewerItemBridge_largeContentImage));
}

- (BOOL)showsLargeContentViewer
{
  return 1;
}

- (BOOL)scalesLargeContentImage
{
  return 1;
}

- (UIEdgeInsets)largeContentImageInsets
{
  double v2 = *MEMORY[0x1E4FB2848];
  double v3 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (_TtC7SwiftUIP33_1C25C4B203EEAC6A19839AC5BDB6A34530UILargeContentViewerItemBridge)init
{
  UIEdgeInsets result = (_TtC7SwiftUIP33_1C25C4B203EEAC6A19839AC5BDB6A34530UILargeContentViewerItemBridge *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  double v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC7SwiftUIP33_1C25C4B203EEAC6A19839AC5BDB6A34530UILargeContentViewerItemBridge_largeContentImage);
}

@end