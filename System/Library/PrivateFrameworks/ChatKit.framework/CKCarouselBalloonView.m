@interface CKCarouselBalloonView
- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKCarouselBalloonView)initWithCoder:(id)a3;
- (CKCarouselBalloonView)initWithFrame:(CGRect)a3;
- (void)carousel:(id)a3 didScrollToIndex:(int64_t)a4;
- (void)layoutSubviews;
@end

@implementation CKCarouselBalloonView

- (CKCarouselBalloonView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CKCarouselBalloonView_carouselStackView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CKCarouselBalloonView_dataSource) = 0;
  v8 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR___CKCarouselBalloonView_preferredBalloonSize);
  v9 = (objc_class *)type metadata accessor for CarouselBalloonView();
  void *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[CKBalloonView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (CKCarouselBalloonView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CKCarouselBalloonView_carouselStackView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CKCarouselBalloonView_dataSource) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR___CKCarouselBalloonView_preferredBalloonSize);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (CKCarouselBalloonView *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CarouselBalloonView();
  v2 = (char *)v5.receiver;
  [(CKBalloonView *)&v5 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR___CKCarouselBalloonView_carouselStackView];
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v2, sel_frame, v5.receiver, v5.super_class);
    objc_msgSend(v4, sel_frame);
    objc_msgSend(v4, sel_setFrame_);

    v2 = v4;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double v4 = CGSizeScaledToFit(a3.width, a3.height, *(double *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR___CKCarouselBalloonView_preferredBalloonSize), *(double *)((char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR___CKCarouselBalloonView_preferredBalloonSize));
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___CKCarouselBalloonView_carouselStackView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CKCarouselBalloonView_dataSource);
}

- (void)carousel:(id)a3 didScrollToIndex:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  v8 = [(CKBalloonView *)v7 delegate];
  if (v8)
  {
    v9 = v8;
    if ([(CKBalloonViewDelegate *)v8 respondsToSelector:sel_balloonView_carouselScrolledToIndex_])[(CKBalloonViewDelegate *)v9 balloonView:v7 carouselScrolledToIndex:a4]; {

    }
    swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

@end