@interface NumberFormatterObserver
- (_TtC9Calculate23NumberFormatterObserver)init;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation NumberFormatterObserver

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v9 = sub_1BDDAFD68();
    uint64_t v11 = v10;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v17, 0, sizeof(v17));
    id v15 = a5;
    v16 = self;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v14 = 0;
    goto LABEL_8;
  }
  uint64_t v9 = 0;
  uint64_t v11 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v12 = a5;
  v13 = self;
  sub_1BDDB0238();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey();
  sub_1BDD3A63C(&qword_1EBA26978);
  uint64_t v14 = sub_1BDDAFC78();

LABEL_8:
  sub_1BDD3A3EC(v9, v11, (uint64_t)v17, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BDCE627C((uint64_t)v17);
}

- (void)dealloc
{
  v2 = self;
  sub_1BDD3A178();
}

- (void).cxx_destruct
{
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9Calculate23NumberFormatterObserver_willChange);
  sub_1BDCE03A8(v3);
}

- (_TtC9Calculate23NumberFormatterObserver)init
{
  result = (_TtC9Calculate23NumberFormatterObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end