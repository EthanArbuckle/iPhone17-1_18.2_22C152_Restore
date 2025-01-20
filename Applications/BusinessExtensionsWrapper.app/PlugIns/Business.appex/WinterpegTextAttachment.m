@interface WinterpegTextAttachment
- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(int64_t)a6;
- (_TtC8BusinessP33_F1257CEC6FBB055D52A44E01318C013B23WinterpegTextAttachment)initWithCoder:(id)a3;
- (_TtC8BusinessP33_F1257CEC6FBB055D52A44E01318C013B23WinterpegTextAttachment)initWithData:(id)a3 ofType:(id)a4;
@end

@implementation WinterpegTextAttachment

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(int64_t)a6
{
  double y = a5.y;
  double x = a5.x;
  double height = a4.size.height;
  double width = a4.size.width;
  double v11 = a4.origin.y;
  double v12 = a4.origin.x;
  id v15 = a3;
  v16 = self;
  sub_100099564((uint64_t)a3, a6, v12, v11, width, height, x, y);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  double v25 = v18;
  double v26 = v20;
  double v27 = v22;
  double v28 = v24;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (_TtC8BusinessP33_F1257CEC6FBB055D52A44E01318C013B23WinterpegTextAttachment)initWithData:(id)a3 ofType:(id)a4
{
  v5 = a3;
  if (!a3)
  {
    id v13 = a4;
    unint64_t v9 = 0xF000000000000000;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v10 = 0;
    uint64_t v12 = 0;
    return (_TtC8BusinessP33_F1257CEC6FBB055D52A44E01318C013B23WinterpegTextAttachment *)sub_1000997B0((uint64_t)v5, v9, v10, v12);
  }
  id v6 = a4;
  id v7 = v5;
  v5 = (void *)sub_1000BB188();
  unint64_t v9 = v8;

  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v10 = sub_1000BBAC8();
  uint64_t v12 = v11;

  return (_TtC8BusinessP33_F1257CEC6FBB055D52A44E01318C013B23WinterpegTextAttachment *)sub_1000997B0((uint64_t)v5, v9, v10, v12);
}

- (_TtC8BusinessP33_F1257CEC6FBB055D52A44E01318C013B23WinterpegTextAttachment)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8BusinessP33_F1257CEC6FBB055D52A44E01318C013B23WinterpegTextAttachment_fontDescender) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WinterpegTextAttachment();
  return [(WinterpegTextAttachment *)&v5 initWithCoder:a3];
}

@end