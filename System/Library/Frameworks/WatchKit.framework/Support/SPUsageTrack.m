@interface SPUsageTrack
- (NSMutableDictionary)appUsageTrack;
- (OS_dispatch_queue)usageTrackQueue;
- (SPUsageTrack)init;
- (int)_indexForSize:(unint64_t)a3;
- (unsigned)_arrayForApplication:(id)a3 toGizmo:(BOOL)a4;
- (void)_logUsageData;
- (void)_prepareString:(char *)a3 fromArray:(unsigned int *)a4;
- (void)_printSeparator;
- (void)_printString:(char *)a3 fromArray:(unsigned int *)a4;
- (void)_updateDataCount:(unint64_t)a3 application:(id)a4 toGizmo:(BOOL)a5;
- (void)dataReceiedFromGizmo:(unint64_t)a3 application:(id)a4;
- (void)dataSentToGizmo:(unint64_t)a3 application:(id)a4;
- (void)setAppUsageTrack:(id)a3;
- (void)setUsageTrackQueue:(id)a3;
@end

@implementation SPUsageTrack

- (SPUsageTrack)init
{
  v7.receiver = self;
  v7.super_class = (Class)SPUsageTrack;
  v2 = [(SPUsageTrack *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.companionappd.usagetrack", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    usageTrackQueue = v2->_usageTrackQueue;
    v2->_usageTrackQueue = (OS_dispatch_queue *)v3;

    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    [(SPUsageTrack *)v2 setAppUsageTrack:v5];
  }
  return v2;
}

- (void)_prepareString:(char *)a3 fromArray:(unsigned int *)a4
{
  __sprintf_chk(__s2, 0, 0x20uLL, "%6u", *a4);
  strcat(a3, __s2);
  for (uint64_t i = 1; i != 13; ++i)
  {
    strcat(a3, ", ");
    __sprintf_chk(__s2, 0, 0x20uLL, "%6u", a4[i]);
    strcat(a3, __s2);
  }
}

- (void)_printString:(char *)a3 fromArray:(unsigned int *)a4
{
  __strcpy_chk();
  [(SPUsageTrack *)self _prepareString:v13 fromArray:a4];
  v6 = wk_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446722;
    v8 = "-[SPUsageTrack _printString:fromArray:]";
    __int16 v9 = 1024;
    int v10 = 192;
    __int16 v11 = 2082;
    v12 = v13;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: %{public}s", (uint8_t *)&v7, 0x1Cu);
  }
}

- (void)_printSeparator
{
  strcpy(v10, "          ");
  int v2 = 13;
  do
  {
    __strcat_chk();
    --v2;
  }
  while (v2);
  dispatch_queue_t v3 = wk_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446722;
    id v5 = "-[SPUsageTrack _printSeparator]";
    __int16 v6 = 1024;
    int v7 = 201;
    __int16 v8 = 2082;
    __int16 v9 = v10;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: %{public}s", (uint8_t *)&v4, 0x1Cu);
  }
}

- (void)_logUsageData
{
  usageTrackQueue = self->_usageTrackQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000975C;
  block[3] = &unk_1000447A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)usageTrackQueue, block);
}

- (void)dataSentToGizmo:(unint64_t)a3 application:(id)a4
{
  id v6 = a4;
  usageTrackQueue = self->_usageTrackQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009B64;
  block[3] = &unk_100045458;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_barrier_async((dispatch_queue_t)usageTrackQueue, block);
}

- (void)dataReceiedFromGizmo:(unint64_t)a3 application:(id)a4
{
  id v6 = a4;
  usageTrackQueue = self->_usageTrackQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009C20;
  block[3] = &unk_100045458;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_barrier_async((dispatch_queue_t)usageTrackQueue, block);
}

- (void)_updateDataCount:(unint64_t)a3 application:(id)a4 toGizmo:(BOOL)a5
{
  int v7 = [(SPUsageTrack *)self _arrayForApplication:a4 toGizmo:a5];
  unsigned int v8 = [(SPUsageTrack *)self _indexForSize:a3];
  if ((v8 & 0x80000000) != 0)
  {
    __int16 v9 = wk_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136446722;
      unint64_t v11 = "-[SPUsageTrack _updateDataCount:application:toGizmo:]";
      __int16 v12 = 1024;
      int v13 = 270;
      __int16 v14 = 2048;
      unint64_t v15 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Packet larger than largest bucket. size=%lu", (uint8_t *)&v10, 0x1Cu);
    }
  }
  else
  {
    ++v7[v8];
  }
}

- (int)_indexForSize:(unint64_t)a3
{
  uint64_t v3 = 0;
  while (dword_10003EEB8[v3] < a3)
  {
    if (++v3 == 13)
    {
      LODWORD(v3) = -1;
      return v3;
    }
  }
  return v3;
}

- (unsigned)_arrayForApplication:(id)a3 toGizmo:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = [(SPUsageTrack *)self appUsageTrack];
  unsigned int v8 = [v7 objectForKey:v6];

  if (!v8)
  {
    unsigned int v8 = objc_alloc_init(SPAppUsageTrack);
    __int16 v9 = [(SPUsageTrack *)self appUsageTrack];
    [v9 setObject:v8 forKeyedSubscript:v6];
  }
  if (v4) {
    int v10 = [(SPAppUsageTrack *)v8 toGizmoArray];
  }
  else {
    int v10 = [(SPAppUsageTrack *)v8 toCompArray];
  }
  unint64_t v11 = v10;

  return v11;
}

- (NSMutableDictionary)appUsageTrack
{
  return self->_appUsageTrack;
}

- (void)setAppUsageTrack:(id)a3
{
}

- (OS_dispatch_queue)usageTrackQueue
{
  return self->_usageTrackQueue;
}

- (void)setUsageTrackQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageTrackQueue, 0);

  objc_storeStrong((id *)&self->_appUsageTrack, 0);
}

@end