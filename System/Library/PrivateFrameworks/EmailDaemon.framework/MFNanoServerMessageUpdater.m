@interface MFNanoServerMessageUpdater
- (BOOL)_status:(unint64_t)a3 containsState:(unint64_t)a4;
- (MFNanoServerMessageUpdater)init;
- (id)_libraryMessageForMessageId:(id)a3;
- (void)_addOperation:(id)a3 withMessages:(id)a4 toChangeManager:(id)a5;
- (void)moveMessages:(id)a3 toMailbox:(id)a4;
- (void)updateMessages:(id)a3;
@end

@implementation MFNanoServerMessageUpdater

- (MFNanoServerMessageUpdater)init
{
  v7.receiver = self;
  v7.super_class = (Class)MFNanoServerMessageUpdater;
  v2 = [(MFNanoServerMessageUpdater *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.MFNanoServerMessageUpdater", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)updateMessages:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100099628;
  v7[3] = &unk_100139C20;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)moveMessages:(id)a3 toMailbox:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009A19C;
  block[3] = &unk_10013ABC8;
  id v12 = v7;
  id v13 = v6;
  v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)_addOperation:(id)a3 withMessages:(id)a4 toChangeManager:(id)a5
{
  id v10 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = [[MailMessageChangeSet alloc] initWithMessages:v7 operation:v10];
  [v8 addChange:v9];
}

- (id)_libraryMessageForMessageId:(id)a3
{
  v3 = +[NSURL URLWithString:a3];
  id v4 = objc_msgSend(v3, "mf_messageCriterion");
  v5 = +[MFMailMessageLibrary defaultInstance];
  id v6 = [v5 messagesMatchingCriterion:v4 options:6144];

  id v7 = [v6 firstObject];

  return v7;
}

- (BOOL)_status:(unint64_t)a3 containsState:(unint64_t)a4
{
  return (a4 & a3) != 0;
}

- (void).cxx_destruct
{
}

@end