@interface ActivityProminenceObservationClient
- (_TtC11ActivityKit35ActivityProminenceObservationClient)init;
- (id)listenForActivityProminenceWithActivityIdentifier:(id)a3 handler:(id)a4;
@end

@implementation ActivityProminenceObservationClient

- (id)listenForActivityProminenceWithActivityIdentifier:(id)a3 handler:(id)a4
{
  v5 = _Block_copy(a4);
  sub_242FDC0D0();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  uint64_t v7 = qword_268D5BEC8;
  v8 = self;
  if (v7 != -1) {
    swift_once();
  }
  v9 = (void *)qword_268D5BF08;
  v10 = (void *)sub_242FDC0C0();
  v14[4] = sub_242F55578;
  v14[5] = v6;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 1107296256;
  v14[2] = sub_242F52230;
  v14[3] = &block_descriptor_63_0;
  v11 = _Block_copy(v14);
  swift_retain();
  swift_release();
  id v12 = objc_msgSend(v9, sel_listenForActivityProminenceWithActivityIdentifier_handler_, v10, v11);
  _Block_release(v11);

  swift_bridgeObjectRelease();
  swift_release();

  return v12;
}

- (_TtC11ActivityKit35ActivityProminenceObservationClient)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ActivityProminenceObservationClient();
  return [(ActivityProminenceObservationClient *)&v3 init];
}

@end