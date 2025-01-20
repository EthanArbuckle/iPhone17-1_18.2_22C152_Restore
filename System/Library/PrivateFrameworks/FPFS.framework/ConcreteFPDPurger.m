@interface ConcreteFPDPurger
- (_TtC9libfssync17ConcreteFPDPurger)init;
- (void)purgeAndWaitAtUrl:(id)a3;
- (void)purgeAsyncAtUrl:(id)a3;
@end

@implementation ConcreteFPDPurger

- (_TtC9libfssync17ConcreteFPDPurger)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ConcreteFPDPurger();
  return [(ConcreteFPDPurger *)&v3 init];
}

- (void)purgeAndWaitAtUrl:(id)a3
{
  uint64_t v4 = sub_24DCC8A58();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_24DCC89E8();
  uint64_t v8 = qword_26B18FF60;
  v9 = self;
  if (v8 != -1) {
    swift_once();
  }
  id v10 = (id)fpfs_current_log();
  v11 = (void *)MEMORY[0x270FA5388](v10);
  *(void *)&v12[-16] = v9;
  *(void *)&v12[-8] = v7;
  sub_24D6050CC(v11, 0, (uint64_t)"purgeAndWait(at:)", 17, 2, (uint64_t)sub_24D739728, (uint64_t)&v12[-32]);

  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)purgeAsyncAtUrl:(id)a3
{
  uint64_t v4 = sub_24DCC8A58();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v17 - v9;
  sub_24DCC89E8();
  uint64_t v11 = qword_26B18FF60;
  v12 = self;
  if (v11 != -1) {
    swift_once();
  }
  id v13 = (id)fpfs_current_log();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
  unint64_t v14 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v12;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v15 + v14, v8, v4);
  v16 = v12;
  sub_24D3E29E4(v13, (uint64_t)"purgeAsync(at:)", 15, 2, (uint64_t)sub_24D738B4C, v15);

  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
}

@end