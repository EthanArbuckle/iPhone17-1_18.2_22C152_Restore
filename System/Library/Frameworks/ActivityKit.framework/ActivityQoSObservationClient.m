@interface ActivityQoSObservationClient
- (_TtC11ActivityKit28ActivityQoSObservationClient)init;
- (id)listenForActivityQoSWithActivityIdentifier:(id)a3 handler:(id)a4;
@end

@implementation ActivityQoSObservationClient

- (id)listenForActivityQoSWithActivityIdentifier:(id)a3 handler:(id)a4
{
  v5 = _Block_copy(a4);
  sub_242FDC0D0();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  uint64_t v7 = qword_268D5CA88;
  v8 = self;
  if (v7 != -1) {
    swift_once();
  }
  v9 = (void *)qword_268D5E7E8;
  v10 = (void *)sub_242FDC0C0();
  v14[4] = sub_242F40608;
  v14[5] = v6;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 1107296256;
  v14[2] = sub_242FC36D0;
  v14[3] = &block_descriptor_63_1;
  v11 = _Block_copy(v14);
  swift_retain();
  swift_release();
  id v12 = objc_msgSend(v9, sel_listenForActivityQoSWithActivityIdentifier_handler_, v10, v11);
  _Block_release(v11);

  swift_bridgeObjectRelease();
  swift_release();

  return v12;
}

- (_TtC11ActivityKit28ActivityQoSObservationClient)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ActivityQoSObservationClient();
  return [(ActivityQoSObservationClient *)&v3 init];
}

@end