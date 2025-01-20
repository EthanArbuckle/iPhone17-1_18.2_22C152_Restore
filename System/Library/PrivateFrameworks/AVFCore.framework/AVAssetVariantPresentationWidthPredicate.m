@interface AVAssetVariantPresentationWidthPredicate
- (AVAssetVariantPresentationWidthPredicate)initWithPresentationWidth:(double)a3 operatorType:(unint64_t)a4;
@end

@implementation AVAssetVariantPresentationWidthPredicate

- (AVAssetVariantPresentationWidthPredicate)initWithPresentationWidth:(double)a3 operatorType:(unint64_t)a4
{
  uint64_t v7 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"videoAttributes.presentationWidth"];
  v9.receiver = self;
  v9.super_class = (Class)AVAssetVariantPresentationWidthPredicate;
  return -[AVAssetVariantPresentationWidthPredicate initWithLeftExpression:rightExpression:modifier:type:options:](&v9, sel_initWithLeftExpression_rightExpression_modifier_type_options_, v7, objc_msgSend(MEMORY[0x1E4F28C68], "expressionForConstantValue:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:", a3)), 0, a4, 0);
}

@end