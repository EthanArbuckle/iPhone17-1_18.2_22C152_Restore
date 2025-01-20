@interface PKLassoTool
- (BOOL)_isLassoTool;
- (Class)_toolPickerItemClass;
- (PKLassoTool)init;
- (id)_defaultItemIdentifier;
- (id)_initWithInk:(id)a3;
@end

@implementation PKLassoTool

- (PKLassoTool)init
{
  v3 = [MEMORY[0x1E4FB1618] colorWithWhite:0.466666667 alpha:1.0];
  v4 = +[PKInk inkWithType:@"com.apple.ink.lasso" color:v3 weight:1.0];
  v7.receiver = self;
  v7.super_class = (Class)PKLassoTool;
  v5 = [(PKTool *)&v7 _initWithInk:v4];

  return v5;
}

- (id)_initWithInk:(id)a3
{
  v4 = [a3 color];
  v5 = +[PKInk inkWithType:@"com.apple.ink.lasso" color:v4 weight:1.0];
  v8.receiver = self;
  v8.super_class = (Class)PKLassoTool;
  id v6 = [(PKTool *)&v8 _initWithInk:v5];

  return v6;
}

- (BOOL)_isLassoTool
{
  return 1;
}

- (id)_defaultItemIdentifier
{
  return @"com.apple.tool.lasso";
}

- (Class)_toolPickerItemClass
{
  return (Class)objc_opt_class();
}

@end