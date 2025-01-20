@interface EKEventOOPHostViewModel
- (_TtC10EventKitUI23EKEventOOPHostViewModel)init;
@end

@implementation EKEventOOPHostViewModel

- (_TtC10EventKitUI23EKEventOOPHostViewModel)init
{
  return (_TtC10EventKitUI23EKEventOOPHostViewModel *)sub_1B411308C();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel__configuration;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCDE8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel__event;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCE00);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel_viewHierarchy);
}

@end