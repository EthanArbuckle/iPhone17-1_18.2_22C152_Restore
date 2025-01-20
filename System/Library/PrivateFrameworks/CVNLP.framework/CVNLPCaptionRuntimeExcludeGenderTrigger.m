@interface CVNLPCaptionRuntimeExcludeGenderTrigger
- (CVNLPCaptionRuntimeExcludeGenderTrigger)initWithDictionary:(id)a3;
- (NSArray)triggerTokens;
@end

@implementation CVNLPCaptionRuntimeExcludeGenderTrigger

- (CVNLPCaptionRuntimeExcludeGenderTrigger)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CVNLPCaptionRuntimeExcludeGenderTrigger;
  v7 = [(CVNLPCaptionRuntimeExcludeGenderTrigger *)&v14 init];
  if (v7)
  {
    v8 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"triggerTokens", v6);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v4, v9, @"triggerTokens", v10);
      triggerTokens = v7->_triggerTokens;
      v7->_triggerTokens = (NSArray *)v11;
    }
    else
    {
      triggerTokens = v7->_triggerTokens;
      v7->_triggerTokens = 0;
    }
  }
  return v7;
}

- (NSArray)triggerTokens
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end