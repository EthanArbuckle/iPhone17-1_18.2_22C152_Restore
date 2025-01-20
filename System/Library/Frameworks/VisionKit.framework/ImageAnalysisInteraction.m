@interface ImageAnalysisInteraction
- (UIView)view;
- (_TtC9VisionKit24ImageAnalysisInteraction)init;
- (void)didMoveToView:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation ImageAnalysisInteraction

- (UIView)view
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_view);

  return (UIView *)v2;
}

- (_TtC9VisionKit24ImageAnalysisInteraction)init
{
  return (_TtC9VisionKit24ImageAnalysisInteraction *)ImageAnalysisInteraction.init()();
}

- (void)willMoveToView:(id)a3
{
  if (!a3)
  {
    v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
    v8 = self;
    v5 = (_TtC9VisionKit24ImageAnalysisInteraction *)objc_msgSend(v4, sel_view);
    if (v5)
    {
      v6 = v5;
      [(ImageAnalysisInteraction *)v5 removeInteraction:v4];

      v7 = v6;
    }
    else
    {
      v7 = v8;
    }
  }
}

- (void)didMoveToView:(id)a3
{
  if (a3)
  {
    v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
    v6 = self;
    id v5 = a3;
    objc_msgSend(v5, sel_addInteraction_, v4);
    sub_21796860C(0, &qword_267BA4450);
    objc_msgSend(v4, sel_setWantsAutomaticContentsRectCalculation_, objc_msgSend(v5, sel_isKindOfClass_, swift_getObjCClassFromMetadata()));
  }
}

- (void).cxx_destruct
{
  sub_21796937C((uint64_t)self + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_delegate);

  swift_release();
}

@end