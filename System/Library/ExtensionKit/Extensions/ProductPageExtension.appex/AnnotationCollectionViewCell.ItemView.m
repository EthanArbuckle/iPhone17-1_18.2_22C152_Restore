@interface AnnotationCollectionViewCell.ItemView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtCC20ProductPageExtension28AnnotationCollectionViewCell8ItemView)initWithCoder:(id)a3;
- (_TtCC20ProductPageExtension28AnnotationCollectionViewCell8ItemView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AnnotationCollectionViewCell.ItemView

- (_TtCC20ProductPageExtension28AnnotationCollectionViewCell8ItemView)initWithFrame:(CGRect)a3
{
  return (_TtCC20ProductPageExtension28AnnotationCollectionViewCell8ItemView *)sub_10056A634(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC20ProductPageExtension28AnnotationCollectionViewCell8ItemView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC20ProductPageExtension28AnnotationCollectionViewCell8ItemView_leadingPairLabels) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC20ProductPageExtension28AnnotationCollectionViewCell8ItemView_trailingPairLabels) = (Class)_swiftEmptyArrayStorage;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtCC20ProductPageExtension28AnnotationCollectionViewCell8ItemView_isLastItem) = 0;
  id v4 = a3;

  result = (_TtCC20ProductPageExtension28AnnotationCollectionViewCell8ItemView *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = sub_100779050();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100773890();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13.receiver = self;
  v13.super_class = ObjectType;
  v12 = self;
  [(AnnotationCollectionViewCell.ItemView *)&v13 layoutSubviews];
  sub_10056A9E0();
  sub_100770A80();
  sub_100773850();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  uint64_t v5 = sub_100773890();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectRetain();
  uint64_t v9 = self;
  sub_10056A9E0();
  sub_100773840();
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_unknownObjectRelease();

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.var3 = v21;
  result.var2 = v20;
  result.var1 = v19;
  result.var0 = v18;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC20ProductPageExtension28AnnotationCollectionViewCell8ItemView_headingArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC20ProductPageExtension28AnnotationCollectionViewCell8ItemView_headingTextLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC20ProductPageExtension28AnnotationCollectionViewCell8ItemView_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC20ProductPageExtension28AnnotationCollectionViewCell8ItemView_listTextLabel));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end