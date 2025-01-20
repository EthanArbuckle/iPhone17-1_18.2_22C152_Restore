@interface ActivityAlertClient
- (_TtC18ActivityUIServices19ActivityAlertClient)init;
- (_TtP18ActivityUIServices27ActivityAlertClientDelegate_)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation ActivityAlertClient

- (_TtP18ActivityUIServices27ActivityAlertClientDelegate_)delegate
{
  v2 = (char *)self + OBJC_IVAR____TtC18ActivityUIServices19ActivityAlertClient_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x23ECEAE20](v2);
  return (_TtP18ActivityUIServices27ActivityAlertClientDelegate_ *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC18ActivityUIServices19ActivityAlertClient)init
{
  return (_TtC18ActivityUIServices19ActivityAlertClient *)ActivityAlertClient.init()();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC18ActivityUIServices19ActivityAlertClient_delegate;
  sub_23C9563B0((uint64_t)v3);
}

@end