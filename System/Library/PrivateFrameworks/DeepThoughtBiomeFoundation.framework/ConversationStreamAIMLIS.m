@interface ConversationStreamAIMLIS
- (_TtC26DeepThoughtBiomeFoundation24ConversationStreamAIMLIS)init;
- (void)streamConversationsWithBookmark:(_TtC26DeepThoughtBiomeFoundation15StreamsBookmark *)a3 completionHandler:(id)a4;
@end

@implementation ConversationStreamAIMLIS

- (_TtC26DeepThoughtBiomeFoundation24ConversationStreamAIMLIS)init
{
  return (_TtC26DeepThoughtBiomeFoundation24ConversationStreamAIMLIS *)sub_24C9D8D04(self, (uint64_t)a2, type metadata accessor for ConversationStreamAIMLIS);
}

- (void)streamConversationsWithBookmark:(_TtC26DeepThoughtBiomeFoundation15StreamsBookmark *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698048C0);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_24C9FFF30();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2698048D0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2698048E0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_24C9DCEF0((uint64_t)v9, (uint64_t)&unk_2698048F0, (uint64_t)v14);
  swift_release();
}

@end