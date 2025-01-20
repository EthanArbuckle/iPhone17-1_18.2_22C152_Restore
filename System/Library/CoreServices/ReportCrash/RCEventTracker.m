@interface RCEventTracker
- (RCEventTracker)init;
- (int)total_count;
- (int64_t)increment:(const char *)a3;
- (void)decrement:(const char *)a3;
- (void)waitForAll;
@end

@implementation RCEventTracker

- (RCEventTracker)init
{
  v3.receiver = self;
  v3.super_class = (Class)RCEventTracker;
  return [(RCEventTracker *)&v3 initWithCondition:0];
}

- (int64_t)increment:(const char *)a3
{
  [(RCEventTracker *)self lock];
  id v5 = [(RCEventTracker *)self condition];
  id v6 = v5;
  if ((uint64_t)v5 >= 0) {
    int64_t v7 = (int64_t)v5 + 1;
  }
  else {
    int64_t v7 = 1;
  }
  ++self->_total_count;
  if (!self->txn)
  {
    v8 = (OS_os_transaction *)os_transaction_create();
    txn = self->txn;
    self->txn = v8;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    v12 = a3;
    __int16 v13 = 2048;
    id v14 = v6;
    __int16 v15 = 2048;
    int64_t v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s condition bump %ld -> %ld", (uint8_t *)&v11, 0x20u);
  }
  [(RCEventTracker *)self unlockWithCondition:v7];
  return v7;
}

- (void)decrement:(const char *)a3
{
  [(RCEventTracker *)self lock];
  id v5 = (char *)[(RCEventTracker *)self condition];
  id v6 = v5;
  if ((uint64_t)v5 <= 0) {
    int64_t v7 = 0;
  }
  else {
    int64_t v7 = v5 - 1;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    v10 = a3;
    __int16 v11 = 2048;
    v12 = v6;
    __int16 v13 = 2048;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s condition decrement %ld -> %ld", (uint8_t *)&v9, 0x20u);
  }
  if (!v7)
  {
    txn = self->txn;
    self->txn = 0;
  }
  [(RCEventTracker *)self unlockWithCondition:v7];
}

- (void)waitForAll
{
  [(RCEventTracker *)self lockWhenCondition:0];

  [(RCEventTracker *)self unlock];
}

- (int)total_count
{
  return self->_total_count;
}

- (void).cxx_destruct
{
}

@end