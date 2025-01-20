@interface PDPool
- (void)_scheduleDrain;
- (void)drain;
- (void)lock;
- (void)unlock;
@end

@implementation PDPool

- (void)unlock
{
}

- (void)lock
{
}

- (void)_scheduleDrain
{
  if (!self->_drainScheduled)
  {
    CLSInitLog();
    v3 = (void *)CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEBUG))
    {
      name = self->_name;
      double drainInterval = self->_drainInterval;
      *(_DWORD *)buf = 138412546;
      v10 = name;
      __int16 v11 = 2048;
      double v12 = drainInterval;
      v7 = v3;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Scheduling drain of pool (%@) in %0.1fs", buf, 0x16u);
    }
    self->_drainScheduled = 1;
    dispatch_time_t v4 = dispatch_time(0, (uint64_t)(self->_drainInterval * 1000000000.0));
    if (qword_10023E538 != -1) {
      dispatch_once(&qword_10023E538, &stru_1001F3458);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100068A1C;
    block[3] = &unk_1001F2A68;
    block[4] = self;
    dispatch_after(v4, (dispatch_queue_t)qword_10023E530, block);
  }
}

- (void)drain
{
  [(PDPool *)self lock];
  self->_drainScheduled = 0;
  if ([(NSMutableArray *)self->_items count])
  {
    CLSInitLog();
    v3 = (void *)CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEBUG))
    {
      name = self->_name;
      *(_DWORD *)v7 = 138412290;
      *(void *)&v7[4] = name;
      v6 = v3;
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Draining pool (%@)", v7, 0xCu);
    }
    dispatch_time_t v4 = -[NSMutableArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", 0, *(_OWORD *)v7);
    objc_msgSend(v4, "pd_close");
    [(NSMutableArray *)self->_items removeObjectAtIndex:0];
    if ([(NSMutableArray *)self->_items count]) {
      [(PDPool *)self _scheduleDrain];
    }
    [(PDPool *)self unlock];
  }
  else
  {
    [(PDPool *)self unlock];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_items, 0);
}

@end