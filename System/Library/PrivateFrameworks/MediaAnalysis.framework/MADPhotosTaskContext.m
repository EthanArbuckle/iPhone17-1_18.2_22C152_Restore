@interface MADPhotosTaskContext
- (MADPhotosTaskContext)initWithTaskUUID:(id)a3;
- (NSUUID)taskUUID;
@end

@implementation MADPhotosTaskContext

- (MADPhotosTaskContext)initWithTaskUUID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADPhotosTaskContext;
  v6 = [(MADPhotosTaskContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_taskUUID, a3);
  }

  return v7;
}

- (NSUUID)taskUUID
{
  return self->_taskUUID;
}

- (void).cxx_destruct
{
}

@end