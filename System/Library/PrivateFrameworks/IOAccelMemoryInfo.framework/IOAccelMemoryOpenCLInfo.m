@interface IOAccelMemoryOpenCLInfo
- (NSString)cl_context;
- (NSString)objectDescription;
- (NSString)objectType;
- (id)description;
- (int)pid;
- (unint64_t)cl_mem;
- (void)dealloc;
- (void)setCl_context:(id)a3;
- (void)setCl_mem:(unint64_t)a3;
- (void)setObjectDescription:(id)a3;
- (void)setObjectType:(id)a3;
- (void)setPid:(int)a3;
@end

@implementation IOAccelMemoryOpenCLInfo

- (id)description
{
  v3 = (void *)[MEMORY[0x263F089D8] string];
  [v3 appendFormat:@"%@, Context %@, %@ 0x%llx", pid2name(-[IOAccelMemoryOpenCLInfo pid](self, "pid")), -[IOAccelMemoryOpenCLInfo cl_context](self, "cl_context"), -[IOAccelMemoryOpenCLInfo objectType](self, "objectType"), -[IOAccelMemoryOpenCLInfo cl_mem](self, "cl_mem")];
  if ([(IOAccelMemoryOpenCLInfo *)self objectDescription]) {
    [v3 appendFormat:@" (%@)", -[IOAccelMemoryOpenCLInfo objectDescription](self, "objectDescription")];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IOAccelMemoryOpenCLInfo;
  [(IOAccelMemoryOpenCLInfo *)&v3 dealloc];
}

- (int)pid
{
  return self->pid;
}

- (void)setPid:(int)a3
{
  self->pid = a3;
}

- (NSString)cl_context
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCl_context:(id)a3
{
}

- (unint64_t)cl_mem
{
  return self->cl_mem;
}

- (void)setCl_mem:(unint64_t)a3
{
  self->cl_mem = a3;
}

- (NSString)objectType
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setObjectType:(id)a3
{
}

- (NSString)objectDescription
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setObjectDescription:(id)a3
{
}

@end