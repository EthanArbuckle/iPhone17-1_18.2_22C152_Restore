@interface CAMShutterButton
+ (id)shutterButtonWithSpec:(CAMShutterButtonSpec)a3;
- (int64_t)mode;
- (void)setMode:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation CAMShutterButton

+ (id)shutterButtonWithSpec:(CAMShutterButtonSpec)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CAMShutterButton;
  v3 = objc_msgSendSuper2(&v5, sel_shutterButtonWithDesiredSpec_, a3.var0, a3.var1, a3.var2, a3.var3);
  return v3;
}

- (void)setMode:(int64_t)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CAMShutterButton;
  [(CMKShutterButton *)&v4 setButtonMode:a3 animated:a4];
}

- (int64_t)mode
{
  v3.receiver = self;
  v3.super_class = (Class)CAMShutterButton;
  return [(CMKShutterButton *)&v3 buttonMode];
}

@end