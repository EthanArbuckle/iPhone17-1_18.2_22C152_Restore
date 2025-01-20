@interface MathPresentation._LayoutContext
- (CGColor)baseFontColor;
- (CGSize)containerSize;
- (CGSize)targetSize;
- (NSString)baseFontName;
- (_TtCV15MathTypesetting16MathPresentation14_LayoutContext)init;
- (double)baseFontSize;
@end

@implementation MathPresentation._LayoutContext

- (double)baseFontSize
{
  return sub_2558374E4();
}

- (NSString)baseFontName
{
  sub_25583754C();
  if (v2)
  {
    v3 = (void *)sub_2558B9CA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (CGSize)targetSize
{
  double v2 = sub_2558375AC();
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)containerSize
{
  double v2 = sub_2558375F4();
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGColor)baseFontColor
{
  double v2 = sub_25583764C();

  return (CGColor *)v2;
}

- (_TtCV15MathTypesetting16MathPresentation14_LayoutContext)init
{
}

- (void).cxx_destruct
{
  id v2 = *(id *)&self->context[OBJC_IVAR____TtCV15MathTypesetting16MathPresentation14_LayoutContext_context + 64];
  swift_bridgeObjectRelease();
}

@end