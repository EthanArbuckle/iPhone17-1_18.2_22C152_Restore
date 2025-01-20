@interface CNContactQuickActionsDisambiguationMenuPresentation
+ (CNContactQuickActionsDisambiguationMenuPresentation)alertSheetPresentation;
+ (CNContactQuickActionsDisambiguationMenuPresentation)modalPresentation;
- (id)initBase;
- (id)viewControllerForPresentingActionsController:(id)a3 fromView:(id)a4 dismissDisambiguationMenuHandler:(id)a5;
@end

@implementation CNContactQuickActionsDisambiguationMenuPresentation

- (id)viewControllerForPresentingActionsController:(id)a3 fromView:(id)a4 dismissDisambiguationMenuHandler:(id)a5
{
  return (id)[a3 viewController];
}

- (id)initBase
{
  v3.receiver = self;
  v3.super_class = (Class)CNContactQuickActionsDisambiguationMenuPresentation;
  return [(CNContactQuickActionsDisambiguationMenuPresentation *)&v3 init];
}

+ (CNContactQuickActionsDisambiguationMenuPresentation)alertSheetPresentation
{
  id v2 = [(CNContactQuickActionsDisambiguationMenuPresentation *)[_CNContactQuickActionsAlertSheetDisambiguationMenuPresentation alloc] initBase];

  return (CNContactQuickActionsDisambiguationMenuPresentation *)v2;
}

+ (CNContactQuickActionsDisambiguationMenuPresentation)modalPresentation
{
  id v2 = [(CNContactQuickActionsDisambiguationMenuPresentation *)[_CNContactQuickActionsModalDisambiguationMenuPresentation alloc] initBase];

  return (CNContactQuickActionsDisambiguationMenuPresentation *)v2;
}

@end