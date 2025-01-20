@interface UIResponder_QSExtras
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
@end

@implementation UIResponder_QSExtras

+ (id)safeCategoryTargetClassName
{
  return @"UIResponder";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  int v7 = [(UIResponder_QSExtras *)self _accessibilityQScanPerformAction:a3 withSender:v6];
  v8 = +[AXQSMenuHelper sharedInstance];
  char v9 = [v8 isShowingLanguageChoices];

  if ((v9 & 1) == 0
    && ((v7 | +[AXQuickSpeak isQuickSpeakSelector:a3]) & 1) == 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)UIResponder_QSExtras;
    LOBYTE(v7) = [(UIResponder_QSExtras *)&v11 canPerformAction:a3 withSender:v6];
  }

  return v7;
}

@end