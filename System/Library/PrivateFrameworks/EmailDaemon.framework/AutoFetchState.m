@interface AutoFetchState
- (AutoFetchState)init;
- (id)accountDidFinish;
- (id)accountDidStart;
- (id)mailboxesDidFinish;
- (id)mailboxesDidFinishAll;
- (id)mailboxesDidStart;
- (id)update:(int64_t)a3;
- (int64_t)currentStage;
- (int64_t)mailboxesStage;
- (unint64_t)activeAccountSyncCount;
- (void)setActiveAccountSyncCount:(unint64_t)a3;
- (void)setMailboxesStage:(int64_t)a3;
@end

@implementation AutoFetchState

- (AutoFetchState)init
{
  v3.receiver = self;
  v3.super_class = (Class)AutoFetchState;
  result = [(AutoFetchState *)&v3 init];
  if (result)
  {
    result->_activeAccountSyncCount = 0;
    result->_mailboxesStage = 0;
  }
  return result;
}

- (int64_t)currentStage
{
  if ([(AutoFetchState *)self activeAccountSyncCount]) {
    return 1;
  }

  return [(AutoFetchState *)self mailboxesStage];
}

- (id)update:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      self = [(AutoFetchState *)self accountDidStart];
      goto LABEL_10;
    case 1:
      self = [(AutoFetchState *)self accountDidFinish];
      goto LABEL_10;
    case 2:
      self = [(AutoFetchState *)self mailboxesDidStart];
      goto LABEL_10;
    case 3:
      self = [(AutoFetchState *)self mailboxesDidFinish];
      goto LABEL_10;
    case 4:
      self = [(AutoFetchState *)self mailboxesDidFinishAll];
LABEL_10:
      break;
    default:
      break;
  }
  return self;
}

- (id)accountDidStart
{
  int64_t v3 = [(AutoFetchState *)self currentStage];
  [(AutoFetchState *)self setActiveAccountSyncCount:(char *)[(AutoFetchState *)self activeAccountSyncCount] + 1];
  if (v3 == 1)
  {
    uint64_t v4 = &__NSArray0__struct;
  }
  else
  {
    CFStringRef v6 = @"AutoFetchProcessStartNotification";
    uint64_t v4 = +[NSArray arrayWithObjects:&v6 count:1];
  }

  return v4;
}

- (id)accountDidFinish
{
  if (![(AutoFetchState *)self activeAccountSyncCount])
  {
    CFStringRef v6 = MFAutoFetchLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000BFFF8(v6, v7, v8, v9, v10, v11, v12, v13);
    }

    goto LABEL_8;
  }
  [(AutoFetchState *)self setActiveAccountSyncCount:(char *)[(AutoFetchState *)self activeAccountSyncCount] - 1];
  int64_t v3 = [(AutoFetchState *)self currentStage];
  if (v3 == 2)
  {
    CFStringRef v16 = @"AutoFetchProcessFinishedNotification";
    uint64_t v4 = &v16;
    uint64_t v5 = 1;
    goto LABEL_10;
  }
  if (v3)
  {
LABEL_8:
    v14 = &__NSArray0__struct;
    goto LABEL_11;
  }
  CFStringRef v17 = @"AutoFetchProcessFinishedNotification";
  CFStringRef v18 = @"AutoFetchDoneNotification";
  uint64_t v4 = &v17;
  uint64_t v5 = 2;
LABEL_10:
  v14 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, v5, v16, v17, v18);
LABEL_11:

  return v14;
}

- (id)mailboxesDidStart
{
  int64_t v3 = [(AutoFetchState *)self currentStage];
  [(AutoFetchState *)self setMailboxesStage:1];
  if (v3 == 1)
  {
    uint64_t v4 = &__NSArray0__struct;
  }
  else
  {
    CFStringRef v6 = @"AutoFetchProcessStartNotification";
    uint64_t v4 = +[NSArray arrayWithObjects:&v6 count:1];
  }

  return v4;
}

- (id)mailboxesDidFinish
{
  if ((id)[(AutoFetchState *)self mailboxesStage] != (id)1)
  {
    int64_t v3 = MFAutoFetchLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000C0030(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  int64_t v11 = [(AutoFetchState *)self currentStage];
  [(AutoFetchState *)self setMailboxesStage:2];
  if ((id)[(AutoFetchState *)self currentStage] == (id)2)
  {
    if (v11 == 1)
    {
      CFStringRef v16 = @"AutoFetchProcessFinishedNotification";
      uint64_t v12 = &v16;
      uint64_t v13 = 1;
    }
    else
    {
      CFStringRef v17 = @"AutoFetchProcessStartNotification";
      CFStringRef v18 = @"AutoFetchProcessFinishedNotification";
      uint64_t v12 = &v17;
      uint64_t v13 = 2;
    }
    v14 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, v13, v16, v17, v18);
  }
  else
  {
    v14 = &__NSArray0__struct;
  }

  return v14;
}

- (id)mailboxesDidFinishAll
{
  if ((id)[(AutoFetchState *)self mailboxesStage] == (id)2)
  {
    [(AutoFetchState *)self setMailboxesStage:0];
    if (![(AutoFetchState *)self currentStage])
    {
      CFStringRef v13 = @"AutoFetchDoneNotification";
      int64_t v3 = +[NSArray arrayWithObjects:&v13 count:1];
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v4 = MFAutoFetchLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000C0068(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  int64_t v3 = &__NSArray0__struct;
LABEL_8:

  return v3;
}

- (unint64_t)activeAccountSyncCount
{
  return self->_activeAccountSyncCount;
}

- (void)setActiveAccountSyncCount:(unint64_t)a3
{
  self->_activeAccountSyncCount = a3;
}

- (int64_t)mailboxesStage
{
  return self->_mailboxesStage;
}

- (void)setMailboxesStage:(int64_t)a3
{
  self->_mailboxesStage = a3;
}

@end