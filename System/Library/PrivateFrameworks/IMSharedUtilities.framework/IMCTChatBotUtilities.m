@interface IMCTChatBotUtilities
+ (BOOL)IMHandleIsChatBot:(id)a3;
+ (id)IMChipFromCTChip:(id)a3 originalID:(id)a4;
+ (id)IMChipListFromCTChipList:(id)a3 originalID:(id)a4;
+ (id)IMChipListFromSuggestions:(id)a3;
- (IMCTChatBotUtilities)init;
@end

@implementation IMCTChatBotUtilities

+ (BOOL)IMHandleIsChatBot:(id)a3
{
  uint64_t v3 = sub_1A09F3E18();
  char v5 = sub_1A0783F48(v3, v4);
  swift_bridgeObjectRelease();
  return v5 & 1;
}

+ (id)IMChipListFromSuggestions:(id)a3
{
  sub_1A09F3E18();
  swift_getObjCClassMetadata();
  id v3 = sub_1A08E73AC();
  swift_bridgeObjectRelease();

  return v3;
}

+ (id)IMChipListFromCTChipList:(id)a3 originalID:(id)a4
{
  sub_1A09F3E18();
  swift_getObjCClassMetadata();
  id v5 = a3;
  v6 = (void *)sub_1A08E7700(a3);

  swift_bridgeObjectRelease();

  return v6;
}

+ (id)IMChipFromCTChip:(id)a3 originalID:(id)a4
{
  sub_1A09F3E18();
  id v5 = a3;
  id v6 = sub_1A08E8C28(v5);

  swift_bridgeObjectRelease();

  return v6;
}

- (IMCTChatBotUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)IMCTChatBotUtilities;
  return [(IMCTChatBotUtilities *)&v3 init];
}

@end