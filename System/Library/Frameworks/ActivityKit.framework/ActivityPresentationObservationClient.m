@interface ActivityPresentationObservationClient
- (_TtC11ActivityKit37ActivityPresentationObservationClient)init;
- (id)listenForActivityPresentationWithActivityIdentifier:(id)a3 presenterBundleIdentifier:(id)a4 handler:(id)a5;
@end

@implementation ActivityPresentationObservationClient

- (id)listenForActivityPresentationWithActivityIdentifier:(id)a3 presenterBundleIdentifier:(id)a4 handler:(id)a5
{
  v6 = _Block_copy(a5);
  sub_242FDC0D0();
  sub_242FDC0D0();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = qword_268D5CA68;
  v9 = self;
  if (v8 != -1) {
    swift_once();
  }
  v10 = (void *)qword_268D5D608;
  v11 = (void *)sub_242FDC0C0();
  v12 = (void *)sub_242FDC0C0();
  v16[4] = sub_242F40608;
  v16[5] = v7;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 1107296256;
  v16[2] = sub_242F3D2E4;
  v16[3] = &block_descriptor_63;
  v13 = _Block_copy(v16);
  swift_retain();
  swift_release();
  id v14 = objc_msgSend(v10, sel_listenForActivityPresentationWithActivityIdentifier_presenterBundleIdentifier_handler_, v11, v12, v13);
  _Block_release(v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return v14;
}

- (_TtC11ActivityKit37ActivityPresentationObservationClient)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ActivityPresentationObservationClient();
  return [(ActivityPresentationObservationClient *)&v3 init];
}

@end