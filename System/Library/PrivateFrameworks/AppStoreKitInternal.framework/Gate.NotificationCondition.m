@interface Gate.NotificationCondition
- (void)cantGetNoSatisfactionFrom:(id)a3;
- (void)takeSatisfactionFrom:(id)a3;
@end

@implementation Gate.NotificationCondition

- (void)takeSatisfactionFrom:(id)a3
{
  uint64_t v4 = sub_1E1D56898();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = &v8[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1E1D56848();
  swift_beginAccess();
  self->super.isSatisfied[0] = 1;
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_retain();
    sub_1E17AD508();
    swift_release();
    swift_release();
  }
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)cantGetNoSatisfactionFrom:(id)a3
{
  uint64_t v4 = sub_1E1D56898();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = &v8[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1E1D56848();
  swift_beginAccess();
  self->super.isSatisfied[0] = 0;
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_retain();
    sub_1E17AD508();
    swift_release();
    swift_release();
  }
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

@end