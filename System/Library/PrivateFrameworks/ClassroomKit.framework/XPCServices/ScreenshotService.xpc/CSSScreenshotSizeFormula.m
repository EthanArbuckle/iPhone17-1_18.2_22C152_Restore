@interface CSSScreenshotSizeFormula
- (CGSize)sizeByLimitingMaximumSize:(CGSize)a3 toDisplaySize:(id)a4;
- (id)screenshotSizeWithMaximumSize:(CGSize)a3 displaySize:(id)a4;
- (id)smallestPossibleScreenshotSizeForDisplaySize:(id)a3;
- (unint64_t)scaleForSourceSize:(id)a3 toDestinationSize:(CGSize)a4;
@end

@implementation CSSScreenshotSizeFormula

- (id)screenshotSizeWithMaximumSize:(CGSize)a3 displaySize:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  if ([v7 hasZeroArea])
  {
    v8 = +[CSSIntegralSize zeroSize];
  }
  else
  {
    -[CSSScreenshotSizeFormula sizeByLimitingMaximumSize:toDisplaySize:](self, "sizeByLimitingMaximumSize:toDisplaySize:", v7, width, height);
    double v10 = v9;
    double v12 = v11;
    v13 = [(CSSScreenshotSizeFormula *)self smallestPossibleScreenshotSizeForDisplaySize:v7];
    v8 = objc_msgSend(v13, "sizeScaledByFactor:", -[CSSScreenshotSizeFormula scaleForSourceSize:toDestinationSize:](self, "scaleForSourceSize:toDestinationSize:", v13, v10, v12));
  }

  return v8;
}

- (CGSize)sizeByLimitingMaximumSize:(CGSize)a3 toDisplaySize:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = a4;
  double v7 = fmin(width, (double)(unint64_t)[v6 width]);
  id v8 = [v6 height];

  double v9 = fmin(height, (double)(unint64_t)v8);
  double v10 = v7;
  result.double height = v9;
  result.double width = v10;
  return result;
}

- (unint64_t)scaleForSourceSize:(id)a3 toDestinationSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  double v7 = width / (double)(unint64_t)[v6 width];
  id v8 = [v6 height];

  double v9 = fmin(v7, height / (double)(unint64_t)v8);
  if ((unint64_t)v9 <= 1) {
    return 1;
  }
  else {
    return (unint64_t)v9;
  }
}

- (id)smallestPossibleScreenshotSizeForDisplaySize:(id)a3
{
  id v3 = a3;
  v4 = [CSSFraction alloc];
  id v5 = [v3 width];
  id v6 = [v3 height];

  double v7 = [(CSSFraction *)v4 initWithNumerator:v5 denominator:v6];
  id v8 = [(CSSFraction *)v7 simplifiedFraction];
  double v9 = -[CSSIntegralSize initWithWidth:height:]([CSSIntegralSize alloc], "initWithWidth:height:", [v8 numerator], objc_msgSend(v8, "denominator"));

  return v9;
}

@end