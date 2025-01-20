@interface MADServiceTaskInformation
- (MADServiceTaskInformation)initWithTask:(id)a3 requestID:(unint64_t)a4 schedulingErrorHandler:(id)a5;
- (NSNumber)scheduledTaskID;
- (VCPMADTaskProtocol)task;
- (id)schedulingErrorHandler;
- (unint64_t)requestID;
- (void)setScheduledTaskID:(id)a3;
@end

@implementation MADServiceTaskInformation

- (MADServiceTaskInformation)initWithTask:(id)a3 requestID:(unint64_t)a4 schedulingErrorHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MADServiceTaskInformation;
  v11 = [(MADServiceTaskInformation *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_task, a3);
    v12->_requestID = a4;
    id v13 = objc_retainBlock(v10);
    id schedulingErrorHandler = v12->_schedulingErrorHandler;
    v12->_id schedulingErrorHandler = v13;

    scheduledTaskID = v12->_scheduledTaskID;
    v12->_scheduledTaskID = 0;
  }
  return v12;
}

- (VCPMADTaskProtocol)task
{
  return self->_task;
}

- (unint64_t)requestID
{
  return self->_requestID;
}

- (id)schedulingErrorHandler
{
  return self->_schedulingErrorHandler;
}

- (NSNumber)scheduledTaskID
{
  return self->_scheduledTaskID;
}

- (void)setScheduledTaskID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledTaskID, 0);
  objc_storeStrong(&self->_schedulingErrorHandler, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

@end