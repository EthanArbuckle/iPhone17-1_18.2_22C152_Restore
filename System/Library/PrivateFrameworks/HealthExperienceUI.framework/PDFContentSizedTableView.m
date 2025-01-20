@interface PDFContentSizedTableView
- (CGSize)contentSize;
- (CGSize)intrinsicContentSize;
- (_TtC18HealthExperienceUIP33_41892A8E3AE85A20C0CA0B347A3001CA24PDFContentSizedTableView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUIP33_41892A8E3AE85A20C0CA0B347A3001CA24PDFContentSizedTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (void)setContentSize:(CGSize)a3;
@end

@implementation PDFContentSizedTableView

- (CGSize)contentSize
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PDFContentSizedTableView();
  [(PDFContentSizedTableView *)&v4 contentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PDFContentSizedTableView();
  id v5 = v6.receiver;
  -[PDFContentSizedTableView setContentSize:](&v6, sel_setContentSize_, width, height);
  objc_msgSend(v5, sel_invalidateIntrinsicContentSize, v6.receiver, v6.super_class);
}

- (CGSize)intrinsicContentSize
{
  double v2 = self;
  [(PDFContentSizedTableView *)v2 layoutIfNeeded];
  double v3 = *MEMORY[0x1E4FB30D8];
  [(PDFContentSizedTableView *)v2 contentSize];
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (_TtC18HealthExperienceUIP33_41892A8E3AE85A20C0CA0B347A3001CA24PDFContentSizedTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for PDFContentSizedTableView();
  return -[PDFContentSizedTableView initWithFrame:style:](&v10, sel_initWithFrame_style_, a4, x, y, width, height);
}

- (_TtC18HealthExperienceUIP33_41892A8E3AE85A20C0CA0B347A3001CA24PDFContentSizedTableView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PDFContentSizedTableView();
  return [(PDFContentSizedTableView *)&v5 initWithCoder:a3];
}

@end