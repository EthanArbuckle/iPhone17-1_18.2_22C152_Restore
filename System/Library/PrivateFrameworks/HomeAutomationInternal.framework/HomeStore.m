@interface HomeStore
- (_TtC22HomeAutomationInternal9HomeStore)init;
- (void)home:(id)a3 didAddAccessory:(id)a4;
- (void)home:(void *)a3 didRemoveAccessory:(void *)a4;
- (void)home:(void *)a3 didUpdateRoom:(void *)a4 forAccessory:(void *)a5;
- (void)homeDidUpdateName:(id)a3;
- (void)homeManager:(id)a3 didAddHome:(id)a4;
- (void)homeManager:(id)a3 didRemoveHome:(id)a4;
- (void)homeManagerDidUpdateAssistantIdentifiers:(id)a3;
- (void)homeManagerDidUpdateCurrentHome:(id)a3;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)mediaSystem:(void *)a3 didUpdateName:;
@end

@implementation HomeStore

- (_TtC22HomeAutomationInternal9HomeStore)init
{
  return (_TtC22HomeAutomationInternal9HomeStore *)sub_22E1FE850();
}

- (void)homeManagerDidUpdateCurrentHome:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22E203924();
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4 = (char *)a3;
  v5 = self;
  sub_22E1FEDFC(v4);
}

- (void)homeDidUpdateName:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22E203C94();
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_22E203DAC(v7);
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_22E203C94();
}

- (void)homeManagerDidUpdateAssistantIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22E203C94();
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_22E203EE0(v7);
}

- (void)home:(void *)a3 didUpdateRoom:(void *)a4 forAccessory:(void *)a5
{
  v9 = &a1[OBJC_IVAR____TtC22HomeAutomationInternal9HomeStore__cacheRequiresInvalidation];
  swift_beginAccess();
  v10 = (void *)*((void *)v9 + 1);
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = a1;
  objc_msgSend(v10, sel_lock);
  char *v9 = 1;
  objc_msgSend(v10, sel_unlock);
  swift_endAccess();
  v15 = &v14[OBJC_IVAR____TtC22HomeAutomationInternal9HomeStore__isCachedStableHomeGraphHashValid];
  swift_beginAccess();
  v16 = (void *)*((void *)v15 + 1);
  objc_msgSend(v16, sel_lock);
  char *v15 = 0;
  objc_msgSend(v16, sel_unlock);
  swift_endAccess();
}

- (void)mediaSystem:(void *)a3 didUpdateName:
{
  v5 = &a1[OBJC_IVAR____TtC22HomeAutomationInternal9HomeStore__cacheRequiresInvalidation];
  swift_beginAccess();
  id v6 = (void *)*((void *)v5 + 1);
  id v7 = a3;
  v8 = a1;
  objc_msgSend(v6, sel_lock);
  char *v5 = 1;
  objc_msgSend(v6, sel_unlock);
  swift_endAccess();
  v9 = &v8[OBJC_IVAR____TtC22HomeAutomationInternal9HomeStore__isCachedStableHomeGraphHashValid];
  swift_beginAccess();
  v10 = (void *)*((void *)v9 + 1);
  objc_msgSend(v10, sel_lock);
  char *v9 = 0;
  objc_msgSend(v10, sel_unlock);
  swift_endAccess();
}

- (void)home:(void *)a3 didRemoveAccessory:(void *)a4
{
  id v7 = &a1[OBJC_IVAR____TtC22HomeAutomationInternal9HomeStore__cacheRequiresInvalidation];
  swift_beginAccess();
  v8 = (void *)*((void *)v7 + 1);
  id v9 = a3;
  id v10 = a4;
  id v11 = a1;
  objc_msgSend(v8, sel_lock);
  *id v7 = 1;
  objc_msgSend(v8, sel_unlock);
  swift_endAccess();
  id v12 = &v11[OBJC_IVAR____TtC22HomeAutomationInternal9HomeStore__isCachedStableHomeGraphHashValid];
  swift_beginAccess();
  id v13 = (void *)*((void *)v12 + 1);
  objc_msgSend(v13, sel_lock);
  *id v12 = 0;
  objc_msgSend(v13, sel_unlock);
  swift_endAccess();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC22HomeAutomationInternal9HomeStore_initializationSignpostID;
  uint64_t v4 = sub_22E6CFCB0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();

  swift_release();
  swift_release();
  objc_release(*(id *)&self->_cachedResults[OBJC_IVAR____TtC22HomeAutomationInternal9HomeStore__cachedStableHomeGraphHash
                                          + 8]);
  swift_bridgeObjectRelease();
  v5 = *(void **)&self->_cachedResults[OBJC_IVAR____TtC22HomeAutomationInternal9HomeStore__isCachedStableHomeGraphHashValid];
}

@end