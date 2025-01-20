@interface MTLArchitecture
- (MTLArchitecture)initWithCPUType:(int)a3 cpuSubtype:(int)a4;
- (MTLArchitecture)initWithCPUType:(int)a3 cpuSubtype:(int)a4 revision:(id)a5;
- (NSString)name;
- (NSString)revision;
- (id)copyWithZone:(_NSZone *)a3;
- (int)cpuSubtype;
- (int)cpuType;
- (void)dealloc;
@end

@implementation MTLArchitecture

- (NSString)revision
{
  return self->_revision;
}

- (MTLArchitecture)initWithCPUType:(int)a3 cpuSubtype:(int)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MTLArchitecture;
  v6 = [(MTLArchitecture *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_cpuType = a3;
    v6->_cpuSubtype = a4;
    v6->_name = (NSString *)newArchitectureNameString(a3, a4);
  }
  return v7;
}

- (MTLArchitecture)initWithCPUType:(int)a3 cpuSubtype:(int)a4 revision:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)MTLArchitecture;
  v8 = [(MTLArchitecture *)&v11 init];
  objc_super v9 = v8;
  if (v8)
  {
    v8->_cpuType = a3;
    v8->_cpuSubtype = a4;
    v8->_name = (NSString *)newArchitectureNameString(a3, a4);
    v9->_revision = (NSString *)[a5 copy];
  }
  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLArchitecture;
  [(MTLArchitecture *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init((Class)objc_opt_class());
  *((void *)result + 1) = self->_name;
  *((void *)result + 2) = self->_revision;
  *((_DWORD *)result + 6) = self->_cpuType;
  *((_DWORD *)result + 7) = self->_cpuSubtype;
  return result;
}

- (int)cpuType
{
  return self->_cpuType;
}

- (int)cpuSubtype
{
  return self->_cpuSubtype;
}

@end