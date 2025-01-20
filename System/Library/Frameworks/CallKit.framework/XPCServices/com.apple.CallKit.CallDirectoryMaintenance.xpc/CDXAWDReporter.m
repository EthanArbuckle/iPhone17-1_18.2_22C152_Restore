@interface CDXAWDReporter
- (AWDServerConnection)serverConnection;
- (CDXAWDReporter)init;
- (OS_dispatch_queue)queue;
- (void)_reportMetricId:(unsigned int)a3 usingBlock:(id)a4;
- (void)reportLoadedDataForExtensionWithIdentifier:(id)a3 blockingEntries:(unint64_t)a4 identificationEntries:(unint64_t)a5;
- (void)reportSetEnabled:(BOOL)a3 forExtensionWithIdentifier:(id)a4;
- (void)setQueue:(id)a3;
- (void)setServerConnection:(id)a3;
@end

@implementation CDXAWDReporter

- (CDXAWDReporter)init
{
  v9.receiver = self;
  v9.super_class = (Class)CDXAWDReporter;
  v2 = [(CDXAWDReporter *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.callkit.calldirectory.awdreporter", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000062DC;
    block[3] = &unk_100034B88;
    v8 = v2;
    dispatch_async(v5, block);
  }
  return v2;
}

- (void)reportLoadedDataForExtensionWithIdentifier:(id)a3 blockingEntries:(unint64_t)a4 identificationEntries:(unint64_t)a5
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000063F0;
  v7[3] = &unk_100034C00;
  unint64_t v9 = a4;
  unint64_t v10 = a5;
  id v8 = a3;
  id v6 = v8;
  [(CDXAWDReporter *)self _reportMetricId:5242881 usingBlock:v7];
}

- (void)reportSetEnabled:(BOOL)a3 forExtensionWithIdentifier:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006600;
  v7[3] = &unk_100034C28;
  id v8 = a4;
  BOOL v9 = a3;
  id v6 = v8;
  [(CDXAWDReporter *)self _reportMetricId:5242881 usingBlock:v7];
}

- (void)_reportMetricId:(unsigned int)a3 usingBlock:(id)a4
{
  id v6 = a4;
  v7 = [(CDXAWDReporter *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006714;
  block[3] = &unk_100034C50;
  unsigned int v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (AWDServerConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverConnection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end