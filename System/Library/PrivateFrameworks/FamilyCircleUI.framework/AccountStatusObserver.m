@interface AccountStatusObserver
- (_TtC14FamilyCircleUI21AccountStatusObserver)init;
- (void)accountWasAdded:(void *)a3;
- (void)dealloc;
@end

@implementation AccountStatusObserver

- (void)dealloc
{
  v2 = self;
  sub_218C2EE28();
}

- (void).cxx_destruct
{
}

- (_TtC14FamilyCircleUI21AccountStatusObserver)init
{
  result = (_TtC14FamilyCircleUI21AccountStatusObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)accountWasAdded:(void *)a3
{
  v5 = self;
  id v6 = a3;
  id v7 = a1;
  id v8 = objc_msgSend(v5, sel_defaultCenter);
  id v9 = v8;
  if (qword_26AA849A0 != -1)
  {
    swift_once();
    id v8 = v9;
  }
  objc_msgSend(v8, sel_postNotificationName_object_userInfo_deliverImmediately_, qword_26AA87880, 0, 0, 1);
}

@end