@interface CSUCaptionRuntimeExcludeGenderTrigger
- (CSUCaptionRuntimeExcludeGenderTrigger)initWithDictionary:(id)a3;
- (NSArray)triggerTokens;
@end

@implementation CSUCaptionRuntimeExcludeGenderTrigger

- (CSUCaptionRuntimeExcludeGenderTrigger)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CSUCaptionRuntimeExcludeGenderTrigger;
  v8 = [(CSUCaptionRuntimeExcludeGenderTrigger *)&v16 init];
  if (v8)
  {
    v9 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"triggerTokens", v6, v7);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v4, v10, @"triggerTokens", v11, v12);
      triggerTokens = v8->_triggerTokens;
      v8->_triggerTokens = (NSArray *)v13;
    }
    else
    {
      triggerTokens = v8->_triggerTokens;
      v8->_triggerTokens = 0;
    }
  }
  return v8;
}

- (NSArray)triggerTokens
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end