@interface ImageAnalysisInteractionDelegateProxy
- (BOOL)imageAnalysisInteraction:(id)a3 shouldBeginAtPoint:(CGPoint)a4 forAnalysisType:(unint64_t)a5;
- (CGRect)contentsRectForImageAnalysisInteraction:(id)a3;
- (_TtC9VisionKit37ImageAnalysisInteractionDelegateProxy)init;
- (id)contentViewForImageAnalysisInteraction:(id)a3;
- (id)presentingViewControllerForImageAnalysisInteraction:(id)a3;
- (void)imageAnalysisInteraction:(id)a3 highlightSelectedItemsValueDidChange:(BOOL)a4;
- (void)imageAnalysisInteraction:(id)a3 liveTextButtonDidChangeToVisible:(BOOL)a4;
- (void)textSelectionDidChangeForImageAnalysisInteraction:(id)a3;
@end

@implementation ImageAnalysisInteractionDelegateProxy

- (BOOL)imageAnalysisInteraction:(id)a3 shouldBeginAtPoint:(CGPoint)a4 forAnalysisType:(unint64_t)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  v10 = self;
  LOBYTE(a5) = sub_21796901C(a5, x, y);

  return a5 & 1;
}

- (CGRect)contentsRectForImageAnalysisInteraction:(id)a3
{
  id v4 = a3;
  v5 = self;
  double v6 = sub_217969114();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (id)contentViewForImageAnalysisInteraction:(id)a3
{
  id v4 = a3;
  v5 = self;
  double v6 = (void *)sub_217969204();

  return v6;
}

- (id)presentingViewControllerForImageAnalysisInteraction:(id)a3
{
  id v4 = a3;
  v5 = self;
  double v6 = (void *)sub_2179692C0();

  return v6;
}

- (void)imageAnalysisInteraction:(id)a3 liveTextButtonDidChangeToVisible:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = MEMORY[0x21D450800]((char *)self + OBJC_IVAR____TtC9VisionKit37ImageAnalysisInteractionDelegateProxy_owner, a2);
  if (v7)
  {
    double v8 = (void *)v7;
    uint64_t v9 = v7 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_delegate;
    swift_beginAccess();
    if (MEMORY[0x21D450800](v9))
    {
      uint64_t v10 = *(void *)(v9 + 8);
      uint64_t ObjectType = swift_getObjectType();
      double v12 = *(void (**)(void *, BOOL, uint64_t, uint64_t))(v10 + 40);
      id v13 = a3;
      double v14 = self;
      v12(v8, v4, ObjectType, v10);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

- (void)imageAnalysisInteraction:(id)a3 highlightSelectedItemsValueDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = MEMORY[0x21D450800]((char *)self + OBJC_IVAR____TtC9VisionKit37ImageAnalysisInteractionDelegateProxy_owner, a2);
  if (v7)
  {
    double v8 = (void *)v7;
    uint64_t v9 = v7 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_delegate;
    swift_beginAccess();
    if (MEMORY[0x21D450800](v9))
    {
      uint64_t v10 = *(void *)(v9 + 8);
      uint64_t ObjectType = swift_getObjectType();
      double v12 = *(void (**)(void *, BOOL, uint64_t, uint64_t))(v10 + 48);
      id v13 = a3;
      double v14 = self;
      v12(v8, v4, ObjectType, v10);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

- (void)textSelectionDidChangeForImageAnalysisInteraction:(id)a3
{
  uint64_t v5 = MEMORY[0x21D450800]((char *)self + OBJC_IVAR____TtC9VisionKit37ImageAnalysisInteractionDelegateProxy_owner, a2);
  if (v5)
  {
    double v6 = (void *)v5;
    uint64_t v7 = v5 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_delegate;
    swift_beginAccess();
    if (MEMORY[0x21D450800](v7))
    {
      uint64_t v8 = *(void *)(v7 + 8);
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v10 = *(void (**)(void *, uint64_t, uint64_t))(v8 + 56);
      id v11 = a3;
      double v12 = self;
      v10(v6, ObjectType, v8);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

- (_TtC9VisionKit37ImageAnalysisInteractionDelegateProxy)init
{
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ImageAnalysisInteractionDelegateProxy();
  return [(ImageAnalysisInteractionDelegateProxy *)&v4 init];
}

- (void).cxx_destruct
{
}

@end