@interface NSDictionary(INIntentImpl)
- (double)intents_doubleForKey:()INIntentImpl;
- (id)_intents_widgetPlistRepresentableForKey:()INIntentImpl ofClass:error:;
- (id)intents_numberForKey:()INIntentImpl;
- (id)intents_safeObjectForKey:()INIntentImpl ofType:;
- (id)intents_stringForKey:()INIntentImpl;
- (id)intents_urlForKey:()INIntentImpl;
- (uint64_t)intents_BOOLForKey:()INIntentImpl;
- (uint64_t)intents_int64ForKey:()INIntentImpl;
- (uint64_t)intents_intForKey:()INIntentImpl;
@end

@implementation NSDictionary(INIntentImpl)

- (id)_intents_widgetPlistRepresentableForKey:()INIntentImpl ofClass:error:
{
  id v8 = a3;
  v9 = objc_msgSend(a1, "intents_safeObjectForKey:ofType:", v8, objc_opt_class());

  if (v9)
  {
    id v15 = 0;
    v10 = [a4 makeFromWidgetPlistableRepresentation:v9 error:&v15];
    id v11 = v15;
    v12 = v11;
    if (v11)
    {
      id v13 = 0;
      if (a5) {
        *a5 = v11;
      }
    }
    else
    {
      id v13 = v10;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)intents_urlForKey:()INIntentImpl
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "intents_safeObjectForKey:ofType:", v4, objc_opt_class());

  v6 = [MEMORY[0x1E4F1CB10] URLWithString:v5];

  return v6;
}

- (id)intents_numberForKey:()INIntentImpl
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "intents_safeObjectForKey:ofType:", v4, objc_opt_class());

  return v5;
}

- (double)intents_doubleForKey:()INIntentImpl
{
  v1 = objc_msgSend(a1, "intents_numberForKey:");
  v2 = v1;
  if (v1)
  {
    [v1 doubleValue];
    double v4 = v3;
  }
  else
  {
    double v4 = 0.0;
  }

  return v4;
}

- (uint64_t)intents_int64ForKey:()INIntentImpl
{
  v1 = objc_msgSend(a1, "intents_numberForKey:");
  v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 longLongValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)intents_intForKey:()INIntentImpl
{
  v1 = objc_msgSend(a1, "intents_numberForKey:");
  v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 integerValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)intents_stringForKey:()INIntentImpl
{
  v1 = objc_msgSend(a1, "objectForKey:");
  v2 = objc_msgSend(NSString, "intents_makeFromWidgetPlistableRepresentation:", v1);

  return v2;
}

- (uint64_t)intents_BOOLForKey:()INIntentImpl
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "intents_safeObjectForKey:ofType:", v4, objc_opt_class());

  uint64_t v6 = [v5 BOOLValue];
  return v6;
}

- (id)intents_safeObjectForKey:()INIntentImpl ofType:
{
  v1 = objc_msgSend(a1, "objectForKey:");
  v2 = v1;
  if (v1)
  {
    if (objc_opt_isKindOfClass()) {
      v1 = v2;
    }
    else {
      v1 = 0;
    }
  }
  id v3 = v1;

  return v3;
}

@end