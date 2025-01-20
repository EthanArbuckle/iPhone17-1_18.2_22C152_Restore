@interface CKVideoPlayerReusePool
+ (CKVideoPlayerReusePool)sharedPool;
- (CKVideoPlayerReusePool)init;
- (NSArray)pool;
- (id)dequeueAvailablePlayerAt:(int64_t)a3;
- (id)dequeueAvailableVideoPlayer;
- (id)existingVideoPlayerForTransferGUID:(id)a3;
- (void)dealloc;
- (void)lowMemoryWarningReceivedWithNotification:(id)a3;
- (void)removeUnneededVideoPlayers;
- (void)returnPlayerToPool:(id)a3;
- (void)setPool:(id)a3;
@end

@implementation CKVideoPlayerReusePool

- (NSArray)pool
{
  swift_beginAccess();
  sub_18F5CB48C();
  sub_18F7B6CA0();
  v2 = (void *)sub_18F7B99A0();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (void)setPool:(id)a3
{
  sub_18F5CB48C();
  uint64_t v4 = sub_18F7B99C0();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___CKVideoPlayerReusePool_pool);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

+ (CKVideoPlayerReusePool)sharedPool
{
  if (qword_1E92377C0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E923C798;

  return (CKVideoPlayerReusePool *)v2;
}

- (CKVideoPlayerReusePool)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKVideoPlayerReusePool_pool) = (Class)MEMORY[0x1E4FBC860];
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for VideoPlayerReusePool();
  v2 = [(CKVideoPlayerReusePool *)&v7 init];
  v3 = self;
  uint64_t v4 = v2;
  id v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_addObserver_selector_name_object_, v4, sel_lowMemoryWarningReceivedWithNotification_, *MEMORY[0x1E4F43670], 0);

  return v4;
}

- (void)dealloc
{
  v3 = self;
  uint64_t v4 = self;
  id v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for VideoPlayerReusePool();
  [(CKVideoPlayerReusePool *)&v6 dealloc];
}

- (void).cxx_destruct
{
}

- (id)dequeueAvailableVideoPlayer
{
  v2 = self;
  uint64_t v3 = sub_18F5CA790();
  if (v4) {
    id v5 = objc_msgSend(objc_allocWithZone((Class)CKReusableVideoPlayer), sel_init);
  }
  else {
    id v5 = [(CKVideoPlayerReusePool *)v2 dequeueAvailablePlayerAt:v3];
  }
  objc_super v6 = v5;

  return v6;
}

- (id)existingVideoPlayerForTransferGUID:(id)a3
{
  uint64_t v4 = sub_18F7B97E0();
  uint64_t v6 = v5;
  swift_beginAccess();
  objc_super v7 = self;
  unint64_t v8 = sub_18F7B6CA0();
  uint64_t v9 = sub_18F5CB25C(v8, v4, v6);
  char v11 = v10;
  swift_bridgeObjectRelease();
  id v12 = 0;
  if ((v11 & 1) == 0) {
    id v12 = [(CKVideoPlayerReusePool *)v7 dequeueAvailablePlayerAt:v9];
  }

  swift_bridgeObjectRelease();

  return v12;
}

- (void)returnPlayerToPool:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_18F5CAB20(v4);
}

- (id)dequeueAvailablePlayerAt:(int64_t)a3
{
  swift_beginAccess();
  uint64_t v5 = self;
  uint64_t v6 = (void *)sub_18F5E9614(a3);
  swift_endAccess();

  return v6;
}

- (void)removeUnneededVideoPlayers
{
  v2 = self;
  sub_18F5CAD1C();
}

- (void)lowMemoryWarningReceivedWithNotification:(id)a3
{
  uint64_t v4 = sub_18F7B5D30();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  objc_super v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18F7B5CF0();
  [(CKVideoPlayerReusePool *)self removeUnneededVideoPlayers];
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end