@interface NSAttributedString
+ (id)_maps_attributedStringWithBindingFormat:(id)a3 replacements:(id)a4 attributes:(id)a5;
- (id)_maps_attributedStringByApplyingBindingFormatReplacements:(id)a3;
- (id)_maps_attributedStringByApplyingBindingFormatReplacements:(id)a3 defaultReplacementAttributes:(id)a4;
@end

@implementation NSAttributedString

+ (id)_maps_attributedStringWithBindingFormat:(id)a3 replacements:(id)a4 attributes:(id)a5
{
  return objc_msgSend(a1, "_mapkit_attributedStringWithBindingFormat:replacements:attributes:", a3, a4, a5);
}

- (id)_maps_attributedStringByApplyingBindingFormatReplacements:(id)a3 defaultReplacementAttributes:(id)a4
{
  return [(NSAttributedString *)self _mapkit_attributedStringByApplyingBindingFormatReplacements:a3 defaultReplacementAttributes:a4];
}

- (id)_maps_attributedStringByApplyingBindingFormatReplacements:(id)a3
{
  return [(NSAttributedString *)self _mapkit_attributedStringByApplyingBindingFormatReplacements:a3];
}

@end