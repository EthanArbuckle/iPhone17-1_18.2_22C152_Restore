@interface __IOGCDevice
- (__IOGCDevice)initWithPort:(unsigned int)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation __IOGCDevice

- (__IOGCDevice)initWithPort:(unsigned int)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)__IOGCDevice;
  return [(GCIOService *)&v5 initWithPort:*(void *)&a3 error:a4];
}

- (void)dealloc
{
  qword_2676829E8 = (uint64_t)"BUG IN IOGCDevice: Removal notification is still active.";
  __break(1u);
}

@end