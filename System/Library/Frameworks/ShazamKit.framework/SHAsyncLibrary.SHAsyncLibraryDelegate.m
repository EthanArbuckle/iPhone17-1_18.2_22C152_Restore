@interface SHAsyncLibrary.SHAsyncLibraryDelegate
- (_TtCC9ShazamKit14SHAsyncLibrary22SHAsyncLibraryDelegate)init;
- (void)_library:(id)a3 didChangeWithSnapshot:(id)a4;
- (void)_library:(id)a3 didProduceError:(id)a4 failedItemIdentifiers:(id)a5;
- (void)_libraryDidCompleteSync:(id)a3;
- (void)_libraryWillBeginSync:(id)a3;
@end

@implementation SHAsyncLibrary.SHAsyncLibraryDelegate

- (void)_libraryWillBeginSync:(id)a3
{
}

- (void)_library:(id)a3 didChangeWithSnapshot:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  v7 = self;
  sub_224B903E0(v6);
  swift_unknownObjectRelease();
}

- (void)_library:(id)a3 didProduceError:(id)a4 failedItemIdentifiers:(id)a5
{
  uint64_t v7 = sub_224BBF0B0();
  swift_unknownObjectRetain();
  id v8 = a4;
  v9 = self;
  sub_224B90DF4(v8, v7);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)_libraryDidCompleteSync:(id)a3
{
}

- (_TtCC9ShazamKit14SHAsyncLibrary22SHAsyncLibraryDelegate)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (char *)self + OBJC_IVAR____TtCC9ShazamKit14SHAsyncLibrary22SHAsyncLibraryDelegate_updatesContinuation;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680975C8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  uint64_t v6 = OBJC_IVAR____TtCC9ShazamKit14SHAsyncLibrary22SHAsyncLibraryDelegate_lock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680975D0);
  uint64_t v7 = (objc_class *)swift_allocObject();
  *((_DWORD *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.isa + v6) = v7;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCC9ShazamKit14SHAsyncLibrary22SHAsyncLibraryDelegate_inflightItems) = (Class)MEMORY[0x263F8EE88];
  v9.receiver = self;
  v9.super_class = ObjectType;
  return [(SHAsyncLibrary.SHAsyncLibraryDelegate *)&v9 init];
}

- (void).cxx_destruct
{
  sub_224B73E2C((uint64_t)self + OBJC_IVAR____TtCC9ShazamKit14SHAsyncLibrary22SHAsyncLibraryDelegate_updatesContinuation, &qword_268097628);
  swift_release();

  swift_bridgeObjectRelease();
}

@end