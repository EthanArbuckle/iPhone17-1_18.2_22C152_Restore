@interface SGMIBiomeReducedMessageEvents
- (BOOL)forwardDraftStarted;
- (BOOL)linkClicked;
- (BOOL)mailGotFlagged;
- (BOOL)markedAsJunk;
- (BOOL)markedAsRead;
- (BOOL)markedAsUnread;
- (BOOL)replyDraftStarted;
- (BOOL)scrolledToEnd;
- (BOOL)userReplied;
- (SGMIBiomeReducedMessageEvents)init;
- (SGMIBiomeReducedMessageEvents)initWithScrolledToEnd:(BOOL)a3 messageViewMaxDwellTime:(double)a4 messageViewTotalDwellTime:(double)a5 messageViewCount:(unsigned int)a6 timeBeforeViewStartSinceAvailable:(double)a7 numberOfMailsViewedBeforeSinceAvailable:(unsigned int)a8 userReplied:(BOOL)a9 replyDraftStarted:(BOOL)a10 forwardDraftStarted:(BOOL)a11 numberOfUnreadMessageAtFirstViewTime:(unsigned int)a12 numberOfMoreRecentUnreadMessageAtFirstViewTime:(unsigned int)a13 markedAsRead:(BOOL)a14 markedAsUnread:(BOOL)a15 markedAsJunk:(BOOL)a16 mailGotFlagged:(BOOL)a17 linkClicked:(BOOL)a18;
- (double)firstAppLaunchFollowingFetch;
- (double)messageAvailableTime;
- (double)messageFetchTime;
- (double)messageViewMaxDwellTime;
- (double)messageViewTotalDwellTime;
- (double)timeBeforeViewStartSinceAvailable;
- (unsigned)messageViewCount;
- (unsigned)numberOfMailsViewedBeforeSinceAvailable;
- (unsigned)numberOfMoreRecentUnreadMessageAtFirstViewTime;
- (unsigned)numberOfUnreadMessageAtFirstViewTime;
- (void)incrementNumberOfMailsViewedBeforeSinceAvailable;
- (void)incrementNumberOfMoreRecentUnreadMessageAtFirstViewTime;
- (void)updateWithAppLaunchAtTime:(double)a3;
- (void)updateWithEvent:(id)a3 eventTimestamp:(double)a4;
- (void)updateWithFlagChangedEvent;
- (void)updateWithMessageFetchedEventAtTime:(double)a3;
- (void)updateWithMessageMovedEventWithPayload:(id)a3;
- (void)updateWithReadChangedEventWithPayload:(id)a3;
- (void)updateWithViewEndWithPayload:(id)a3;
- (void)updateWithViewStartAtTime:(double)a3 unreadMessageCount:(unsigned int)a4;
@end

@implementation SGMIBiomeReducedMessageEvents

- (double)messageFetchTime
{
  return self->_messageFetchTime;
}

- (double)firstAppLaunchFollowingFetch
{
  return self->_firstAppLaunchFollowingFetch;
}

- (BOOL)linkClicked
{
  return self->_linkClicked;
}

- (BOOL)markedAsJunk
{
  return self->_markedAsJunk;
}

- (BOOL)forwardDraftStarted
{
  return self->_forwardDraftStarted;
}

- (BOOL)replyDraftStarted
{
  return self->_replyDraftStarted;
}

- (BOOL)mailGotFlagged
{
  return self->_mailGotFlagged;
}

- (BOOL)markedAsUnread
{
  return self->_markedAsUnread;
}

- (BOOL)markedAsRead
{
  return self->_markedAsRead;
}

- (unsigned)numberOfMoreRecentUnreadMessageAtFirstViewTime
{
  return self->_numberOfMoreRecentUnreadMessageAtFirstViewTime;
}

- (unsigned)numberOfUnreadMessageAtFirstViewTime
{
  return self->_numberOfUnreadMessageAtFirstViewTime;
}

