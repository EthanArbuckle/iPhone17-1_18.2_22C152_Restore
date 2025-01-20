@interface APSOutstandingTask
- (APSDNSRequest)dnsRequest;
- (APSOutstandingTask)initWithDNSTask:(id)a3;
- (APSOutstandingTask)initWithDNSTask:(id)a3 messageId:(unint64_t)a4 taskId:(unint64_t)a5 taskStatus:(unint64_t)a6;
- (unint64_t)messageId;
- (unint64_t)taskId;
- (unint64_t)taskStatus;
- (unint64_t)taskType;
- (void)setMessageId:(unint64_t)a3;
- (void)setTaskId:(unint64_t)a3;
- (void)setTaskStatus:(unint64_t)a3;
@end

@implementation APSOutstandingTask

- (APSOutstandingTask)initWithDNSTask:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APSOutstandingTask;
  v6 = [(APSOutstandingTask *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_taskType = 1;
    objc_storeStrong((id *)&v6->_dnsRequest, a3);
  }

  return v7;
}

- (APSOutstandingTask)initWithDNSTask:(id)a3 messageId:(unint64_t)a4 taskId:(unint64_t)a5 taskStatus:(unint64_t)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)APSOutstandingTask;
  v12 = [(APSOutstandingTask *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_taskType = 1;
    objc_storeStrong((id *)&v12->_dnsRequest, a3);
    [(APSOutstandingTask *)v13 setMessageId:a4];
    [(APSOutstandingTask *)v13 setTaskId:a5];
    [(APSOutstandingTask *)v13 setTaskStatus:a6];
  }

  return v13;
}

- (unint64_t)messageId
{
  return self->_messageId;
}

- (void)setMessageId:(unint64_t)a3
{
  self->_messageId = a3;
}

- (unint64_t)taskId
{
  return self->_taskId;
}

- (void)setTaskId:(unint64_t)a3
{
  self->_taskId = a3;
}

- (unint64_t)taskType
{
  return self->_taskType;
}

- (APSDNSRequest)dnsRequest
{
  return self->_dnsRequest;
}

- (unint64_t)taskStatus
{
  return self->_taskStatus;
}

- (void)setTaskStatus:(unint64_t)a3
{
  self->_taskStatus = a3;
}

- (void).cxx_destruct
{
}

@end