@interface MetaTagRequirementController
- (_TtC24AppClipDeveloperSettings28MetaTagRequirementController)init;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webViewWebContentProcessDidTerminate:(id)a3;
@end

@implementation MetaTagRequirementController

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = self;
  sub_9E1C(a3, (uint64_t)a4);
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a5;
  v9 = self;
  sub_AC40((uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  swift_errorRelease();
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a5;
  v9 = self;
  sub_B02C((uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  swift_errorRelease();
}

- (void)webViewWebContentProcessDidTerminate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_B33C((uint64_t)a3);
}

- (_TtC24AppClipDeveloperSettings28MetaTagRequirementController)init
{
  return (_TtC24AppClipDeveloperSettings28MetaTagRequirementController *)sub_B624();
}

- (void).cxx_destruct
{
  sub_BB08((id *)((char *)&self->super.isa
                + OBJC_IVAR____TtC24AppClipDeveloperSettings28MetaTagRequirementController_webView));
  sub_BB34((Class *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC24AppClipDeveloperSettings28MetaTagRequirementController_completion));
}

@end