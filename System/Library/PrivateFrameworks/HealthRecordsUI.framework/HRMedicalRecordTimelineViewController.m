@interface HRMedicalRecordTimelineViewController
- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (HRMedicalRecordTimelineViewController)initWithCoder:(id)a3;
- (HRMedicalRecordTimelineViewController)initWithCollectionViewLayout:(id)a3;
- (HRMedicalRecordTimelineViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (HRMedicalRecordTimelineViewController)initWithProfile:(id)a3 accountId:(id)a4;
- (NSString)sidebarSelectionIdentifier;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)clinicalIngestionStore:(id)a3 ingestionStateDidUpdateTo:(int64_t)a4;
- (void)cloudSyncObserver:(id)a3 syncDidStartWithProgress:(id)a4;
- (void)cloudSyncObserver:(id)a3 syncFailedWithError:(id)a4;
- (void)cloudSyncObserverSyncCompleted:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)configureDisplayTypes:(id)a3 timeScope:(int64_t)a4 stackOffset:(int64_t)a5;
- (void)dealloc;
- (void)didTapExportPDFButton;
- (void)didUpdateSeriesWithNewValueRange:(id)a3;
- (void)didUpdateVisibleValueRange:(id)a3 changeContext:(int64_t)a4;
- (void)fetchMoreData;
- (void)reloadData;
- (void)reloadDataWithDelay:(double)a3;
- (void)reloadDataWithNotification:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)tapToRadarWithSender:(id)a3;
- (void)updateSystemStatusView;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation HRMedicalRecordTimelineViewController

- (NSString)sidebarSelectionIdentifier
{
  v2 = self;
  sub_1C21F45D8();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1C254F430();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (HRMedicalRecordTimelineViewController)initWithProfile:(id)a3 accountId:(id)a4
{
  id v20 = a3;
  sub_1C21AB558(0, (unint64_t *)&qword_1EA2DEFF0, MEMORY[0x1E4F27990], MEMORY[0x1E4FBB718]);
  uint64_t v5 = MEMORY[0x1F4188790](v4 - 8);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  v9 = (char *)&v19 - v8;
  uint64_t v10 = sub_1C254CB40();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C254CB20();
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v9, v13, v10);
  v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  v15(v9, 0, 1, v10);
  v15(v7, 1, 1, v10);
  char v18 = 1;
  v16 = (HRMedicalRecordTimelineViewController *)(*(uint64_t (**)(id, void, char *, void, void, char *, void, void, void, char))(ObjectType + 960))(v20, 0, v9, 0, 0, v7, 0, 0, 0, v18);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  swift_deallocPartialClassInstance();
  return v16;
}

- (HRMedicalRecordTimelineViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C21FE544();
}

- (void)dealloc
{
  v2 = self;
  sub_1C21F8D2C();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for MedicalRecordTimelineViewController();
  [(HRMedicalRecordTimelineViewController *)&v3 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRMedicalRecordTimelineViewController_displayItemProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRMedicalRecordTimelineViewController_profile));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRMedicalRecordTimelineViewController_category));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRMedicalRecordTimelineViewController_account));
  sub_1C22001C4((uint64_t)self + OBJC_IVAR___HRMedicalRecordTimelineViewController_accountId, (uint64_t)&qword_1EA2DEFF0, MEMORY[0x1E4F27990], MEMORY[0x1E4FBB718], (uint64_t (*)(void))sub_1C21AB558);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRMedicalRecordTimelineViewController_conceptIdentifier));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRMedicalRecordTimelineViewController_ontologyConcept));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRMedicalRecordTimelineViewController_userDomainConcept));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_super v3 = *(FBSSceneIdentityToken **)((char *)&self->super.super.super.__layeringSceneIdentity
                                 + OBJC_IVAR___HRMedicalRecordTimelineViewController_displayState);
  uint64_t v4 = *(UIViewControllerTransitioningDelegate **)((char *)&self->super.super._overrideTransitioningDelegate
                                                 + OBJC_IVAR___HRMedicalRecordTimelineViewController_displayState);
  objc_release(*(id *)((char *)&self->super.super.super._responderFlags
                     + OBJC_IVAR___HRMedicalRecordTimelineViewController_displayState));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRMedicalRecordTimelineViewController____lazy_storage___contentStatusView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRMedicalRecordTimelineViewController____lazy_storage___clinicalAccountStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRMedicalRecordTimelineViewController____lazy_storage___dataProvider));
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRMedicalRecordTimelineViewController_cloudSyncObserver));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRMedicalRecordTimelineViewController_gradientView));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR___HRMedicalRecordTimelineViewController_gradientColorProvider);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C21F5E7C();
}

- (void)viewIsAppearing:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1C21F6A54(a3);
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MedicalRecordTimelineViewController();
  v2 = v5.receiver;
  [(HRMedicalRecordTimelineViewController *)&v5 viewWillLayoutSubviews];
  if (v2[OBJC_IVAR___HRMedicalRecordTimelineViewController_showGradientBackgroundForAllRecordsRoom] != 1) {
    goto LABEL_4;
  }
  id v3 = objc_msgSend(v2, sel_collectionView, v5.receiver, v5.super_class);
  if (v3)
  {
    uint64_t v4 = v3;
    objc_msgSend(v3, sel_contentOffset);

    sub_1C2200960(&qword_1EA2DE1D0, (void (*)(uint64_t))type metadata accessor for MedicalRecordTimelineViewController);
    sub_1C254DD40();
LABEL_4:

    return;
  }
  __break(1u);
}

