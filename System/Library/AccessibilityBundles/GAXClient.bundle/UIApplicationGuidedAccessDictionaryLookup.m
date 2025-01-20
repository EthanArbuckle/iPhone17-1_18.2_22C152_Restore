@interface UIApplicationGuidedAccessDictionaryLookup
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_guidedAccessDictionaryLookupAllowed;
- (id)detailTextForGuidedAccessRestrictionWithIdentifier:(id)a3;
- (id)guidedAccessRestrictionIdentifiers;
- (id)textForGuidedAccessRestrictionWithIdentifier:(id)a3;
- (void)_guidedAccessSetDictionaryLookupAllowed:(BOOL)a3;
- (void)guidedAccessRestrictionWithIdentifier:(id)a3 didChangeState:(int64_t)a4;
@end

@implementation UIApplicationGuidedAccessDictionaryLookup

+ (id)safeCategoryTargetClassName
{
  return @"UIApplication";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_guidedAccessDictionaryLookupAllowed
{
  v2 = objc_getAssociatedObject(self, &unk_1BCD8);
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v3 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v3 = 1;
  }

  return v3;
}

- (void)_guidedAccessSetDictionaryLookupAllowed:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, &unk_1BCD8, v4, (char *)&dword_0 + 1);
}

- (id)guidedAccessRestrictionIdentifiers
{
  CFStringRef v4 = @"GAXProfileAllowsWebTextDefine";
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (void)guidedAccessRestrictionWithIdentifier:(id)a3 didChangeState:(int64_t)a4
{
  if ([a3 isEqualToString:@"GAXProfileAllowsWebTextDefine"])
  {
    [(UIApplicationGuidedAccessDictionaryLookup *)self _guidedAccessSetDictionaryLookupAllowed:a4 == 0];
  }
}

- (id)textForGuidedAccessRestrictionWithIdentifier:(id)a3
{
  if ([a3 isEqualToString:@"GAXProfileAllowsWebTextDefine"])
  {
    unsigned __int8 v3 = +[NSBundle bundleForClass:objc_opt_class()];
    CFStringRef v4 = [v3 localizedStringForKey:@"DICTIONARY_LOOKUP" value:0 table:@"GuidedAccessAppStrings"];
  }
  else
  {
    CFStringRef v4 = 0;
  }

  return v4;
}

- (id)detailTextForGuidedAccessRestrictionWithIdentifier:(id)a3
{
  return 0;
}

@end