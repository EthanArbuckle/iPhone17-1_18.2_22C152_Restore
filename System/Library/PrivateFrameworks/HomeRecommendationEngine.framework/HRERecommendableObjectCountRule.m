@interface HRERecommendableObjectCountRule
+ (id)ruleWithAccessoryType:(id)a3 allowedCount:(_NSRange)a4;
- (BOOL)passesWithHomeObjects:(id)a3;
- (HRERecommendableObjectCountRule)initWithAccessoryType:(id)a3 allowedCount:(_NSRange)a4;
- (_NSRange)allowedCount;
@end

@implementation HRERecommendableObjectCountRule

- (HRERecommendableObjectCountRule)initWithAccessoryType:(id)a3 allowedCount:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v7.receiver = self;
  v7.super_class = (Class)HRERecommendableObjectCountRule;
  result = [(HRERecommendableObjectTypeRule *)&v7 initWithRequiredType:a3];
  if (result)
  {
    result->_allowedCount.NSUInteger location = location;
    result->_allowedCount.NSUInteger length = length;
  }
  return result;
}

+ (id)ruleWithAccessoryType:(id)a3 allowedCount:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v6 = a3;
  objc_super v7 = -[HRERecommendableObjectCountRule initWithAccessoryType:allowedCount:]([HRERecommendableObjectCountRule alloc], "initWithAccessoryType:allowedCount:", v6, location, length);

  return v7;
}

- (BOOL)passesWithHomeObjects:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "hre_matchingTypes");
        v11 = [(HRERecommendableObjectTypeRule *)self requiredType];
        unsigned int v12 = [v10 containsObject:v11];

        v7 += v12;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }
  unint64_t v13 = [(HRERecommendableObjectCountRule *)self allowedCount];
  BOOL v16 = v7 >= v13 && v7 - v13 < v14;

  return v16;
}

- (_NSRange)allowedCount
{
  p_allowedCount = &self->_allowedCount;
  NSUInteger location = self->_allowedCount.location;
  NSUInteger length = p_allowedCount->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

@end