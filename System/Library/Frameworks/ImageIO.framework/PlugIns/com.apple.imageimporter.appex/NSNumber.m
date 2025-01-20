@interface NSNumber
- (id)fractionString;
@end

@implementation NSNumber

- (id)fractionString
{
  [(NSNumber *)self doubleValue];
  uint64_t v4 = (uint64_t)v3;
  if ((uint64_t)v3) {
    return +[NSMutableString stringWithFormat:@"%@", self];
  }
  uint64_t v6 = 0;
  uint64_t v7 = 1;
  double v8 = v3;
  uint64_t v9 = 1;
  while (1)
  {
    uint64_t v10 = v9;
    uint64_t v11 = v4;
    uint64_t v12 = (uint64_t)v8;
    uint64_t v4 = v7 + v4 * (uint64_t)v8;
    if (v4 >= 100001)
    {
      uint64_t v4 = v11;
      goto LABEL_10;
    }
    uint64_t v9 = v6 + v9 * v12;
    if (v8 == (double)v12) {
      break;
    }
    double v8 = 1.0 / (v8 - (double)v12);
    uint64_t v7 = v11;
    uint64_t v6 = v10;
    if (v8 > 2147483650.0) {
      goto LABEL_10;
    }
  }
  uint64_t v7 = v11;
  uint64_t v6 = v10;
LABEL_10:
  uint64_t v13 = (100000 - v7) / v4;
  uint64_t v14 = v6 + v13 * v9;
  uint64_t v15 = v7 + v13 * v4;
  double v16 = vabdd_f64(v3, (double)v9 / (double)v4);
  double v17 = fabs((double)v14 / (double)v15);
  if (v16 <= v17) {
    uint64_t v18 = v9;
  }
  else {
    uint64_t v18 = v14;
  }
  if (v16 <= v17) {
    uint64_t v19 = v4;
  }
  else {
    uint64_t v19 = v15;
  }
  if (v18 >= 2)
  {
    double v20 = (double)v19 / (double)v18;
    uint64_t v21 = v18;
    uint64_t v22 = v19;
    if (fabs((double)v18 / (double)v19 + -1.0 / v20) < 0.01)
    {
      uint64_t v22 = (uint64_t)v20;
      if ((uint64_t)v20 <= 999) {
        uint64_t v22 = (uint64_t)(round((double)v22 / 5.0) * 5.0);
      }
      uint64_t v21 = 1;
    }
    if (v22)
    {
      uint64_t v18 = v21;
      uint64_t v19 = v22;
    }
  }
  if (qword_100008488 != -1) {
    dispatch_once(&qword_100008488, &stru_100004338);
  }
  [(id)qword_100008470 setFormat:@"#0;0;#0"];
  [(id)qword_100008478 setFormat:@"#0;0;#0"];
  [(id)qword_100008480 setFormat:@"#0;0;#0"];
  objc_msgSend((id)qword_100008470, "stringForObjectValue:", +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", 0));
  id v23 = objc_msgSend((id)qword_100008470, "stringForObjectValue:", +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v18));
  id v24 = objc_msgSend((id)qword_100008470, "stringForObjectValue:", +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v19));
  v25 = +[NSMutableString stringWithString:@"%1/%2"];
  [(NSMutableString *)v25 replaceOccurrencesOfString:@"%1", v23, 0, 0, [(NSMutableString *)v25 length] withString options range];
  [(NSMutableString *)v25 replaceOccurrencesOfString:@"%2", v24, 0, 0, [(NSMutableString *)v25 length] withString options range];
  return v25;
}

@end