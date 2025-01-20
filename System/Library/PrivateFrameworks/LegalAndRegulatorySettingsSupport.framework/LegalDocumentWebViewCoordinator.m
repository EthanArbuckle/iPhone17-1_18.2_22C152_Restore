@interface LegalDocumentWebViewCoordinator
- (_TtC33LegalAndRegulatorySettingsSupport31LegalDocumentWebViewCoordinator)init;
- (void)scrollViewDidScroll:(id)a3;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
@end

@implementation LegalDocumentWebViewCoordinator

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_2544742D8(v10, (uint64_t)v11, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_msgSend(v4, sel_contentOffset);
  objc_msgSend(v4, sel_setContentOffset_, 0.0);
}

- (_TtC33LegalAndRegulatorySettingsSupport31LegalDocumentWebViewCoordinator)init
{
  result = (_TtC33LegalAndRegulatorySettingsSupport31LegalDocumentWebViewCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC33LegalAndRegulatorySettingsSupport31LegalDocumentWebViewCoordinator_openURL;
  uint64_t v3 = sub_25447F330();
  id v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end