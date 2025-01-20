@interface ArcadeDownloadPackSuggestionsViewController
- (void)didTapDoneButton;
- (void)didTapGetAllButtonWithSender:(id)a3;
@end

@implementation ArcadeDownloadPackSuggestionsViewController

- (void)didTapDoneButton
{
  v2 = self;
  sub_100762E90();
  v4[4] = sub_10017AAE4;
  v4[5] = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 1107296256;
  v4[2] = sub_1000DFF64;
  v4[3] = &unk_1008764A8;
  v3 = _Block_copy(v4);
  [(ArcadeDownloadPackSuggestionsViewController *)v2 dismissViewControllerAnimated:1 completion:v3];
  _Block_release(v3);
}

- (void)didTapGetAllButtonWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10017AD7C(v4);
}

- (void).cxx_destruct
{
  swift_release();

  v3 = *(void **)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC22SubscribePageExtension43ArcadeDownloadPackSuggestionsViewController_primaryGetAllButton];
}

@end