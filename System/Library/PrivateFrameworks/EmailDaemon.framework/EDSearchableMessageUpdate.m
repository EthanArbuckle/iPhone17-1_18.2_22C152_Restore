@interface EDSearchableMessageUpdate
- (EDSearchableMessageUpdate)init;
- (EDSearchableMessageUpdate)initWithConversationIdentifier:(id)a3 mailboxIdentifiers:(id)a4 gmailLabels:(id)a5 isLikelyJunk:(id)a6 dateLastViewed:(id)a7 flags:(id)a8;
- (void)addToAttributes:(id)a3;
@end

@implementation EDSearchableMessageUpdate

- (EDSearchableMessageUpdate)initWithConversationIdentifier:(id)a3 mailboxIdentifiers:(id)a4 gmailLabels:(id)a5 isLikelyJunk:(id)a6 dateLastViewed:(id)a7 flags:(id)a8
{
  uint64_t v11 = sub_1DB5E1898();
  uint64_t v13 = v12;
  uint64_t v14 = sub_1DB5E19F8();
  sub_1DB5A668C(0, (unint64_t *)&qword_1EB5F55C8);
  uint64_t v15 = sub_1DB5E19F8();
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5F54B0);
  MEMORY[0x1F4188790](v16 - 8);
  v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a7)
  {
    sub_1DB5E1718();
    uint64_t v19 = sub_1DB5E1728();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 0, 1, v19);
  }
  else
  {
    uint64_t v20 = sub_1DB5E1728();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v18, 1, 1, v20);
  }
  id v21 = a8;
  id v22 = a6;
  v23 = (EDSearchableMessageUpdate *)sub_1DB5C39F4(v11, v13, v14, v15, a6, (uint64_t)v18, (uint64_t)v21);

  return v23;
}

- (void)addToAttributes:(id)a3
{
  uint64_t v5 = type metadata accessor for SearchableMessageUpdate();
  MEMORY[0x1F4188790](v5);
  v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1DB5BEEB4((uint64_t)self + OBJC_IVAR___EDSearchableMessageUpdate__underlying, (uint64_t)v10);
  id v8 = a3;
  v9 = self;
  swift_dynamicCast();
  sub_1DB5D20FC(v8);
  sub_1DB5C3998((uint64_t)v7);
}

- (EDSearchableMessageUpdate)init
{
  result = (EDSearchableMessageUpdate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end