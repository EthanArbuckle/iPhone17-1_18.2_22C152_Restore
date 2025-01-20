@interface NSDictionary(CBPropertyKeyExtension)
- (id)initWithPropertyKey:()CBPropertyKeyExtension andCategory:;
- (id)initWithPropertyKey:()CBPropertyKeyExtension andDisplay:;
- (id)initWithPropertyKey:()CBPropertyKeyExtension display:andParameter:;
- (id)initWithPropertyKey:()CBPropertyKeyExtension keyboardID:;
- (uint64_t)getKeyCategory;
- (uint64_t)getKeyCategoryRef;
- (uint64_t)getKeyDisplayID;
- (uint64_t)getKeyDisplayIDRef;
- (uint64_t)getKeyKeyboardID;
- (uint64_t)getKeyKeyboardIDRef;
- (uint64_t)getKeyPropertyParameter;
- (uint64_t)getKeyString;
- (uint64_t)initWithPropertyKey:()CBPropertyKeyExtension;
@end

@implementation NSDictionary(CBPropertyKeyExtension)

- (id)initWithPropertyKey:()CBPropertyKeyExtension andDisplay:
{
  id v9 = a1;
  uint64_t v8 = a2;
  uint64_t v7 = a3;
  uint64_t v6 = a4;
  id v5 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:a4];
  if (v5) {
    id v9 = (id)objc_msgSend(v9, "initWithObjectsAndKeys:", v5, @"Display", v7, @"String", 0);
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (id)initWithPropertyKey:()CBPropertyKeyExtension display:andParameter:
{
  id v11 = a1;
  uint64_t v10 = a2;
  uint64_t v9 = a3;
  uint64_t v8 = a4;
  uint64_t v7 = a5;
  id v6 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:a4];
  if (v6) {
    id v11 = (id)objc_msgSend(v11, "initWithObjectsAndKeys:", v6, @"Display", v9, @"String", v7, @"Parameter", 0);
  }
  else {
    id v11 = 0;
  }

  return v11;
}

- (uint64_t)initWithPropertyKey:()CBPropertyKeyExtension
{
  id v6 = a1;
  uint64_t v5 = a2;
  uint64_t v4 = a3;
  if (a3) {
    return objc_msgSend(v6, "initWithObjectsAndKeys:", v4, @"String", 0);
  }
  else {
    return 0;
  }
}

- (id)initWithPropertyKey:()CBPropertyKeyExtension andCategory:
{
  id v9 = a1;
  uint64_t v8 = a2;
  uint64_t v7 = a3;
  uint64_t v6 = a4;
  id v5 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:a4];
  if (v5) {
    id v9 = (id)objc_msgSend(v9, "initWithObjectsAndKeys:", v5, @"Category", v7, @"String", 0);
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (uint64_t)getKeyString
{
  return objc_msgSend(a1, "objectForKey:", @"String", a2, a1);
}

- (uint64_t)getKeyDisplayID
{
  uint64_t v3 = 0;
  v2 = (void *)[a1 objectForKey:@"Display"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return [v2 unsignedIntegerValue];
  }
  return v3;
}

- (uint64_t)getKeyDisplayIDRef
{
  return objc_msgSend(a1, "objectForKey:", @"Display", a2, a1);
}

- (uint64_t)getKeyCategory
{
  uint64_t v3 = 0;
  v2 = (void *)[a1 objectForKey:@"Category"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return [v2 unsignedIntegerValue];
  }
  return v3;
}

- (uint64_t)getKeyCategoryRef
{
  return objc_msgSend(a1, "objectForKey:", @"Category", a2, a1);
}

- (uint64_t)getKeyPropertyParameter
{
  return objc_msgSend(a1, "objectForKey:", @"Parameter", a2, a1);
}

- (id)initWithPropertyKey:()CBPropertyKeyExtension keyboardID:
{
  id v9 = a1;
  uint64_t v8 = a2;
  uint64_t v7 = a3;
  uint64_t v6 = a4;
  id v5 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:a4];
  if (v5) {
    id v9 = (id)objc_msgSend(v9, "initWithObjectsAndKeys:", v5, @"Keyboard", v7, @"String", 0);
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (uint64_t)getKeyKeyboardID
{
  uint64_t v3 = 0;
  v2 = (void *)[a1 objectForKey:@"Keyboard"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return [v2 unsignedIntegerValue];
  }
  return v3;
}

- (uint64_t)getKeyKeyboardIDRef
{
  return objc_msgSend(a1, "objectForKey:", @"Keyboard", a2, a1);
}

@end