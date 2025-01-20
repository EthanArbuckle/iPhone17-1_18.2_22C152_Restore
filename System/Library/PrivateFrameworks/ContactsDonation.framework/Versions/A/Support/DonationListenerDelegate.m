@interface DonationListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC21contactsdonationagent24DonationListenerDelegate)init;
@end

@implementation DonationListenerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1000069A8(v7);

  return v9 & 1;
}

- (_TtC21contactsdonationagent24DonationListenerDelegate)init
{
  result = (_TtC21contactsdonationagent24DonationListenerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end