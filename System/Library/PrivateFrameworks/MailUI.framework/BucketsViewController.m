@interface BucketsViewController
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtC6MailUI21BucketsViewController)initWithCoder:(id)a3;
- (_TtC6MailUI21BucketsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)preferredHeight;
- (id)lastSeenDatesForBucket:(int64_t)a3;
- (void)clearSessionState;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)didRecognizeSwipeGesture:(id)a3;
- (void)setlastSeenDates:(id)a3 forBucket:(int64_t)a4;
- (void)updateLastSeenDates:(id)a3 forMailboxes:(id)a4 bucket:(int64_t)a5;
- (void)updateWithMailboxes:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewLayoutMarginsDidChange;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BucketsViewController

- (double)preferredHeight
{
  v2 = self;
  double v5 = BucketsViewController.preferredHeight.getter();

  return v5;
}

- (_TtC6MailUI21BucketsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  BucketsViewController.init(coder:)();
}

- (void)dealloc
{
  v2 = self;
  BucketsViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_1DDD31B20((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI21BucketsViewController_lastSeenBucketHelper));
  sub_1DDD31B20((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI21BucketsViewController_collectionView));
  sub_1DDD31B20((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI21BucketsViewController_collectionViewLayout));
  sub_1DDD31CE0();
  sub_1DDD78F4C((uint64_t)self + OBJC_IVAR____TtC6MailUI21BucketsViewController_cellRegistration);
  sub_1DDD5C558();
  sub_1DDD5C558();
  sub_1DDD5C558();
  sub_1DDD5C558();
  swift_release();
  sub_1DDD31CE0();
  sub_1DDD31CE0();
  sub_1DDD31B20((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI21BucketsViewController_addAllMailSwipeGestureRecognizer));
  sub_1DDD31B20((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI21BucketsViewController_removeAllMailSwipeGestureRecognizer));
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  BucketsViewController.viewDidLayoutSubviews()();
}

- (void)viewLayoutMarginsDidChange
{
  v2 = self;
  BucketsViewController.viewLayoutMarginsDidChange()();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  swift_unknownObjectRetain();
  double v5 = self;
  BucketsViewController.viewWillTransition(to:with:)(a4, a3.width, a3.height);

  swift_unknownObjectRelease();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3 = self;
  char v4 = sub_1DDEECF58();
  BucketsViewController.viewDidAppear(_:)(v4 & 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v3 = self;
  char v4 = sub_1DDEECF58();
  BucketsViewController.viewDidDisappear(_:)(v4 & 1);
}

- (void)updateWithMailboxes:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1DDD79318();
  uint64_t v6 = sub_1DDEEEDA8();
  BucketsViewController.update(mailboxes:)((Swift::OpaquePointer)v6);
  swift_bridgeObjectRelease();
}

- (_TtC6MailUI21BucketsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a3;
  id v5 = a4;
  if (a3)
  {
    sub_1DDEEEB78();
  }
  return (_TtC6MailUI21BucketsViewController *)BucketsViewController.init(nibName:bundle:)();
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  v14 = self;
  id v15 = a3;
  id v13 = a4;
  uint64_t v12 = sub_1DDEECF38();
  uint64_t v9 = *(void *)(v12 - 8);
  uint64_t v10 = v12 - 8;
  unint64_t v8 = (*(void *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v11 = (uint64_t)&v8 - v8;
  id v5 = (id)MEMORY[0x1F4188790](v15);
  id v6 = v13;
  v7 = self;
  sub_1DDEECEE8();
  BucketsViewController.collectionView(_:didSelectItemAt:)((uint64_t)v15, v11);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v11, v12);
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  v14 = self;
  id v15 = a3;
  id v13 = a4;
  uint64_t v12 = sub_1DDEECF38();
  uint64_t v9 = *(void *)(v12 - 8);
  uint64_t v10 = v12 - 8;
  unint64_t v8 = (*(void *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v11 = (uint64_t)&v8 - v8;
  id v5 = (id)MEMORY[0x1F4188790](v15);
  id v6 = v13;
  v7 = self;
  sub_1DDEECEE8();
  BucketsViewController.collectionView(_:didDeselectItemAt:)((uint64_t)v15, v11);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v11, v12);
}

- (void)didRecognizeSwipeGesture:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1DDD7741C(a3);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = self;
  BucketsViewController.gestureRecognizerShouldBegin(_:)((UIGestureRecognizer)a3);

  return sub_1DDEECF48() & 1;
}

- (id)lastSeenDatesForBucket:(int64_t)a3
{
  id v3 = self;
  id v7 = BucketsViewController.lastSeenDates(for:)(a3);

  return v7;
}

- (void)setlastSeenDates:(id)a3 forBucket:(int64_t)a4
{
  id v5 = a3;
  id v6 = self;
  BucketsViewController.setlastSeenDates(_:for:)(a3, a4);
}

- (void)clearSessionState
{
  v2 = self;
  BucketsViewController.clearState()();
}

- (void)updateLastSeenDates:(id)a3 forMailboxes:(id)a4 bucket:(int64_t)a5
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = self;
  sub_1DDD79318();
  uint64_t v10 = sub_1DDEEEDA8();
  BucketsViewController.updateLastSeenDates(_:forMailboxes:bucket:)(a3, v10, a5);
  swift_bridgeObjectRelease();
}

@end