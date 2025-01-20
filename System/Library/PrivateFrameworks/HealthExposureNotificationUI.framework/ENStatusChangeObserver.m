@interface ENStatusChangeObserver
- (BOOL)active;
- (ENStatusChangeObserver)init;
- (ENStatusChangeObserver)initWithAdapter:(id)a3 didChangeHandler:(id)a4;
- (void)dealloc;
- (void)setActive:(BOOL)a3;
@end

@implementation ENStatusChangeObserver

- (ENStatusChangeObserver)initWithAdapter:(id)a3 didChangeHandler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.isa + OBJC_IVAR___ENStatusChangeObserver_active) = 0;
  swift_unknownObjectWeakAssign();
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR___ENStatusChangeObserver_didChangeHandler);
  *v7 = sub_2293D3010;
  v7[1] = (uint64_t (*)())v6;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ENManagerAdapter.StatusChangeObserver();
  return [(ENStatusChangeObserver *)&v9 init];
}

- (BOOL)active
{
  v2 = (BOOL *)self + OBJC_IVAR___ENStatusChangeObserver_active;
  swift_beginAccess();
  return *v2;
}

- (void)setActive:(BOOL)a3
{
  v4 = self;
  ENManagerAdapter.StatusChangeObserver.active.setter(a3);
}

- (void)dealloc
{
  v3 = (char *)self + OBJC_IVAR___ENStatusChangeObserver_active;
  swift_beginAccess();
  unsigned char *v3 = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ENManagerAdapter.StatusChangeObserver();
  v4 = self;
  [(ENStatusChangeObserver *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_release();
}

- (ENStatusChangeObserver)init
{
  result = (ENStatusChangeObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end