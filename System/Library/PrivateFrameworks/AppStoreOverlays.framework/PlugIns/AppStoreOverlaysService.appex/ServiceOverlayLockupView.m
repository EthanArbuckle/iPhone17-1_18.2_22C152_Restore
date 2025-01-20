@interface ServiceOverlayLockupView
- (AMSMutableBinaryPromise)loadLockupPromise;
- (ASCLockup)lockup;
- (ASCSignpostSpan)hostSignpostSpan;
- (ASCViewMetrics)viewMetrics;
- (ASOServiceAdInteractionAttributor)adInteractionAttributor;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC23AppStoreOverlaysService24ServiceOverlayLockupView)initWithCoder:(id)a3;
- (_TtC23AppStoreOverlaysService24ServiceOverlayLockupView)initWithFrame:(CGRect)a3;
- (_TtC23AppStoreOverlaysService24ServiceOverlayLockupView)initWithFrame:(CGRect)a3 lockup:(id)a4 metricsReporter:(id)a5 localizer:(id)a6 hostBundleIdentifier:(id)a7 hostSceneIdentifier:(id)a8;
- (_TtC23AppStoreOverlaysService24ServiceOverlayLockupView)initWithFrame:(CGRect)a3 request:(id)a4 metricsReporter:(id)a5 localizer:(id)a6 hostBundleIdentifier:(id)a7 hostSceneIdentifier:(id)a8;
- (id)additionalMetricsFields;
- (id)lockupViewPerformAdAttributionForState:(id)a3;
- (id)metricsActivityForLockupView:(id)a3 toPerformActionOfOffer:(id)a4;
- (id)presentingViewControllerForLockupView:(id)a3;
- (int64_t)semanticContentAttribute;
- (int64_t)variant;
- (void)didTapOnOverlay;
- (void)layoutSubviews;
- (void)lockupView:(id)a3 didFailRequestWithError:(id)a4;
- (void)lockupViewDidBeginRequest:(id)a3;
- (void)lockupViewDidFinishRequest:(id)a3;
- (void)setAdInteractionAttributor:(id)a3;
- (void)setHostSignpostSpan:(id)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setVariant:(int64_t)a3;
- (void)updateFonts;
@end

@implementation ServiceOverlayLockupView

- (_TtC23AppStoreOverlaysService24ServiceOverlayLockupView)initWithFrame:(CGRect)a3 request:(id)a4 metricsReporter:(id)a5 localizer:(id)a6 hostBundleIdentifier:(id)a7 hostSceneIdentifier:(id)a8
{
  return (_TtC23AppStoreOverlaysService24ServiceOverlayLockupView *)sub_100013E4C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2, a4, a5, a6, (uint64_t)a7, (uint64_t)a8, (uint64_t (*)(void *, void *, void *, uint64_t, uint64_t, uint64_t, uint64_t, double, double, double, double))sub_100013B68);
}

- (_TtC23AppStoreOverlaysService24ServiceOverlayLockupView)initWithFrame:(CGRect)a3 lockup:(id)a4 metricsReporter:(id)a5 localizer:(id)a6 hostBundleIdentifier:(id)a7 hostSceneIdentifier:(id)a8
{
  return (_TtC23AppStoreOverlaysService24ServiceOverlayLockupView *)sub_100013E4C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2, a4, a5, a6, (uint64_t)a7, (uint64_t)a8, (uint64_t (*)(void *, void *, void *, uint64_t, uint64_t, uint64_t, uint64_t, double, double, double, double))sub_100013CD4);
}

- (_TtC23AppStoreOverlaysService24ServiceOverlayLockupView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_adInteractionAttributor) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_hostSignpostSpan) = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC23AppStoreOverlaysService24ServiceOverlayLockupView *)sub_100018A60();
  __break(1u);
  return result;
}

- (AMSMutableBinaryPromise)loadLockupPromise
{
  return (AMSMutableBinaryPromise *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                            + OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_loadLockupPromise));
}

- (int64_t)variant
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_variant);
}

- (void)setVariant:(int64_t)a3
{
  v4 = self;
  sub_100014054(a3);
}

- (ASOServiceAdInteractionAttributor)adInteractionAttributor
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (ASOServiceAdInteractionAttributor *)v2;
}

- (void)setAdInteractionAttributor:(id)a3
{
  v4 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_adInteractionAttributor);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (ASCLockup)lockup
{
  id v2 = [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_lockupView) lockup];

  return (ASCLockup *)v2;
}