- (void)updateSystemStatusView
{
  v2 = self;
  sub_1C21F91D8(0);
}

- (void)fetchMoreData
{
  v2 = self;
  sub_1C21F8F24();
}

- (void)didTapExportPDFButton
{
  v2 = self;
  sub_1C21F98B0();
}

- (void)tapToRadarWithSender:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  sub_1C25501E0();
  swift_unknownObjectRelease();
  type metadata accessor for TapToRadarManager();
  static TapToRadarManager.presentTapToRadarDialogue(from:)(v4);

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v5);
}

- (void)reloadDataWithDelay:(double)a3
{
  uint64_t v5 = self;
  uint64_t v6 = self;
  objc_msgSend(v5, sel_cancelPreviousPerformRequestsWithTarget_selector_object_, v6, sel_reloadData, 0);
  [(HRMedicalRecordTimelineViewController *)v6 performSelector:sel_reloadData withObject:0 afterDelay:a3];
}

- (void)reloadDataWithNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1C21F9F3C(v4);
}

- (void)reloadData
{
  v2 = self;
  sub_1C21F3CF4();
  swift_retain();
  swift_release();
  sub_1C254EA80();
  swift_release();
  objc_msgSend(v3, sel_reload);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v15 = self;
  objc_msgSend(v4, sel_contentOffset);
  double v6 = v5;
  objc_msgSend(v4, sel_contentSize);
  double v8 = v7;
  objc_msgSend(v4, sel_frame);
  CGFloat x = v17.origin.x;
  CGFloat y = v17.origin.y;
  CGFloat width = v17.size.width;
  CGFloat height = v17.size.height;
  CGFloat v13 = v8 - (v6 + CGRectGetHeight(v17));
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGFloat v14 = CGRectGetHeight(v18);
  if (v13 < v14 + v14) {
    sub_1C21F8F24();
  }
}

- (HRMedicalRecordTimelineViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (HRMedicalRecordTimelineViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (HRMedicalRecordTimelineViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (HRMedicalRecordTimelineViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)didUpdateVisibleValueRange:(id)a3 changeContext:(int64_t)a4
{
  if (a4 == 1)
  {
    id v6 = a3;
    double v7 = self;
    sub_1C21FCB18(3, 18);
  }
}

- (void)didUpdateSeriesWithNewValueRange:(id)a3
{
  if (!a3)
  {
    if (*((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR___HRMedicalRecordTimelineViewController_chartLoaded))
    {
      id v3 = self;
      sub_1C21FCB18(3, 18);
    }
    else
    {
      *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR___HRMedicalRecordTimelineViewController_chartLoaded) = 1;
    }
  }
}

- (void)configureDisplayTypes:(id)a3 timeScope:(int64_t)a4 stackOffset:(int64_t)a5
{
  double v5 = self;
  sub_1C21FCB18(3, 18);
}

- (void)clinicalIngestionStore:(id)a3 ingestionStateDidUpdateTo:(int64_t)a4
{
  id v6 = a3;
  double v7 = self;
  sub_1C21FE930(a4);
}

- (void)cloudSyncObserver:(id)a3 syncDidStartWithProgress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  sub_1C21FEC1C(v7);
}

- (void)cloudSyncObserver:(id)a3 syncFailedWithError:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  sub_1C21FEF0C((uint64_t)&unk_1F1D8FE48, (uint64_t)sub_1C22009DC, (uint64_t)&block_descriptor_119);
}

- (void)cloudSyncObserverSyncCompleted:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1C21FEF0C((uint64_t)&unk_1F1D8FDF8, (uint64_t)sub_1C2200314, (uint64_t)&block_descriptor_113);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1C21F3F98();
  sub_1C254DCE0();
  int64_t v6 = sub_1C254D6A0();

  swift_release();
  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = a3;
  int64_t v6 = self;
  sub_1C21F3F98();
  sub_1C254DCE0();
  int64_t v7 = sub_1C254D680();

  swift_release();
  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C254CD90();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C254CD40();
  id v10 = a3;
  uint64_t v11 = self;
  id v12 = MedicalRecordTimelineViewController.collectionView(_:cellForItemAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return sub_1C22F5A84(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(id, char *))MedicalRecordTimelineViewController.collectionView(_:shouldSelectItemAt:));
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return sub_1C22F5A84(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(id, char *))MedicalRecordTimelineViewController.collectionView(_:shouldHighlightItemAt:));
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C254CD90();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C254CD40();
  id v10 = a3;
  uint64_t v11 = self;
  MedicalRecordTimelineViewController.collectionView(_:didSelectItemAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v7 = sub_1C254CD90();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  id v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C254CD40();
  id v11 = a3;
  uint64_t v12 = self;
  CGFloat v13 = (void *)_s15HealthRecordsUI35MedicalRecordTimelineViewControllerC010collectionG0_33contextMenuConfigurationForItemAt5pointSo09UIContextkL0CSgSo012UICollectionG0C_10Foundation9IndexPathVSo7CGPointVtF_0(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4
{
  return sub_1C22F5A84(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(id, char *))MedicalRecordTimelineViewController.collectionView(_:selectionFollowsFocusForItemAt:));
}

@end