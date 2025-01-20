@interface MUILastSeenBucketHelper
- (_TtC6MailUI23MUILastSeenBucketHelper)init;
- (id)lastSeenDatesForBucket:(int64_t)a3;
- (void)categoryCloudStorage:(id)a3 didChangeLastSeenDate:(id)a4 lastSeenDisplayDate:(id)a5 forCategoryType:(id)a6 inMailboxWithExternalURL:(id)a7;
- (void)clearSessionState;
- (void)messageRepository:(id)a3 query:(id)a4 countDidChange:(int64_t)a5;
- (void)setlastSeenDates:(id)a3 forBucket:(int64_t)a4;
- (void)updateLastSeenDates:(id)a3 forMailboxes:(id)a4 bucket:(int64_t)a5;
- (void)updateWithMailboxes:(id)a3;
@end

@implementation MUILastSeenBucketHelper

- (void)updateWithMailboxes:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DDD79318();
  uint64_t v6 = sub_1DDEEEDA8();
  MUILastSeenBucketHelper.update(mailboxes:)((Swift::OpaquePointer)v6);
  swift_bridgeObjectRelease();
}

- (_TtC6MailUI23MUILastSeenBucketHelper)init
{
  return (_TtC6MailUI23MUILastSeenBucketHelper *)MUILastSeenBucketHelper.init()();
}

- (void).cxx_destruct
{
  sub_1DDD31430();
  sub_1DDD31430();
  sub_1DDD31430();
}

- (void)messageRepository:(id)a3 query:(id)a4 countDidChange:(int64_t)a5
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  MUILastSeenBucketHelper.messageRepository(_:query:countDidChange:)((uint64_t)a3, a4, a5);
}

- (void)categoryCloudStorage:(id)a3 didChangeLastSeenDate:(id)a4 lastSeenDisplayDate:(id)a5 forCategoryType:(id)a6 inMailboxWithExternalURL:(id)a7
{
  v44 = self;
  id v36 = a3;
  id v42 = a6;
  id v45 = a4;
  id v41 = a5;
  id v43 = a7;
  uint64_t v28 = 0;
  uint64_t v23 = sub_1DDEECD28();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = v23 - 8;
  unint64_t v26 = (*(void *)(v24 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v23);
  v27 = (char *)&v16 - v26;
  unint64_t v29 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA2380) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v28);
  uint64_t v30 = (uint64_t)&v16 - v29;
  uint64_t v31 = sub_1DDEECE18();
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v33 = v31 - 8;
  unint64_t v34 = (*(void *)(v32 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v31);
  v35 = (char *)&v16 - v34;
  unint64_t v37 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBEA2790) - 8) + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = MEMORY[0x1F4188790](v36);
  uint64_t v38 = (uint64_t)&v16 - v37;
  unint64_t v39 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  v9 = (void *)MEMORY[0x1F4188790](v7);
  uint64_t v40 = (uint64_t)&v16 - v39;
  id v10 = v9;
  id v11 = v45;
  id v12 = v41;
  id v13 = v42;
  id v14 = v43;
  v15 = v44;
  if (v45)
  {
    id v22 = v45;
    id v21 = v45;
    sub_1DDEECDF8();
    (*(void (**)(uint64_t, char *, uint64_t))(v32 + 32))(v40, v35, v31);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v32 + 56))(v40, 0, 1, v31);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v32 + 56))(v40, 1, 1, v31);
  }
  if (v41)
  {
    id v20 = v41;
    id v19 = v41;
    sub_1DDEECDF8();
    (*(void (**)(uint64_t, char *, uint64_t))(v32 + 32))(v38, v35, v31);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v32 + 56))(v38, 0, 1, v31);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v32 + 56))(v38, 1, 1, v31);
  }
  if (v43)
  {
    id v18 = v43;
    id v17 = v43;
    sub_1DDEECCF8();
    (*(void (**)(uint64_t, char *, uint64_t))(v24 + 32))(v30, v27, v23);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v24 + 56))(v30, 0, 1, v23);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 56))(v30, 1, 1, v23);
  }
  MUILastSeenBucketHelper.categoryCloudStorage(_:didChangeLastSeenDate:lastSeenDisplay:forCategoryType:inMailboxWithExternalURL:)((uint64_t)v36, v40, v38, (uint64_t)v42, v30);
  sub_1DDD933AC(v30);
  sub_1DDD798DC(v38);
  sub_1DDD798DC(v40);
}

- (void)clearSessionState
{
  v2 = self;
  MUILastSeenBucketHelper.clearState()();
}

- (id)lastSeenDatesForBucket:(int64_t)a3
{
  v3 = self;
  id v7 = MUILastSeenBucketHelper.lastSeenDates(for:)(a3);

  return v7;
}

- (void)setlastSeenDates:(id)a3 forBucket:(int64_t)a4
{
  id v5 = a3;
  id v6 = self;
  MUILastSeenBucketHelper.setlastSeenDates(_:for:)(a3, a4);
}

- (void)updateLastSeenDates:(id)a3 forMailboxes:(id)a4 bucket:(int64_t)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1DDD79318();
  uint64_t v10 = sub_1DDEEEDA8();
  MUILastSeenBucketHelper.updateLastSeenDates(_:forMailboxes:bucket:)(a3, v10, a5);
  swift_bridgeObjectRelease();
}

@end