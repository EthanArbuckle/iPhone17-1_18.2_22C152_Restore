@interface SSSScreenshotGroupImageIdentifierUpdateTracker
- (BOOL)successful;
- (SSSScreenshotGroupImageIdentifierUpdateTracker)init;
- (SSSScreenshotGroupImageIdentifierUpdateTrackerDelegate)delegate;
- (double)progressTowardsReceivingAllImageIdentifierUpdates;
- (void)_progressChanged;
- (void)addScreenshotToGroup:(id)a3;
- (void)screenshotReceivedImageIdentifierUpdate:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SSSScreenshotGroupImageIdentifierUpdateTracker

- (void)addScreenshotToGroup:(id)a3
{
  environmentDescriptionIdentifierForScreenshotsAwaitingImageIdentifierUpdates = self->_environmentDescriptionIdentifierForScreenshotsAwaitingImageIdentifierUpdates;
  ++self->_totalScreenshotsInGroup;
  v5 = [a3 environmentDescription];
  v6 = [v5 identifier];
  [(NSMutableArray *)environmentDescriptionIdentifierForScreenshotsAwaitingImageIdentifierUpdates addObject:v6];

  [(SSSScreenshotGroupImageIdentifierUpdateTracker *)self _progressChanged];
}

- (void)screenshotReceivedImageIdentifierUpdate:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];

  if (v5) {
    ++self->_totalValidScreenshotsInGroup;
  }
  environmentDescriptionIdentifierForScreenshotsAwaitingImageIdentifierUpdates = self->_environmentDescriptionIdentifierForScreenshotsAwaitingImageIdentifierUpdates;
  v7 = [v4 environmentDescription];
  v8 = [v7 identifier];
  [(NSMutableArray *)environmentDescriptionIdentifierForScreenshotsAwaitingImageIdentifierUpdates removeObject:v8];

  [(SSSScreenshotGroupImageIdentifierUpdateTracker *)self _progressChanged];
  id v10 = [(SSSScreenshotGroupImageIdentifierUpdateTracker *)self delegate];
  v9 = [v4 identifier];

  [v10 groupImageIdentifierUpdateTrackerDidReceiveNewScreenshotIdentifier:v9];
}

- (void)_progressChanged
{
  id v3 = [(SSSScreenshotGroupImageIdentifierUpdateTracker *)self delegate];
  [v3 groupImageIdentifierUpdateTrackerChangedProgressTowardsReceivingAllImageIdentifierUpdates:self];
}

- (double)progressTowardsReceivingAllImageIdentifierUpdates
{
  double totalScreenshotsInGroup = (double)self->_totalScreenshotsInGroup;
  return (totalScreenshotsInGroup
        - (double)(unint64_t)[(NSMutableArray *)self->_environmentDescriptionIdentifierForScreenshotsAwaitingImageIdentifierUpdates count])/ totalScreenshotsInGroup;
}

- (BOOL)successful
{
  int64_t totalScreenshotsInGroup = self->_totalScreenshotsInGroup;
  int64_t totalValidScreenshotsInGroup = self->_totalValidScreenshotsInGroup;
  if (totalValidScreenshotsInGroup > totalScreenshotsInGroup)
  {
    v5 = os_log_create("com.apple.screenshotservices", "ShareSheet");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10005F5B8(v5);
    }

    int64_t totalScreenshotsInGroup = self->_totalScreenshotsInGroup;
    int64_t totalValidScreenshotsInGroup = self->_totalValidScreenshotsInGroup;
  }
  return totalValidScreenshotsInGroup >= totalScreenshotsInGroup;
}

- (SSSScreenshotGroupImageIdentifierUpdateTracker)init
{
  v6.receiver = self;
  v6.super_class = (Class)SSSScreenshotGroupImageIdentifierUpdateTracker;
  v2 = [(SSSScreenshotGroupImageIdentifierUpdateTracker *)&v6 init];
  uint64_t v3 = +[NSMutableArray array];
  environmentDescriptionIdentifierForScreenshotsAwaitingImageIdentifierUpdates = v2->_environmentDescriptionIdentifierForScreenshotsAwaitingImageIdentifierUpdates;
  v2->_environmentDescriptionIdentifierForScreenshotsAwaitingImageIdentifierUpdates = (NSMutableArray *)v3;

  return v2;
}

- (SSSScreenshotGroupImageIdentifierUpdateTrackerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SSSScreenshotGroupImageIdentifierUpdateTrackerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_environmentDescriptionIdentifierForScreenshotsAwaitingImageIdentifierUpdates, 0);
}

@end