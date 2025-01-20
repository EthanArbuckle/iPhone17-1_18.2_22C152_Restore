@interface UIImage
+ (id)scat_cachedMenuImageForImageName:(id)a3;
+ (id)scat_imageForTitle:(id)a3 imageSize:(CGSize)a4;
+ (id)scat_singleCharacterImageForTitle:(id)a3 charactersInUse:(id)a4;
+ (void)scat_setCachedMenuImage:(id)a3 forImageName:(id)a4;
@end

@implementation UIImage

+ (void)scat_setCachedMenuImage:(id)a3 forImageName:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if (!qword_1001F0A18)
  {
    id v6 = objc_alloc_init((Class)NSCache);
    v7 = (void *)qword_1001F0A18;
    qword_1001F0A18 = (uint64_t)v6;
  }
  if (v8 && v5) {
    [(id)qword_1001F0A18 setObject:v8 forKey:v5];
  }
}

+ (id)scat_cachedMenuImageForImageName:(id)a3
{
  if (a3)
  {
    v4 = objc_msgSend((id)qword_1001F0A18, "objectForKey:");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)scat_singleCharacterImageForTitle:(id)a3 charactersInUse:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    v7 = 0;
    unint64_t v8 = 0;
    while (1)
    {
      id v9 = [v5 rangeOfComposedCharacterSequenceAtIndex:v8];
      if (!v10) {
        break;
      }
      id v11 = v9;
      if (v9 == (id)0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v12 = v10;
      v13 = objc_msgSend(v5, "substringWithRange:", v9, v10);

      if (v6 && ([v6 containsObject:v13] & 1) != 0
        || (+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"), v14 = objc_claimAutoreleasedReturnValue(), [v13 stringByTrimmingCharactersInSet:v14], v15 = objc_claimAutoreleasedReturnValue(), id v16 = objc_msgSend(v15, "length"), v15, v14, !v16))
      {
        unint64_t v8 = (unint64_t)v11 + v12;
        v7 = v13;
        if (v8 < (unint64_t)[v5 length]) {
          continue;
        }
      }
      goto LABEL_12;
    }
    v13 = v7;
  }
  else
  {
    v13 = 0;
  }
LABEL_12:
  if ([v13 length])
  {
    +[SCATModernMenuItem imageSize];
    double v18 = v17;
    double v20 = v19;
    v33[0] = NSFontAttributeName;
    v21 = +[UIFont systemFontOfSize:45.0];
    v34[0] = v21;
    v33[1] = NSForegroundColorAttributeName;
    v22 = +[UIColor whiteColor];
    v34[1] = v22;
    v23 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];

    [v13 sizeWithAttributes:v23];
    double v25 = v24;
    double v27 = v26;
    v28 = +[UIScreen mainScreen];
    [v28 scale];
    CGFloat v30 = v29;
    v36.width = v18;
    v36.height = v20;
    UIGraphicsBeginImageContextWithOptions(v36, 0, v30);

    objc_msgSend(v13, "drawInRect:withAttributes:", v23, (v18 - v25) * 0.5, (v20 - v27) * 0.5, v25, v27);
    v31 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [v6 addObject:v13];
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

+ (id)scat_imageForTitle:(id)a3 imageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  if ([v6 length])
  {
    v19[0] = NSFontAttributeName;
    v7 = +[UIFont systemFontOfSize:12.0];
    v20[0] = v7;
    v19[1] = NSForegroundColorAttributeName;
    unint64_t v8 = +[UIColor whiteColor];
    v20[1] = v8;
    id v9 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];

    [v6 sizeWithAttributes:v9];
    double v11 = v10;
    double v13 = v12;
    v14 = +[UIScreen mainScreen];
    [v14 scale];
    CGFloat v16 = v15;
    v22.double width = width;
    v22.double height = height;
    UIGraphicsBeginImageContextWithOptions(v22, 0, v16);

    objc_msgSend(v6, "drawInRect:withAttributes:", v9, (width - v11) * 0.5, (height - v13) * 0.5, v11, v13);
    double v17 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }
  else
  {
    double v17 = 0;
  }

  return v17;
}

@end