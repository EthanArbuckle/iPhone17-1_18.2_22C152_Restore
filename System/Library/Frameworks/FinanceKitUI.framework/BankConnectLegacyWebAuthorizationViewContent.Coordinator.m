@interface BankConnectLegacyWebAuthorizationViewContent.Coordinator
- (_TtCV12FinanceKitUIP33_207ADDCA487650A08FA142B344A4E7BA44BankConnectLegacyWebAuthorizationViewContent11Coordinator)init;
- (void)webView:(WKWebView *)a3 decidePolicyForNavigationAction:(WKNavigationAction *)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation BankConnectLegacyWebAuthorizationViewContent.Coordinator

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1A950);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    uint64_t v10 = sub_243DFEBB0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
    sub_243DFEB80();
    v11 = self;
    id v12 = a4;
    v13 = v11;
    id v14 = a3;
    uint64_t v15 = sub_243DFEB70();
    v16 = (void *)swift_allocObject();
    uint64_t v17 = MEMORY[0x263F8F500];
    v16[2] = v15;
    v16[3] = v17;
    v16[4] = v12;
    v16[5] = v13;
    v16[6] = 0;
    sub_243C26D38((uint64_t)v9, (uint64_t)&unk_268E1D438, (uint64_t)v16);

    swift_release();
  }
  else
  {
    __break(1u);
  }
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
}

- (void)webView:(WKWebView *)a3 decidePolicyForNavigationAction:(WKNavigationAction *)a4 decisionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1A950);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_243DFEBB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_268E1D3F0;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_268E20C30;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  v19 = self;
  sub_243DAA940((uint64_t)v11, (uint64_t)&unk_268E1D400, (uint64_t)v16);
  swift_release();
}

- (_TtCV12FinanceKitUIP33_207ADDCA487650A08FA142B344A4E7BA44BankConnectLegacyWebAuthorizationViewContent11Coordinator)init
{
  result = (_TtCV12FinanceKitUIP33_207ADDCA487650A08FA142B344A4E7BA44BankConnectLegacyWebAuthorizationViewContent11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV12FinanceKitUIP33_207ADDCA487650A08FA142B344A4E7BA44BankConnectLegacyWebAuthorizationViewContent11Coordinator_initialNavigation);
}

@end