@interface IDSGroupDefaultRootMaterialExchangeController
- (IDSGroupQUICMaterialExchangeProvider)quicMaterialExchangeProvider;
- (_TtC17identityservicesd45IDSGroupDefaultRootMaterialExchangeController)initWithConfig:(id)a3 session:(id)a4 serviceID:(id)a5 pushHandler:(id)a6;
@end

@implementation IDSGroupDefaultRootMaterialExchangeController

- (IDSGroupQUICMaterialExchangeProvider)quicMaterialExchangeProvider
{
  v2 = (void *)swift_unknownObjectRetain();

  return (IDSGroupQUICMaterialExchangeProvider *)v2;
}

- (_TtC17identityservicesd45IDSGroupDefaultRootMaterialExchangeController)initWithConfig:(id)a3 session:(id)a4 serviceID:(id)a5 pushHandler:(id)a6
{
  uint64_t v9 = sub_100726430();
  uint64_t v11 = v10;
  id v12 = a3;
  id v13 = a4;
  swift_unknownObjectRetain();
  return (_TtC17identityservicesd45IDSGroupDefaultRootMaterialExchangeController *)sub_10052B538((uint64_t)v12, (uint64_t)v13, v9, v11, (uint64_t)a6);
}

- (void).cxx_destruct
{
}

@end