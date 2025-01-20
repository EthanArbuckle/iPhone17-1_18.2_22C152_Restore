@interface GAXSKPaymentQueueOverride
+ (BOOL)canMakePayments;
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation GAXSKPaymentQueueOverride

+ (id)safeCategoryTargetClassName
{
  return @"SKPaymentQueue";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)canMakePayments
{
  v3 = +[GAXClient sharedInstance];
  if ([v3 serverMode] == 2)
  {
    unsigned __int8 v4 = 0;
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___GAXSKPaymentQueueOverride;
    unsigned __int8 v4 = objc_msgSendSuper2(&v6, "canMakePayments");
  }

  return v4;
}

@end