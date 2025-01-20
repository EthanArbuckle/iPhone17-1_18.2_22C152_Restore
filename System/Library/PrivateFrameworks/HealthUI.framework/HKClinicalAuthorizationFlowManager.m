@interface HKClinicalAuthorizationFlowManager
+ (id)tableViewHeaderIcon;
- (HKClinicalAuthorizationFlowManager)init;
- (HKClinicalAuthorizationFlowManager)initWithHealthStore:(id)a3 healthRecordsStore:(id)a4;
- (id)createInitialViewControllerWithContext:(id)a3 delegate:(id)a4;
- (void)healthRecordsStore:(id)a3 observedAccountsEvent:(unint64_t)a4;
- (void)registerIngestionStatusObserver:(id)a3;
- (void)removeIngestionStatusObserver:(id)a3;
@end

@implementation HKClinicalAuthorizationFlowManager

- (HKClinicalAuthorizationFlowManager)initWithHealthStore:(id)a3 healthRecordsStore:(id)a4
{
  return (HKClinicalAuthorizationFlowManager *)sub_1E0E0CE8C(a3, a4);
}

+ (id)tableViewHeaderIcon
{
  return 0;
}

- (void)registerIngestionStatusObserver:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1E0E0D6AC((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (void)removeIngestionStatusObserver:(id)a3
{
}

- (id)createInitialViewControllerWithContext:(id)a3 delegate:(id)a4
{
  id v7 = objc_allocWithZone((Class)type metadata accessor for ClinicalAuthorizationAccountsOverviewViewController());
  id v8 = a3;
  swift_unknownObjectRetain_n();
  id v9 = v8;
  v10 = self;
  sub_1E0E90F08((uint64_t)a4, v9);
  v12 = v11;
  id v13 = objc_allocWithZone((Class)type metadata accessor for ClinicalAuthorizationAccountsIntroViewController());
  uint64_t v14 = swift_unknownObjectRetain();
  sub_1E0E48F0C(v14, v12);
  v16 = v15;

  swift_unknownObjectRelease();
  return v16;
}

- (void)healthRecordsStore:(id)a3 observedAccountsEvent:(unint64_t)a4
{
  id v6 = a3;
  id v7 = self;
  sub_1E0E0DB00(a4);
}

- (HKClinicalAuthorizationFlowManager)init
{
  result = (HKClinicalAuthorizationFlowManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___HKClinicalAuthorizationFlowManager_ingestionObserverSet);
}

@end