@interface EDSearchableMessage
+ (NSString)userHandle;
+ (id)peopleFromCommentedAddresses:(id)a3;
- (EDSearchableMessage)init;
- (EDSearchableMessage)initWithSubjectWithoutPrefix:(id)a3 dateSent:(id)a4 dateReceived:(id)a5 isEncrypted:(BOOL)a6 priority:(id)a7 senders:(id)a8 to:(id)a9 cc:(id)a10 bcc:(id)a11 allHeaders:(id)a12 htmlContent:(id)a13 messageID:(id)a14 messageIDHeader:(id)a15 notificationID:(id)a16 isPartOfExistingThread:(BOOL)a17 hasCompleteData:(BOOL)a18 accountIdentifier:(id)a19 accountIsManaged:(BOOL)a20 accountType:(id)a21 accountEmailAddresses:(id)a22 update:(id)a23 attachments:(id)a24 category:(id)a25;
- (void)addToAttributes:(id)a3 forIdentifier:(id)a4;
@end

@implementation EDSearchableMessage

+ (NSString)userHandle
{
  if (qword_1EB5F54C8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DB5E1868();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

+ (id)peopleFromCommentedAddresses:(id)a3
{
  uint64_t v3 = sub_1DB5E19F8();
  sub_1DB5C25A0(v3);
  swift_bridgeObjectRelease();
  sub_1DB5A668C(0, (unint64_t *)&qword_1EB5F55C0);
  v4 = (void *)sub_1DB5E19E8();
  swift_bridgeObjectRelease();

  return v4;
}

- (EDSearchableMessage)initWithSubjectWithoutPrefix:(id)a3 dateSent:(id)a4 dateReceived:(id)a5 isEncrypted:(BOOL)a6 priority:(id)a7 senders:(id)a8 to:(id)a9 cc:(id)a10 bcc:(id)a11 allHeaders:(id)a12 htmlContent:(id)a13 messageID:(id)a14 messageIDHeader:(id)a15 notificationID:(id)a16 isPartOfExistingThread:(BOOL)a17 hasCompleteData:(BOOL)a18 accountIdentifier:(id)a19 accountIsManaged:(BOOL)a20 accountType:(id)a21 accountEmailAddresses:(id)a22 update:(id)a23 attachments:(id)a24 category:(id)a25
{
  BOOL v82 = a6;
  id v68 = a7;
  id v69 = a24;
  id v71 = a23;
  id v72 = a25;
  id v65 = a21;
  id v66 = a22;
  id v85 = a19;
  id v70 = a16;
  id v67 = a15;
  v83 = self;
  id v84 = a14;
  uint64_t v25 = sub_1DB5E1898();
  uint64_t v80 = v26;
  uint64_t v81 = v25;
  uint64_t v27 = sub_1DB5E1728();
  uint64_t v28 = *(void *)(*(void *)(v27 - 8) + 64);
  MEMORY[0x1F4188790](v27 - 8);
  unint64_t v29 = (v28 + 15) & 0xFFFFFFFFFFFFFFF0;
  v79 = &v60[-v29];
  uint64_t v30 = sub_1DB5E1718();
  MEMORY[0x1F4188790](v30);
  v78 = &v60[-v29];
  sub_1DB5E1718();
  v77 = (void *)sub_1DB5E19F8();
  v76 = (void *)sub_1DB5E19F8();
  uint64_t v75 = sub_1DB5E19F8();
  uint64_t v74 = sub_1DB5E19F8();
  if (a12)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5F5560);
    uint64_t v73 = sub_1DB5E1828();
  }
  else
  {
    uint64_t v73 = 0;
  }
  id v31 = v65;
  id v32 = v66;
  id v71 = v71;
  id v72 = v72;
  id v69 = v69;
  id v33 = v85;
  id v34 = v70;
  id v35 = v67;
  id v36 = v84;
  id v68 = v68;
  if (a13)
  {
    id v37 = a13;
    v38 = (void *)sub_1DB5E16A8();
    id v65 = v39;
    id v66 = v38;

    if (v36) {
      goto LABEL_6;
    }
  }
  else
  {
    id v65 = (id)0xF000000000000000;
    id v66 = 0;
    if (v36)
    {
LABEL_6:
      id v84 = (id)sub_1DB5E1898();
      uint64_t v64 = v40;

      if (v35) {
        goto LABEL_7;
      }
LABEL_11:
      id v67 = 0;
      uint64_t v63 = 0;
      if (v34) {
        goto LABEL_8;
      }
      goto LABEL_12;
    }
  }
  id v84 = 0;
  uint64_t v64 = 0;
  if (!v35) {
    goto LABEL_11;
  }
LABEL_7:
  id v67 = (id)sub_1DB5E1898();
  uint64_t v63 = v41;

  if (v34)
  {
LABEL_8:
    id v70 = (id)sub_1DB5E1898();
    uint64_t v62 = v42;

    goto LABEL_13;
  }
LABEL_12:
  id v70 = 0;
  uint64_t v62 = 0;
LABEL_13:
  BOOL v61 = a18;
  if (v33)
  {
    uint64_t v43 = sub_1DB5E1898();
    uint64_t v45 = v44;
  }
  else
  {
    uint64_t v43 = 0;
    uint64_t v45 = 0;
  }
  uint64_t v46 = sub_1DB5E1898();
  uint64_t v48 = v47;

  uint64_t v49 = sub_1DB5E19F8();
  v50 = v72;
  id v51 = v69;
  id v52 = v71;
  uint64_t v59 = v49;
  uint64_t v58 = v46;
  unint64_t v53 = (unint64_t)v65;
  uint64_t v54 = (uint64_t)v66;
  v55 = v68;
  v56 = (EDSearchableMessage *)sub_1DB5C2788(v81, v80, (uint64_t)v79, (uint64_t)v78, v82, v68, v77, v76, v75, v74, v73, (uint64_t)v66, (unint64_t)v65, (uint64_t)v84, v64, (uint64_t)v67, v63, (uint64_t)v70, v62,
                                 a17,
                                 v61,
                                 v43,
                                 v45,
                                 a20,
                                 v58,
                                 v48,
                                 v59,
                                 (uint64_t)v71,
                                 (uint64_t)v69,
                                 v72);

  sub_1DB5B2D68(v54, v53);
  return v56;
}

- (void)addToAttributes:(id)a3 forIdentifier:(id)a4
{
  uint64_t v6 = type metadata accessor for SearchableMessage(0);
  MEMORY[0x1F4188790](v6);
  v8 = &v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_1DB5E1898();
  v11 = v10;
  sub_1DB5BEEB4((uint64_t)self + OBJC_IVAR___EDSearchableMessage__underlying, (uint64_t)v14);
  id v12 = a3;
  v13 = self;
  swift_dynamicCast();
  sub_1DB5C9DF8(v12, v9, v11);
  sub_1DB5C15D4((uint64_t)v8);

  swift_bridgeObjectRelease();
}

- (EDSearchableMessage)init
{
  result = (EDSearchableMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end