@interface DDAddressAction
+ (BOOL)actionAvailableForContact:(id)a3;
+ (id)actionWithURL:(id)a3 result:(__DDResult *)a4 enclosingResult:(__DDResult *)a5 context:(id)a6;
- (id)iconName;
- (id)variantIconName;
@end

@implementation DDAddressAction

+ (id)actionWithURL:(id)a3 result:(__DDResult *)a4 enclosingResult:(__DDResult *)a5 context:(id)a6
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___DDAddressAction;
  uint64_t v7 = objc_msgSendSuper2(&v9, sel_actionWithURL_result_context_, a3, a4, a6);
  if (a5)
  {
    *(void *)(v7 + 16) = CFRetain(a5);
    *(unsigned char *)(v7 + 80) = 1;
  }
  return (id)v7;
}

+ (BOOL)actionAvailableForContact:(id)a3
{
  v4 = DDDefaultAddressForContact(a3);
  if (v4) {
    char v5 = [a1 isAvailable];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)iconName
{
  return @"person.crop.circle.badge.plus";
}

- (id)variantIconName
{
  return @"person.crop.circle.fill";
}

@end