@interface IMDChatQueryStrings
+ (NSString)allColumns;
+ (NSString)chatRowIDsSortedByLastMessageDate;
+ (NSString)copyAllActiveChatsQuery;
+ (NSString)copyAllChatsQuery;
+ (NSString)copyAllNamedChatsQuery;
+ (NSString)copyChatForGUIDQuery;
+ (NSString)copyChatForGUIDUnlockedQuery;
+ (NSString)copyChatGUIDsWithUnreadMessagesQuery;
+ (NSString)copyChatsWithUnreadMessagesQuery;
+ (NSString)remapChatsWithLastAddressedSIMIDToNewLastAddressedIDsQuery;
+ (NSString)selectAllColumns;
+ (id)copyChatsWithUnreadMessagesWithLimit:(int64_t)a3;
+ (id)copyRecentChatsQueryWithFilterCount:(int)a3;
- (IMDChatQueryStrings)init;
@end

@implementation IMDChatQueryStrings

+ (NSString)allColumns
{
  v2 = (void *)sub_1AFC71CF8();
  return (NSString *)v2;
}

+ (NSString)selectAllColumns
{
  id v2 = objc_msgSend(a1, sel_allColumns);
  sub_1AFC71D08();

  sub_1AFC71D38();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1AFC71D38();
  swift_bridgeObjectRelease();
  v3 = (void *)sub_1AFC71CF8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (NSString)copyAllChatsQuery
{
  return (NSString *)sub_1AFC56370(a1);
}

+ (NSString)copyAllNamedChatsQuery
{
  return (NSString *)sub_1AFC56370(a1);
}

+ (NSString)remapChatsWithLastAddressedSIMIDToNewLastAddressedIDsQuery
{
  id v2 = (void *)sub_1AFC71CF8();
  return (NSString *)v2;
}

+ (NSString)chatRowIDsSortedByLastMessageDate
{
  id v2 = (void *)sub_1AFC71CF8();
  return (NSString *)v2;
}

+ (NSString)copyAllActiveChatsQuery
{
  return (NSString *)sub_1AFC56370(a1);
}

+ (NSString)copyChatForGUIDQuery
{
  return (NSString *)sub_1AFC56370(a1);
}

+ (NSString)copyChatForGUIDUnlockedQuery
{
  return (NSString *)sub_1AFC56370(a1);
}

+ (NSString)copyChatGUIDsWithUnreadMessagesQuery
{
  return (NSString *)sub_1AFC71CF8();
}

+ (NSString)copyChatsWithUnreadMessagesQuery
{
  return (NSString *)sub_1AFC71CF8();
}

+ (id)copyRecentChatsQueryWithFilterCount:(int)a3
{
  sub_1AFC56474(0xD000000000000294, 0x80000001AFCB09D0, a3);
  sub_1AFC5683C((uint64_t *)&unk_1E9AF74A8);
  sub_1AFC56880();
  sub_1AFC71CE8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1AFC71D38();
  swift_bridgeObjectRelease();
  v3 = (void *)sub_1AFC71CF8();
  swift_bridgeObjectRelease();
  return v3;
}

+ (id)copyChatsWithUnreadMessagesWithLimit:(int64_t)a3
{
  swift_getObjCClassMetadata();
  sub_1AFC56654(a3);
  v4 = (void *)sub_1AFC71CF8();
  swift_bridgeObjectRelease();
  return v4;
}

- (IMDChatQueryStrings)init
{
  v3.receiver = self;
  v3.super_class = (Class)IMDChatQueryStrings;
  return [(IMDChatQueryStrings *)&v3 init];
}

@end