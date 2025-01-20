@interface AnnotationImagesView
- (BOOL)hasContent;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC22SubscribePageExtension20AnnotationImagesView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension20AnnotationImagesView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AnnotationImagesView

- (_TtC22SubscribePageExtension20AnnotationImagesView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = sub_10000FB44(&qword_100942F38);
  __chkstk_darwin(v9, v10);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension20AnnotationImagesView_imageViews) = (Class)_swiftEmptyArrayStorage;
  type metadata accessor for AnnotationImagesView.AnnotationImageView();
  v11 = self;
  sub_100764CC0();
  sub_1003093CC();
  sub_1007659A0();

  v14.receiver = v11;
  v14.super_class = ObjectType;
  v12 = -[AnnotationImagesView initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  -[AnnotationImagesView setLayoutMargins:](v12, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  return v12;
}

- (_TtC22SubscribePageExtension20AnnotationImagesView)initWithCoder:(id)a3
{
  return (_TtC22SubscribePageExtension20AnnotationImagesView *)sub_100307C78(a3);
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_beginAccess();
  swift_unknownObjectRetain();
  v5 = self;
  unint64_t v6 = swift_bridgeObjectRetain();
  sub_1004FA308(v6);
  swift_bridgeObjectRelease();
  if (qword_100930CA0 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_10075E5E0();
  sub_10001076C(v7, (uint64_t)qword_100991AD0);
  sub_10075E590();
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.var3 = v19;
  result.var2 = v18;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (BOOL)hasContent
{
  swift_beginAccess();
  type metadata accessor for AnnotationImagesView.AnnotationImageView();
  v3 = self;
  swift_bridgeObjectRetain();
  char v4 = sub_100767850();

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100308DD8();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension20AnnotationImagesView_imageViewReusePool;
  uint64_t v4 = sub_10000FB44(&qword_100942F70);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end