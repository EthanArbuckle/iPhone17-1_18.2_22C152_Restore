@interface EDSearchableRichLink
+ (NSString)idAttributeKey;
+ (NSString)titleAttributeKey;
+ (NSString)urlAttributeKey;
- (EDSearchableRichLink)init;
- (EDSearchableRichLink)initWithAccountIdentifier:(id)a3 mailboxIdentifiers:(id)a4 messageID:(id)a5 id:(id)a6 title:(id)a7 url:(id)a8 dateSent:(id)a9 dateReceived:(id)a10 sender:(id)a11 recipients:(id)a12;
- (void)addToAttributes:(id)a3;
@end

@implementation EDSearchableRichLink

+ (NSString)idAttributeKey
{
  v2 = (void *)sub_1DB5E1868();

  return (NSString *)v2;
}

+ (NSString)titleAttributeKey
{
  v2 = (void *)sub_1DB5E1868();

  return (NSString *)v2;
}

+ (NSString)urlAttributeKey
{
  v2 = (void *)sub_1DB5E1868();

  return (NSString *)v2;
}

- (EDSearchableRichLink)initWithAccountIdentifier:(id)a3 mailboxIdentifiers:(id)a4 messageID:(id)a5 id:(id)a6 title:(id)a7 url:(id)a8 dateSent:(id)a9 dateReceived:(id)a10 sender:(id)a11 recipients:(id)a12
{
  id v38 = a6;
  v39 = self;
  id v36 = a5;
  if (a3)
  {
    uint64_t v37 = sub_1DB5E1898();
    uint64_t v35 = v13;
  }
  else
  {
    uint64_t v37 = 0;
    uint64_t v35 = 0;
  }
  uint64_t v14 = (uint64_t)a11;
  uint64_t v34 = sub_1DB5E19F8();
  if (a7)
  {
    uint64_t v15 = sub_1DB5E1898();
    uint64_t v32 = v16;
    uint64_t v33 = v15;
  }
  else
  {
    uint64_t v32 = 0;
    uint64_t v33 = 0;
  }
  uint64_t v17 = sub_1DB5E1898();
  v19 = v18;
  uint64_t v20 = sub_1DB5E1728();
  uint64_t v21 = *(void *)(*(void *)(v20 - 8) + 64);
  MEMORY[0x1F4188790](v20 - 8);
  v22 = (char *)&v32 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_1DB5E1718();
  MEMORY[0x1F4188790](v23);
  sub_1DB5E1718();
  if (a11)
  {
    uint64_t v14 = sub_1DB5E1898();
    v25 = v24;
  }
  else
  {
    v25 = 0;
  }
  v26 = (void *)sub_1DB5E19F8();
  id v27 = v36;
  id v28 = v38;
  v31._object = v25;
  v31._countAndFlagsBits = v14;
  v29 = (EDSearchableRichLink *)sub_1DB5C54D8(v37, v35, v34, v27, v28, v33, v32, v17, v19, (uint64_t)v22, (uint64_t)v22, v31, v26);

  return v29;
}

- (void)addToAttributes:(id)a3
{
  uint64_t v5 = type metadata accessor for SearchableRichLink();
  MEMORY[0x1F4188790](v5);
  v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1DB5BEEB4((uint64_t)self + OBJC_IVAR___EDSearchableRichLink__underlying, (uint64_t)v10);
  id v8 = a3;
  v9 = self;
  swift_dynamicCast();
  sub_1DB5D3F1C(v8);
  sub_1DB5C547C((uint64_t)v7);
}

- (EDSearchableRichLink)init
{
  result = (EDSearchableRichLink *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end