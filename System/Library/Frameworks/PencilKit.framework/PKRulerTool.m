@interface PKRulerTool
- (BOOL)_isRulerTool;
- (Class)_toolPickerItemClass;
- (PKRulerTool)init;
- (id)_defaultItemIdentifier;
@end

@implementation PKRulerTool

- (PKRulerTool)init
{
  v3 = [MEMORY[0x1E4FB1618] clearColor];
  v4 = +[PKInk inkWithIdentifier:@"com.apple.ink.custom" color:v3 weight:0.0];

  v5 = +[PKToolConfiguration defaultConfigurationForToolWithIdentifier:@"com.apple.tool.ruler"];
  v8.receiver = self;
  v8.super_class = (Class)PKRulerTool;
  v6 = [(PKTool *)&v8 _initWithInk:v4 configuration:v5];

  return v6;
}

- (BOOL)_isRulerTool
{
  return 1;
}

- (id)_defaultItemIdentifier
{
  return @"com.apple.tool.ruler";
}

- (Class)_toolPickerItemClass
{
  return (Class)objc_opt_class();
}

@end