@interface CNContactGroupVisualizerViewWrapper
- (UIViewController)hostingController;
- (_TtC10ContactsUI35CNContactGroupVisualizerViewWrapper)init;
- (_TtC10ContactsUI35CNContactGroupVisualizerViewWrapper)initWithType:(int64_t)a3 contacts:(id)a4;
- (_TtC10ContactsUI35CNContactGroupVisualizerViewWrapper)initWithType:(int64_t)a3 contacts:(id)a4 limitContactsCount:(int64_t)a5;
@end

@implementation CNContactGroupVisualizerViewWrapper

- (UIViewController)hostingController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC10ContactsUI35CNContactGroupVisualizerViewWrapper_hostingController));
}

- (_TtC10ContactsUI35CNContactGroupVisualizerViewWrapper)initWithType:(int64_t)a3 contacts:(id)a4 limitContactsCount:(int64_t)a5
{
  if (a4)
  {
    sub_18B6950C8();
    unint64_t v7 = sub_18B985F88();
  }
  else
  {
    unint64_t v7 = 0;
  }
  return (_TtC10ContactsUI35CNContactGroupVisualizerViewWrapper *)CNContactGroupVisualizerViewWrapper.init(type:contacts:limitContactsCount:)(a3, v7, a5);
}

- (_TtC10ContactsUI35CNContactGroupVisualizerViewWrapper)initWithType:(int64_t)a3 contacts:(id)a4
{
  v4 = a4;
  if (a4)
  {
    sub_18B6950C8();
    sub_18B985F88();
    v4 = (void *)sub_18B985F78();
    swift_bridgeObjectRelease();
  }
  unint64_t v7 = [(CNContactGroupVisualizerViewWrapper *)self initWithType:a3 contacts:v4 limitContactsCount:-1];

  return v7;
}

- (_TtC10ContactsUI35CNContactGroupVisualizerViewWrapper)init
{
  result = (_TtC10ContactsUI35CNContactGroupVisualizerViewWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI35CNContactGroupVisualizerViewWrapper_hostingController));
}

@end