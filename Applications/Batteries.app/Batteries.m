ValueMetadata *type metadata accessor for ContentView()
{
  return &type metadata for ContentView;
}

uint64_t sub_1000037D0(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_100003D7C, 1);
}

uint64_t sub_1000037F4()
{
  return static View._viewListCount(inputs:)();
}

void *sub_100003814()
{
  return &protocol witness table for EmptyView;
}

uint64_t sub_100003820()
{
  uint64_t v0 = sub_1000039FC(&qword_100008098);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003A40();
  WindowGroup.init(id:title:lazyContent:)();
  sub_100003A94();
  static SceneBuilder.buildBlock<A>(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10000397C()
{
  unint64_t result = qword_100008090;
  if (!qword_100008090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008090);
  }
  return result;
}

ValueMetadata *type metadata accessor for BatteriesApp()
{
  return &type metadata for BatteriesApp;
}

uint64_t sub_1000039E0(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_100003DC0, 1);
}

uint64_t sub_1000039FC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100003A40()
{
  unint64_t result = qword_1000080A0;
  if (!qword_1000080A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000080A0);
  }
  return result;
}

unint64_t sub_100003A94()
{
  unint64_t result = qword_1000080A8;
  if (!qword_1000080A8)
  {
    sub_100003AF0(&qword_100008098);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000080A8);
  }
  return result;
}

uint64_t sub_100003AF0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100003B3C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t WindowGroup.init(id:title:lazyContent:)()
{
  return WindowGroup.init(id:title:lazyContent:)();
}

uint64_t static SceneBuilder.buildBlock<A>(_:)()
{
  return static SceneBuilder.buildBlock<A>(_:)();
}

uint64_t static App.main()()
{
  return static App.main()();
}

uint64_t static View._makeView(view:inputs:)()
{
  return static View._makeView(view:inputs:)();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t self
{
  return _self;
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}