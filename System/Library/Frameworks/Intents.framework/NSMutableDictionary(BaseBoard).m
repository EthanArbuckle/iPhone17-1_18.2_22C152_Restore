@interface NSMutableDictionary(BaseBoard)
- (uint64_t)intents_setArrayOfWidgetPlistRepresentable:()BaseBoard forKey:error:;
- (uint64_t)intents_setWidgetPlistRepresentable:()BaseBoard forKey:error:;
- (void)intents_setArrayOfWidgetPlistRepresentable:()BaseBoard forKey:parameters:error:;
- (void)intents_setBoolIfTrue:()BaseBoard forKey:;
- (void)intents_setIntegerIfNonZero:()BaseBoard forKey:;
- (void)intents_setPlistSafeObject:()BaseBoard forKey:;
- (void)intents_setWidgetPlistRepresentable:()BaseBoard forKey:parameters:error:;
@end

@implementation NSMutableDictionary(BaseBoard)

- (void)intents_setArrayOfWidgetPlistRepresentable:()BaseBoard forKey:parameters:error:
{
  v19 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  uint64_t v13 = [v9 count];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    while (1)
    {
      v16 = objc_msgSend(v9, "objectAtIndexedSubscript:", v15, v19);
      id v20 = 0;
      v17 = [v16 widgetPlistableRepresentationWithParameters:v11 error:&v20];
      id v18 = v20;

      if (v18) {
        break;
      }
      [v12 setObject:v17 atIndexedSubscript:v15];

      if (v14 == ++v15) {
        goto LABEL_5;
      }
    }
    if (v19) {
      void *v19 = v18;
    }
  }
  else
  {
LABEL_5:
    objc_msgSend(a1, "intents_setPlistSafeObject:forKey:", v12, v10, v19);
  }
}

- (uint64_t)intents_setArrayOfWidgetPlistRepresentable:()BaseBoard forKey:error:
{
  return objc_msgSend(a1, "intents_setArrayOfWidgetPlistRepresentable:forKey:parameters:error:", a3, a4, 0, a5);
}

- (void)intents_setWidgetPlistRepresentable:()BaseBoard forKey:parameters:error:
{
  id v10 = a4;
  id v14 = 0;
  id v11 = [a3 widgetPlistableRepresentationWithParameters:a5 error:&v14];
  id v12 = v14;
  uint64_t v13 = v12;
  if (v12)
  {
    if (a6) {
      *a6 = v12;
    }
  }
  else
  {
    objc_msgSend(a1, "intents_setPlistSafeObject:forKey:", v11, v10);
  }
}

- (uint64_t)intents_setWidgetPlistRepresentable:()BaseBoard forKey:error:
{
  return objc_msgSend(a1, "intents_setWidgetPlistRepresentable:forKey:parameters:error:", a3, a4, 0, a5);
}

- (void)intents_setBoolIfTrue:()BaseBoard forKey:
{
  if (a3)
  {
    v5 = NSNumber;
    id v6 = a4;
    id v7 = [v5 numberWithBool:1];
    objc_msgSend(a1, "intents_setPlistSafeObject:forKey:", v7, v6);
  }
}

- (void)intents_setPlistSafeObject:()BaseBoard forKey:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [v6 absoluteString];

      id v6 = (id)v9;
    }
    id v6 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {

LABEL_13:
      [a1 setObject:v6 forKey:v8];
      goto LABEL_14;
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      goto LABEL_13;
    }
    id v11 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_FAULT))
    {
      int v12 = 136315650;
      uint64_t v13 = "-[NSMutableDictionary(BaseBoard) intents_setPlistSafeObject:forKey:]";
      __int16 v14 = 2114;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_fault_impl(&dword_18CB2F000, v11, OS_LOG_TYPE_FAULT, "%s Unsupported plistable type attempting to be encoded for key [%{public}@]: %@", (uint8_t *)&v12, 0x20u);
    }
  }
LABEL_14:
}

- (void)intents_setIntegerIfNonZero:()BaseBoard forKey:
{
  if (a3)
  {
    id v6 = NSNumber;
    id v7 = a4;
    id v8 = [v6 numberWithInteger:a3];
    objc_msgSend(a1, "intents_setPlistSafeObject:forKey:", v8, v7);
  }
}

@end