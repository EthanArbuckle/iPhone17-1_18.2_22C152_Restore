@interface AutoFetchHistoryEntry
- (AutoFetchHistoryEntry)initWithMailboxPath:(id)a3;
- (NSString)mailboxPath;
- (double)lastFetchDuration;
- (double)lastFetchTime;
- (unint64_t)frequency;
- (unint64_t)newMessagesState;
- (void)setFrequency:(unint64_t)a3;
- (void)setLastFetchDuration:(double)a3;
- (void)setLastFetchTime:(double)a3;
- (void)setNewMessagesState:(unint64_t)a3;
@end

@implementation AutoFetchHistoryEntry

- (AutoFetchHistoryEntry)initWithMailboxPath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AutoFetchHistoryEntry;
  v5 = [(AutoFetchHistoryEntry *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    mailboxPath = v5->_mailboxPath;
    v5->_mailboxPath = v6;
  }
  return v5;
}

- (NSString)mailboxPath
{
  return self->_mailboxPath;
}

- (unint64_t)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(unint64_t)a3
{
  self->_frequency = a3;
}

- (double)lastFetchTime
{
  return self->_lastFetchTime;
}

- (void)setLastFetchTime:(double)a3
{
  self->_lastFetchTime = a3;
}

- (double)lastFetchDuration
{
  return self->_lastFetchDuration;
}

- (void)setLastFetchDuration:(double)a3
{
  self->_lastFetchDuration = a3;
}

- (unint64_t)newMessagesState
{
  return self->_newMessagesState;
}

- (void)setNewMessagesState:(unint64_t)a3
{
  self->_newMessagesState = a3;
}

- (void).cxx_destruct
{
}

@end