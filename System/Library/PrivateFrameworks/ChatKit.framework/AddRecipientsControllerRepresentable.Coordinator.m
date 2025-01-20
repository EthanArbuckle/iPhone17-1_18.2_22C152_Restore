@interface AddRecipientsControllerRepresentable.Coordinator
- (BOOL)recipientSelectionIsGroup:(id)a3;
- (UIEdgeInsets)navigationBarInsetsForRecipientSelectionController:(id)a3;
- (_TtCV7ChatKit36AddRecipientsControllerRepresentable11Coordinator)init;
- (double)visibleInputAndEntryViewHeightToAvoidForRecipientSelectionController:(id)a3;
- (void)handleCancelAction;
- (void)handleDoneAction;
- (void)recipientSelectionControllerShouldResignFirstResponder:(id)a3;
@end

@implementation AddRecipientsControllerRepresentable.Coordinator

- (void)handleCancelAction
{
  v2 = self;
  sub_18F6ED5D4();
}

- (void)handleDoneAction
{
  v2 = self;
  sub_18F6ED814();
}

- (BOOL)recipientSelectionIsGroup:(id)a3
{
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV7ChatKit36AddRecipientsControllerRepresentable11Coordinator_conversation);
  if (v3)
  {
    id v5 = a3;
    v6 = self;
    id v7 = objc_msgSend(v3, sel_recipients);
    sub_18EF3528C(0, (unint64_t *)&qword_1E922B6D8);
    unint64_t v8 = sub_18F7B99C0();

    if (v8 >> 62)
    {
      sub_18F7B6CA0();
      uint64_t v9 = sub_18F7BA5F0();

      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9 > 1;
}

- (double)visibleInputAndEntryViewHeightToAvoidForRecipientSelectionController:(id)a3
{
  return 0.0;
}

- (UIEdgeInsets)navigationBarInsetsForRecipientSelectionController:(id)a3
{
  double v3 = *MEMORY[0x1E4F437F8];
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)recipientSelectionControllerShouldResignFirstResponder:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_18F6ED814();
}

- (_TtCV7ChatKit36AddRecipientsControllerRepresentable11Coordinator)init
{
  UIEdgeInsets result = (_TtCV7ChatKit36AddRecipientsControllerRepresentable11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void *)&self->parent[OBJC_IVAR____TtCV7ChatKit36AddRecipientsControllerRepresentable11Coordinator_parent];
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV7ChatKit36AddRecipientsControllerRepresentable11Coordinator_parent));
  sub_18EF6E880(v3);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV7ChatKit36AddRecipientsControllerRepresentable11Coordinator_addRecipientsController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV7ChatKit36AddRecipientsControllerRepresentable11Coordinator_navigationController));
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV7ChatKit36AddRecipientsControllerRepresentable11Coordinator_conversation);
}

@end