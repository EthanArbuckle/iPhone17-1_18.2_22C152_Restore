@interface NSValue
+ (id)ax_valueWithCGPoint:(CGPoint)a3;
- (int64_t)compare:(id)a3;
@end

@implementation NSValue

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  id v5 = [(NSValue *)self rangeValue];
  id v6 = [v4 rangeValue];

  int64_t v7 = -1;
  if (v5 >= v6) {
    int64_t v7 = 1;
  }
  if (v5 == v6) {
    return 0;
  }
  else {
    return v7;
  }
}

+ (id)ax_valueWithCGPoint:(CGPoint)a3
{
  return +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", a3.x, a3.y);
}

@end