- (double)messageViewTotalDwellTime
{
  return self->_messageViewTotalDwellTime;
}

- (double)messageViewMaxDwellTime
{
  return self->_messageViewMaxDwellTime;
}

- (unsigned)messageViewCount
{
  return self->_messageViewCount;
}

- (double)timeBeforeViewStartSinceAvailable
{
  return self->_timeBeforeViewStartSinceAvailable;
}

- (unsigned)numberOfMailsViewedBeforeSinceAvailable
{
  return self->_numberOfMailsViewedBeforeSinceAvailable;
}

- (BOOL)userReplied
{
  return self->_userReplied;
}

- (BOOL)scrolledToEnd
{
  return self->_scrolledToEnd;
}

- (void)incrementNumberOfMoreRecentUnreadMessageAtFirstViewTime
{
  if (!self->_messageViewCount) {
    ++self->_numberOfMoreRecentUnreadMessageAtFirstViewTime;
  }
}

- (void)incrementNumberOfMailsViewedBeforeSinceAvailable
{
}

- (double)messageAvailableTime
{
  double result = -1.0;
  if (self->_messageFetchTime >= 0.0)
  {
    double result = self->_firstAppLaunchFollowingFetch;
    if (result < 0.0) {
      return self->_messageFetchTime;
    }
  }
  return result;
}

- (void)updateWithEvent:(id)a3 eventTimestamp:(double)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = sgLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v16 = [v5 eventName];
    int v17 = 138412290;
    v18 = v16;
    _os_log_debug_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEBUG, "Processing event with eventName: %@", (uint8_t *)&v17, 0xCu);
  }
  v7 = [v5 eventName];
  char v8 = [v7 isEqualToString:@"reply_sent"];

  if (v8)
  {
    uint64_t v9 = 9;
LABEL_11:
    *((unsigned char *)&self->super.isa + v9) = 1;
    goto LABEL_12;
  }
  v10 = [v5 eventName];
  char v11 = [v10 isEqualToString:@"reply_draft_started"];

  if (v11)
  {
    uint64_t v9 = 13;
    goto LABEL_11;
  }
  v12 = [v5 eventName];
  char v13 = [v12 isEqualToString:@"forward_draft_started"];

  if (v13)
  {
    uint64_t v9 = 14;
    goto LABEL_11;
  }
  v14 = [v5 eventName];
  int v15 = [v14 isEqualToString:@"link_clicked"];

  if (v15)
  {
    uint64_t v9 = 16;
    goto LABEL_11;
  }
LABEL_12:
}

- (void)updateWithMessageMovedEventWithPayload:(id)a3
{
  id v7 = a3;
  v4 = [v7 objectForKeyedSubscript:@"mailbox_type"];

  id v5 = v7;
  if (v4)
  {
    v6 = [v7 objectForKeyedSubscript:@"mailbox_type"];
    if ([v6 intValue] == 1) {
      self->_markedAsJunk = 1;
    }

    id v5 = v7;
  }
}

- (void)updateWithReadChangedEventWithPayload:(id)a3
{
  id v7 = [a3 objectForKeyedSubscript:@"value"];
  if (![v7 intValue])
  {
    uint64_t v6 = 11;
    id v5 = v7;
    goto LABEL_6;
  }
  BOOL v4 = [v7 intValue] == 1;
  id v5 = v7;
  if (v4)
  {
    uint64_t v6 = 10;
LABEL_6:
    *((unsigned char *)&self->super.isa + v6) = 1;
  }
}

- (void)updateWithFlagChangedEvent
{
  self->_mailGotFlagged = 1;
}

- (void)updateWithMessageFetchedEventAtTime:(double)a3
{
  self->_messageFetchTime = a3;
}

- (void)updateWithViewEndWithPayload:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"scrolled_to_end"];

  if (v5) {
    self->_scrolledToEnd = 1;
  }
  id v9 = [v4 objectForKeyedSubscript:@"duration"];

  [v9 doubleValue];
  if (v6 > self->_messageViewMaxDwellTime)
  {
    [v9 doubleValue];
    self->_messageViewMaxDwellTime = v7;
  }
  [v9 doubleValue];
  self->_messageViewTotalDwellTime = v8 + self->_messageViewTotalDwellTime;
}

