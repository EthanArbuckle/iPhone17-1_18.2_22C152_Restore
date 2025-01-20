ValueMetadata *type metadata accessor for ContentView()
{
  return &type metadata for ContentView;
}

uint64_t sub_100003790(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_100003D7C, 1);
}

uint64_t sub_1000037B4()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_1000037D0@<X0>(uint64_t a1@<X8>)
{
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t result = Text.init(_:tableName:bundle:comment:)();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

void *sub_100003850()
{
  return &protocol witness table for Text;
}

uint64_t sub_100003860()
{
  uint64_t v0 = sub_100003A3C(&qword_100008098);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003A80();
  WindowGroup.init(id:title:lazyContent:)();
  sub_100003AD4();
  static SceneBuilder.buildBlock<A>(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000039BC()
{
  unint64_t result = qword_100008090;
  if (!qword_100008090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008090);
  }
  return result;
}

ValueMetadata *type metadata accessor for GAXApp()
{
  return &type metadata for GAXApp;
}

uint64_t sub_100003A20(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_100003DC0, 1);
}

uint64_t sub_100003A3C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100003A80()
{
  unint64_t result = qword_1000080A0;
  if (!qword_1000080A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000080A0);
  }
  return result;
}

unint64_t sub_100003AD4()
{
  unint64_t result = qword_1000080A8;
  if (!qword_1000080A8)
  {
    sub_100003B30(&qword_100008098);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000080A8);
  }
  return result;
}

uint64_t sub_100003B30(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100003B7C()
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

uint64_t LocalizedStringKey.init(stringLiteral:)()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t static App.main()()
{
  return static App.main()();
}

uint64_t Text.init(_:tableName:bundle:comment:)()
{
  return Text.init(_:tableName:bundle:comment:)();
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