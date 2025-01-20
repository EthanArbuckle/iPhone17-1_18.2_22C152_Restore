@interface CLKUIAtlas
- (BOOL)isPurgable;
- (CLKUIAtlas)initWithUuid:(id)a3;
- (NSString)uuid;
- (double)boundTime;
- (id)backing;
- (int64_t)instanceCount;
- (unint64_t)height;
- (unint64_t)maxMipmapLevelsToDrop;
- (unint64_t)maxPlaceholderSize;
- (unint64_t)memoryCost;
- (unint64_t)status;
- (unint64_t)width;
- (void)decrementInstanceCount;
- (void)incrementInstanceCount;
- (void)setBoundTime:(double)a3;
- (void)setMaxMipmapLevelsToDrop:(unint64_t)a3;
- (void)setMaxPlaceholderSize:(unint64_t)a3;
- (void)setMemoryCost:(unint64_t)a3;
- (void)setStatus:(unint64_t)a3;
@end

@implementation CLKUIAtlas

- (CLKUIAtlas)initWithUuid:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLKUIAtlas;
  v6 = [(CLKUIAtlas *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_uuid, a3);
    v7->_status = 0;
  }

  return v7;
}

- (int64_t)instanceCount
{
  return (int)atomic_load((unsigned int *)&self->_instanceCount);
}

- (id)backing
{
  v3 = +[CLKUIResourceManager sharedInstance];
  v4 = [v3 delegateForUuid:self->_uuid];

  if (v4)
  {
    id v5 = [v4 provideAtlasBacking:self->_uuid];
    v6 = v5;
    if (v5 && !self->_status)
    {
      self->_status = 1;
      self->_width = [v5 width];
      self->_height = [v6 height];
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)incrementInstanceCount
{
}

- (void)decrementInstanceCount
{
}

- (BOOL)isPurgable
{
  return [(CLKUIAtlas *)self status] == 2 || [(CLKUIAtlas *)self status] == 3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)height
{
  return self->_height;
}

- (unint64_t)maxMipmapLevelsToDrop
{
  return self->_maxMipmapLevelsToDrop;
}

- (void)setMaxMipmapLevelsToDrop:(unint64_t)a3
{
  self->_maxMipmapLevelsToDrop = a3;
}

- (unint64_t)maxPlaceholderSize
{
  return self->_maxPlaceholderSize;
}

- (void)setMaxPlaceholderSize:(unint64_t)a3
{
  self->_maxPlaceholderSize = a3;
}

- (double)boundTime
{
  return self->_boundTime;
}

- (void)setBoundTime:(double)a3
{
  self->_boundTime = a3;
}

- (unint64_t)memoryCost
{
  return self->_memoryCost;
}

- (void)setMemoryCost:(unint64_t)a3
{
  self->_memoryCost = a3;
}

- (void).cxx_destruct
{
}

@end