@interface UpdateStore
- (_TtC19AppStoreKitInternal11UpdateStore)init;
- (void)broadcastChangeNotificationIfNotCoalescing;
- (void)dealloc;
- (void)reloadFromServerWithCompletionBlock:(id)a3;
@end

@implementation UpdateStore

- (_TtC19AppStoreKitInternal11UpdateStore)init
{
  return (_TtC19AppStoreKitInternal11UpdateStore *)UpdateStore.init()();
}

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for UpdateStore();
  [(ASDSoftwareUpdatesStore *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal11UpdateStore_notificationQueue));
  swift_weakDestroy();
}

- (void)reloadFromServerWithCompletionBlock:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = sub_1E1868CAC;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_1E1867C30((uint64_t)v7, v6);
  sub_1E160EDD8((uint64_t)v7);
}

- (void)broadcastChangeNotificationIfNotCoalescing
{
  v2 = self;
  sub_1E1868684();
}

@end