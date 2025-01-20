@interface BMResourceSyncPlatformPolicy
- (BMResourceSyncPlatformPolicy)initWithPlatform:(int64_t)a3 transportType:(unint64_t)a4 direction:(unint64_t)a5;
- (int64_t)platform;
- (unint64_t)direction;
- (unint64_t)transportType;
@end

@implementation BMResourceSyncPlatformPolicy

- (BMResourceSyncPlatformPolicy)initWithPlatform:(int64_t)a3 transportType:(unint64_t)a4 direction:(unint64_t)a5
{
  v6 = self;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v13.receiver = self;
    v13.super_class = (Class)BMResourceSyncPlatformPolicy;
    v9 = [(BMResourceSyncPlatformPolicy *)&v13 init];
    if (v9)
    {
      v9->_platform = a3;
      v9->_transportType = a4;
      v9->_direction = a5;
    }
    v6 = v9;
    v10 = v6;
  }
  else
  {
    v11 = __biome_log_for_category(15);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BMResourceSyncPlatformPolicy initWithPlatform:transportType:direction:](a4, v11);
    }

    v10 = 0;
  }

  return v10;
}

- (int64_t)platform
{
  return self->_platform;
}

- (unint64_t)transportType
{
  return self->_transportType;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void)initWithPlatform:(uint64_t)a1 transportType:(NSObject *)a2 direction:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B30A0000, a2, OS_LOG_TYPE_FAULT, "Invalid transport type %lu.", (uint8_t *)&v2, 0xCu);
}

@end