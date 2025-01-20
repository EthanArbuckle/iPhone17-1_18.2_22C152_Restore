@interface AAUIIdentityViewFactory
+ (id)createAppleAccountHeaderViewFromContact:(id)a3 account:(id)a4 showAccountDetails:(BOOL)a5 showEditButton:(BOOL)a6;
- (AAUIIdentityViewFactory)init;
@end

@implementation AAUIIdentityViewFactory

+ (id)createAppleAccountHeaderViewFromContact:(id)a3 account:(id)a4 showAccountDetails:(BOOL)a5 showEditButton:(BOOL)a6
{
  swift_getObjCClassMetadata();
  id v6 = a3;
  id v7 = a4;
  char v9 = sub_2098BE1E8();
  char v10 = sub_2098BE1E8();
  swift_getObjCClassMetadata();
  id v13 = static IdentityViewFactory.createAppleAccountHeaderView(contact:account:showAccountDetails:showEditButton:)(a3, a4, v9 & 1, v10 & 1);

  return v13;
}

- (AAUIIdentityViewFactory)init
{
  return (AAUIIdentityViewFactory *)IdentityViewFactory.init()();
}

@end