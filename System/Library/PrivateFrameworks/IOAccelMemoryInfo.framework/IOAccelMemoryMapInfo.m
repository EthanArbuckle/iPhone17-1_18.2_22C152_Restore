@interface IOAccelMemoryMapInfo
- (int)pid;
- (unint64_t)address;
- (void)setAddress:(unint64_t)a3;
- (void)setPid:(int)a3;
@end

@implementation IOAccelMemoryMapInfo

- (int)pid
{
  return self->pid;
}

- (void)setPid:(int)a3
{
  self->pid = a3;
}

- (unint64_t)address
{
  return self->address;
}

- (void)setAddress:(unint64_t)a3
{
  self->address = a3;
}

@end