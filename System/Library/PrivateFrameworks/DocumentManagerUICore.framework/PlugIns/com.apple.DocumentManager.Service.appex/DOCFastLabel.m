@interface DOCFastLabel
- (CGRect)textRectForBounds:(CGRect)a3 limitedToNumberOfLines:(int64_t)a4;
- (CGSize)doc_effectiveContentSize;
- (NSAttributedString)attributedText;
- (NSString)text;
- (_TtC33com_apple_DocumentManager_Service12DOCFastLabel)initWithCoder:(id)a3;
- (_TtC33com_apple_DocumentManager_Service12DOCFastLabel)initWithFrame:(CGRect)a3;
- (double)contentScaleFactor;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setAttributedText:(id)a3;
- (void)setContentScaleFactor:(double)a3;
- (void)setText:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DOCFastLabel

- (_TtC33com_apple_DocumentManager_Service12DOCFastLabel)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC33com_apple_DocumentManager_Service12DOCFastLabel_textLayer;
  id v9 = objc_allocWithZone((Class)type metadata accessor for DOCFastLabel.FastLabelLayer());
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)[v9 init];

  v14.receiver = v10;
  v14.super_class = (Class)type metadata accessor for DOCFastLabel();
  v11 = -[DOCFastLabel initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  id v12 = [(DOCFastLabel *)v11 layer];
  [v12 addSublayer:*(Class *)((char *)&v11->super.super.super.super.isa+ OBJC_IVAR____TtC33com_apple_DocumentManager_Service12DOCFastLabel_textLayer)];

  return v11;
}

- (_TtC33com_apple_DocumentManager_Service12DOCFastLabel)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC33com_apple_DocumentManager_Service12DOCFastLabel_textLayer;
  id v6 = objc_allocWithZone((Class)type metadata accessor for DOCFastLabel.FastLabelLayer());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC33com_apple_DocumentManager_Service12DOCFastLabel *)sub_1004CEE70();
  __break(1u);
  return result;
}

- (NSString)text
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DOCFastLabel();
  id v2 = v7.receiver;
  v3 = [(DOCFastLabel *)&v7 text];
  if (v3)
  {
    v4 = v3;
    sub_1004CD2F0();

    NSString v5 = sub_1004CD2B0();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setText:(id)a3
{
}

- (NSAttributedString)attributedText
{
  id v2 = self;
  id v3 = sub_1004197AC();

  return (NSAttributedString *)v3;
}

- (void)setAttributedText:(id)a3
{
}

- (double)contentScaleFactor
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCFastLabel();
  [(DOCFastLabel *)&v3 contentScaleFactor];
  return result;
}

- (void)setContentScaleFactor:(double)a3
{
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for DOCFastLabel();
  v4 = (char *)v12.receiver;
  [(DOCFastLabel *)&v12 setContentScaleFactor:a3];
  NSString v5 = *(void **)&v4[OBJC_IVAR____TtC33com_apple_DocumentManager_Service12DOCFastLabel_textLayer];
  id v6 = objc_msgSend(v4, "layer", v12.receiver, v12.super_class);
  [v6 contentsScale];
  double v8 = v7;

  [v5 setContentsScale:v8];
  id v9 = [v4 layer];
  [v9 rasterizationScale];
  double v11 = v10;

  [v5 setRasterizationScale:v11];
}

- (CGRect)textRectForBounds:(CGRect)a3 limitedToNumberOfLines:(int64_t)a4
{
  sub_10003B0B8(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC33com_apple_DocumentManager_Service12DOCFastLabel_textLayer)+ OBJC_IVAR____TtCC33com_apple_DocumentManager_Service12DOCFastLabelP33_7D25665A06605AE161E4D244A1D6EF7A14FastLabelLayer_labelInformation, (uint64_t)v15, &qword_10062A800);
  sub_10003B0B8((uint64_t)v15, (uint64_t)v12, &qword_10062A800);
  sub_10003B0B8((uint64_t)v15, (uint64_t)v16, &qword_10062A800);
  double v4 = 0.0;
  double v5 = 0.0;
  if (sub_1000784E8(v16) != 1)
  {
    double v5 = v13;
    double v4 = v14;
    sub_10003B0B8((uint64_t)v12, (uint64_t)v10, &qword_10062A800);
    sub_10003B0B8((uint64_t)v15, (uint64_t)v11, &qword_10062A800);
    sub_1001B9F94((uint64_t)v11);
    sub_10041BB20(v10, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1001BA0D8);
  }
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = v5;
  double v9 = v4;
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_100419B0C();
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCFastLabel();
  id v2 = v4.receiver;
  [(DOCFastLabel *)&v4 didMoveToWindow];
  id v3 = objc_msgSend(v2, "window", v4.receiver, v4.super_class);

  if (v3) {
    sub_100418D94([v2 traitCollection]);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCFastLabel();
  id v4 = a3;
  id v5 = v6.receiver;
  [(DOCFastLabel *)&v6 traitCollectionDidChange:v4];
  sub_100418D94(objc_msgSend(v5, "traitCollection", v6.receiver, v6.super_class));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service12DOCFastLabel_textLayer));
}

- (CGSize)doc_effectiveContentSize
{
  [*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC33com_apple_DocumentManager_Service12DOCFastLabel_textLayer) frame];
  double v3 = v2;
  double v5 = v4;
  result.double height = v5;
  result.double width = v3;
  return result;
}

@end