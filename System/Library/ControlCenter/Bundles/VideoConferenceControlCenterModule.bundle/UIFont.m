@interface UIFont
+ (double)rpccui_exuberatedValueForValue:(double)a3;
+ (id)rpccui_excessiveLineHeightChars;
- (BOOL)rpccui_hasExuberatedLineHeight;
- (BOOL)rpccui_hasExuberatedLineHeightForText:(id)a3;
- (double)rpccui_drawingHeightForText:(id)a3 withNumberOfLines:(unint64_t)a4 additionalPadding:(double)a5;
- (double)rpccui_effectiveLineHeightForText:(id)a3;
- (double)rpccui_effectiveScaledValueForValue:(double)a3 hasExuberatedLineHeight:(BOOL)a4;
- (double)rpccui_measuringHeightForText:(id)a3 withNumberOfLines:(unint64_t)a4;
- (unint64_t)rpccui_numberOfLinesForText:(id)a3 inFrame:(CGRect)a4 maximum:(unint64_t)a5 drawingContext:(id)a6;
@end

@implementation UIFont

+ (id)rpccui_excessiveLineHeightChars
{
  if (qword_7DDB0 != -1) {
    dispatch_once(&qword_7DDB0, &stru_69628);
  }
  v2 = (void *)qword_7DDA8;

  return v2;
}

+ (double)rpccui_exuberatedValueForValue:(double)a3
{
  _CTFontGetExuberatedLineHeightForLineHeight(a1, a2, a3);
  return result;
}

- (BOOL)rpccui_hasExuberatedLineHeight
{
  return _CTFontHasExuberatedLineHeight(self, a2);
}

- (BOOL)rpccui_hasExuberatedLineHeightForText:(id)a3
{
  id v4 = a3;
  if ([v4 length] && -[UIFont rpccui_hasExuberatedLineHeight](self, "rpccui_hasExuberatedLineHeight")) {
    unsigned __int8 v5 = objc_msgSend(v4, "rpccui_containsExcessiveLineHeightCharacters");
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (double)rpccui_effectiveScaledValueForValue:(double)a3 hasExuberatedLineHeight:(BOOL)a4
{
  if (a4)
  {
    v6 = objc_opt_class();
    [(UIFont *)self _scaledValueForValue:a3];
    objc_msgSend(v6, "rpccui_exuberatedValueForValue:");
  }
  else
  {
    -[UIFont _scaledValueForValue:](self, "_scaledValueForValue:");
  }
  return result;
}

- (double)rpccui_effectiveLineHeightForText:(id)a3
{
  if ([(UIFont *)self rpccui_hasExuberatedLineHeightForText:a3])
  {
    id v4 = objc_opt_class();
    [(UIFont *)self lineHeight];
    objc_msgSend(v4, "rpccui_exuberatedValueForValue:");
  }
  else
  {
    [(UIFont *)self lineHeight];
  }
  return result;
}

- (unint64_t)rpccui_numberOfLinesForText:(id)a3 inFrame:(CGRect)a4 maximum:(unint64_t)a5 drawingContext:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  id v11 = a3;
  id v12 = a6;
  if ([v11 length])
  {
    if (a5 != 1)
    {
      if (!v12)
      {
        id v12 = objc_alloc_init((Class)NSStringDrawingContext);
        [v12 setWantsNumberOfLineFragments:1];
      }
      NSAttributedStringKey v16 = NSFontAttributeName;
      v17 = self;
      v13 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      objc_msgSend(v11, "boundingRectWithSize:options:attributes:context:", 1, v13, v12, width, height);

      if (!a5) {
        a5 = -1;
      }
      id v14 = [v12 numberOfLineFragments];
      if (a5 >= (unint64_t)v14) {
        a5 = (unint64_t)v14;
      }
    }
  }
  else
  {
    a5 = 0;
  }

  return a5;
}

- (double)rpccui_measuringHeightForText:(id)a3 withNumberOfLines:(unint64_t)a4
{
  double v6 = (double)a4;
  [(UIFont *)self rpccui_effectiveLineHeightForText:a3];
  double v8 = v7;
  unint64_t v9 = a4 - 1;
  if (!a4) {
    unint64_t v9 = 0;
  }
  double v10 = (double)v9;
  [(UIFont *)self leading];
  return v11 * v10 + v6 * v8;
}

- (double)rpccui_drawingHeightForText:(id)a3 withNumberOfLines:(unint64_t)a4 additionalPadding:(double)a5
{
  BOOL v8 = [(UIFont *)self rpccui_hasExuberatedLineHeightForText:a3];
  if (v8)
  {
    unint64_t v9 = objc_opt_class();
    [(UIFont *)self lineHeight];
    objc_msgSend(v9, "rpccui_exuberatedValueForValue:");
  }
  else
  {
    [(UIFont *)self lineHeight];
  }
  double v11 = v10;
  [(UIFont *)self rpccui_effectiveScaledValueForValue:v8 hasExuberatedLineHeight:a5];
  double v13 = v12;
  [(UIFont *)self leading];
  return (v13 + v11 + v14) * (double)a4;
}

@end