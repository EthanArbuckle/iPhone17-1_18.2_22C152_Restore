@interface CDELogGatherer
- (CDELogGatherer)init;
- (NSArray)attachments;
- (unint64_t)trafficLogsCollectionMode;
- (void)diagnosticsCollector:(id)a3 createdOutputFiles:(id)a4;
- (void)diagnosticsCollector:(id)a3 finishedWithError:(id)a4;
- (void)gatherLogsWithCompletion:(id)a3;
- (void)setTrafficLogsCollectionMode:(unint64_t)a3;
@end

@implementation CDELogGatherer

- (CDELogGatherer)init
{
  v9.receiver = self;
  v9.super_class = (Class)CDELogGatherer;
  v2 = [(CDELogGatherer *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    attachments = v3->_attachments;
    v3->_attachments = v4;

    v6 = (EKEventStore *)[objc_alloc((Class)EKEventStore) initWithEKOptions:132];
    eventStore = v3->_eventStore;
    v3->_eventStore = v6;
  }
  return v3;
}

- (NSArray)attachments
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableArray *)self->_attachments copy];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (void)gatherLogsWithCompletion:(id)a3
{
  id v4 = objc_retainBlock(a3);
  id completionBlock = self->_completionBlock;
  self->_id completionBlock = v4;

  id v6 = [objc_alloc((Class)EKDiagnosticsCollector) initWithEventStore:self->_eventStore delegate:self];
  [v6 setRedactLogs:1];
  objc_msgSend(v6, "setTrafficLogsCollectionMode:", -[CDELogGatherer trafficLogsCollectionMode](self, "trafficLogsCollectionMode"));
  [v6 collectDiagnostics];
}

- (void)diagnosticsCollector:(id)a3 createdOutputFiles:(id)a4
{
  id v5 = a4;
  id v6 = +[CalendarDiagnosticExtension log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Got a batch of files: %@", (uint8_t *)&v7, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  [(NSMutableArray *)self->_attachments addObjectsFromArray:v5];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)diagnosticsCollector:(id)a3 finishedWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[CalendarDiagnosticExtension log];
  objc_super v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000031E8((uint64_t)v7, v9);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Diagnosticcs collector finished", v12, 2u);
  }

  id completionBlock = (void (**)(void))self->_completionBlock;
  if (completionBlock)
  {
    completionBlock[2]();
    id v11 = self->_completionBlock;
    self->_id completionBlock = 0;
  }
}

- (unint64_t)trafficLogsCollectionMode
{
  return self->_trafficLogsCollectionMode;
}

- (void)setTrafficLogsCollectionMode:(unint64_t)a3
{
  self->_trafficLogsCollectionMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_attachments, 0);

  objc_storeStrong((id *)&self->_eventStore, 0);
}

@end