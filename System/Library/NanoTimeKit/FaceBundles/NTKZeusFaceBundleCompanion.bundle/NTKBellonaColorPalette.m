@interface NTKBellonaColorPalette
- (NTKBellonaColorPalette)init;
- (id)_handInlay;
- (id)_handStroke;
@end

@implementation NTKBellonaColorPalette

- (NTKBellonaColorPalette)init
{
  v3 = +[NTKBellonaFace pigmentFaceDomain];
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v7.receiver = self;
  v7.super_class = (Class)NTKBellonaColorPalette;
  v5 = [(NTKBellonaColorPalette *)&v7 initWithDomainName:v3 inBundle:v4];

  return v5;
}

- (id)_handInlay
{
  return +[UIColor blackColor];
}

- (id)_handStroke
{
  return +[UIColor whiteColor];
}

@end