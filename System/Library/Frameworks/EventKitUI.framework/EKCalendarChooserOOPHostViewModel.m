@interface EKCalendarChooserOOPHostViewModel
- (_TtC10EventKitUI33EKCalendarChooserOOPHostViewModel)init;
@end

@implementation EKCalendarChooserOOPHostViewModel

- (_TtC10EventKitUI33EKCalendarChooserOOPHostViewModel)init
{
  return (_TtC10EventKitUI33EKCalendarChooserOOPHostViewModel *)sub_1B411C574();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel__configuration;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CFCF20);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel_sizeCategory));
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel_viewHierarchy);
}

@end