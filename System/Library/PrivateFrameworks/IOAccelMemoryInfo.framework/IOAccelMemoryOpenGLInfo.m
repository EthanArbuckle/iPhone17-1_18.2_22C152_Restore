@interface IOAccelMemoryOpenGLInfo
- (NSString)debugLabel;
- (NSString)objectDescription;
- (NSString)sharegroup;
- (id)description;
- (int)blamedProcess;
- (int)name;
- (int)pid;
- (unint64_t)objectType;
- (void)dealloc;
- (void)setBlamedProcess:(int)a3;
- (void)setDebugLabel:(id)a3;
- (void)setName:(int)a3;
- (void)setObjectDescription:(id)a3;
- (void)setObjectType:(unint64_t)a3;
- (void)setPid:(int)a3;
- (void)setSharegroup:(id)a3;
@end

@implementation IOAccelMemoryOpenGLInfo

- (id)description
{
  v3 = (void *)[MEMORY[0x263F089D8] string];
  unint64_t v4 = [(IOAccelMemoryOpenGLInfo *)self objectType];
  if (v4 > 2) {
    v5 = @"Unknown";
  }
  else {
    v5 = off_264461658[v4];
  }
  [v3 appendFormat:@"%@ Sharegroup %@ %@ %d", pid2name(-[IOAccelMemoryOpenGLInfo pid](self, "pid")), -[IOAccelMemoryOpenGLInfo sharegroup](self, "sharegroup"), v5, -[IOAccelMemoryOpenGLInfo name](self, "name")];
  if ([(IOAccelMemoryOpenGLInfo *)self debugLabel]
    || [(IOAccelMemoryOpenGLInfo *)self objectDescription])
  {
    objc_msgSend(v3, "appendString:", @" (");
    if ([(IOAccelMemoryOpenGLInfo *)self debugLabel])
    {
      objc_msgSend(v3, "appendString:", -[IOAccelMemoryOpenGLInfo debugLabel](self, "debugLabel"));
      if ([(IOAccelMemoryOpenGLInfo *)self objectDescription]) {
        [v3 appendString:@", "];
      }
    }
    if ([(IOAccelMemoryOpenGLInfo *)self objectDescription]) {
      objc_msgSend(v3, "appendString:", -[IOAccelMemoryOpenGLInfo objectDescription](self, "objectDescription"));
    }
    [v3 appendString:@""]);
  }
  if ([(IOAccelMemoryOpenGLInfo *)self blamedProcess]) {
    [v3 appendFormat:@", on behalf of %@", pid2name(-[IOAccelMemoryOpenGLInfo blamedProcess](self, "blamedProcess"))];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IOAccelMemoryOpenGLInfo;
  [(IOAccelMemoryOpenGLInfo *)&v3 dealloc];
}

- (int)pid
{
  return self->pid;
}

- (void)setPid:(int)a3
{
  self->pid = a3;
}

- (NSString)sharegroup
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSharegroup:(id)a3
{
}

- (unint64_t)objectType
{
  return self->objectType;
}

- (void)setObjectType:(unint64_t)a3
{
  self->objectType = a3;
}

- (int)name
{
  return self->name;
}

- (void)setName:(int)a3
{
  self->name = a3;
}

- (int)blamedProcess
{
  return self->blamedProcess;
}

- (void)setBlamedProcess:(int)a3
{
  self->blamedProcess = a3;
}

- (NSString)objectDescription
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setObjectDescription:(id)a3
{
}

- (NSString)debugLabel
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDebugLabel:(id)a3
{
}

@end