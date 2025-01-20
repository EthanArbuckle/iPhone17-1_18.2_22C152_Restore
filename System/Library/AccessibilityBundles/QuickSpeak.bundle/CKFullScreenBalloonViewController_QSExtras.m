@interface CKFullScreenBalloonViewController_QSExtras
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)performCancelAnimationWithCompletion:(id)a3;
@end

@implementation CKFullScreenBalloonViewController_QSExtras

+ (id)safeCategoryTargetClassName
{
  return @"CKFullScreenBalloonViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)performCancelAnimationWithCompletion:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKFullScreenBalloonViewController_QSExtras;
  [(CKFullScreenBalloonViewController_QSExtras *)&v4 performCancelAnimationWithCompletion:a3];
  v3 = +[AXQuickSpeak sharedInstance];
  [v3 setContent:0];
}

@end