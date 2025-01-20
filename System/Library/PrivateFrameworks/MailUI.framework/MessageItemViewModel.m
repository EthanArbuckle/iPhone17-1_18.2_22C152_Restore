@interface MessageItemViewModel
- (BOOL)hasAttachments;
- (BOOL)isBlockedSender;
- (BOOL)isFlagged;
- (BOOL)isForwarded;
- (BOOL)isJunk;
- (BOOL)isMute;
- (BOOL)isNotify;
- (BOOL)isRead;
- (BOOL)isRedirected;
- (BOOL)isReplied;
- (BOOL)isUnscreenedSender;
- (BOOL)isVIP;
- (EMFollowUp)followUp;
- (MessageItemViewModel)initWithItemBuilder:(id)a3;
- (NSDate)date;
- (NSDate)displayDate;
- (NSDate)readLaterDate;
- (NSDate)sendLaterDate;
- (NSIndexSet)flagColors;
- (int64_t)unsubscribeType;
- (void)setBlockedSender:(BOOL)a3;
- (void)setDate:(id)a3;
- (void)setDisplayDate:(id)a3;
- (void)setFlagColors:(id)a3;
- (void)setFlagged:(BOOL)a3;
- (void)setFollowUp:(id)a3;
- (void)setForwarded:(BOOL)a3;
- (void)setHasAttachments:(BOOL)a3;
- (void)setJunk:(BOOL)a3;
- (void)setMute:(BOOL)a3;
- (void)setNotify:(BOOL)a3;
- (void)setRead:(BOOL)a3;
- (void)setReadLaterDate:(id)a3;
- (void)setRedirected:(BOOL)a3;
- (void)setReplied:(BOOL)a3;
- (void)setSendLaterDate:(id)a3;
- (void)setUnscreenedSender:(BOOL)a3;
- (void)setUnsubscribeType:(int64_t)a3;
- (void)setVIP:(BOOL)a3;
@end

@implementation MessageItemViewModel

- (NSDate)sendLaterDate
{
  return self->_sendLaterDate;
}

- (EMFollowUp)followUp
{
  return self->_followUp;
}

- (NSDate)readLaterDate
{
  return self->_readLaterDate;
}

- (BOOL)isVIP
{
  return self->_VIP;
}

- (BOOL)isReplied
{
  return self->_replied;
}

- (BOOL)isRead
{
  return self->_read;
}

- (BOOL)isNotify
{
  return self->_notify;
}

- (BOOL)isMute
{
  return self->_mute;
}

- (BOOL)isForwarded
{
  return self->_forwarded;
}

- (BOOL)isFlagged
{
  return self->_flagged;
}

- (BOOL)isBlockedSender
{
  return self->_blockedSender;
}

- (BOOL)hasAttachments
{
  return self->_hasAttachments;
}

- (NSIndexSet)flagColors
{
  return self->_flagColors;
}

- (NSDate)displayDate
{
  return self->_displayDate;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setVIP:(BOOL)a3
{
  self->_VIP = a3;
}

- (void)setUnsubscribeType:(int64_t)a3
{
  self->_unsubscribeType = a3;
}

- (void)setSendLaterDate:(id)a3
{
}

- (void)setReplied:(BOOL)a3
{
  self->_replied = a3;
}

- (void)setRedirected:(BOOL)a3
{
  self->_redirected = a3;
}

- (void)setReadLaterDate:(id)a3
{
}

- (void)setRead:(BOOL)a3
{
  self->_read = a3;
}

- (void)setNotify:(BOOL)a3
{
  self->_notify = a3;
}

- (void)setMute:(BOOL)a3
{
  self->_mute = a3;
}

- (void)setJunk:(BOOL)a3
{
  self->_junk = a3;
}

- (void)setHasAttachments:(BOOL)a3
{
  self->_hasAttachments = a3;
}

- (void)setForwarded:(BOOL)a3
{
  self->_forwarded = a3;
}

- (void)setFollowUp:(id)a3
{
}

- (void)setFlagged:(BOOL)a3
{
  self->_flagged = a3;
}

- (void)setFlagColors:(id)a3
{
}

- (void)setDisplayDate:(id)a3
{
}

- (void)setDate:(id)a3
{
}

- (void)setBlockedSender:(BOOL)a3
{
  self->_blockedSender = a3;
}

- (MessageItemViewModel)initWithItemBuilder:(id)a3
{
  v5 = (void (**)(id, MessageItemViewModel *))a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"MessageItemViewModel.m", 37, @"Invalid parameter not satisfying: %@", @"builderBlock" object file lineNumber description];
  }
  v9.receiver = self;
  v9.super_class = (Class)MessageItemViewModel;
  v6 = [(MessageItemViewModel *)&v9 init];
  if (v6) {
    v5[2](v5, v6);
  }

  return v6;
}

- (BOOL)isRedirected
{
  return self->_redirected;
}

- (BOOL)isJunk
{
  return self->_junk;
}

- (int64_t)unsubscribeType
{
  return self->_unsubscribeType;
}

- (BOOL)isUnscreenedSender
{
  return self->_unscreenedSender;
}

- (void)setUnscreenedSender:(BOOL)a3
{
  self->_unscreenedSender = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_followUp, 0);
  objc_storeStrong((id *)&self->_displayDate, 0);
  objc_storeStrong((id *)&self->_sendLaterDate, 0);
  objc_storeStrong((id *)&self->_readLaterDate, 0);
  objc_storeStrong((id *)&self->_flagColors, 0);
}

@end