- (void)updateWithViewStartAtTime:(double)a3 unreadMessageCount:(unsigned int)a4
{
  unsigned int messageViewCount = self->_messageViewCount;
  if (!messageViewCount)
  {
    [(SGMIBiomeReducedMessageEvents *)self messageAvailableTime];
    self->_timeBeforeViewStartSinceAvailable = a3 - v8;
    self->_numberOfUnreadMessageAtFirstViewTime = a4;
    unsigned int messageViewCount = self->_messageViewCount;
  }
  self->_unsigned int messageViewCount = messageViewCount + 1;
}

- (void)updateWithAppLaunchAtTime:(double)a3
{
  if (self->_messageFetchTime > 0.0 && self->_firstAppLaunchFollowingFetch < 0.0) {
    self->_firstAppLaunchFollowingFetch = a3;
  }
}

- (SGMIBiomeReducedMessageEvents)initWithScrolledToEnd:(BOOL)a3 messageViewMaxDwellTime:(double)a4 messageViewTotalDwellTime:(double)a5 messageViewCount:(unsigned int)a6 timeBeforeViewStartSinceAvailable:(double)a7 numberOfMailsViewedBeforeSinceAvailable:(unsigned int)a8 userReplied:(BOOL)a9 replyDraftStarted:(BOOL)a10 forwardDraftStarted:(BOOL)a11 numberOfUnreadMessageAtFirstViewTime:(unsigned int)a12 numberOfMoreRecentUnreadMessageAtFirstViewTime:(unsigned int)a13 markedAsRead:(BOOL)a14 markedAsUnread:(BOOL)a15 markedAsJunk:(BOOL)a16 mailGotFlagged:(BOOL)a17 linkClicked:(BOOL)a18
{
  v33.receiver = self;
  v33.super_class = (Class)SGMIBiomeReducedMessageEvents;
  double result = [(SGMIBiomeReducedMessageEvents *)&v33 init];
  if (result)
  {
    result->_scrolledToEnd = a3;
    result->_messageViewMaxDwellTime = a4;
    result->_messageViewTotalDwellTime = a5;
    result->_timeBeforeViewStartSinceAvailable = a7;
    result->_numberOfMailsViewedBeforeSinceAvailable = a8;
    result->_unsigned int messageViewCount = a6;
    result->_userReplied = a9;
    result->_replyDraftStarted = a10;
    result->_forwardDraftStarted = a11;
    result->_numberOfUnreadMessageAtFirstViewTime = a12;
    result->_numberOfMoreRecentUnreadMessageAtFirstViewTime = a13;
    result->_markedAsRead = a14;
    result->_markedAsUnread = a15;
    result->_markedAsJunk = a16;
    result->_mailGotFlagged = a17;
    result->_linkClicked = a18;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&result->_firstAppLaunchFollowingFetch = _Q0;
  }
  return result;
}

- (SGMIBiomeReducedMessageEvents)init
{
  v8.receiver = self;
  v8.super_class = (Class)SGMIBiomeReducedMessageEvents;
  double result = [(SGMIBiomeReducedMessageEvents *)&v8 init];
  if (result)
  {
    result->_scrolledToEnd = 0;
    result->_messageViewMaxDwellTime = 0.0;
    result->_messageViewTotalDwellTime = 0.0;
    result->_timeBeforeViewStartSinceAvailable = -1.0;
    result->_numberOfMoreRecentUnreadMessageAtFirstViewTime = 0;
    *(void *)&result->_unsigned int messageViewCount = 0;
    result->_numberOfMailsViewedBeforeSinceAvailable = 0;
    *(void *)&result->_userReplied = 0;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&result->_firstAppLaunchFollowingFetch = _Q0;
  }
  return result;
}

@end