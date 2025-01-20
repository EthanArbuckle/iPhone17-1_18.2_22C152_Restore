@interface NSObject(_CAObjectInternal)
+ (BOOL)CA_encodesPropertyConditionally:()_CAObjectInternal type:;
+ (uint64_t)CA_CAMLPropertyForKey:()_CAObjectInternal;
+ (uint64_t)CA_automaticallyNotifiesObservers:()_CAObjectInternal;
+ (uint64_t)CA_getterForProperty:()_CAObjectInternal;
+ (uint64_t)CA_setterForProperty:()_CAObjectInternal;
- (uint64_t)CA_validateValue:()_CAObjectInternal forKey:;
@end

@implementation NSObject(_CAObjectInternal)

+ (BOOL)CA_encodesPropertyConditionally:()_CAObjectInternal type:
{
  return a4 == 1 || a4 == 4;
}

- (uint64_t)CA_validateValue:()_CAObjectInternal forKey:
{
  if (a3)
  {
    if (!CAInternAtom(a4, 0)) {
      goto LABEL_18;
    }
    v6 = (objc_class *)objc_opt_class();
    v7 = (uint64_t *)classDescription(v6);
    v8 = propertyInfoForKey(v7, a4, 0);
    if (!v8) {
      goto LABEL_18;
    }
    v9 = v8;
    if (*((unsigned __int16 *)v8 + 2) - 1 <= 4)
    {
      v10 = (const char *)*((void *)v8 + 3);
      if (!v10)
      {
LABEL_18:
        char isKindOfClass = 1;
        return isKindOfClass & 1;
      }
      v11 = (__CFString *)*((void *)v8 + 4);
      if (!v11)
      {
        v11 = (__CFString *)CFStringCreateWithCString(0, v10, 0x8000100u);
        *((void *)v9 + 4) = v11;
      }
      if (NSClassFromString(&v11->isa))
      {
LABEL_21:
        char isKindOfClass = objc_opt_isKindOfClass();
        return isKindOfClass & 1;
      }
      if ([*((id *)v9 + 4) isEqualToString:@"CGColor"])
      {
        CFTypeID v12 = CFGetTypeID(a3);
        CFTypeID TypeID = CGColorGetTypeID();
LABEL_16:
        char isKindOfClass = v12 == TypeID;
        return isKindOfClass & 1;
      }
      if ([*((id *)v9 + 4) isEqualToString:@"CGPath"])
      {
        CFTypeID v12 = CFGetTypeID(a3);
        CFTypeID TypeID = CGPathGetTypeID();
        goto LABEL_16;
      }
      if ([*((id *)v9 + 4) isEqualToString:@"CGColorSpace"])
      {
        CFTypeID v12 = CFGetTypeID(a3);
        CFTypeID TypeID = CGColorSpaceGetTypeID();
        goto LABEL_16;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_18;
    }
    objc_opt_class();
    goto LABEL_21;
  }
  char isKindOfClass = 1;
  return isKindOfClass & 1;
}

+ (uint64_t)CA_CAMLPropertyForKey:()_CAObjectInternal
{
  return a3;
}

+ (uint64_t)CA_automaticallyNotifiesObservers:()_CAObjectInternal
{
  return 1;
}

+ (uint64_t)CA_getterForProperty:()_CAObjectInternal
{
  return 0;
}

+ (uint64_t)CA_setterForProperty:()_CAObjectInternal
{
  return 0;
}

@end