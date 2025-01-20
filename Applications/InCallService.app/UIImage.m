@interface UIImage
+ (id)_phImageNamed:(id)a3 inBundle:(id)a4 compatibleWithTraitCollection:(id)a5;
+ (id)phCarPlayImageNamed:(id)a3;
+ (id)phCarPlayImageNamed:(id)a3 inBundle:(id)a4;
+ (id)phImageNamed:(id)a3;
+ (id)phPathForImageNamed:(id)a3;
+ (id)phPathForImageNamed:(id)a3 inBundle:(id)a4;
@end

@implementation UIImage

+ (id)_phImageNamed:(id)a3 inBundle:(id)a4 compatibleWithTraitCollection:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v8)
  {
    id v8 = +[NSBundle mainBundle];
  }
  v10 = +[UIImage imageNamed:v7 inBundle:v8 compatibleWithTraitCollection:v9];

  return v10;
}

+ (id)phImageNamed:(id)a3
{
  id v3 = a3;
  v4 = +[UIScreen mainScreen];
  v5 = [v4 traitCollection];
  v6 = +[UIImage _phImageNamed:v3 inBundle:0 compatibleWithTraitCollection:v5];

  return v6;
}

+ (id)phCarPlayImageNamed:(id)a3
{
  return [a1 phCarPlayImageNamed:a3 inBundle:0];
}

+ (id)phCarPlayImageNamed:(id)a3 inBundle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[UIScreen _carScreen];
  id v8 = [v7 traitCollection];
  id v9 = +[UIImage _phImageNamed:v6 inBundle:v5 compatibleWithTraitCollection:v8];

  return v9;
}

+ (id)phPathForImageNamed:(id)a3
{
  id v3 = a3;
  v4 = +[NSBundle mainBundle];
  id v5 = +[UIImage phPathForImageNamed:v3 inBundle:v4];

  return v5;
}

+ (id)phPathForImageNamed:(id)a3 inBundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v6 = +[NSBundle mainBundle];
  }
  id v7 = +[UIScreen mainScreen];
  [v7 scale];
  double v9 = v8;

  if (v9 > 1.0)
  {
    v10 = +[UIScreen mainScreen];
    [v10 scale];
    v12 = +[NSString stringWithFormat:@"@%dx", (int)v11];

    if ([v5 hasSuffix:v12])
    {
    }
    else
    {
      v13 = [v5 stringByAppendingString:v12];
      v14 = [v6 pathForResource:v13 ofType:@"png"];

      if (v14) {
        goto LABEL_8;
      }
    }
  }
  v14 = [v6 pathForResource:v5 ofType:@"png"];
LABEL_8:

  return v14;
}

@end