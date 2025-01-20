@interface CKPopRendererView
+ (double)duration;
- (BOOL)playWithSourceView:(id)a3;
- (CGRect)frameForSourceFrame:(CGRect)a3;
- (CKPopRendererView)initWithCoder:(id)a3;
- (CKPopRendererView)initWithFrame:(CGRect)a3;
- (CKPopRendererView)initWithFrame:(CGRect)a3 device:(id)a4;
- (CKPopRendererViewDelegate)delegate;
- (void)didEnterBackgroundFrom:(id)a3;
- (void)didMoveToWindow;
- (void)drawFrom:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)willEnterForegroundFrom:(id)a3;
@end

@implementation CKPopRendererView

+ (double)duration
{
  return 0.8;
}

- (CKPopRendererViewDelegate)delegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (CKPopRendererViewDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  v4 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKPopRendererView_delegate);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (CKPopRendererView)initWithFrame:(CGRect)a3 device:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  swift_unknownObjectRetain();
  return (CKPopRendererView *)PopRendererView.init(frame:device:)(a4, x, y, width, height);
}

- (CKPopRendererView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s7ChatKit15PopRendererViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_18F683BDC();
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PopRendererView();
  id v2 = v3.receiver;
  [(CKPopRendererView *)&v3 didMoveToWindow];
  objc_msgSend(v2, sel_setNeedsLayout, v3.receiver, v3.super_class);
}

- (void)didEnterBackgroundFrom:(id)a3
{
}

- (void)willEnterForegroundFrom:(id)a3
{
}

- (CGRect)frameForSourceFrame:(CGRect)a3
{
  return CGRectInset(a3, -100.0, -100.0);
}

- (BOOL)playWithSourceView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18F684368(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (void)drawFrom:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18F68456C(v4);
}

- (CKPopRendererView)initWithFrame:(CGRect)a3
{
  result = (CKPopRendererView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end