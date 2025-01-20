@interface WebReportViewController
- (BOOL)shouldAutorotate;
- (_TtC28HealthExposureNotificationUI23WebReportViewController)initWithAgencyModel:(id)a3;
- (_TtC28HealthExposureNotificationUI23WebReportViewController)initWithCoder:(id)a3;
- (_TtC28HealthExposureNotificationUI23WebReportViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)didTapDone;
- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4;
- (void)viewDidLoad;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation WebReportViewController

- (_TtC28HealthExposureNotificationUI23WebReportViewController)initWithAgencyModel:(id)a3
{
  id v4 = a3;
  v5 = (_TtC28HealthExposureNotificationUI23WebReportViewController *)sub_2293A3FF0(a3);

  return v5;
}

- (_TtC28HealthExposureNotificationUI23WebReportViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC28HealthExposureNotificationUI23WebReportViewController____lazy_storage___webView) = 0;
  uint64_t v5 = OBJC_IVAR____TtC28HealthExposureNotificationUI23WebReportViewController_statusView;
  v6 = self;
  id v7 = a3;
  id v8 = objc_msgSend(v6, sel_systemBackgroundColor);
  id v9 = objc_allocWithZone((Class)type metadata accessor for LoadingStatusView());
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)LoadingStatusView.init(with:backgroundColor:)(0, 0xE000000000000000, v8);

  result = (_TtC28HealthExposureNotificationUI23WebReportViewController *)sub_2294195F8();
  __break(1u);
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (void)viewDidLoad
{
  v2 = self;
  WebReportViewController.viewDidLoad()();
}

- (void)didTapDone
{
}

- (_TtC28HealthExposureNotificationUI23WebReportViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC28HealthExposureNotificationUI23WebReportViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI23WebReportViewController_healthAgencyModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI23WebReportViewController____lazy_storage___webView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC28HealthExposureNotificationUI23WebReportViewController_statusView);
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_2293A420C(v7);
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_2293A45BC(v10, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
  id v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_2293A497C(v10, (uint64_t)v11, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  id v10 = self;
  sub_2293A4B98(v11);
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v6 = *(char **)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC28HealthExposureNotificationUI23WebReportViewController_statusView);
  id v7 = *(void **)&v6[OBJC_IVAR____TtC28HealthExposureNotificationUI17LoadingStatusView_spinnerView];
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  objc_msgSend(v7, sel_stopAnimating);
  objc_msgSend(v6, sel_setHidden_, 1);
}

@end