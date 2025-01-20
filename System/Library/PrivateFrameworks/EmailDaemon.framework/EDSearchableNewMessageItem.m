@interface EDSearchableNewMessageItem
- (BOOL)alwaysMarkAsIndexed;
- (BOOL)hasCompleteData;
- (BOOL)requiresPreprocessing;
- (BOOL)shouldExcludeFromIndex;
- (BOOL)shouldIndexImmediatelyPostPreprocessing;
- (NSDate)dateReceived;
- (NSString)domainIdentifier;
- (NSString)identifier;
- (_TtC11EmailDaemon26EDSearchableNewMessageItem)init;
- (id)fetchIndexableAttachments;
- (id)searchableItem;
- (int64_t)estimatedSizeInBytes;
- (int64_t)indexingType;
- (unint64_t)itemInstantiationTime;
- (void)setIndexingType:(int64_t)a3;
@end

@implementation EDSearchableNewMessageItem

- (unint64_t)itemInstantiationTime
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC11EmailDaemon26EDSearchableNewMessageItem_itemInstantiationTime);
}

- (NSString)identifier
{
  return (NSString *)sub_1DB5C3D30();
}

- (NSString)domainIdentifier
{
  return (NSString *)sub_1DB5C3D30();
}

- (int64_t)indexingType
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC11EmailDaemon26EDSearchableNewMessageItem_indexingType);
  swift_beginAccess();
  return *v2;
}

- (void)setIndexingType:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC11EmailDaemon26EDSearchableNewMessageItem_indexingType);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (_TtC11EmailDaemon26EDSearchableNewMessageItem)init
{
  result = (_TtC11EmailDaemon26EDSearchableNewMessageItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (BOOL)alwaysMarkAsIndexed
{
  return 1;
}

- (NSDate)dateReceived
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5F54B0);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC11EmailDaemon26EDSearchableNewMessageItem_message;
  v7 = &v6[*(int *)(type metadata accessor for SearchableMessage(0) + 24)];
  uint64_t v8 = sub_1DB5E1728();
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v5, v7, v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v5, 0, 1, v8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v5, 1, v8) != 1)
  {
    v10 = (void *)sub_1DB5E16F8();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v8);
  }

  return (NSDate *)v10;
}

- (int64_t)estimatedSizeInBytes
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11EmailDaemon26EDSearchableNewMessageItem_sizeInBytes);
}

- (BOOL)hasCompleteData
{
  return 1;
}

- (BOOL)requiresPreprocessing
{
  return 0;
}

- (BOOL)shouldExcludeFromIndex
{
  return 0;
}

- (id)fetchIndexableAttachments
{
  id v2 = objc_msgSend(self, sel_nullFuture);

  return v2;
}

- (BOOL)shouldIndexImmediatelyPostPreprocessing
{
  return 0;
}

- (id)searchableItem
{
  id v2 = self;
  uint64_t v3 = (void *)EDSearchableNewMessageItem.searchableItem()();

  return v3;
}

@end