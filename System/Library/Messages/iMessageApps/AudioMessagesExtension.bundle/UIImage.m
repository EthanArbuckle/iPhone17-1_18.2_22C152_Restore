@interface UIImage
+ (id)systemImageNamedNumberAware:(id)a3;
+ (id)templateImageNamed:(id)a3;
@end

@implementation UIImage

+ (id)templateImageNamed:(id)a3
{
  v3 = +[UIImage imageNamed:a3];
  v4 = [v3 imageWithRenderingMode:2];

  return v4;
}

+ (id)systemImageNamedNumberAware:(id)a3
{
  id v3 = a3;
  if (qword_82ED8 != -1) {
    dispatch_once(&qword_82ED8, &stru_6D998);
  }
  if (([(id)qword_82ED0 containsObject:v3] & 1) == 0)
  {

    v8 = 0;
LABEL_14:
    v9 = +[UIImage systemImageNamed:v3];
    goto LABEL_15;
  }
  v4 = +[NSLocale currentLocale];
  v5 = [v4 languageCode];

  if (([v5 isEqualToString:@"ar"] & 1) != 0
    || [v5 isEqualToString:@"hi"])
  {
    v6 = +[NSLocale currentLocale];
    v7 = [v6 numberingSystem];

    if ([v7 isEqualToString:@"latn"])
    {
      v8 = [v3 stringByAppendingFormat:@".westernarabic"];
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  if (!v8) {
    goto LABEL_14;
  }
  v9 = +[UIImage imageNamed:v8];
  if (!v9) {
    goto LABEL_14;
  }
LABEL_15:

  return v9;
}

@end