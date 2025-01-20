@interface MPReportFlowPresenter
- (MPReportFlowPresenter)init;
- (MPReportFlowPresenter)initWithCallReportingViewModel:(id)a3 alertPresentingViewController:(id)a4 contactsService:(id)a5;
- (void)_showCarrierVoiceCallReportAlertForCall:(id)a3;
- (void)controller:(id)a3 didCompleteClassificationRequest:(id)a4 withResponse:(id)a5;
- (void)presentBlockAllAlertFor:(id)a3;
- (void)presentBlockUnknownAlertFor:(id)a3;
- (void)presentFaceTimeSpamReportAlertFor:(id)a3;
- (void)presentFaceTimeSpamReportAndBlockAlertFor:(id)a3;
- (void)presentGroupFaceTimeSpamReportAndBlockAlertFor:(id)a3;
- (void)showReportingExtensionForCall:(id)a3;
@end

@implementation MPReportFlowPresenter

- (MPReportFlowPresenter)initWithCallReportingViewModel:(id)a3 alertPresentingViewController:(id)a4 contactsService:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (MPReportFlowPresenter *)specialized ReportFlowPresenter.init(callReportingViewModel:alertPresentingViewController:contactsService:)(v7, (uint64_t)v8, v9);

  return v10;
}

- (void)presentFaceTimeSpamReportAlertFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  ReportFlowPresenter.presentFaceTimeSpamReportAlert(for:)(v4);
}

- (void)presentBlockAllAlertFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  ReportFlowPresenter.presentBlockAllAlert(for:)(v4);
}

- (void)presentBlockUnknownAlertFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  ReportFlowPresenter.presentBlockUnknownAlert(for:)(v4);
}

- (void)presentFaceTimeSpamReportAndBlockAlertFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  ReportFlowPresenter.presentFaceTimeSpamReportAndBlockAlert(for:)(v4);
}

- (void)presentGroupFaceTimeSpamReportAndBlockAlertFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  ReportFlowPresenter.presentGroupFaceTimeSpamReportAndBlockAlert(for:)(v4);
}

- (void)showReportingExtensionForCall:(id)a3
{
  id v4 = a3;
  v5 = self;
  ReportFlowPresenter.showReportingExtension(for:)(v4);
}

- (void)_showCarrierVoiceCallReportAlertForCall:(id)a3
{
  id v4 = a3;
  v5 = self;
  ReportFlowPresenter.showCarrierVoiceCallReportAlert(for:)(v4);
}

- (MPReportFlowPresenter)init
{
  result = (MPReportFlowPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  v3 = (char *)self + OBJC_IVAR___MPReportFlowPresenter_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPReportFlowPresenter_classificationViewController);
}

- (void)controller:(id)a3 didCompleteClassificationRequest:(id)a4 withResponse:(id)a5
{
  id v27 = a5;
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v28 = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v9);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v13 - 8);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v12, (char *)self + OBJC_IVAR___MPReportFlowPresenter_logger, v9);
  type metadata accessor for MainActor();
  id v17 = a4;
  id v18 = a5;
  v19 = self;
  id v20 = v17;
  id v26 = v18;
  id v25 = a3;
  uint64_t v21 = static MainActor.shared.getter();
  unint64_t v22 = (*(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v23 = (v11 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  v24 = (char *)swift_allocObject();
  *((void *)v24 + 2) = v21;
  *((void *)v24 + 3) = &protocol witness table for MainActor;
  *((void *)v24 + 4) = v19;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v24[v22], v12, v28);
  *(void *)&v24[v23] = v20;
  *(void *)&v24[(v23 + 15) & 0xFFFFFFFFFFFFFFF8] = v27;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCytSg_Tgm5((uint64_t)v15, (uint64_t)&closure #1 in ReportFlowPresenter.controller(_:didComplete:with:)partial apply, (uint64_t)v24);

  swift_release();
}

@end