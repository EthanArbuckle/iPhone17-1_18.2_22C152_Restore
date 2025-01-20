@interface MUISearchIndexStatus
- (BOOL)isEqual:(id)a3;
- (BOOL)isPaused;
- (BOOL)isVisible;
- (MUISearchIndexStatus)init;
- (MUISearchIndexStatus)initWithMessagesIndexed:(unint64_t)a3 totalMessages:(unint64_t)a4 messagesInLargestRemoteAccount:(unint64_t)a5 paused:(BOOL)a6;
- (float)progress;
- (unint64_t)messagesInLargestRemoteAccount;
- (unint64_t)messagesIndexed;
- (unint64_t)totalMessages;
- (void)setIsPaused:(BOOL)a3;
- (void)setMessagesIndexed:(unint64_t)a3;
- (void)setTotalMessages:(unint64_t)a3;
@end

@implementation MUISearchIndexStatus

- (BOOL)isVisible
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F604B8] getValueForKey:@"min-messages-for-search-index-visibility"];
  v4 = [MEMORY[0x1E4F604B8] getValueForKey:@"max-indexing-ratio-for-search-index-visibility"];
  v5 = EMLogSearchableIndexStatus();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543618;
    v15 = v3;
    __int16 v16 = 2114;
    v17 = v4;
    _os_log_impl(&dword_1DDCDB000, v5, OS_LOG_TYPE_DEFAULT, "Server Config:: MinMessageToIndex:%{public}@ MaxIndexedToTotalRatio:%{public}@", (uint8_t *)&v14, 0x16u);
  }

  if (!v3)
  {
    unint64_t v6 = 100;
    if (v4) {
      goto LABEL_5;
    }
LABEL_7:
    float v8 = 0.95;
    goto LABEL_8;
  }
  unint64_t v6 = [v3 unsignedIntegerValue];
  if (!v4) {
    goto LABEL_7;
  }
LABEL_5:
  [v4 floatValue];
  float v8 = v7;
LABEL_8:
  unint64_t v9 = [(MUISearchIndexStatus *)self messagesIndexed];
  unint64_t v10 = [(MUISearchIndexStatus *)self totalMessages];
  if ([(MUISearchIndexStatus *)self messagesIndexed] <= v6 || (float)((float)v9 / (float)v10) >= v8) {
    int v11 = 0;
  }
  else {
    int v11 = _os_feature_enabled_impl() ^ 1;
  }
  v12 = EMLogSearchableIndexStatus();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 67109120;
    LODWORD(v15) = v11;
    _os_log_impl(&dword_1DDCDB000, v12, OS_LOG_TYPE_DEFAULT, "Indexing Status Visible:%{BOOL}d", (uint8_t *)&v14, 8u);
  }

  return v11;
}

- (float)progress
{
  if (![(MUISearchIndexStatus *)self totalMessages]) {
    return 1.0;
  }
  float v3 = (float)[(MUISearchIndexStatus *)self messagesIndexed];
  return v3 / (float)[(MUISearchIndexStatus *)self totalMessages];
}

- (MUISearchIndexStatus)initWithMessagesIndexed:(unint64_t)a3 totalMessages:(unint64_t)a4 messagesInLargestRemoteAccount:(unint64_t)a5 paused:(BOOL)a6
{
  v11.receiver = self;
  v11.super_class = (Class)MUISearchIndexStatus;
  result = [(MUISearchIndexStatus *)&v11 init];
  if (result)
  {
    result->_messagesIndexed = a3;
    result->_totalMessages = a4;
    result->_messagesInLargestRemoteAccount = a5;
    result->_isPaused = a6;
  }
  return result;
}

- (MUISearchIndexStatus)init
{
  return [(MUISearchIndexStatus *)self initWithMessagesIndexed:0 totalMessages:0 messagesInLargestRemoteAccount:0 paused:0];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MUISearchIndexStatus *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = [(MUISearchIndexStatus *)self isPaused];
      if (v6 == [(MUISearchIndexStatus *)v5 isPaused])
      {
        [(MUISearchIndexStatus *)self progress];
        float v9 = v8;
        [(MUISearchIndexStatus *)v5 progress];
        BOOL v7 = v9 == v10;
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isPaused
{
  return self->_isPaused;
}

- (void)setIsPaused:(BOOL)a3
{
  self->_isPaused = a3;
}

- (unint64_t)messagesIndexed
{
  return self->_messagesIndexed;
}

- (void)setMessagesIndexed:(unint64_t)a3
{
  self->_messagesIndexed = a3;
}

- (unint64_t)totalMessages
{
  return self->_totalMessages;
}

- (void)setTotalMessages:(unint64_t)a3
{
  self->_totalMessages = a3;
}

- (unint64_t)messagesInLargestRemoteAccount
{
  return self->_messagesInLargestRemoteAccount;
}

@end