@interface DOCInteractionManager
+ (id)sharedManagerFor:(id)a3;
+ (void)clearSharedControllerFor:(id)a3;
+ (void)setSharedManagerWith:(id)a3 to:(id)a4;
- (FPItem)lastOpenedItem;
- (FPItem)lastSelectedItem;
- (_TtC18DocumentAppIntents21DOCInteractionManager)init;
- (void)setLastOpenedItem:(id)a3;
- (void)setLastSelectedItem:(id)a3;
@end

@implementation DOCInteractionManager

+ (id)sharedManagerFor:(id)a3
{
  id v4 = a3;
  id v5 = _s18DocumentAppIntents21DOCInteractionManagerC06sharedE03forACSo8NSStringCSg_tFZ_0(a3);

  return v5;
}

+ (void)clearSharedControllerFor:(id)a3
{
  if (a3)
  {
    uint64_t v3 = qword_100655A78;
    id v4 = a3;
    if (v3 != -1) {
      swift_once();
    }
    objc_msgSend((id)qword_10065B5B0, "removeObjectForKey:");
  }
  else
  {
    id v4 = (id)sub_1004F2FF0();
    sub_1004F4D90();
    sub_1004F3000();
  }
}

+ (void)setSharedManagerWith:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  sub_1000F1AF4(v5, (uint64_t)v6);
}

- (FPItem)lastOpenedItem
{
  return (FPItem *)sub_1000F1110((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC18DocumentAppIntents21DOCInteractionManager_lastOpenedItem);
}

- (void)setLastOpenedItem:(id)a3
{
}

- (FPItem)lastSelectedItem
{
  return (FPItem *)sub_1000F1110((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC18DocumentAppIntents21DOCInteractionManager_lastSelectedItem);
}

- (void)setLastSelectedItem:(id)a3
{
}

- (_TtC18DocumentAppIntents21DOCInteractionManager)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18DocumentAppIntents21DOCInteractionManager_lastOpenedItem) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18DocumentAppIntents21DOCInteractionManager_lastSelectedItem) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCInteractionManager();
  return [(DOCInteractionManager *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents21DOCInteractionManager_lastOpenedItem));
  objc_super v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18DocumentAppIntents21DOCInteractionManager_lastSelectedItem);
}

@end