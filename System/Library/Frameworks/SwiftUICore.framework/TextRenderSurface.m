@interface TextRenderSurface
- (CALayer)layer;
- (CGRect)adjustedLayoutFragmentFrame:(CGRect)a3;
- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D417TextRenderSurface)init;
@end

@implementation TextRenderSurface

- (CALayer)layer
{
  return (CALayer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D417TextRenderSurface__layer));
}

- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D417TextRenderSurface)init
{
  result = (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D417TextRenderSurface *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D417TextRenderSurface__layer));

  swift_unknownObjectWeakDestroy();
}

- (CGRect)adjustedLayoutFragmentFrame:(CGRect)a3
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8 = (double *)((char *)self
                + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D417TextRenderSurface_yDisplacement);
  swift_beginAccess();
  v9 = (double *)(*(char **)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D417TextRenderSurface__layer)
                + OBJC_IVAR____TtC7SwiftUI15TextRenderLayer_currentDisplacement);
  double v10 = y + *v8 + *v9;
  double v11 = height + v9[2];
  double v12 = x;
  double v13 = width;
  result.size.double height = v11;
  result.size.CGFloat width = v13;
  result.origin.double y = v10;
  result.origin.CGFloat x = v12;
  return result;
}

@end