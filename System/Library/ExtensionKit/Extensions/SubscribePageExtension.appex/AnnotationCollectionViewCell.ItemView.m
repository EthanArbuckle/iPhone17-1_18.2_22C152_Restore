@interface AnnotationCollectionViewCell.ItemView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtCC22SubscribePageExtension28AnnotationCollectionViewCell8ItemView)initWithCoder:(id)a3;
- (_TtCC22SubscribePageExtension28AnnotationCollectionViewCell8ItemView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AnnotationCollectionViewCell.ItemView

- (_TtCC22SubscribePageExtension28AnnotationCollectionViewCell8ItemView)initWithFrame:(CGRect)a3
{
  return (_TtCC22SubscribePageExtension28AnnotationCollectionViewCell8ItemView *)sub_1005A6844(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC22SubscribePageExtension28AnnotationCollectionViewCell8ItemView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC22SubscribePageExtension28AnnotationCollectionViewCell8ItemView_leadingPairLabels) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC22SubscribePageExtension28AnnotationCollectionViewCell8ItemView_trailingPairLabels) = (Class)_swiftEmptyArrayStorage;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtCC22SubscribePageExtension28AnnotationCollectionViewCell8ItemView_isLastItem) = 0;
  id v4 = a3;

  result = (_TtCC22SubscribePageExtension28AnnotationCollectionViewCell8ItemView *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = sub_1007649F0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10075F2D0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  v13 = (char *)&v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15.receiver = self;
  v15.super_class = ObjectType;
  v14 = self;
  [(AnnotationCollectionViewCell.ItemView *)&v15 layoutSubviews];
  sub_1005A6BF0();
  sub_10075C580();
  sub_10075F290();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  uint64_t v5 = sub_10075F2D0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectRetain();
  uint64_t v10 = self;
  sub_1005A6BF0();
  sub_10075F280();
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  swift_unknownObjectRelease();

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.var3 = v22;
  result.var2 = v21;
  result.var1 = v20;
  result.var0 = v19;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC22SubscribePageExtension28AnnotationCollectionViewCell8ItemView_headingArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC22SubscribePageExtension28AnnotationCollectionViewCell8ItemView_headingTextLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC22SubscribePageExtension28AnnotationCollectionViewCell8ItemView_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC22SubscribePageExtension28AnnotationCollectionViewCell8ItemView_listTextLabel));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end