@interface AVAssetVariantRenditionSpecificAudioAttributePredicate
- (AVAssetVariantRenditionSpecificAudioAttributePredicate)initWithAttributeSelector:(SEL)a3 mediaSelectionOption:(id)a4 value:(id)a5 operatorType:(unint64_t)a6;
@end

@implementation AVAssetVariantRenditionSpecificAudioAttributePredicate

- (AVAssetVariantRenditionSpecificAudioAttributePredicate)initWithAttributeSelector:(SEL)a3 mediaSelectionOption:(id)a4 value:(id)a5 operatorType:(unint64_t)a6
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C68], "expressionForConstantValue:", objc_msgSend(a4, "propertyList"));
  uint64_t v11 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"audioAttributes"];
  v15[0] = v10;
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28C68], "expressionForFunction:selectorName:arguments:", v11, objc_msgSend(NSString, "stringWithUTF8String:", sel_getName(a3)), objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v15, 1));
  v14.receiver = self;
  v14.super_class = (Class)AVAssetVariantRenditionSpecificAudioAttributePredicate;
  return -[AVAssetVariantRenditionSpecificAudioAttributePredicate initWithLeftExpression:rightExpression:modifier:type:options:](&v14, sel_initWithLeftExpression_rightExpression_modifier_type_options_, v12, [MEMORY[0x1E4F28C68] expressionForConstantValue:a5], 0, a6, 0);
}

@end