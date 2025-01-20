@interface ConduitApprovalDelegate
- (_TtC15ConversationKit23ConduitApprovalDelegate)init;
- (void)approveSplitSessionForConversation:(id)a3 requestedFromDevice:(id)a4 pullContext:(int64_t)a5 completion:(id)a6;
- (void)cancelSplitSessionApproval;
@end

@implementation ConduitApprovalDelegate

- (void)approveSplitSessionForConversation:(id)a3 requestedFromDevice:(id)a4 pullContext:(int64_t)a5 completion:(id)a6
{
  v9 = _Block_copy(a6);
  *(void *)(swift_allocObject() + 16) = v9;
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  ConduitApprovalDelegate.approveSplitSession(for:requestedFromDevice:pullContext:completion:)();

  swift_release();
}

- (void)cancelSplitSessionApproval
{
  v2 = self;
  ConduitApprovalDelegate.cancelSplitSessionApproval()();
}

- (_TtC15ConversationKit23ConduitApprovalDelegate)init
{
}

- (void).cxx_destruct
{
}

@end