@interface LibcoreIoStructLinger
+ (const)__metadata;
- (BOOL)isOn;
- (LibcoreIoStructLinger)initWithInt:(int)a3 withInt:(int)a4;
- (id)description;
@end

@implementation LibcoreIoStructLinger

- (LibcoreIoStructLinger)initWithInt:(int)a3 withInt:(int)a4
{
  self->l_onoff_ = a3;
  self->l_linger_ = a4;
  return self;
}

- (BOOL)isOn
{
  return self->l_onoff_ != 0;
}

- (id)description
{
  return (id)JreStrcat("$I$IC", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"StructLinger[l_onoff=");
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10044EAE8;
}

@end