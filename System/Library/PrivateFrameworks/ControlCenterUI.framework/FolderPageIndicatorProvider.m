@interface FolderPageIndicatorProvider
- (_TtC15ControlCenterUI27FolderPageIndicatorProvider)init;
- (void)folder:(id)a3 didAddList:(id)a4;
- (void)folder:(id)a3 didMoveList:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6;
- (void)folder:(id)a3 didRemoveLists:(id)a4 atIndexes:(id)a5;
- (void)folder:(id)a3 listHiddenDidChange:(id)a4;
- (void)iconList:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5;
- (void)iconList:(void *)a3 didAddIcon:(void *)a4;
@end

@implementation FolderPageIndicatorProvider

- (void)folder:(id)a3 didAddList:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  if ((objc_msgSend(v6, sel_isExtraList_, v7) & 1) == 0) {
    objc_msgSend(v7, sel_addListObserver_, v8);
  }
  sub_1D7B66B70();
}

- (void)folder:(id)a3 didRemoveLists:(id)a4 atIndexes:(id)a5
{
  uint64_t v7 = sub_1D7BB6C08();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D7B2170C(0, &qword_1EA871878);
  unint64_t v11 = sub_1D7BB72F8();
  sub_1D7BB6BF8();
  id v12 = a3;
  v13 = self;
  sub_1D7B68424(v11);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)folder:(id)a3 didMoveList:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_1D7B66B70();
}

- (void)folder:(id)a3 listHiddenDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1D7B66B70();
}

- (void)iconList:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5
{
  if (a3)
  {
    id v8 = a4;
    id v9 = a5;
    unint64_t v11 = self;
    id v10 = a3;
    sub_1D7B66CB8(v10);
  }
  else
  {
    __break(1u);
  }
}

- (void)iconList:(void *)a3 didAddIcon:(void *)a4
{
  if (a3)
  {
    id v6 = a4;
    id v8 = a1;
    id v7 = a3;
    sub_1D7B66CB8(v7);
  }
  else
  {
    __break(1u);
  }
}

- (_TtC15ControlCenterUI27FolderPageIndicatorProvider)init
{
  result = (_TtC15ControlCenterUI27FolderPageIndicatorProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D7B63530((uint64_t)self + OBJC_IVAR____TtC15ControlCenterUI27FolderPageIndicatorProvider_delegate);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end