@interface MockTriggerBuilder
- (BOOL)executeOnce;
- (BOOL)isEnabled;
- (BOOL)nameIsConfigured;
- (HMActionSetBuilder)triggerOwnedActionSet;
- (HMTriggerPolicy)policy;
- (NSArray)actionSets;
- (NSArray)endEvents;
- (NSArray)events;
- (NSArray)recurrences;
- (NSPredicate)predicate;
- (NSString)description;
- (NSString)name;
- (_TtC13HomeDataModel18MockTriggerBuilder)init;
- (unint64_t)recurrenceDays;
- (void)addActionSet:(id)a3;
- (void)addEndEvent:(id)a3;
- (void)addEvent:(id)a3;
- (void)removeActionSet:(id)a3;
- (void)removeEndEvent:(id)a3;
- (void)removeEvent:(id)a3;
- (void)setActionSets:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEndEvents:(id)a3;
- (void)setEvents:(id)a3;
- (void)setExecuteOnce:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setName:(id)a3 isConfigured:(BOOL)a4;
- (void)setNameIsConfigured:(BOOL)a3;
- (void)setPolicy:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setRecurrenceDays:(unint64_t)a3;
- (void)setRecurrences:(id)a3;
- (void)setTriggerOwnedActionSet:(id)a3;
@end

@implementation MockTriggerBuilder

- (NSString)name
{
  if (*(void *)&self->name[OBJC_IVAR____TtC13HomeDataModel18MockTriggerBuilder_name])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_251F356C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (void)setName:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_251F356F0();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC13HomeDataModel18MockTriggerBuilder_name);
  uint64_t *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease();
}

- (BOOL)isEnabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC13HomeDataModel18MockTriggerBuilder_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC13HomeDataModel18MockTriggerBuilder_isEnabled) = a3;
}

- (NSArray)actionSets
{
  return (NSArray *)sub_251C02F28((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC13HomeDataModel18MockTriggerBuilder_actionSets, &qword_26B21EB00);
}

- (void)setActionSets:(id)a3
{
}

- (unint64_t)recurrenceDays
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC13HomeDataModel18MockTriggerBuilder_recurrenceDays);
}

- (void)setRecurrenceDays:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13HomeDataModel18MockTriggerBuilder_recurrenceDays) = (Class)a3;
}

- (NSArray)recurrences
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13HomeDataModel18MockTriggerBuilder_recurrences))
  {
    sub_251F34880();
    swift_bridgeObjectRetain();
    v2 = (void *)sub_251F35AA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (void)setRecurrences:(id)a3
{
  if (a3)
  {
    sub_251F34880();
    uint64_t v4 = (objc_class *)sub_251F35AC0();
  }
  else
  {
    uint64_t v4 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13HomeDataModel18MockTriggerBuilder_recurrences) = v4;
  swift_bridgeObjectRelease();
}

- (BOOL)executeOnce
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC13HomeDataModel18MockTriggerBuilder_executeOnce);
}

- (void)setExecuteOnce:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC13HomeDataModel18MockTriggerBuilder_executeOnce) = a3;
}

- (NSPredicate)predicate
{
  return (NSPredicate *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                + OBJC_IVAR____TtC13HomeDataModel18MockTriggerBuilder_predicate));
}

- (void)setPredicate:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13HomeDataModel18MockTriggerBuilder_predicate);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13HomeDataModel18MockTriggerBuilder_predicate) = (Class)a3;
  id v3 = a3;
}

- (NSArray)events
{
  return (NSArray *)sub_251C02F28((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC13HomeDataModel18MockTriggerBuilder_events, (unint64_t *)&unk_269BA0320);
}

- (void)setEvents:(id)a3
{
}

- (NSArray)endEvents
{
  return (NSArray *)sub_251C02F28((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC13HomeDataModel18MockTriggerBuilder_endEvents, (unint64_t *)&unk_269BA0320);
}

- (void)setEndEvents:(id)a3
{
}

- (HMTriggerPolicy)policy
{
  return (HMTriggerPolicy *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR____TtC13HomeDataModel18MockTriggerBuilder_policy));
}

- (void)setPolicy:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13HomeDataModel18MockTriggerBuilder_policy);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13HomeDataModel18MockTriggerBuilder_policy) = (Class)a3;
  id v3 = a3;
}

- (BOOL)nameIsConfigured
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC13HomeDataModel18MockTriggerBuilder_nameIsConfigured);
}

- (void)setNameIsConfigured:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC13HomeDataModel18MockTriggerBuilder_nameIsConfigured) = a3;
}

- (HMActionSetBuilder)triggerOwnedActionSet
{
  return (HMActionSetBuilder *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC13HomeDataModel18MockTriggerBuilder_triggerOwnedActionSet));
}

- (void)setTriggerOwnedActionSet:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13HomeDataModel18MockTriggerBuilder_triggerOwnedActionSet);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13HomeDataModel18MockTriggerBuilder_triggerOwnedActionSet) = (Class)a3;
  id v3 = a3;
}

- (void)setName:(id)a3 isConfigured:(BOOL)a4
{
  if (a3)
  {
    uint64_t v6 = sub_251F356F0();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  v9 = (uint64_t *)((char *)self + OBJC_IVAR____TtC13HomeDataModel18MockTriggerBuilder_name);
  uint64_t *v9 = v6;
  v9[1] = v8;
  v10 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)&v10->super.isa + OBJC_IVAR____TtC13HomeDataModel18MockTriggerBuilder_nameIsConfigured) = a4;

  swift_bridgeObjectRelease();
}

- (void)addEvent:(id)a3
{
}

- (void)removeEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_251C03218(v4);
}

- (void)addEndEvent:(id)a3
{
}

- (void)removeEndEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_251C03398(v4);
}

- (void)addActionSet:(id)a3
{
}

- (void)removeActionSet:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_251C03678(v4);
}

- (NSString)description
{
  v2 = self;
  sub_251C03768();

  id v3 = (void *)sub_251F356C0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC13HomeDataModel18MockTriggerBuilder)init
{
  result = (_TtC13HomeDataModel18MockTriggerBuilder *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13HomeDataModel18MockTriggerBuilder_triggerOwnedActionSet);
}

@end