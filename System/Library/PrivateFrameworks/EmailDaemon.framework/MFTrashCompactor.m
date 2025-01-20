@interface MFTrashCompactor
- (EFScheduler)scheduler;
- (MFTrashCompactor)init;
- (NSMutableDictionary)emptiedTrashTimestamps;
- (void)emptyTrashForAccount:(id)a3;
- (void)setEmptiedTrashTimestamps:(id)a3;
- (void)setScheduler:(id)a3;
@end

@implementation MFTrashCompactor

- (MFTrashCompactor)init
{
  v8.receiver = self;
  v8.super_class = (Class)MFTrashCompactor;
  v2 = [(MFTrashCompactor *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    emptiedTrashTimestamps = v2->_emptiedTrashTimestamps;
    v2->_emptiedTrashTimestamps = v3;

    uint64_t v5 = +[EFScheduler serialDispatchQueueSchedulerWithName:@"com.apple.mail.TrashCompactor.scheduler" qualityOfService:17];
    scheduler = v2->_scheduler;
    v2->_scheduler = (EFScheduler *)v5;
  }
  return v2;
}

- (void)emptyTrashForAccount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 uniqueID];
  if (v5)
  {
    v6 = [(MFTrashCompactor *)self scheduler];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10009C6D0;
    v7[3] = &unk_10013ABC8;
    v7[4] = self;
    id v8 = v5;
    id v9 = v4;
    [v6 performBlock:v7];
  }
}

- (NSMutableDictionary)emptiedTrashTimestamps
{
  return self->_emptiedTrashTimestamps;
}

- (void)setEmptiedTrashTimestamps:(id)a3
{
}

- (EFScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);

  objc_storeStrong((id *)&self->_emptiedTrashTimestamps, 0);
}

@end