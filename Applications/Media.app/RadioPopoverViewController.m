@interface RadioPopoverViewController
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)popoverPresentationControllerDidDismissPopover:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RadioPopoverViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10000D678();
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RadioPopoverViewController();
  id v2 = v3.receiver;
  [(RadioPopoverViewController *)&v3 viewDidLayoutSubviews];
  sub_10000DD64();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RadioPopoverViewController();
  id v4 = v5.receiver;
  [(RadioPopoverViewController *)&v5 viewWillAppear:v3];
  sub_10000DD64();
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 44.0;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  BOOL v3 = (void *)swift_dynamicCastObjCProtocolConditional();
  if (v3) {
    [v3 invalidate];
  }
}

@end