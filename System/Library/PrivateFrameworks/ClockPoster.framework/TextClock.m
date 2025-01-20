@interface TextClock
- (_TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC495429TextClock)init;
- (void)dealloc;
- (void)timeFormatterTextDidChange:(id)a3;
@end

@implementation TextClock

- (_TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC495429TextClock)init
{
  *(void *)&self->delegate[OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC495429TextClock_delegate] = 0;
  swift_unknownObjectWeakInit();
  v3 = (char *)self + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC495429TextClock_overrideDate;
  uint64_t v4 = sub_24A056238();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  uint64_t v5 = OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC495429TextClock__timeFormatterByOffset;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751618);
  v6 = (objc_class *)swift_allocObject();
  type metadata accessor for CPUnfairLock();
  uint64_t v7 = swift_allocObject();
  *(_DWORD *)(v7 + 16) = 0;
  uint64_t v8 = MEMORY[0x263F8EE80];
  *((void *)v6 + 2) = v7;
  *((void *)v6 + 3) = v8;
  *(Class *)((char *)&self->super.isa + v5) = v6;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TextClock(0);
  return [(TextClock *)&v10 init];
}

- (void)dealloc
{
  v2 = self;
  sub_24A00A268();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for TextClock(0);
  [(TextClock *)&v3 dealloc];
}

- (void).cxx_destruct
{
  sub_249FCFFE8((uint64_t)self + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC495429TextClock_delegate);
  sub_249F6E790((uint64_t)self + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC495429TextClock_overrideDate, &qword_2697515A0);

  swift_release();
}

- (void)timeFormatterTextDidChange:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  sub_24A00AE94(a3);
}

@end