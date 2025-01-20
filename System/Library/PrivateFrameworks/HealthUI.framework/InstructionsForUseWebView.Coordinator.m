@interface InstructionsForUseWebView.Coordinator
- (_TtCV8HealthUIP33_9391128D22BBD0797A4FA47559946E1D25InstructionsForUseWebView11Coordinator)init;
- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5;
- (void)webView:(void *)a3 didFailProvisionalNavigation:(void *)a4 withError:(void *)a5;
@end

@implementation InstructionsForUseWebView.Coordinator

- (void)webView:(void *)a3 didFailProvisionalNavigation:(void *)a4 withError:(void *)a5
{
  v9 = &a1[OBJC_IVAR____TtCV8HealthUIP33_9391128D22BBD0797A4FA47559946E1D25InstructionsForUseWebView11Coordinator_parent];
  uint64_t v10 = type metadata accessor for InstructionsForUseWebView(0);
  v11 = (uint64_t *)&v9[*(int *)(v10 + 24)];
  uint64_t v12 = *v11;
  uint64_t v13 = v11[1];
  uint64_t v14 = (uint64_t)&v9[*(int *)(v10 + 32)];
  id v15 = a3;
  id v16 = a4;
  id v18 = a5;
  v17 = a1;
  sub_1E0EB7B18(a5, v12, v13, v14, 0, 0);
}

- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_1E0EBFE60(v9, v10, (uint64_t)v11, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (_TtCV8HealthUIP33_9391128D22BBD0797A4FA47559946E1D25InstructionsForUseWebView11Coordinator)init
{
  result = (_TtCV8HealthUIP33_9391128D22BBD0797A4FA47559946E1D25InstructionsForUseWebView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end