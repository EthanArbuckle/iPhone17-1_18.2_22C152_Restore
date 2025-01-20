@interface NSString
- (CGSize)_maps_sizeWithFont:(id)a3;
- (CGSize)_maps_sizeWithFont:(id)a3 constrainedToSize:(CGSize)a4;
- (CGSize)_maps_sizeWithFont:(id)a3 constrainedToSize:(CGSize)a4 options:(int64_t)a5;
- (NSString)sha1Hash;
- (id)_maps_prefixMatchesForSearchString:(id)a3;
- (void)_maps_drawAtPoint:(CGPoint)a3 withFont:(id)a4;
- (void)_maps_drawInRect:(CGRect)a3 withFont:(id)a4;
@end

@implementation NSString

- (id)_maps_prefixMatchesForSearchString:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  v7 = +[NSMutableArray array];
  id v8 = [v4 length];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100EC;
  v44[3] = &unk_61B20;
  id v9 = v7;
  id v45 = v9;
  objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, 1027, v44);
  v10 = +[NSMutableArray array];
  NSUInteger v11 = [(NSString *)self length];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100F8;
  v42[3] = &unk_61B20;
  id v12 = v10;
  id v43 = v12;
  -[NSString enumerateSubstringsInRange:options:usingBlock:](self, "enumerateSubstringsInRange:options:usingBlock:", 0, v11, 1027, v42);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v9;
  id v33 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v33)
  {
    v31 = v5;
    uint64_t v32 = *(void *)v39;
    context = v6;
    id v28 = v4;
    v30 = v12;
    while (1)
    {
      uint64_t v13 = 0;
LABEL_4:
      if (*(void *)v39 != v32) {
        objc_enumerationMutation(obj);
      }
      v14 = *(void **)(*((void *)&v38 + 1) + 8 * v13);
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v15 = [v12 copy];
      id v16 = [v15 countByEnumeratingWithState:&v34 objects:v46 count:16];
      if (!v16) {
        break;
      }
      id v17 = v16;
      uint64_t v18 = *(void *)v35;
LABEL_8:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v34 + 1) + 8 * v19);
        v21 = [v20 objectAtIndexedSubscript:0];
        v22 = [v20 objectAtIndexedSubscript:1];
        id v23 = [v22 rangeValue];

        if (![v21 localizedStandardRangeOfString:v14]) {
          break;
        }

        if (v17 == (id)++v19)
        {
          id v17 = [v15 countByEnumeratingWithState:&v34 objects:v46 count:16];
          if (v17) {
            goto LABEL_8;
          }
          goto LABEL_18;
        }
      }
      v24 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v23, [v14 length]);
      v5 = v31;
      [v31 addObject:v24];

      id v12 = v30;
      [v30 removeObject:v20];

      if ((id)++v13 != v33) {
        goto LABEL_4;
      }
      v6 = context;
      id v4 = v28;
      id v33 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
      if (!v33) {
        goto LABEL_17;
      }
    }
LABEL_18:

    id v25 = 0;
    id v4 = v28;
    v5 = v31;
  }
  else
  {
LABEL_17:

    id v25 = v5;
  }

  return v25;
}

- (CGSize)_maps_sizeWithFont:(id)a3
{
  if (a3)
  {
    NSAttributedStringKey v12 = NSFontAttributeName;
    id v13 = a3;
    id v4 = a3;
    v5 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  }
  else
  {
    v5 = 0;
  }
  [(NSString *)self sizeWithAttributes:v5];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)_maps_sizeWithFont:(id)a3 constrainedToSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  if (a3)
  {
    NSAttributedStringKey v15 = NSFontAttributeName;
    id v16 = a3;
    id v7 = a3;
    double v8 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  }
  else
  {
    double v8 = 0;
  }
  -[NSString boundingRectWithSize:options:attributes:context:](self, "boundingRectWithSize:options:attributes:context:", 0, v8, 0, width, height);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (CGSize)_maps_sizeWithFont:(id)a3 constrainedToSize:(CGSize)a4 options:(int64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  if (a3)
  {
    NSAttributedStringKey v17 = NSFontAttributeName;
    id v18 = a3;
    id v9 = a3;
    double v10 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  }
  else
  {
    double v10 = 0;
  }
  -[NSString boundingRectWithSize:options:attributes:context:](self, "boundingRectWithSize:options:attributes:context:", a5, v10, 0, width, height);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (void)_maps_drawAtPoint:(CGPoint)a3 withFont:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  if (a4)
  {
    NSAttributedStringKey v9 = NSFontAttributeName;
    id v10 = a4;
    id v7 = a4;
    double v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  }
  else
  {
    double v8 = 0;
  }
  -[NSString drawAtPoint:withAttributes:](self, "drawAtPoint:withAttributes:", v8, x, y);
}

- (void)_maps_drawInRect:(CGRect)a3 withFont:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a4)
  {
    NSAttributedStringKey v11 = NSFontAttributeName;
    id v12 = a4;
    id v9 = a4;
    id v10 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  }
  else
  {
    id v10 = 0;
  }
  -[NSString drawInRect:withAttributes:](self, "drawInRect:withAttributes:", v10, x, y, width, height);
}

- (NSString)sha1Hash
{
  id v2 = [(NSString *)self dataUsingEncoding:4];
  CC_SHA1([v2 bytes], (CC_LONG)objc_msgSend(v2, "length"), md);
  id v3 = objc_alloc_init((Class)NSMutableString);
  for (uint64_t i = 0; i != 20; ++i)
    objc_msgSend(v3, "appendFormat:", @"%02x", md[i]);

  return (NSString *)v3;
}

@end