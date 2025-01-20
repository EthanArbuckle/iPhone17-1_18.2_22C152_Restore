@interface BankConnectWebViewContent.Coordinator
- (_TtCV12FinanceKitUIP33_A64F0A24CC9AF1F8A1FFE13B9BBB3DBE25BankConnectWebViewContent11Coordinator)init;
- (void)webView:(WKWebView *)a3 decidePolicyForNavigationAction:(WKNavigationAction *)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webView:(void *)a3 didFailProvisionalNavigation:(void *)a4 withError:(void *)a5;
@end

@implementation BankConnectWebViewContent.Coordinator

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_243D316DC(a4);
}

- (void)webView:(void *)a3 didFailProvisionalNavigation:(void *)a4 withError:(void *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  id v10 = a1;
  sub_243D317BC(a4, (uint64_t)v11);
}

- (void)webView:(WKWebView *)a3 decidePolicyForNavigationAction:(WKNavigationAction *)a4 decisionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1A950);
  MEMORY[0x270FA5388](v9 - 8);
  id v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_243DFEBB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_268E20C28;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_268E20C30;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_243DAA940((uint64_t)v11, (uint64_t)&unk_268E1D400, (uint64_t)v16);
  swift_release();
}

- (_TtCV12FinanceKitUIP33_A64F0A24CC9AF1F8A1FFE13B9BBB3DBE25BankConnectWebViewContent11Coordinator)init
{
  result = (_TtCV12FinanceKitUIP33_A64F0A24CC9AF1F8A1FFE13B9BBB3DBE25BankConnectWebViewContent11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_243D31164((uint64_t)self+ OBJC_IVAR____TtCV12FinanceKitUIP33_A64F0A24CC9AF1F8A1FFE13B9BBB3DBE25BankConnectWebViewContent11Coordinator_parent, type metadata accessor for BankConnectWebViewContent);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV12FinanceKitUIP33_A64F0A24CC9AF1F8A1FFE13B9BBB3DBE25BankConnectWebViewContent11Coordinator_initialNavigation);
}

@end