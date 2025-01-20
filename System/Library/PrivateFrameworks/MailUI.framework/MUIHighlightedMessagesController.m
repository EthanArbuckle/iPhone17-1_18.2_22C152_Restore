@interface MUIHighlightedMessagesController
- (EMMessageRepository)repository;
- (MUIHighlightedMessagesController)init;
- (MUIHighlightedMessagesController)initWithRepository:(id)a3 delegate:(id)a4;
- (MUIHighlightedMessagesControllerDelegate)delegate;
- (NSArray)mailboxes;
- (NSPredicate)filterPredicate;
- (id)messageList;
- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5;
- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5;
- (void)collection:(id)a3 changedItemIDs:(id)a4;
- (void)collection:(id)a3 deletedItemIDs:(id)a4;
- (void)collection:(id)a3 movedItemIDs:(id)a4 after:(id)a5;
- (void)collection:(id)a3 movedItemIDs:(id)a4 before:(id)a5;
- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5;
- (void)collectionDidFinishInitialLoad:(id)a3;
- (void)reloadApplyingEmptyUpdate:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFilterPredicate:(id)a3;
- (void)setMailboxes:(id)a3;
@end

@implementation MUIHighlightedMessagesController

- (void).cxx_destruct
{
  sub_1DDD31CB8();
  sub_1DDD31B20((id *)((char *)&self->super.isa
                     + OBJC_IVAR___MUIHighlightedMessagesController____lazy_storage___reloadDebouncer));
  sub_1DDD31B20((id *)((char *)&self->super.isa
                     + OBJC_IVAR___MUIHighlightedMessagesController____lazy_storage___reloadWithEmptyUpdateDebouncer));
  sub_1DDD31430();
  sub_1DDD31B20((id *)((char *)&self->super.isa + OBJC_IVAR___MUIHighlightedMessagesController_filterPredicate));
  sub_1DDD31CE0();
}

- (EMMessageRepository)repository
{
  swift_getObjectType();
  v3 = self;
  id v6 = sub_1DDE41970();

  return (EMMessageRepository *)v6;
}

- (MUIHighlightedMessagesControllerDelegate)delegate
{
  swift_getObjectType();
  v3 = self;
  id v6 = (id)sub_1DDE41A14();

  return (MUIHighlightedMessagesControllerDelegate *)v6;
}

- (void)setDelegate:(id)a3
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  v4 = self;
  sub_1DDE41AD4();
}

- (MUIHighlightedMessagesController)initWithRepository:(id)a3 delegate:(id)a4
{
  swift_getObjectType();
  id v4 = a3;
  swift_unknownObjectRetain();
  return (MUIHighlightedMessagesController *)sub_1DDE42DEC(a3, (uint64_t)a4);
}

- (NSArray)mailboxes
{
  swift_getObjectType();
  v3 = self;
  sub_1DDE430CC();

  sub_1DDD79318();
  id v6 = (id)sub_1DDEEED98();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (void)setMailboxes:(id)a3
{
  swift_getObjectType();
  id v4 = a3;
  v5 = self;
  sub_1DDD79318();
  uint64_t v6 = sub_1DDEEEDA8();
  sub_1DDE431A4(v6);
}

- (NSPredicate)filterPredicate
{
  swift_getObjectType();
  v3 = self;
  id v6 = sub_1DDE433D8();

  return (NSPredicate *)v6;
}

- (void)setFilterPredicate:(id)a3
{
  swift_getObjectType();
  id v4 = a3;
  v5 = self;
  sub_1DDE43498(a3);
}

- (id)messageList
{
  swift_getObjectType();
  v3 = self;
  id v6 = sub_1DDE43724();

  return v6;
}

- (void)reloadApplyingEmptyUpdate:(BOOL)a3
{
  swift_getObjectType();
  id v4 = self;
  char v5 = sub_1DDEECF58();
  sub_1DDE43854(v5 & 1);
}

- (MUIHighlightedMessagesController)init
{
  return (MUIHighlightedMessagesController *)MUIHighlightedMessagesController.init()();
}

- (void)collectionDidFinishInitialLoad:(id)a3
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  id v4 = self;
  MUIHighlightedMessagesController.collectionDidFinishInitialLoad(_:)((uint64_t)a3);

  swift_unknownObjectRelease();
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  id v6 = a4;
  swift_unknownObjectRetain();
  v7 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB96770);
  uint64_t v8 = sub_1DDEEEDA8();
  MUIHighlightedMessagesController.collection(_:addedItemIDs:before:)((uint64_t)a3, v8, (uint64_t)a5);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  id v6 = a4;
  swift_unknownObjectRetain();
  v7 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB96770);
  uint64_t v8 = sub_1DDEEEDA8();
  MUIHighlightedMessagesController.collection(_:addedItemIDs:after:)((uint64_t)a3, v8, (uint64_t)a5);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)collection:(id)a3 movedItemIDs:(id)a4 before:(id)a5
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  id v6 = a4;
  swift_unknownObjectRetain();
  v7 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB96770);
  uint64_t v8 = sub_1DDEEEDA8();
  MUIHighlightedMessagesController.collection(_:movedItemIDs:before:)((uint64_t)a3, v8, (uint64_t)a5);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)collection:(id)a3 movedItemIDs:(id)a4 after:(id)a5
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  id v6 = a4;
  swift_unknownObjectRetain();
  v7 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB96770);
  uint64_t v8 = sub_1DDEEEDA8();
  MUIHighlightedMessagesController.collection(_:movedItemIDs:after:)((uint64_t)a3, v8, (uint64_t)a5);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)collection:(id)a3 changedItemIDs:(id)a4
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  id v5 = a4;
  id v6 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB96770);
  uint64_t v7 = sub_1DDEEEDA8();
  MUIHighlightedMessagesController.collection(_:changedItemIDs:)((uint64_t)a3, v7);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

- (void)collection:(id)a3 deletedItemIDs:(id)a4
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  id v5 = a4;
  id v6 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB96770);
  uint64_t v7 = sub_1DDEEEDA8();
  MUIHighlightedMessagesController.collection(_:deletedItemIDs:)((uint64_t)a3, v7);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v6 = self;
  MUIHighlightedMessagesController.collection(_:replacedExisting:withNewItemID:)((uint64_t)a3, (uint64_t)a4, (uint64_t)a5);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end