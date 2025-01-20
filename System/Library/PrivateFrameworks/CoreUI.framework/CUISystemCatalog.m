@interface CUISystemCatalog
- (BOOL)hasStylePresetWithName:(id)a3;
- (BOOL)hasStylePresetWithName:(id)a3 styleConfiguration:(id)a4;
@end

@implementation CUISystemCatalog

- (BOOL)hasStylePresetWithName:(id)a3 styleConfiguration:(id)a4
{
  return objc_msgSend(a3, "isEqualToString:", @"NSLetterpress", a4);
}

- (BOOL)hasStylePresetWithName:(id)a3
{
  return [(CUISystemCatalog *)self hasStylePresetWithName:a3 styleConfiguration:0];
}

@end