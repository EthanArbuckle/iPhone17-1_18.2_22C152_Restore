@interface PKPaletteConcreteHandwritingTool
- (BOOL)isHandwritingTool;
- (NSString)localeIdentifier;
- (NSString)toolIdentifier;
- (void)setLocaleIdentifier:(id)a3;
@end

@implementation PKPaletteConcreteHandwritingTool

- (NSString)toolIdentifier
{
  return (NSString *)@"com.apple.ink.handwriting";
}

- (BOOL)isHandwritingTool
{
  return 1;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end