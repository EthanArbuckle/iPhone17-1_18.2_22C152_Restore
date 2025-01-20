@interface MADScopedWatchdog
- (MADScopedWatchdog)init;
- (void)dealloc;
- (void)pet;
@end

@implementation MADScopedWatchdog

- (MADScopedWatchdog)init
{
  v9.receiver = self;
  v9.super_class = (Class)MADScopedWatchdog;
  v2 = [(MADScopedWatchdog *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[VCPWatchdog sharedWatchdog];
    internalWatchdog = v2->_internalWatchdog;
    v2->_internalWatchdog = (VCPWatchdog *)v3;

    if (qword_1002526E8 != -1) {
      dispatch_once(&qword_1002526E8, &stru_10021DA08);
    }
    v5 = qword_1002526F0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000DDA20;
    block[3] = &unk_10021C738;
    v8 = v2;
    dispatch_sync(v5, block);
  }
  return v2;
}

- (void)dealloc
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DDBA4;
  block[3] = &unk_10021C738;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)qword_1002526F0, block);
  v3.receiver = self;
  v3.super_class = (Class)MADScopedWatchdog;
  [(MADScopedWatchdog *)&v3 dealloc];
}

- (void)pet
{
}

- (void).cxx_destruct
{
}

@end