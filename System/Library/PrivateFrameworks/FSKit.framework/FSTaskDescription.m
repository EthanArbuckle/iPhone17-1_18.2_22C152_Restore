@interface FSTaskDescription
+ (BOOL)supportsSecureCoding;
+ (FSTaskDescription)taskDescriptionWithID:(id)a3 state:(unsigned __int8)a4 purpose:(id)a5 error:(id)a6 bundleID:(id)a7 extensionID:(id)a8 resource:(id)a9;
- (BOOL)terminateExtensionWhenFinished;
- (FSContainerIdentifier)taskExtensionInstanceID;
- (FSResource)taskResource;
- (FSTaskDescription)initWithCoder:(id)a3;
- (FSTaskDescription)initWithID:(id)a3 state:(unsigned __int8)a4 purpose:(id)a5 error:(id)a6 bundleID:(id)a7 extensionID:(id)a8 resource:(id)a9;
- (NSError)taskErrorState;
- (NSObject)taskReferenceHolder;
- (NSString)taskBundleID;
- (NSString)taskInitiatorID;
- (NSString)taskPurpose;
- (NSString)taskSigningID;
- (NSUUID)taskID;
- (id)updatedDescriptionInState:(unsigned __int8)a3 error:(id)a4;
- (unsigned)taskState;
- (void)encodeWithCoder:(id)a3;
- (void)setTaskInitiatorID:(id)a3;
- (void)setTaskReferenceHolder:(id)a3;
- (void)setTaskSigningID:(id)a3;
- (void)setTerminateExtensionWhenFinished:(BOOL)a3;
@end

@implementation FSTaskDescription

- (FSTaskDescription)initWithID:(id)a3 state:(unsigned __int8)a4 purpose:(id)a5 error:(id)a6 bundleID:(id)a7 extensionID:(id)a8 resource:(id)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v33.receiver = self;
  v33.super_class = (Class)FSTaskDescription;
  v21 = [(FSTaskDescription *)&v33 init];
  if (v21)
  {
    uint64_t v22 = [v15 copy];
    taskID = v21->_taskID;
    v21->_taskID = (NSUUID *)v22;

    v21->_taskState = a4;
    objc_storeStrong((id *)&v21->_taskPurpose, a5);
    if (v17)
    {
      uint64_t v24 = [v17 copy];
      taskErrorState = v21->_taskErrorState;
      v21->_taskErrorState = (NSError *)v24;
    }
    else
    {
      taskErrorState = v21->_taskErrorState;
      v21->_taskErrorState = 0;
    }

    uint64_t v26 = [v18 copy];
    taskBundleID = v21->_taskBundleID;
    v21->_taskBundleID = (NSString *)v26;

    if (v19)
    {
      uint64_t v28 = [v19 copy];
      taskExtensionInstanceID = v21->_taskExtensionInstanceID;
      v21->_taskExtensionInstanceID = (FSContainerIdentifier *)v28;
    }
    else
    {
      taskExtensionInstanceID = v21->_taskExtensionInstanceID;
      v21->_taskExtensionInstanceID = 0;
    }

    uint64_t v30 = [v20 makeProxy];
    taskResource = v21->_taskResource;
    v21->_taskResource = (FSResource *)v30;

    v21->_terminateExtensionWhenFinished = 0;
  }

  return v21;
}

- (NSUUID)taskID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (unsigned)taskState
{
  return self->_taskState;
}

