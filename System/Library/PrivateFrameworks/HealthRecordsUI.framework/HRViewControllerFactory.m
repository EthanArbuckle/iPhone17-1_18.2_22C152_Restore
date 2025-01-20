@interface HRViewControllerFactory
+ (HRViewControllerFactory)shared;
- (HRViewControllerFactory)init;
- (id)makeAccountDetailViewControllerForAccount:(id)a3 profile:(id)a4 sourceIdentifier:(id)a5;
- (id)makeAlphabeticalViewControllerForCategory:(id)a3 usingProfile:(id)a4;
- (id)makeDetailViewControllerForRecord:(id)a3 usingProfile:(id)a4;
- (id)makeFailedToOnboardAccountAlertControllerToGateway:(id)a3 error:(id)a4;
- (id)makeImproveHealthRecordsPrivacyPresenter;
- (id)makeOutOfRangeLabsViewControllerUsingProfile:(id)a3;
- (id)makeTimelineViewControllerForCategory:(id)a3 showsInitialSearchBar:(BOOL)a4 usingProfile:(id)a5 filterPredicatesByType:(id)a6;
- (id)makeViewControllerForCategory:(id)a3 usingProfile:(id)a4;
- (id)makeViewControllerForRecord:(id)a3 usingProfile:(id)a4;
- (void)makeAndPresentOnboardingTileViewControllerFor:(id)a3 from:(id)a4 sourceIdentifier:(id)a5 animated:(BOOL)a6 completion:(id)a7;
@end

@implementation HRViewControllerFactory

+ (HRViewControllerFactory)shared
{
  if (qword_1EBB6D858 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EBB6ED30;
  return (HRViewControllerFactory *)v2;
}

- (void)makeAndPresentOnboardingTileViewControllerFor:(id)a3 from:(id)a4 sourceIdentifier:(id)a5 animated:(BOOL)a6 completion:(id)a7
{
  v12 = (uint64_t (*)())_Block_copy(a7);
  v13 = v12;
  if (a5)
  {
    uint64_t v14 = sub_1C254F470();
    a5 = v15;
    if (v13)
    {
LABEL_3:
      uint64_t v16 = swift_allocObject();
      *(void *)(v16 + 16) = v13;
      v13 = sub_1C22989C4;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v14 = 0;
    if (v12) {
      goto LABEL_3;
    }
  }
  uint64_t v16 = 0;
LABEL_6:
  id v17 = a3;
  id v18 = a4;
  v19 = self;
  sub_1C24541F0(v17, v18, v14, (uint64_t)a5, a6, (uint64_t)v13, v16);
  sub_1C221794C((uint64_t)v13);

  swift_bridgeObjectRelease();
}

- (id)makeAccountDetailViewControllerForAccount:(id)a3 profile:(id)a4 sourceIdentifier:(id)a5
{
  if (a5)
  {
    uint64_t v7 = sub_1C254F470();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  char v12 = 0;
  objc_allocWithZone((Class)type metadata accessor for ClinicalAccountDetailsViewController());
  v10 = sub_1C242E68C(a3, a4, &v12, v7, v9);
  return v10;
}

- (id)makeFailedToOnboardAccountAlertControllerToGateway:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  id v10 = sub_1C2453138(a3, v8);

  return v10;
}

- (id)makeViewControllerForRecord:(id)a3 usingProfile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = sub_1C2452890(v6, v7);

  return v9;
}

- (id)makeDetailViewControllerForRecord:(id)a3 usingProfile:(id)a4
{
  uint64_t v7 = type metadata accessor for PresentationContext(0);
  MEMORY[0x1F4188790](v7 - 8);
  id v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  char v12 = (char *)&v20 - v11;
  uint64_t v13 = sub_1C254CB40();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  sub_1C2454530((uint64_t)v12, (uint64_t)v9, type metadata accessor for PresentationContext);
  objc_allocWithZone((Class)type metadata accessor for MedicalRecordDetailViewController(0));
  id v14 = a3;
  id v15 = a4;
  uint64_t v16 = self;
  id v17 = sub_1C24CD370(v14, v15, (uint64_t)v9);
  id v18 = objc_msgSend(v17, sel_navigationItem);
  objc_msgSend(v18, sel_setLargeTitleDisplayMode_, 2);

  sub_1C242B58C((uint64_t)v12, type metadata accessor for PresentationContext);
  return v17;
}

- (HRViewControllerFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ViewControllerFactory();
  return [(HRViewControllerFactory *)&v3 init];
}

- (id)makeViewControllerForCategory:(id)a3 usingProfile:(id)a4
{
  id v6 = (WDMedicalRecordCategory *)a3;
  uint64_t v7 = (HRProfile *)a4;
  uint64_t v8 = self;
  ViewControllerFactory.makeViewController(for:using:)(v9, v6, v7);
  uint64_t v11 = v10;

  return v11;
}

- (id)makeTimelineViewControllerForCategory:(id)a3 showsInitialSearchBar:(BOOL)a4 usingProfile:(id)a5 filterPredicatesByType:(id)a6
{
  sub_1C21AB7F4(0, (unint64_t *)&qword_1EA2DEFF0, MEMORY[0x1E4F27990], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  id v14 = (char *)&v21 - v13;
  if (a6)
  {
    sub_1C21AB51C(0, &qword_1EBB6FF78);
    sub_1C21AB51C(0, (unint64_t *)&qword_1EBB6FF60);
    sub_1C21AB970();
    a6 = (id)sub_1C254F2D0();
  }
  uint64_t v15 = sub_1C254CB40();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  v16(v14, 1, 1, v15);
  v16(v11, 1, 1, v15);
  objc_allocWithZone((Class)type metadata accessor for MedicalRecordTimelineViewController());
  id v17 = a3;
  id v18 = a5;
  v19 = sub_1C21FDDB8(v18, a3, (uint64_t)v14, 0, 0, (uint64_t)v11, 0, (unsigned int (*)(uint64_t, uint64_t, uint64_t))a6, 0);

  return v19;
}

- (id)makeAlphabeticalViewControllerForCategory:(id)a3 usingProfile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1C21AA50C(v6, (uint64_t)v17);
  v12[0] = v17[0];
  v12[1] = v18;
  long long v13 = v19;
  uint64_t v14 = v20;
  long long v15 = v21;
  long long v16 = v22;
  objc_allocWithZone((Class)type metadata accessor for ConceptListViewController());
  id v9 = v7;
  id v10 = sub_1C24FB44C(v12, v9);

  return v10;
}

- (id)makeOutOfRangeLabsViewControllerUsingProfile:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s15HealthRecordsUI21ViewControllerFactoryC018makeOutOfRangeLabsdE05usingSo06UIViewE0CSo9HRProfileC_tF_0(v4);
  id v7 = v6;

  return v7;
}

- (id)makeImproveHealthRecordsPrivacyPresenter
{
  v2 = self;
  objc_super v3 = (void *)sub_1C254F430();
  id v4 = objc_msgSend(self, sel_presenterForPrivacySplashWithIdentifier_, v3);

  if (v4)
  {

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

@end