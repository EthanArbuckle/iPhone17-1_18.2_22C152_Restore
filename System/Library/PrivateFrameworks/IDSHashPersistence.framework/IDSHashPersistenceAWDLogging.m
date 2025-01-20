@interface IDSHashPersistenceAWDLogging
+ (id)sharedInstance;
- (BOOL)shouldSubmit;
- (IDSHashPersistenceAWDLogging)init;
- (id)_metricContainerForMetricType:(unsigned int)a3;
- (void)_submitAWDMetric:(id)a3 withContainer:(id)a4;
- (void)dealloc;
- (void)duplicateMessageEncounted;
@end

@implementation IDSHashPersistenceAWDLogging

+ (id)sharedInstance
{
  if (qword_26AD572B8 != -1) {
    dispatch_once(&qword_26AD572B8, &unk_26DB48208);
  }
  v2 = (void *)qword_26AD572C8;
  return v2;
}

- (IDSHashPersistenceAWDLogging)init
{
  v10.receiver = self;
  v10.super_class = (Class)IDSHashPersistenceAWDLogging;
  v2 = [(IDSHashPersistenceAWDLogging *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_msgSend(objc_alloc((Class)MEMORY[0x22A676930](@"AWDServerConnection", @"WirelessDiagnostics")), "initWithComponentId:andBlockOnConfiguration:", 39, 1);
    AWDServerConnection = v2->_AWDServerConnection;
    v2->_AWDServerConnection = (AWDServerConnection *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = dispatch_get_global_queue(-32768, 0);
    dispatch_queue_t v7 = dispatch_queue_create_with_target_V2("com.apple.IDS.AWDLogging", v5, v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (void)dealloc
{
  queue = self->_queue;
  if (queue)
  {
    self->_queue = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)IDSHashPersistenceAWDLogging;
  [(IDSHashPersistenceAWDLogging *)&v4 dealloc];
}

- (BOOL)shouldSubmit
{
  return 1;
}

- (void)_submitAWDMetric:(id)a3 withContainer:(id)a4
{
  if (a3 && a4)
  {
    id v6 = a4;
    [v6 setMetric:a3];
    [self->_AWDServerConnection submitMetric:v6];
  }
}

- (id)_metricContainerForMetricType:(unsigned int)a3
{
  uint64_t v3 = (void *)[self->_AWDServerConnection newMetricContainerWithIdentifier:*(void *)&a3];
  return v3;
}

- (void)duplicateMessageEncounted
{
  queue = self->_queue;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = sub_2273216C0;
  objc_super v10 = &unk_2647FEE28;
  v11 = self;
  uint64_t v3 = queue;
  objc_super v4 = &v7;
  if (v3)
  {
    v5 = +[IDSHashPersistenceAWDLogging sharedInstance];
    int v6 = [v5 shouldSubmit];

    if (v6)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_22732178C;
      block[3] = &unk_2647FEE50;
      v13 = v4;
      dispatch_async(v3, block);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_AWDServerConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end