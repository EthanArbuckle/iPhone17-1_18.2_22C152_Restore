@interface NSAttributedString(CompositionSanitizing)
+ (id)ck_defaultAllowedAttributesForComposition;
- (id)ck_attributedStringByRemovingUnsupportedCompositionAttributes;
@end

@implementation NSAttributedString(CompositionSanitizing)

+ (id)ck_defaultAllowedAttributesForComposition
{
  if (ck_defaultAllowedAttributesForComposition_onceToken != -1) {
    dispatch_once(&ck_defaultAllowedAttributesForComposition_onceToken, &__block_literal_global_235);
  }
  v0 = (void *)ck_defaultAllowedAttributesForComposition_sAttributes;

  return v0;
}

- (id)ck_attributedStringByRemovingUnsupportedCompositionAttributes
{
  v2 = objc_msgSend(MEMORY[0x1E4F28B18], "ck_defaultAllowedAttributesForComposition");
  v3 = [v2 allObjects];

  v4 = objc_msgSend(a1, "__ck_attributedStringByRemovingAllAttributesExcept:", v3);

  return v4;
}

@end