- (NSError)taskErrorState
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)taskBundleID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (FSContainerIdentifier)taskExtensionInstanceID
{
  return (FSContainerIdentifier *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)taskPurpose
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (FSResource)taskResource
{
  return (FSResource *)objc_getProperty(self, a2, 56, 1);
}

- (NSObject)taskReferenceHolder
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setTaskReferenceHolder:(id)a3
{
}

- (NSString)taskInitiatorID
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTaskInitiatorID:(id)a3
{
}

- (NSString)taskSigningID
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTaskSigningID:(id)a3
{
}

- (BOOL)terminateExtensionWhenFinished
{
  return self->_terminateExtensionWhenFinished;
}

- (void)setTerminateExtensionWhenFinished:(BOOL)a3
{
  self->_terminateExtensionWhenFinished = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskSigningID, 0);
  objc_storeStrong((id *)&self->_taskInitiatorID, 0);
  objc_storeStrong((id *)&self->_taskReferenceHolder, 0);
  objc_storeStrong((id *)&self->_taskResource, 0);
  objc_storeStrong((id *)&self->_taskPurpose, 0);
  objc_storeStrong((id *)&self->_taskExtensionInstanceID, 0);
  objc_storeStrong((id *)&self->_taskBundleID, 0);
  objc_storeStrong((id *)&self->_taskErrorState, 0);
  objc_storeStrong((id *)&self->_taskID, 0);
}

+ (FSTaskDescription)taskDescriptionWithID:(id)a3 state:(unsigned __int8)a4 purpose:(id)a5 error:(id)a6 bundleID:(id)a7 extensionID:(id)a8 resource:(id)a9
{
  uint64_t v13 = a4;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a3;
  uint64_t v22 = (void *)[objc_alloc((Class)a1) initWithID:v21 state:v13 purpose:v20 error:v19 bundleID:v18 extensionID:v17 resource:v16];

  return (FSTaskDescription *)v22;
}

- (id)updatedDescriptionInState:(unsigned __int8)a3 error:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v7 = [(id)objc_opt_class() taskDescriptionWithID:self->_taskID state:v4 purpose:self->_taskPurpose error:v6 bundleID:self->_taskBundleID extensionID:self->_taskExtensionInstanceID resource:self->_taskResource];

  [v7 setTerminateExtensionWhenFinished:self->_terminateExtensionWhenFinished];
  v8 = [(FSTaskDescription *)self taskReferenceHolder];

  if (v4 != 3 && v8)
  {
    v9 = [(FSTaskDescription *)self taskReferenceHolder];
    [v7 setTaskReferenceHolder:v9];
  }
  v10 = [(FSTaskDescription *)self taskInitiatorID];
  [v7 setTaskInitiatorID:v10];

  v11 = [(FSTaskDescription *)self taskSigningID];
  [v7 setTaskSigningID:v11];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [v8 encodeObject:self->_taskID forKey:@"FSTask.ID"];
  [v8 encodeInt:self->_taskState forKey:@"FSTask.state"];
  [v8 encodeObject:self->_taskBundleID forKey:@"FSTask.bundle"];
  [v8 encodeObject:self->_taskPurpose forKey:@"FSTask.purpose"];
  taskErrorState = self->_taskErrorState;
  if (taskErrorState) {
    [v8 encodeObject:taskErrorState forKey:@"FSTask.error"];
  }
  taskExtensionInstanceID = self->_taskExtensionInstanceID;
  if (taskExtensionInstanceID) {
    [v8 encodeObject:taskExtensionInstanceID forKey:@"FSTask.ext.ID"];
  }
  taskResource = self->_taskResource;
  v7 = v8;
  if (taskResource)
  {
    [v8 encodeObject:taskResource forKey:@"FSTask.resource"];
    v7 = v8;
  }
}

- (FSTaskDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FSTask.ID"];
  taskID = self->_taskID;
  self->_taskID = v5;

  self->_taskState = [v4 decodeIntForKey:@"FSTask.state"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FSTask.bundle"];
  taskBundleID = self->_taskBundleID;
  self->_taskBundleID = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FSTask.purpose"];
  taskPurpose = self->_taskPurpose;
  self->_taskPurpose = v9;

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FSTask.error"];
  taskErrorState = self->_taskErrorState;
  self->_taskErrorState = v11;

  uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FSTask.ext.ID"];
  taskExtensionInstanceID = self->_taskExtensionInstanceID;
  self->_taskExtensionInstanceID = v13;

  id v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FSTask.resource"];

  taskResource = self->_taskResource;
  self->_taskResource = v15;

  return self;
}

@end