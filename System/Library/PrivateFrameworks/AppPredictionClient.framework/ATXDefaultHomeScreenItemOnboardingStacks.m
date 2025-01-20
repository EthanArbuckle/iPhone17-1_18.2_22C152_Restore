@interface ATXDefaultHomeScreenItemOnboardingStacks
- (ATXDefaultHomeScreenItemOnboardingStacks)initWithOnboardingStack1:(id)a3 stack2:(id)a4 sortedThirdPartyWidgets:(id)a5;
- (ATXDefaultWidgetStack)stack1;
- (ATXDefaultWidgetStack)stack2;
- (NSArray)sortedThirdPartyWidgets;
@end

@implementation ATXDefaultHomeScreenItemOnboardingStacks

- (ATXDefaultHomeScreenItemOnboardingStacks)initWithOnboardingStack1:(id)a3 stack2:(id)a4 sortedThirdPartyWidgets:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXDefaultHomeScreenItemOnboardingStacks;
  v12 = [(ATXDefaultHomeScreenItemOnboardingStacks *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_stack1, a3);
    objc_storeStrong((id *)&v13->_stack2, a4);
    objc_storeStrong((id *)&v13->_sortedThirdPartyWidgets, a5);
  }

  return v13;
}

- (ATXDefaultWidgetStack)stack1
{
  return self->_stack1;
}

- (ATXDefaultWidgetStack)stack2
{
  return self->_stack2;
}

- (NSArray)sortedThirdPartyWidgets
{
  return self->_sortedThirdPartyWidgets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedThirdPartyWidgets, 0);
  objc_storeStrong((id *)&self->_stack2, 0);

  objc_storeStrong((id *)&self->_stack1, 0);
}

@end