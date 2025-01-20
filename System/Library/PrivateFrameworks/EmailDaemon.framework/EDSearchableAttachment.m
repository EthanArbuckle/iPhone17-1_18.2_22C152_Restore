@interface EDSearchableAttachment
- (EDSearchableAttachment)init;
- (EDSearchableAttachment)initWithContentURL:(id)a3 contentType:(id)a4 name:(id)a5 accountIdentifier:(id)a6 mailboxIdentifiers:(id)a7 messageID:(id)a8 messageIDHeader:(id)a9 dateSent:(id)a10 dateReceived:(id)a11 sender:(id)a12 recipients:(id)a13 downloadDate:(id)a14;
- (NSString)displayName;
- (NSURL)contentURL;
- (void)addToAttributes:(id)a3;
@end

@implementation EDSearchableAttachment

- (EDSearchableAttachment)initWithContentURL:(id)a3 contentType:(id)a4 name:(id)a5 accountIdentifier:(id)a6 mailboxIdentifiers:(id)a7 messageID:(id)a8 messageIDHeader:(id)a9 dateSent:(id)a10 dateReceived:(id)a11 sender:(id)a12 recipients:(id)a13 downloadDate:(id)a14
{
  id v73 = a6;
  v74 = self;
  id v69 = a11;
  id v70 = a13;
  id v68 = a10;
  uint64_t v18 = sub_1DB5E1798();
  MEMORY[0x1F4188790](v18 - 8);
  v20 = (char *)v58 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_1DB5E1628();
  MEMORY[0x1F4188790](v21 - 8);
  uint64_t v72 = (uint64_t)v58 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DB5E15A8();
  id v23 = a4;
  id v24 = a5;
  id v25 = a7;
  id v71 = a8;
  id v26 = a9;
  id v27 = v68;
  id v60 = v69;
  id v65 = v70;
  id v28 = v73;
  v58[1] = a12;
  id v29 = a12;
  v58[2] = a14;
  id v59 = v29;
  id v30 = a14;
  id v73 = v20;
  sub_1DB5E1788();

  uint64_t v67 = sub_1DB5E1898();
  id v70 = v31;

  if (v28)
  {
    v32 = (void *)sub_1DB5E1898();
    id v68 = v33;
    id v69 = v32;
  }
  else
  {
    id v68 = 0;
    id v69 = 0;
  }
  uint64_t v66 = sub_1DB5E19F8();

  uint64_t v34 = sub_1DB5E1898();
  uint64_t v62 = v35;
  uint64_t v63 = v34;

  uint64_t v36 = sub_1DB5E1728();
  v64 = v58;
  uint64_t v37 = *(void *)(v36 - 8);
  uint64_t v38 = *(void *)(v37 + 64);
  MEMORY[0x1F4188790](v36);
  v39 = (char *)v58 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DB5E1718();

  v61 = v58;
  MEMORY[0x1F4188790](v40);
  uint64_t v41 = (uint64_t)v39;
  v42 = v60;
  sub_1DB5E1718();

  v43 = v59;
  if (v59)
  {
    uint64_t v44 = sub_1DB5E1898();
    v46 = v45;
  }
  else
  {
    uint64_t v44 = 0;
    v46 = 0;
  }
  v47 = v65;
  uint64_t v48 = sub_1DB5E19F8();

  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5F54B0);
  MEMORY[0x1F4188790](v49 - 8);
  v51 = (char *)v58 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v30)
  {
    sub_1DB5E1718();

    uint64_t v52 = 0;
  }
  else
  {
    uint64_t v52 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v37 + 56))(v51, v52, 1, v36);
  commentedAddress._countAndFlagsBits = v44;
  commentedAddress._object = v46;
  uint64_t v56 = (uint64_t)v39;
  v53 = v71;
  v54 = (EDSearchableAttachment *)sub_1DB5BEF6C(v72, (uint64_t)v73, v67, (uint64_t)v70, (uint64_t)v69, (uint64_t)v68, v66, v71, v63, v62, v56, v41, commentedAddress, v48, (uint64_t)v51);

  return v54;
}

- (NSURL)contentURL
{
  uint64_t v3 = type metadata accessor for SearchableAttachment();
  MEMORY[0x1F4188790](v3);
  v5 = &v13[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_1DB5E1628();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = &v13[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1DB5BEEB4((uint64_t)self + OBJC_IVAR___EDSearchableAttachment__underlying, (uint64_t)v13);
  v10 = self;
  swift_dynamicCast();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v9, v5, v6);
  sub_1DB5BEF10((uint64_t)v5);

  v11 = (void *)sub_1DB5E1578();
  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);

  return (NSURL *)v11;
}

- (NSString)displayName
{
  uint64_t v3 = type metadata accessor for SearchableAttachment();
  MEMORY[0x1F4188790](v3);
  v5 = &v9[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1DB5BEEB4((uint64_t)self + OBJC_IVAR___EDSearchableAttachment__underlying, (uint64_t)v9);
  uint64_t v6 = self;
  swift_dynamicCast();
  swift_bridgeObjectRetain();
  sub_1DB5BEF10((uint64_t)v5);

  uint64_t v7 = (void *)sub_1DB5E1868();
  swift_bridgeObjectRelease();

  return (NSString *)v7;
}

- (void)addToAttributes:(id)a3
{
  uint64_t v5 = type metadata accessor for SearchableAttachment();
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1DB5BEEB4((uint64_t)self + OBJC_IVAR___EDSearchableAttachment__underlying, (uint64_t)v10);
  uint64_t v8 = (char *)a3;
  v9 = self;
  swift_dynamicCast();
  sub_1DB5C671C(v8);
  sub_1DB5BEF10((uint64_t)v7);
}

- (EDSearchableAttachment)init
{
  result = (EDSearchableAttachment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end