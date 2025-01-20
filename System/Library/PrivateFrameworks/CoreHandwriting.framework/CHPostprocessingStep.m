@interface CHPostprocessingStep
+ (BOOL)shouldAdjustColumnsFromPostprocessingStepOptions:(id)a3;
- (BOOL)modifiesOriginalTokens;
- (id)process:(id)a3 options:(id)a4;
@end

@implementation CHPostprocessingStep

- (id)process:(id)a3 options:(id)a4
{
  id v4 = a3;
  return v4;
}

- (BOOL)modifiesOriginalTokens
{
  return 0;
}

+ (BOOL)shouldAdjustColumnsFromPostprocessingStepOptions:(id)a3
{
  id v3 = a3;
  v8 = v3;
  if (v3)
  {
    v9 = objc_msgSend_objectForKey_(v3, v4, CHPostProcessingStepOptionAdjustColumns, v5, v6, v7);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v15 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13, v14);
    }
    else {
      char v15 = 1;
    }

    return v15;
  }
  else
  {

    return 1;
  }
}

@end