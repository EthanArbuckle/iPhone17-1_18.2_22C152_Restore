@interface CircularUIView
- (void)drawRect:(CGRect)a3;
@end

@implementation CircularUIView

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)CircularUIView;
  -[CircularUIView drawRect:](&v12, "drawRect:");
  CGFloat v7 = x + width * 0.5 + -11.0;
  CGFloat v8 = y + height * 0.5 + -11.0;
  CurrentContext = UIGraphicsGetCurrentContext();
  v10 = +[UIColor colorWithRed:0.31372549 green:0.31372549 blue:0.31372549 alpha:1.0];
  v13.size.double width = 23.0;
  v13.size.double height = 23.0;
  v13.origin.double x = v7;
  v13.origin.double y = v8;
  CGContextAddEllipseInRect(CurrentContext, v13);
  id v11 = v10;
  CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v11 CGColor]);
  v14.size.double width = 23.0;
  v14.size.double height = 23.0;
  v14.origin.double x = v7;
  v14.origin.double y = v8;
  CGContextStrokeEllipseInRect(CurrentContext, v14);
}

@end