@interface BDSWidgetTimelineController
- (BDSWidgetTimelineController)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4;
- (BUCoalescingCallBlock)coalescingBlock;
- (CHSTimelineController)timelineController;
- (void)reloadTimeline;
- (void)setCoalescingBlock:(id)a3;
- (void)setTimelineController:(id)a3;
@end

@implementation BDSWidgetTimelineController

- (BDSWidgetTimelineController)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)BDSWidgetTimelineController;
  v8 = [(BDSWidgetTimelineController *)&v21 init];
  if (v8)
  {
    objc_initWeak(&location, v8);
    v9 = (CHSTimelineController *)[objc_alloc((Class)CHSTimelineController) initWithExtensionBundleIdentifier:v6 kind:v7];
    timelineController = v8->_timelineController;
    v8->_timelineController = v9;

    id v11 = objc_alloc((Class)BUCoalescingCallBlock);
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    v17 = sub_100018490;
    v18 = &unk_10025FC90;
    objc_copyWeak(&v19, &location);
    v12 = (BUCoalescingCallBlock *)[v11 initWithNotifyBlock:&v15 blockDescription:@"BDSWidgetTimelineController Timeline Reload"];
    coalescingBlock = v8->_coalescingBlock;
    v8->_coalescingBlock = v12;

    -[BUCoalescingCallBlock setCoalescingDelay:](v8->_coalescingBlock, "setCoalescingDelay:", 2.0, v15, v16, v17, v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)reloadTimeline
{
  v3 = [[BDSOSTransaction alloc] initWithTransactionName:"com.apple.bookdatastored.BDSWidgetTimelineController.reloadTimelines"];
  v4 = [(BDSWidgetTimelineController *)self coalescingBlock];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100018660;
  v6[3] = &unk_10025F700;
  id v7 = v3;
  v5 = v3;
  [v4 signalWithCompletion:v6];
}

- (BUCoalescingCallBlock)coalescingBlock
{
  return self->_coalescingBlock;
}

- (void)setCoalescingBlock:(id)a3
{
}

- (CHSTimelineController)timelineController
{
  return self->_timelineController;
}

- (void)setTimelineController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineController, 0);
  objc_storeStrong((id *)&self->_coalescingBlock, 0);
}

@end