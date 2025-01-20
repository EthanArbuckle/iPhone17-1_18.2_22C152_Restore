@interface ASUIClientWrapper
- (_TtC17AccessorySetupKit17ASUIClientWrapper)init;
- (id)retrieveDisplayItems;
- (void)pickerDidDismiss:(id)a3;
- (void)pickerDidPresent;
- (void)pickerDidSelectAccessory;
- (void)pickerSetupFailed:(id)a3;
- (void)pickerStartedBridging;
- (void)pickerStartedPairing;
- (void)pickerStartedRename;
- (void)relayPickerCompletion:(id)a3;
@end

@implementation ASUIClientWrapper

- (void)pickerStartedPairing
{
  v2 = self;
  sub_242F1424C();
}

- (void)pickerSetupFailed:(id)a3
{
  v4 = self;
  id v5 = a3;
  sub_242F1429C((uint64_t)a3);
}

- (void)pickerStartedBridging
{
  v2 = self;
  sub_242F143E8();
}

- (void)pickerStartedRename
{
  v2 = self;
  sub_242F14438();
}

- (void)pickerDidPresent
{
  v2 = self;
  sub_242F14488();
}

- (void)pickerDidDismiss:(id)a3
{
  v4 = self;
  id v5 = a3;
  sub_242F1459C(a3);
}

- (void)pickerDidSelectAccessory
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientWrapper_clientManager);
  if (v2) {
    *(void *)(v2 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_debounceCounter) = 0;
  }
}

- (void)relayPickerCompletion:(id)a3
{
  v4 = self;
  id v5 = a3;
  sub_242F1475C(a3);
}

- (id)retrieveDisplayItems
{
  uint64_t v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientWrapper_clientManager);
  if (v2)
  {
    v3 = self;
    id v4 = v2;
    unint64_t v5 = swift_bridgeObjectRetain();
    sub_242F14AC4(v5);

    swift_bridgeObjectRelease();
  }
  v6 = (void *)sub_242F16A08();
  swift_bridgeObjectRelease();

  return v6;
}

- (_TtC17AccessorySetupKit17ASUIClientWrapper)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientWrapper_clientManager) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ASUIClientWrapper();
  return [(ASUIClientWrapper *)&v3 init];
}

- (void).cxx_destruct
{
}

@end