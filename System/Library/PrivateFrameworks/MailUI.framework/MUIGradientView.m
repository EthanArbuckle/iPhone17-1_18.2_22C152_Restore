@interface MUIGradientView
+ (Class)layerClass;
- (CGPoint)endPoint;
- (CGPoint)startPoint;
- (NSArray)gradientColors;
- (NSArray)locations;
- (void)setEndPoint:(CGPoint)a3;
- (void)setGradientColors:(id)a3;
- (void)setLocations:(id)a3;
- (void)setStartPoint:(CGPoint)a3;
@end

@implementation MUIGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setGradientColors:(id)a3
{
  objc_msgSend(a3, "ef_map:", &__block_literal_global_18);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [(MUIGradientView *)self gradientLayer];
  [v4 setColors:v5];
}

uint64_t __37__MUIGradientView_setGradientColors___block_invoke(int a1, id a2)
{
  id v2 = a2;
  return [v2 CGColor];
}

- (NSArray)gradientColors
{
  id v2 = [(MUIGradientView *)self gradientLayer];
  v3 = [v2 colors];
  v4 = objc_msgSend(v3, "ef_map:", &__block_literal_global_3);

  return (NSArray *)v4;
}

uint64_t __33__MUIGradientView_gradientColors__block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4FB1618] colorWithCGColor:a2];
}

- (void)setLocations:(id)a3
{
  id v4 = a3;
  id v5 = [(MUIGradientView *)self gradientLayer];
  [v5 setLocations:v4];
}

- (NSArray)locations
{
  id v2 = [(MUIGradientView *)self gradientLayer];
  v3 = [v2 locations];

  return (NSArray *)v3;
}

- (void)setStartPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(MUIGradientView *)self gradientLayer];
  objc_msgSend(v5, "setStartPoint:", x, y);
}

- (CGPoint)startPoint
{
  id v2 = [(MUIGradientView *)self gradientLayer];
  [v2 startPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (void)setEndPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(MUIGradientView *)self gradientLayer];
  objc_msgSend(v5, "setEndPoint:", x, y);
}

- (CGPoint)endPoint
{
  id v2 = [(MUIGradientView *)self gradientLayer];
  [v2 endPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double y = v8;
  result.double x = v7;
  return result;
}

@end