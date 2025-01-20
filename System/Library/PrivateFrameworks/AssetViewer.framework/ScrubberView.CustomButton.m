@interface ScrubberView.CustomButton
- (BOOL)isHighlighted;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtCC11AssetViewer12ScrubberView12CustomButton)initWithCoder:(id)a3;
- (_TtCC11AssetViewer12ScrubberView12CustomButton)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation ScrubberView.CustomButton

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ScrubberView.CustomButton();
  return [(ScrubberView.CustomButton *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (objc_class *)type metadata accessor for ScrubberView.CustomButton();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  char v7 = [(ScrubberView.CustomButton *)&v9 isHighlighted];
  v8.receiver = v6;
  v8.super_class = v5;
  [(ScrubberView.CustomButton *)&v8 setHighlighted:v3];
  sub_1E28B4404(v7);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  objc_super v8 = self;
  sub_1E28B46D4();
  v10.CGFloat x = x;
  v10.CGFloat y = y;
  LOBYTE(self) = CGRectContainsPoint(v11, v10);

  return (char)self;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  objc_super v8 = self;
  sub_1E28B46D4();
  v11.CGFloat x = x;
  v11.CGFloat y = y;
  LOBYTE(self) = CGRectContainsPoint(v12, v11);

  if ((self & 1) == 0)
  {

    objc_super v8 = 0;
  }
  return v8;
}

- (_TtCC11AssetViewer12ScrubberView12CustomButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtCC11AssetViewer12ScrubberView12CustomButton_highlightAnimator) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ScrubberView.CustomButton();
  return -[ScrubberView.CustomButton initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtCC11AssetViewer12ScrubberView12CustomButton)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtCC11AssetViewer12ScrubberView12CustomButton_highlightAnimator) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ScrubberView.CustomButton();
  return [(ScrubberView.CustomButton *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC11AssetViewer12ScrubberView12CustomButton_highlightAnimator));
}

@end