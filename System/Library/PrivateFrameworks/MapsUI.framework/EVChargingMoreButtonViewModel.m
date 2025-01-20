@interface EVChargingMoreButtonViewModel
- (BOOL)isEnabled;
- (NSString)symbolName;
- (NSString)titleString;
- (_TtC6MapsUI29EVChargingMoreButtonViewModel)init;
- (id)actionBlock;
- (int64_t)actionStyle;
- (void)setActionBlock:(id)a3;
@end

@implementation EVChargingMoreButtonViewModel

- (NSString)titleString
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_193341380();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)symbolName
{
  if (*(void *)&self->titleString[OBJC_IVAR____TtC6MapsUI29EVChargingMoreButtonViewModel_symbolName])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_193341380();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (id)actionBlock
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI29EVChargingMoreButtonViewModel_actionBlock);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1931FF6DC;
    aBlock[3] = &block_descriptor_17;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setActionBlock:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_193201AE0;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC6MapsUI29EVChargingMoreButtonViewModel_actionBlock);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1931FEDEC(v7);
}

- (BOOL)isEnabled
{
  return 1;
}

- (int64_t)actionStyle
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC6MapsUI29EVChargingMoreButtonViewModel_actionStyle);
}

- (_TtC6MapsUI29EVChargingMoreButtonViewModel)init
{
  return (_TtC6MapsUI29EVChargingMoreButtonViewModel *)sub_193200BA8();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI29EVChargingMoreButtonViewModel_actionBlock);
  sub_1931FEDEC(v3);
}

@end