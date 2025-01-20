@interface LoggingCardCarouselViewController
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UILabel)axCardProgressLabel;
- (_TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)doneTapped:(id)a3;
- (void)respondToContentSizeChanges;
- (void)respondToHorizontalSizeClassChanges;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)viewDidLayoutSubviews;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation LoggingCardCarouselViewController

- (UILabel)axCardProgressLabel
{
  v2 = self;
  id v3 = sub_24158140C();

  return (UILabel *)v3;
}

- (_TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24158FE28();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  ObjectType = (objc_class *)swift_getObjectType();
  v14.receiver = self;
  v14.super_class = ObjectType;
  swift_unknownObjectRetain();
  v9 = self;
  -[LoggingCardCarouselViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = ObjectType;
  v13[4] = sub_241592550;
  v13[5] = v10;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 1107296256;
  v13[2] = sub_241450904;
  v13[3] = &unk_26F5775B8;
  v11 = _Block_copy(v13);
  v12 = v9;
  swift_release();
  objc_msgSend(a4, sel_animateAlongsideTransition_completion_, v11, 0);
  _Block_release(v11);
  swift_unknownObjectRelease();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_2415825B8();
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4 = self;
  sub_241582A00(a3);
}

- (void)doneTapped:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24159024C();
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_2415911D8(v7);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v4 = sub_24162BB18();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 0;
}

- (_TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  UIEdgeInsets result = (_TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_collectionView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_userPreferredUnit));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_mutableDaySummary));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_originalDaySummary));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_healthStore));
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_pinnedContentManager);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_calendarCache));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_selectedDataType));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_collectionViewFlowLayout));
  id v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_gregorianCalendar;
  uint64_t v4 = sub_24162BA08();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_mostRecentBasalBodyTemperature));
  objc_release(*(id *)((char *)&self->super._navigationItem
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_configuration));
  sub_2411CD138((uint64_t)self+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_loggingCardCarouselViewControllerDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_temperatureFormatter));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_cardProgressLabelToCollectionViewConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_collectionViewHeightAnchorConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_collectionViewToDateLabelConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_containerViewCenterYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_doneButtonWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_backgroundBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController____lazy_storage___dateLabelBackgroundVibrancyView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController____lazy_storage___dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController____lazy_storage___cardProgressLabelBackgroundVibrancyView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController____lazy_storage___cardProgressLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_doneButtonBackgroundVibrancyView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController____lazy_storage___doneButton));
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController____lazy_storage___doneLabel);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  int64_t v7 = sub_241591328();

  return v7;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_24162BB18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  id v10 = a3;
  double v11 = self;
  double v12 = (void *)sub_241587E0C(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_collectionView);
  if (v3)
  {
    id v5 = a3;
    uint64_t v8 = self;
    objc_msgSend(v3, sel_contentOffset);
    uint64_t v6 = (char *)v8
       + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LoggingCardCarouselViewController_contentOffsetXBeforeDragging;
    *(void *)uint64_t v6 = v7;
    v6[8] = 0;
  }
  else
  {
    __break(1u);
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x = a4.x;
  id v8 = a3;
  uint64_t v9 = self;
  sub_241591428(&a5->x, x);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_241591D68(a4);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_241591EFC();
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_241592088();
}

- (void)respondToHorizontalSizeClassChanges
{
  v2 = self;
  sub_241588C94();
}

- (void)respondToContentSizeChanges
{
  v2 = self;
  sub_241582128();
  sub_241582368();
}

@end