@interface CacheDeleteSnapshotInfo
- (CacheDeleteSnapshotInfo)initWithName:(id)a3 uid:(unint64_t)a4;
- (NSString)name;
- (unint64_t)uid;
@end

@implementation CacheDeleteSnapshotInfo

- (CacheDeleteSnapshotInfo)initWithName:(id)a3 uid:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CacheDeleteSnapshotInfo;
  v8 = [(CacheDeleteSnapshotInfo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    v9->_uid = a4;
  }

  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)uid
{
  return self->_uid;
}

- (void).cxx_destruct
{
}

@end