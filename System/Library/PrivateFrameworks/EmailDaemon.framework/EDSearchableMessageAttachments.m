@interface EDSearchableMessageAttachments
+ (CSCustomAttributeKey)specificUTIsAttribute;
- (EDSearchableMessageAttachments)init;
- (EDSearchableMessageAttachments)initWithNames:(id)a3 paths:(id)a4 UTIs:(id)a5 specificUTIs:(id)a6 mimeTypes:(id)a7 kinds:(id)a8;
- (void)addToAttributes:(id)a3;
@end

@implementation EDSearchableMessageAttachments

+ (CSCustomAttributeKey)specificUTIsAttribute
{
  if (qword_1EA916C50 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EA9170E8;

  return (CSCustomAttributeKey *)v2;
}

- (EDSearchableMessageAttachments)initWithNames:(id)a3 paths:(id)a4 UTIs:(id)a5 specificUTIs:(id)a6 mimeTypes:(id)a7 kinds:(id)a8
{
  uint64_t v9 = sub_1DB5E19F8();
  uint64_t v10 = sub_1DB5E19F8();
  uint64_t v11 = sub_1DB5E19F8();
  sub_1DB5E1798();
  uint64_t v12 = sub_1DB5E19F8();
  uint64_t v13 = sub_1DB5E19F8();
  uint64_t v14 = sub_1DB5E19F8();
  v15 = (Class *)((char *)&self->super.isa + OBJC_IVAR___EDSearchableMessageAttachments__underlying);
  *(void *)&self->_underlying[OBJC_IVAR___EDSearchableMessageAttachments__underlying + 16] = &type metadata for SearchableMessageAttachments;
  v16 = (void *)swift_allocObject();
  void *v15 = v16;
  v16[2] = v9;
  v16[3] = v10;
  v16[4] = v11;
  v16[5] = v12;
  v16[6] = v13;
  v16[7] = v14;
  v18.receiver = self;
  v18.super_class = (Class)EDSearchableMessageAttachments;
  return [(EDSearchableMessageAttachments *)&v18 init];
}

- (void)addToAttributes:(id)a3
{
  sub_1DB5BEEB4((uint64_t)self + OBJC_IVAR___EDSearchableMessageAttachments__underlying, (uint64_t)v7);
  id v5 = a3;
  v6 = self;
  swift_dynamicCast();
  v7[0] = v7[6];
  v7[1] = v7[7];
  v7[2] = v7[8];
  v7[3] = v7[9];
  v7[4] = v7[10];
  v7[5] = v7[11];
  SearchableMessageAttachments.addTo(_:)((CSSearchableItemAttributeSet)v5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (EDSearchableMessageAttachments)init
{
  result = (EDSearchableMessageAttachments *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end