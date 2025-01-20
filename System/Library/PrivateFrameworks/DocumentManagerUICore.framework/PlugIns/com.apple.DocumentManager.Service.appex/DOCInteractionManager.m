@interface DOCInteractionManager
+ (id)sharedManagerFor:(id)a3;
+ (void)clearSharedControllerFor:(id)a3;
+ (void)setSharedManagerWith:(id)a3 to:(id)a4;
- (FPItem)lastOpenedItem;
- (FPItem)lastSelectedItem;
- (_TtC33com_apple_DocumentManager_Service21DOCInteractionManager)init;
- (void)setLastOpenedItem:(id)a3;
- (void)setLastSelectedItem:(id)a3;
@end

@implementation DOCInteractionManager

+ (id)sharedManagerFor:(id)a3
{
  id v4 = a3;
  id v5 = _s33com_apple_DocumentManager_Service014DOCInteractionD0C06sharedD03forACSo8NSStringCSg_tFZ_0(a3);

  return v5;
}

+ (void)clearSharedControllerFor:(id)a3
{
  if (a3)
  {
    uint64_t v3 = qword_10062A3F0;
    id v4 = a3;
    if (v3 != -1) {
      swift_once();
    }
    objc_msgSend((id)qword_100636208, "removeObjectForKey:");
  }
  else
  {
    id v4 = (id)sub_1004CBDF0();
    sub_1004CDB10();
    sub_1004CBE00();
  }
}

+ (void)setSharedManagerWith:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  sub_1002416F4(v5, (uint64_t)v6);
}

- (FPItem)lastOpenedItem
{
  return (FPItem *)sub_100240D10((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCInteractionManager_lastOpenedItem);
}

- (void)setLastOpenedItem:(id)a3
{
}

- (FPItem)lastSelectedItem
{
  return (FPItem *)sub_100240D10((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCInteractionManager_lastSelectedItem);
}

- (void)setLastSelectedItem:(id)a3
{
}

- (_TtC33com_apple_DocumentManager_Service21DOCInteractionManager)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCInteractionManager_lastOpenedItem) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCInteractionManager_lastSelectedItem) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCInteractionManager();
  return [(DOCInteractionManager *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCInteractionManager_lastOpenedItem));
  objc_super v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCInteractionManager_lastSelectedItem);
}

@end