@interface VCPMADTaskEntry
+ (id)entryWithTaskID:(unint64_t)a3 qos:(unsigned int)a4 background:(BOOL)a5 task:(id)a6 completionHandler:(id)a7;
- (BOOL)background;
- (OS_dispatch_group)taskGroup;
- (VCPMADTaskEntry)initWithTaskID:(unint64_t)a3 qos:(unsigned int)a4 background:(BOOL)a5 task:(id)a6 completionHandler:(id)a7;
- (VCPMADTaskProtocol)task;
- (id)completionHandler;
- (unint64_t)taskID;
- (unsigned)qos;
@end

@implementation VCPMADTaskEntry

- (VCPMADTaskEntry)initWithTaskID:(unint64_t)a3 qos:(unsigned int)a4 background:(BOOL)a5 task:(id)a6 completionHandler:(id)a7
{
  id v13 = a6;
  id v14 = a7;
  v22.receiver = self;
  v22.super_class = (Class)VCPMADTaskEntry;
  v15 = [(VCPMADTaskEntry *)&v22 init];
  v16 = v15;
  if (v15)
  {
    v15->_taskID = a3;
    v15->_qos = a4;
    v15->_background = a5;
    objc_storeStrong((id *)&v15->_task, a6);
    dispatch_group_t v17 = dispatch_group_create();
    taskGroup = v16->_taskGroup;
    v16->_taskGroup = (OS_dispatch_group *)v17;

    id v19 = objc_retainBlock(v14);
    id completionHandler = v16->_completionHandler;
    v16->_id completionHandler = v19;
  }
  return v16;
}

+ (id)entryWithTaskID:(unint64_t)a3 qos:(unsigned int)a4 background:(BOOL)a5 task:(id)a6 completionHandler:(id)a7
{
  BOOL v8 = a5;
  uint64_t v9 = *(void *)&a4;
  id v11 = a6;
  id v12 = a7;
  id v13 = [objc_alloc((Class)objc_opt_class()) initWithTaskID:a3 qos:v9 background:v8 task:v11 completionHandler:v12];

  return v13;
}

- (unint64_t)taskID
{
  return self->_taskID;
}

- (unsigned)qos
{
  return self->_qos;
}

- (BOOL)background
{
  return self->_background;
}

- (VCPMADTaskProtocol)task
{
  return self->_task;
}

- (OS_dispatch_group)taskGroup
{
  return self->_taskGroup;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_taskGroup, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

@end