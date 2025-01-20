@interface ISIcon
+ (id)css_iconWithWebClip:(id)a3;
@end

@implementation ISIcon

+ (id)css_iconWithWebClip:(id)a3
{
  v4 = +[IFImage css_imageWithWebClip:a3];
  if (v4)
  {
    id v5 = objc_alloc((Class)a1);
    v9 = v4;
    v6 = +[NSArray arrayWithObjects:&v9 count:1];
    id v7 = [v5 initWithImages:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

@end