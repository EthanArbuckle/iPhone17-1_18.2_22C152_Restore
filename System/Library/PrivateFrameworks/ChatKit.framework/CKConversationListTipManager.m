@interface CKConversationListTipManager
- (CKConversationListTipManager)initWithConversationListController:(id)a3;
- (CKConversationListTipManagerSwift)swiftManager;
- (id)miniTipUIView;
- (int64_t)presentedTip;
- (void)conversationListControllerDidAppear;
- (void)conversationListControllerDidDisappear;
- (void)setSwiftManager:(id)a3;
- (void)updateCloudTipRulesForDescriptor:(id)a3;
- (void)updateKtTipRules;
- (void)userDidPinConversation;
@end

@implementation CKConversationListTipManager

- (CKConversationListTipManager)initWithConversationListController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKConversationListTipManager;
  v5 = [(CKConversationListTipManager *)&v9 init];
  if (v5)
  {
    v6 = [[CKConversationListTipManagerSwift alloc] initWithConversationListController:v4];
    swiftManager = v5->_swiftManager;
    v5->_swiftManager = v6;
  }
  return v5;
}

- (int64_t)presentedTip
{
  return [(CKConversationListTipManagerSwift *)self->_swiftManager presentedTip];
}

- (void)conversationListControllerDidAppear
{
}

- (id)miniTipUIView
{
  return [(CKConversationListTipManagerSwift *)self->_swiftManager miniTipUIView];
}

- (void)conversationListControllerDidDisappear
{
}

- (void)userDidPinConversation
{
}

- (void)updateKtTipRules
{
}

- (void)updateCloudTipRulesForDescriptor:(id)a3
{
}

- (CKConversationListTipManagerSwift)swiftManager
{
  return self->_swiftManager;
}

- (void)setSwiftManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end