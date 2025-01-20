@interface CKConversationListTipManagerSwift
- (CKConversationListTipManagerSwift)init;
- (CKConversationListTipManagerSwift)initWithConversationListController:(id)a3;
- (UIView)miniTipUIView;
- (int64_t)presentedTip;
- (uint64_t)updateKtTipRules;
- (void)conversationListControllerDidAppear;
- (void)conversationListControllerDidDisappear;
- (void)setMiniTipUIView:(id)a3;
- (void)setPresentedTip:(int64_t)a3;
- (void)updateCloudTipRulesFor:(id)a3;
- (void)userDidPinConversation;
@end

@implementation CKConversationListTipManagerSwift

- (CKConversationListTipManagerSwift)initWithConversationListController:(id)a3
{
  id v3 = a3;
  v4 = (CKConversationListTipManagerSwift *)sub_18EF20B70();

  return v4;
}

- (int64_t)presentedTip
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___CKConversationListTipManagerSwift_presentedTip);
  swift_beginAccess();
  return *v2;
}

- (void)conversationListControllerDidAppear
{
  v2 = self;
  sub_18EF22EC4();
}

- (UIView)miniTipUIView
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___CKConversationListTipManagerSwift_miniTipUIView);
  swift_beginAccess();
  return (UIView *)*v2;
}

- (void)setMiniTipUIView:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___CKConversationListTipManagerSwift_miniTipUIView);
  swift_beginAccess();
  v5 = *v4;
  CKConversationListTipManagerSwift *v4 = a3;
  id v6 = a3;
}

- (void)setPresentedTip:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___CKConversationListTipManagerSwift_presentedTip);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (void)updateCloudTipRulesFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18F4D5E34((uint64_t)v4);
}

- (void)conversationListControllerDidDisappear
{
  uint64_t v3 = OBJC_IVAR___CKConversationListTipManagerSwift_tipObservationTask;
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___CKConversationListTipManagerSwift_tipObservationTask))
  {
    id v4 = self;
    sub_18F7B5790();
    sub_18F7B9AF0();
    swift_release();
  }
  else
  {
    v5 = self;
  }
  *(Class *)((char *)&self->super.isa + v3) = 0;

  swift_release();
}

- (void)userDidPinConversation
{
  uint64_t v3 = sub_18F7B6D50();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  id v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  v9[0] = sub_18EF6F450();
  v9[1] = v8;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E4F422A0], v3);
  sub_18EF70D28();
  sub_18F7B6BA0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  swift_bridgeObjectRelease();
}

- (CKConversationListTipManagerSwift)init
{
  result = (CKConversationListTipManagerSwift *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_18EF24BBC(*(void **)((char *)&self->super.isa
                         + OBJC_IVAR___CKConversationListTipManagerSwift____lazy_storage___ktWaitingForCloudTip));
  sub_18EF24BBC(*(void **)((char *)&self->super.isa
                         + OBJC_IVAR___CKConversationListTipManagerSwift____lazy_storage___ktUpdateAppleIDTip));

  swift_release();
}

- (uint64_t)updateKtTipRules
{
  CKIsWaitingForCloud();
  CKIsAppleIDNotUpdated();
  if (qword_1E922AA10 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_18F7B68E0();
  __swift_project_value_buffer(v0, (uint64_t)qword_1E92648C8);
  v1 = sub_18F7B68C0();
  os_log_type_t v2 = sub_18F7B9D20();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 67109376;
    sub_18F7BA290();
    *(_WORD *)(v3 + 8) = 1024;
    sub_18F7BA290();
    _os_log_impl(&dword_18EF18000, v1, v2, "Updating KT Tip Rules. ktWaitingForCloud=%{BOOL}d, updateAppleID=%{BOOL}d", (uint8_t *)v3, 0xEu);
    MEMORY[0x192FBC240](v3, -1, -1);
  }

  if (qword_1E922BAE8 != -1) {
    swift_once();
  }
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E922B978);
  __swift_project_value_buffer(v4, (uint64_t)qword_1E9264A38);
  swift_beginAccess();
  sub_18F7B6E90();
  swift_endAccess();
  if (qword_1E922BAC0 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v4, (uint64_t)qword_1E9264A20);
  swift_beginAccess();
  sub_18F7B6E90();
  return swift_endAccess();
}

@end