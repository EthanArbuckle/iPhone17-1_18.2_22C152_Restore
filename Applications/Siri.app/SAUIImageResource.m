@interface SAUIImageResource
- (id)_convertedImageOfSize:(CGSize)a3;
@end

@implementation SAUIImageResource

- (id)_convertedImageOfSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(SAUIImageResource *)self resourceUrl];
  if (v6)
  {
    id v7 = objc_alloc_init((Class)SFURLImage);
    [v7 setUrlValue:v6];
  }
  else
  {
    id v7 = 0;
  }
  [v7 setSize:width, height];
  [v7 setCornerRoundingStyle:2];
  [(SAUIImageResource *)self scaleFactor];
  [v7 setScale:];

  return v7;
}

@end