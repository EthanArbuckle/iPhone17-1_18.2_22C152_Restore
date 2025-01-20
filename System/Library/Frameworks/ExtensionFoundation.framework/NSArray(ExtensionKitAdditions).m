@interface NSArray(ExtensionKitAdditions)
- (id)_EX_objectAtIndex:()ExtensionKitAdditions ofClass:;
- (uint64_t)_EX_BOOLAtIndex:()ExtensionKitAdditions;
- (uint64_t)_EX_BOOLAtIndex:()ExtensionKitAdditions defaultValue:;
- (uint64_t)_EX_arrayAtIndex:()ExtensionKitAdditions;
- (uint64_t)_EX_dictionaryAtIndex:()ExtensionKitAdditions;
- (uint64_t)_EX_stringAtIndex:()ExtensionKitAdditions;
@end

@implementation NSArray(ExtensionKitAdditions)

- (id)_EX_objectAtIndex:()ExtensionKitAdditions ofClass:
{
  v1 = objc_msgSend(a1, "objectAtIndex:");
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (uint64_t)_EX_dictionaryAtIndex:()ExtensionKitAdditions
{
  uint64_t v5 = objc_opt_class();

  return objc_msgSend(a1, "_EX_objectAtIndex:ofClass:", a3, v5);
}

- (uint64_t)_EX_arrayAtIndex:()ExtensionKitAdditions
{
  uint64_t v5 = objc_opt_class();

  return objc_msgSend(a1, "_EX_objectAtIndex:ofClass:", a3, v5);
}

- (uint64_t)_EX_stringAtIndex:()ExtensionKitAdditions
{
  uint64_t v5 = objc_opt_class();

  return objc_msgSend(a1, "_EX_objectAtIndex:ofClass:", a3, v5);
}

- (uint64_t)_EX_BOOLAtIndex:()ExtensionKitAdditions
{
  v3 = objc_msgSend(a1, "_EX_objectAtIndex:ofClass:", a3, objc_opt_class());
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

- (uint64_t)_EX_BOOLAtIndex:()ExtensionKitAdditions defaultValue:
{
  uint64_t v5 = objc_msgSend(a1, "_EX_objectAtIndex:ofClass:", a3, objc_opt_class());
  v6 = v5;
  if (v5) {
    a4 = [v5 BOOLValue];
  }

  return a4;
}

@end