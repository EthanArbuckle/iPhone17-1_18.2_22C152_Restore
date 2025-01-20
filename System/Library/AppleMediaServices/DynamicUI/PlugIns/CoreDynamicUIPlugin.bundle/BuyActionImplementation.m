@interface BuyActionImplementation
- (_TtC19CoreDynamicUIPlugin23BuyActionImplementation)init;
- (id)purchase:(id)a3 handleSceneIdentifierRequest:(id)a4 error:(id *)a5;
- (id)purchase:(id)a3 handleWindowRequest:(id)a4 error:(id *)a5;
- (void)purchase:(AMSPurchase *)a3 handleAuthenticateRequest:(AMSAuthenticateRequest *)a4 completion:(id)a5;
- (void)purchase:(AMSPurchase *)a3 handleDialogRequest:(AMSDialogRequest *)a4 completion:(id)a5;
- (void)purchase:(AMSPurchase *)a3 handleEngagementRequest:(AMSEngagementRequest *)a4 completion:(id)a5;
@end

@implementation BuyActionImplementation

- (_TtC19CoreDynamicUIPlugin23BuyActionImplementation)init
{
  return (_TtC19CoreDynamicUIPlugin23BuyActionImplementation *)sub_1F268();
}

- (void).cxx_destruct
{
  sub_EF88((uint64_t)self + OBJC_IVAR____TtC19CoreDynamicUIPlugin23BuyActionImplementation_bag, &qword_BBB40);

  swift_unknownObjectWeakDestroy();
}

- (void)purchase:(AMSPurchase *)a3 handleAuthenticateRequest:(AMSAuthenticateRequest *)a4 completion:(id)a5
{
}

- (void)purchase:(AMSPurchase *)a3 handleDialogRequest:(AMSDialogRequest *)a4 completion:(id)a5
{
}

- (void)purchase:(AMSPurchase *)a3 handleEngagementRequest:(AMSEngagementRequest *)a4 completion:(id)a5
{
}

- (id)purchase:(id)a3 handleSceneIdentifierRequest:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_20C80();

  NSString v10 = sub_8F9A0();
  swift_bridgeObjectRelease();

  return v10;
}

- (id)purchase:(id)a3 handleWindowRequest:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  id v10 = sub_20EFC();

  return v10;
}

@end