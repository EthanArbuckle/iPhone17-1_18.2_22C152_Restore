@interface UIViewController
- (BOOL)doc_isPlaceholder;
- (NSString)docUnavailableSearchResultsText;
- (UIView)dimmingOverlayHostView;
- (_TtC17RecentsAppPopover13DOCTabBarItem)DOCTabBarItem;
- (void)dimmingOverlayStateDidChange:(id)a3 state:(int64_t)a4;
- (void)doc_updateBarButtonTrackingViewsIfNecessary;
- (void)objc_doc_preheatDidFinish;
- (void)objc_doc_preheatForPresentingWithCompletion:(id)a3;
- (void)setDOCTabBarItem:(id)a3;
@end

@implementation UIViewController

- (NSString)docUnavailableSearchResultsText
{
  v2 = [(UIViewController *)self _contentUnavailableConfigurationState];
  v3 = [v2 searchControllerText];

  return (NSString *)v3;
}

- (void)doc_updateBarButtonTrackingViewsIfNecessary
{
  v2 = self;
  v3 = [(UIViewController *)v2 parentViewController];
  [(UIViewController *)v3 doc_updateBarButtonTrackingViewsIfNecessary];
}

- (_TtC17RecentsAppPopover13DOCTabBarItem)DOCTabBarItem
{
  v2 = self;
  result = [(UIViewController *)v2 tabBarItem];
  if (result)
  {

    type metadata accessor for DOCTabBarItem();
    v4 = (void *)swift_dynamicCastClassUnconditional();
    return (_TtC17RecentsAppPopover13DOCTabBarItem *)v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)setDOCTabBarItem:(id)a3
{
}

- (void)objc_doc_preheatForPresentingWithCompletion:(id)a3
{
  v4 = (void (**)(void))_Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_dynamicCastObjCProtocolConditional();
  v7 = self;
  _Block_copy(v4);
  if (v6) {
    DOCPresentationPreheatable<>.doc_preheatForPresenting(completion:)(sub_1000A6070, v5);
  }
  else {
    v4[2](v4);
  }
  swift_release();
  _Block_release(v4);
}

- (void)objc_doc_preheatDidFinish
{
  if (swift_dynamicCastObjCProtocolConditional())
  {
    v3 = self;
    DOCPresentationPreheatable<>.doc_preheatDidFinish()();
  }
}

- (BOOL)doc_isPlaceholder
{
  return 0;
}

- (UIView)dimmingOverlayHostView
{
  v2 = self;
  result = [(UIViewController *)v2 view];
  if (result)
  {
    v4 = result;

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)dimmingOverlayStateDidChange:(id)a3 state:(int64_t)a4
{
  uint64_t v6 = self;
  id v7 = a3;
  v8 = self;
  id v9 = [v6 _dimmingViewColor];
  [v7 setBackgroundColor:v9];
}

@end