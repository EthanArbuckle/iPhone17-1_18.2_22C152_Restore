@interface APSConnectionHistory
- (APSConnectionHistory)init;
- (double)connectedTimeInPastOneDayOnInterface:(int64_t)a3;
- (double)highQualityThresholdConnectedTime;
- (double)lowQualityThresholdConnectedTime;
- (id)connectionHistoryOnInterface:(int64_t)a3;
- (int64_t)connectionQualityOnInterface:(int64_t)a3;
- (void)adjustQualityOfConnectionOnInterface:(int64_t)a3;
- (void)noteDisconnectOnInterface:(int64_t)a3;
- (void)noteNewConnectionOnInterface:(int64_t)a3;
- (void)setHighQualityThresholdConnectedTime:(double)a3;
- (void)setLowQualityThresholdConnectedTime:(double)a3;
@end

@implementation APSConnectionHistory

- (APSConnectionHistory)init
{
  v9.receiver = self;
  v9.super_class = (Class)APSConnectionHistory;
  v2 = [(APSConnectionHistory *)&v9 init];
  v3 = (APSConnectionHistory *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 8) = xmmword_10010E950;
    v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v5 = v3->_connectionHistory[0];
    v3->_connectionHistory[0] = v4;

    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = v3->_connectionHistory[1];
    v3->_connectionHistory[1] = v6;
  }
  return v3;
}

- (void)noteNewConnectionOnInterface:(int64_t)a3
{
  if (a3 < 2)
  {
    v6 = +[NSDate date];
    id v7 = +[APSPair pairWithFirst:v6 second:0];

    [(NSMutableArray *)self->_connectionHistory[a3] addObject:v7];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = sub_100040D80(a3);
    *(_DWORD *)buf = 138412546;
    objc_super v9 = self;
    __int16 v10 = 2112;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to note new connection  with invalid interface %@", buf, 0x16u);
  }
}

- (void)noteDisconnectOnInterface:(int64_t)a3
{
  if (a3 < 2)
  {
    connectionHistory = self->_connectionHistory;
    uint64_t v7 = [(NSMutableArray *)self->_connectionHistory[a3] lastObject];
    if (v7)
    {
      v8 = (void *)v7;
      objc_super v9 = [(NSMutableArray *)connectionHistory[a3] lastObject];
      __int16 v10 = [v9 second];

      if (!v10)
      {
        id v12 = +[NSDate date];
        v11 = [(NSMutableArray *)connectionHistory[a3] lastObject];
        [v11 setSecond:v12];
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = sub_100040D80(a3);
    *(_DWORD *)buf = 138412546;
    v14 = self;
    __int16 v15 = 2112;
    v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to note disconnect with invalid interface %@", buf, 0x16u);
  }
}

- (int64_t)connectionQualityOnInterface:(int64_t)a3
{
  if (a3 < 2) {
    return self->_connectionQuality[a3];
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = sub_100040D80(a3);
    int v7 = 138412546;
    v8 = self;
    __int16 v9 = 2112;
    __int16 v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to get connection quality with invalid interface %@", (uint8_t *)&v7, 0x16u);
  }
  return 0;
}

- (void)adjustQualityOfConnectionOnInterface:(int64_t)a3
{
  if (a3 >= 2)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    v5 = sub_100040D80(a3);
    int v11 = 138412546;
    id v12 = self;
    __int16 v13 = 2112;
    int64_t v14 = (int64_t)v5;
    v6 = "%@ asked to recalculate quality of connection with invalid interface %@";
    uint32_t v7 = 22;
    goto LABEL_11;
  }
  [(APSConnectionHistory *)self connectedTimeInPastOneDayOnInterface:a3];
  if (v8 <= self->_highQualityThresholdConnectedTime)
  {
    connectionQuality = self->_connectionQuality;
    connectionQuality[a3] = v8 >= self->_lowQualityThresholdConnectedTime;
  }
  else
  {
    self->_connectionQuality[a3] = 2;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v10 = self->_connectionQuality[a3];
    v5 = sub_100040D80(a3);
    int v11 = 138412802;
    id v12 = self;
    __int16 v13 = 2048;
    int64_t v14 = v10;
    __int16 v15 = 2112;
    v16 = v5;
    v6 = "%@ calculated current connection quality. {Quality:%lu, Interface: %@}";
    uint32_t v7 = 32;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v7);
  }
}

- (double)connectedTimeInPastOneDayOnInterface:(int64_t)a3
{
  if (a3 < 2)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    uint64_t v24 = 0;
    uint64_t v13 = 0;
    int64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    uint64_t v16 = -1;
    connectionHistory = self->_connectionHistory;
    double v8 = self->_connectionHistory[a3];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10001D6FC;
    v12[3] = &unk_10012A550;
    v12[4] = &v13;
    v12[5] = buf;
    [(NSMutableArray *)v8 enumerateObjectsWithOptions:2 usingBlock:v12];
    if ((v14[3] & 0x8000000000000000) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = v14[3];
        int64_t v10 = connectionHistory[a3];
        *(_DWORD *)v17 = 138412802;
        v18 = self;
        __int16 v19 = 2048;
        uint64_t v20 = v9;
        __int16 v21 = 2112;
        v22 = v10;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ removing connection history pair before index %lu, history %@", v17, 0x20u);
      }
      -[NSMutableArray removeObjectsInRange:](connectionHistory[a3], "removeObjectsInRange:", 0, v14[3] + 1);
    }
    double v5 = *(double *)(*(void *)&buf[8] + 24);
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    double v5 = 0.0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v6 = sub_100040D80(a3);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to get connected time in past one day with invalid interface %@", buf, 0x16u);
    }
  }
  return v5;
}

- (id)connectionHistoryOnInterface:(int64_t)a3
{
  if (a3 < 2)
  {
    v6 = self->_connectionHistory[a3];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      double v5 = sub_100040D80(a3);
      int v8 = 138412546;
      uint64_t v9 = self;
      __int16 v10 = 2112;
      int v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to get connection history with invalid interface %@", (uint8_t *)&v8, 0x16u);
    }
    v6 = 0;
  }
  return v6;
}

- (double)highQualityThresholdConnectedTime
{
  return self->_highQualityThresholdConnectedTime;
}

- (void)setHighQualityThresholdConnectedTime:(double)a3
{
  self->_highQualityThresholdConnectedTime = a3;
}

- (double)lowQualityThresholdConnectedTime
{
  return self->_lowQualityThresholdConnectedTime;
}

- (void)setLowQualityThresholdConnectedTime:(double)a3
{
  self->_lowQualityThresholdConnectedTime = a3;
}

- (void).cxx_destruct
{
  for (uint64_t i = 48; i != 32; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
}

@end