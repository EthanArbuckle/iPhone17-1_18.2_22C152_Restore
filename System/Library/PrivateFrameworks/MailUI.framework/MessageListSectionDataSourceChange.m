@interface MessageListSectionDataSourceChange
+ (id)added:(int64_t)a3 isFirstChange:(BOOL)a4;
+ (id)cleanSnapshot;
+ (id)failed;
+ (id)moved:(int64_t)a3;
+ (id)removed:(int64_t)a3;
+ (id)sectionRemovedWithSection:(id)a3;
+ (id)skipped;
+ (id)updated:(int64_t)a3;
- (BOOL)failed;
- (BOOL)hasChanges;
- (BOOL)isAddition;
- (BOOL)isCleanSnapshot;
- (BOOL)isFirstChange;
- (BOOL)isMove;
- (BOOL)isRemoval;
- (BOOL)isSectionRemoval;
- (BOOL)isUpdate;
- (BOOL)skipped;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)ef_publicDescription;
- (_TtC6MailUI34MessageListSectionDataSourceChange)init;
- (int64_t)numberOfChanges;
@end

@implementation MessageListSectionDataSourceChange

+ (id)added:(int64_t)a3 isFirstChange:(BOOL)a4
{
  swift_getObjCClassMetadata();
  char v6 = sub_1DDEECF58();
  swift_getObjCClassMetadata();
  id v4 = static MessageListSectionDataSourceChange.added(_:isFirstChange:)((void *)a3, v6 & 1);
  return v4;
}

+ (id)removed:(int64_t)a3
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  id v3 = static MessageListSectionDataSourceChange.removed(_:)((void *)a3);
  return v3;
}

+ (id)moved:(int64_t)a3
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  id v3 = static MessageListSectionDataSourceChange.moved(_:)((void *)a3);
  return v3;
}

+ (id)updated:(int64_t)a3
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  id v3 = static MessageListSectionDataSourceChange.updated(_:)((void *)a3);
  return v3;
}

+ (id)skipped
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  id v2 = static MessageListSectionDataSourceChange.skipped()();
  return v2;
}

+ (id)failed
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  id v2 = static MessageListSectionDataSourceChange.failed()();
  return v2;
}

+ (id)cleanSnapshot
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  id v2 = static MessageListSectionDataSourceChange.cleanSnapshot()();
  return v2;
}

+ (id)sectionRemovedWithSection:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  swift_getObjCClassMetadata();
  id v6 = static MessageListSectionDataSourceChange.sectionRemoved(section:)(a3);

  return v6;
}

- (BOOL)isAddition
{
  id v2 = self;
  MessageListSectionDataSourceChange.isAddition.getter();

  return sub_1DDEECF48() & 1;
}

- (BOOL)isRemoval
{
  id v2 = self;
  MessageListSectionDataSourceChange.isRemoval.getter();

  return sub_1DDEECF48() & 1;
}

- (BOOL)isMove
{
  id v2 = self;
  MessageListSectionDataSourceChange.isMove.getter();

  return sub_1DDEECF48() & 1;
}

- (BOOL)isUpdate
{
  id v2 = self;
  MessageListSectionDataSourceChange.isUpdate.getter();

  return sub_1DDEECF48() & 1;
}

- (BOOL)skipped
{
  id v2 = self;
  MessageListSectionDataSourceChange.skipped.getter();

  return sub_1DDEECF48() & 1;
}

- (BOOL)failed
{
  id v2 = self;
  MessageListSectionDataSourceChange.failed.getter();

  return sub_1DDEECF48() & 1;
}

- (BOOL)isFirstChange
{
  id v2 = self;
  MessageListSectionDataSourceChange.isFirstChange.getter();

  return sub_1DDEECF48() & 1;
}

- (BOOL)isSectionRemoval
{
  id v2 = self;
  MessageListSectionDataSourceChange.isSectionRemoval.getter();

  return sub_1DDEECF48() & 1;
}

- (BOOL)isCleanSnapshot
{
  id v2 = self;
  MessageListSectionDataSourceChange.isCleanSnapshot.getter();

  return sub_1DDEECF48() & 1;
}

- (BOOL)hasChanges
{
  id v2 = self;
  MessageListSectionDataSourceChange.hasChanges.getter();

  return sub_1DDEECF48() & 1;
}

- (int64_t)numberOfChanges
{
  id v2 = self;
  int64_t v5 = MessageListSectionDataSourceChange.numberOfChanges.getter();

  return v5;
}

- (_TtC6MailUI34MessageListSectionDataSourceChange)init
{
  return (_TtC6MailUI34MessageListSectionDataSourceChange *)MessageListSectionDataSourceChange.init()();
}

- (void).cxx_destruct
{
}

- (NSString)ef_publicDescription
{
  id v2 = self;
  MessageListSectionDataSourceChange.ef_publicDescription.getter();

  id v5 = (id)sub_1DDEEEB58();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (NSString)description
{
  id v2 = self;
  MessageListSectionDataSourceChange.description.getter();

  id v5 = (id)sub_1DDEEEB58();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (NSString)debugDescription
{
  id v2 = self;
  MessageListSectionDataSourceChange.debugDescription.getter();

  id v5 = (id)sub_1DDEEEB58();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

@end