- (ASCSignpostSpan)hostSignpostSpan
{
  return (ASCSignpostSpan *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                    + OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_hostSignpostSpan));
}

- (void)setHostSignpostSpan:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_hostSignpostSpan);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_hostSignpostSpan) = (Class)a3;
  id v6 = a3;
  id v5 = self;
  sub_10001464C(v4);
}

- (int64_t)semanticContentAttribute
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(ServiceOverlayLockupView *)&v3 semanticContentAttribute];
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v9.receiver = self;
  v9.super_class = ObjectType;
  id v6 = self;
  [(ServiceOverlayLockupView *)&v9 setSemanticContentAttribute:a3];
  v7 = *(Class *)((char *)&v6->super.super.super.isa
                + OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_calloutLabel);
  v8.receiver = v6;
  v8.super_class = ObjectType;
  objc_msgSend(v7, "setSemanticContentAttribute:", -[ServiceOverlayLockupView semanticContentAttribute](&v8, "semanticContentAttribute"));
}

- (void)layoutSubviews
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = sub_100018630();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100018740();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23.receiver = self;
  v23.super_class = ObjectType;
  v12 = self;
  [(ServiceOverlayLockupView *)&v23 layoutSubviews];
  sub_1000149BC((uint64_t)v11);
  [(ServiceOverlayLockupView *)v12 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  [(ServiceOverlayLockupView *)v12 layoutMargins];
  sub_1000121C8(v14, v16, v18, v20, v21, v22);
  sub_1000186C0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v4 = sub_100018740();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = self;
  [(ServiceOverlayLockupView *)v8 layoutMargins];
  sub_1000189C0(v17);
  sub_1000149BC((uint64_t)v7);
  sub_100018640();
  double v10 = v9;
  double v12 = v11;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  double v13 = v10;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)updateFonts
{
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_calloutLabel);
  sub_10000EC7C(0, &qword_10002C9B8);
  uint64_t v4 = qword_10002C350;
  uint64_t v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_100018650();
  sub_10000FD58(v6, (uint64_t)qword_10002D190);
  id v7 = [(ServiceOverlayLockupView *)v5 traitCollection];
  id v8 = (id)sub_1000189E0();

  [v3 setFont:v8];
}

- (id)presentingViewControllerForLockupView:(id)a3
{
  return 0;
}

- (void)lockupViewDidBeginRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100018990();
  sub_10000EA20(&qword_10002C510);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10001C9E0;
  id v7 = v5;
  id v8 = [(ServiceOverlayLockupView *)v7 description];
  uint64_t v9 = sub_100018930();
  uint64_t v11 = v10;

  *(void *)(v6 + 56) = &type metadata for String;
  *(void *)(v6 + 64) = sub_10000EC28();
  *(void *)(v6 + 32) = v9;
  *(void *)(v6 + 40) = v11;
  sub_10000EC7C(0, &qword_10002C500);
  id v12 = (id)sub_100018A10();
  sub_100018600();

  swift_bridgeObjectRelease();
}

- (void)lockupViewDidFinishRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100017750();
}

- (void)lockupView:(id)a3 didFailRequestWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_100017870();
}

- (id)metricsActivityForLockupView:(id)a3 toPerformActionOfOffer:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  id v6 = self;
  id v7 = sub_1000179F0();

  swift_unknownObjectRelease();

  return v7;
}

- (ASCViewMetrics)viewMetrics
{
  id v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_lockupView);
  objc_super v3 = self;
  id v4 = [v2 lockup];
  id v5 = [v4 metrics];

  return (ASCViewMetrics *)v5;
}

- (void)didTapOnOverlay
{
  id v2 = self;
  sub_100015BA0();
}

- (id)additionalMetricsFields
{
  id v2 = self;
  sub_1000168C4();

  v3.super.isa = sub_1000188E0().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

- (_TtC23AppStoreOverlaysService24ServiceOverlayLockupView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC23AppStoreOverlaysService24ServiceOverlayLockupView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_loadLockupPromise));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_hostSignpostSpan));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_localizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_calloutLabel));
  NSDictionary v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_separatorView);
}

- (id)lockupViewPerformAdAttributionForState:(id)a3
{
  uint64_t v5 = sub_10000EA20(&qword_10002C608);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a3;
  uint64_t v9 = self;
  sub_100016AF0((uint64_t)v7);

  uint64_t v10 = sub_100018560();
  uint64_t v11 = *(void *)(v10 - 8);
  double v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10) != 1)
  {
    sub_100018540(v12);
    double v13 = v14;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v10);
  }

  return v13;
}

@end