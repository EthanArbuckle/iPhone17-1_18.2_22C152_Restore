@interface LibcoreIoStructGroupReq
+ (const)__metadata;
- (LibcoreIoStructGroupReq)initWithInt:(int)a3 withJavaNetInetAddress:(id)a4;
- (id)description;
- (void)dealloc;
@end

@implementation LibcoreIoStructGroupReq

- (LibcoreIoStructGroupReq)initWithInt:(int)a3 withJavaNetInetAddress:(id)a4
{
  self->gr_interface_ = a3;
  JreStrongAssign((id *)&self->gr_group_, a4);
  return self;
}

- (id)description
{
  return (id)JreStrcat("$I$@C", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"StructGroupReq[gr_interface=");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)LibcoreIoStructGroupReq;
  [(LibcoreIoStructGroupReq *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10048A6A8;
}

@end