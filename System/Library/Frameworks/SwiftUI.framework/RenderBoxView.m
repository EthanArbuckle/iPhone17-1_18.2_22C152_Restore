@interface RenderBoxView
+ (Class)layerClass;
- (BOOL)isOpaque;
- (_TtC7SwiftUI13RenderBoxView)initWithCoder:(id)a3;
- (_TtC7SwiftUI13RenderBoxView)initWithFrame:(CGRect)a3;
- (void)RBLayer:(id)a3 draw:(id)a4;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)setNeedsDisplay;
- (void)setOpaque:(BOOL)a3;
@end

@implementation RenderBoxView

- (void)RBLayer:(id)a3 draw:(id)a4
{
  v6 = *(void (**)(id))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.super.super.isa) + 0x60);
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  v6(v8);
}

- (void)setOpaque:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  id v5 = [(RenderBoxView *)v4 layer];
  objc_msgSend(v5, sel_setOpaque_, v3);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for RenderBoxView();
  [(RenderBoxView *)&v6 setOpaque:v3];
}

- (_TtC7SwiftUI13RenderBoxView)initWithFrame:(CGRect)a3
{
  return (_TtC7SwiftUI13RenderBoxView *)RenderBoxView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)isOpaque
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RenderBoxView();
  return [(RenderBoxView *)&v3 isOpaque];
}

+ (Class)layerClass
{
  type metadata accessor for RenderBoxLayer();

  return (Class)swift_getObjCClassFromMetadata();
}

- (void)didMoveToWindow
{
  v9 = self;
  v2 = (_TtC7SwiftUI13RenderBoxView *)[(RenderBoxView *)v9 window];
  if (v2)
  {
    objc_super v3 = v2;
    id v4 = [(RenderBoxView *)v9 layer];
    id v5 = [(RenderBoxView *)v3 screen];
    objc_msgSend(v5, sel_scale);
    double v7 = v6;

    objc_msgSend(v4, sel_setContentsScale_, v7);
    [(RenderBoxView *)v9 setNeedsDisplay];

    id v8 = v3;
  }
  else
  {
    id v8 = v9;
  }
}

- (void)setNeedsDisplay
{
  v2 = self;
  id v3 = [(RenderBoxView *)v2 layer];
  objc_msgSend(v3, sel_setNeedsDisplay);
}

- (_TtC7SwiftUI13RenderBoxView)initWithCoder:(id)a3
{
  return (_TtC7SwiftUI13RenderBoxView *)RenderBoxView.init(coder:)(a3);
}

- (void)dealloc
{
  v2 = self;
  id v3 = [(RenderBoxView *)v2 layer];
  objc_msgSend(v3, sel_waitUntilAsyncRenderingCompleted);

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for RenderBoxView();
  [(RenderBoxView *)&v4 dealloc];
}

@end