@interface ConversationStreamFactory
+ (id)createWithType:(int64_t)a3;
- (_TtC26DeepThoughtBiomeFoundation25ConversationStreamFactory)init;
@end

@implementation ConversationStreamFactory

+ (id)createWithType:(int64_t)a3
{
  if (a3) {
    v3 = (objc_class *)type metadata accessor for ConversationStreamAIMLIS();
  }
  else {
    v3 = (objc_class *)type metadata accessor for ConversationStreamPLL();
  }
  id v4 = objc_msgSend(objc_allocWithZone(v3), sel_init);

  return v4;
}

- (_TtC26DeepThoughtBiomeFoundation25ConversationStreamFactory)init
{
  return (_TtC26DeepThoughtBiomeFoundation25ConversationStreamFactory *)sub_24C9D8D04(self, (uint64_t)a2, type metadata accessor for ConversationStreamFactory);
}

@end