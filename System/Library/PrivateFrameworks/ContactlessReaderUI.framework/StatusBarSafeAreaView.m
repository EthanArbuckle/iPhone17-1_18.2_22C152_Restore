@interface StatusBarSafeAreaView
- (_TtC19ContactlessReaderUI21StatusBarSafeAreaView)initWithCoder:(id)a3;
- (_TtC19ContactlessReaderUI21StatusBarSafeAreaView)initWithNibName:(id)a3 bundle:(id)a4;
- (uint64_t)viewSafeAreaInsetsDidChange;
- (void)_boundingPathMayHaveChangedForView:(id)a3 relativeToBoundsOriginOnly:(BOOL)a4;
- (void)viewDidLoad;
@end

@implementation StatusBarSafeAreaView

- (_TtC19ContactlessReaderUI21StatusBarSafeAreaView)initWithCoder:(id)a3
{
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC19ContactlessReaderUI21StatusBarSafeAreaView_safeRect);
  _OWORD *v4 = 0u;
  v4[1] = 0u;
  v5 = (char *)self + OBJC_IVAR____TtC19ContactlessReaderUI21StatusBarSafeAreaView_maxAllowedSize;
  *(void *)v5 = 0;
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  v6 = (_OWORD *)((char *)self + OBJC_IVAR____TtC19ContactlessReaderUI21StatusBarSafeAreaView_cornerRadii);
  _OWORD *v6 = 0u;
  v6[1] = 0u;
  id v7 = a3;

  result = (_TtC19ContactlessReaderUI21StatusBarSafeAreaView *)sub_23EF05BE8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  memset(v7, 0, sizeof(v7));
  char v8 = 1;
  v6 = a1;
  sub_23EEFC7BC(0, (uint64_t)v7, 0);
  v1 = &v6[OBJC_IVAR____TtC19ContactlessReaderUI21StatusBarSafeAreaView_safeRect];
  *(void *)v1 = v2;
  *((void *)v1 + 1) = v3;
  *((void *)v1 + 2) = v4;
  *((void *)v1 + 3) = v5;
}

- (_TtC19ContactlessReaderUI21StatusBarSafeAreaView)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC19ContactlessReaderUI21StatusBarSafeAreaView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)_boundingPathMayHaveChangedForView:(id)a3 relativeToBoundsOriginOnly:(BOOL)a4
{
  if (a3) {
    objc_msgSend(a3, sel_layoutSubviews);
  }
  else {
    __break(1u);
  }
}

- (uint64_t)viewSafeAreaInsetsDidChange
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268C21A00);
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268C202B0 != -1) {
    swift_once();
  }
  uint64_t v3 = __swift_project_value_buffer(v0, (uint64_t)qword_268C26648);
  sub_23EDBA140(v3, (uint64_t)v2);
  uint64_t v4 = sub_23EF03AA8();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v2, 1, v4) == 1) {
    return sub_23EDBA1A8((uint64_t)v2);
  }
  id v7 = sub_23EF03A88();
  os_log_type_t v8 = sub_23EF057C8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_23ED94000, v7, v8, "safeAreaInsetsDidChange", v9, 2u);
    MEMORY[0x2455BF9E0](v9, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v2, v4);
}

@end