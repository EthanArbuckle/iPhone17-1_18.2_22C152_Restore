@interface CSAttSiriStateMonitor
+ (id)sharedInstance;
- (BOOL)isAttending;
- (BOOL)isAttendingForDictation;
- (CSAttSiriStateMonitor)init;
- (OS_dispatch_queue)queue;
- (unint64_t)attendingState;
- (unint64_t)getAttendingState;
- (void)setAttendingState:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)updateState:(unint64_t)a3;
@end

@implementation CSAttSiriStateMonitor

- (void).cxx_destruct
{
}

- (void)setAttendingState:(unint64_t)a3
{
  self->_attendingState = a3;
}

- (unint64_t)attendingState
{
  return self->_attendingState;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)isAttendingForDictation
{
  return (id)[(CSAttSiriStateMonitor *)self getAttendingState] == (id)2;
}

- (BOOL)isAttending
{
  return [(CSAttSiriStateMonitor *)self getAttendingState] != 0;
}

- (void)updateState:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000AB5FC;
  v4[3] = &unk_100253B58;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (unint64_t)getAttendingState
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000AB848;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (CSAttSiriStateMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSAttSiriStateMonitor;
  v2 = [(CSAttSiriStateMonitor *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSAttSiriStateMonitor queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_attendingState = 0;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1002A3888 != -1) {
    dispatch_once(&qword_1002A3888, &stru_100250590);
  }
  v2 = (void *)qword_1002A3880;
  return v2;
}

@end