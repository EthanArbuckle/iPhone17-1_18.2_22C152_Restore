@interface FSModuleTask
+ (id)taskWithID:(id)a3 description:(id)a4 progress:(id)a5;
- (BOOL)wasCanceled;
- (FSModuleTask)init;
- (FSModuleTask)initWithID:(id)a3 description:(id)a4 progress:(id)a5;
- (FSTaskDescription)taskDescription;
- (FSTaskProgressConnector)connector;
- (NSProgress)taskProgress;
- (NSUUID)taskUUID;
- (void)setConnector:(id)a3;
- (void)setTaskDescription:(id)a3;
- (void)setTaskProgress:(id)a3;
- (void)setTaskUUID:(id)a3;
- (void)setWasCanceled:(BOOL)a3;
@end

@implementation FSModuleTask

- (FSModuleTask)init
{
  v3.receiver = self;
  v3.super_class = (Class)FSModuleTask;
  result = [(FSModuleTask *)&v3 init];
  if (result) {
    result->_wasCanceled = 0;
  }
  return result;
}

- (FSModuleTask)initWithID:(id)a3 description:(id)a4 progress:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(FSModuleTask *)self init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_taskUUID, a3);
    objc_storeStrong((id *)&v13->_taskDescription, a4);
    objc_storeStrong((id *)&v13->_taskProgress, a5);
  }

  return v13;
}

+ (id)taskWithID:(id)a3 description:(id)a4 progress:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithID:v10 description:v9 progress:v8];

  return v11;
}

- (NSUUID)taskUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTaskUUID:(id)a3
{
}

- (FSTaskDescription)taskDescription
{
  return (FSTaskDescription *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTaskDescription:(id)a3
{
}

- (NSProgress)taskProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTaskProgress:(id)a3
{
}

- (FSTaskProgressConnector)connector
{
  return (FSTaskProgressConnector *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConnector:(id)a3
{
}

- (BOOL)wasCanceled
{
  return self->_wasCanceled;
}

- (void)setWasCanceled:(BOOL)a3
{
  self->_wasCanceled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connector, 0);
  objc_storeStrong((id *)&self->_taskProgress, 0);
  objc_storeStrong((id *)&self->_taskDescription, 0);
  objc_storeStrong((id *)&self->_taskUUID, 0);
}

@end