@interface ProductionInfoProvider
- (_TtC21contactsdonationagent22ProductionInfoProvider)init;
- (void)meCardChanged;
@end

@implementation ProductionInfoProvider

- (void)meCardChanged
{
  v2 = self;
  sub_100019F24();
}

- (_TtC21contactsdonationagent22ProductionInfoProvider)init
{
  v3 = (char *)self + OBJC_IVAR____TtC21contactsdonationagent22ProductionInfoProvider_curatedName;
  uint64_t v4 = type metadata accessor for PersonNameComponents();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC21contactsdonationagent22ProductionInfoProvider_curatedEmailAddresses) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC21contactsdonationagent22ProductionInfoProvider____lazy_storage___contactStore) = 0;
  v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21contactsdonationagent22ProductionInfoProvider_changeHandler);
  void *v5 = 0;
  v5[1] = 0;
  v6 = (char *)self + OBJC_IVAR____TtC21contactsdonationagent22ProductionInfoProvider_environment;
  v7 = (objc_class *)type metadata accessor for ProductionInfoProvider();
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((void *)v6 + 4) = 0;
  v9.receiver = self;
  v9.super_class = v7;
  return [(ProductionInfoProvider *)&v9 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21contactsdonationagent22ProductionInfoProvider____lazy_storage___contactStore));
  sub_100013B80(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21contactsdonationagent22ProductionInfoProvider_changeHandler));
  sub_100009A44((uint64_t)self + OBJC_IVAR____TtC21contactsdonationagent22ProductionInfoProvider_environment, (uint64_t *)&unk_10004E170);
}

@end