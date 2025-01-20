@interface ComposeMessageView.Coordinator
- (_TtCV37com_apple_CloudSharingUI_CloudSharing18ComposeMessageView11Coordinator)init;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
@end

@implementation ComposeMessageView.Coordinator

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6 = a3;
  v8 = self;
  [v6 dismissViewControllerAnimated:1 completion:0];
  v7 = *(void (**)(BOOL))((char *)&v8->super.isa
                                   + OBJC_IVAR____TtCV37com_apple_CloudSharingUI_CloudSharing18ComposeMessageView11Coordinator_completion);
  if (v7) {
    v7(a4 == 1);
  }
}

- (_TtCV37com_apple_CloudSharingUI_CloudSharing18ComposeMessageView11Coordinator)init
{
  result = (_TtCV37com_apple_CloudSharingUI_CloudSharing18ComposeMessageView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100013344(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCV37com_apple_CloudSharingUI_CloudSharing18ComposeMessageView11Coordinator_completion));
}

@end