@interface CKFullScreenBalloonViewControllerPhone_QSExtras
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setBalloonView:(id)a3;
@end

@implementation CKFullScreenBalloonViewControllerPhone_QSExtras

+ (id)safeCategoryTargetClassName
{
  return @"CKFullScreenBalloonViewControllerPhone";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKFullScreenBalloonViewControllerPhone", @"setBalloonView:", "v", "@", 0);
  [v3 validateClass:@"CKTextBalloonView"];
}

- (void)setBalloonView:(id)a3
{
  id v4 = a3;
  v5 = +[AXQuickSpeak sharedInstance];
  [v5 setHasTextBalloonView:0];

  v7.receiver = self;
  v7.super_class = (Class)CKFullScreenBalloonViewControllerPhone_QSExtras;
  [(CKFullScreenBalloonViewControllerPhone_QSExtras *)&v7 setBalloonView:v4];
  NSClassFromString(&cfstr_Cktextballoonv.isa);
  LOBYTE(self) = objc_opt_isKindOfClass();

  if (self)
  {
    v6 = +[AXQuickSpeak sharedInstance];
    [v6 setHasTextBalloonView:1];
  }
}

@end