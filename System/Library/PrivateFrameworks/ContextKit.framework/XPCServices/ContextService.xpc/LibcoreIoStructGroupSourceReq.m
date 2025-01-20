@interface LibcoreIoStructGroupSourceReq
+ (const)__metadata;
- (LibcoreIoStructGroupSourceReq)initWithInt:(int)a3 withJavaNetInetAddress:(id)a4 withJavaNetInetAddress:(id)a5;
- (id)description;
- (void)dealloc;
@end

@implementation LibcoreIoStructGroupSourceReq

- (LibcoreIoStructGroupSourceReq)initWithInt:(int)a3 withJavaNetInetAddress:(id)a4 withJavaNetInetAddress:(id)a5
{
  self->gsr_interface_ = a3;
  JreStrongAssign((id *)&self->gsr_group_, a4);
  JreStrongAssign((id *)&self->gsr_source_, a5);
  return self;
}

- (id)description
{
  return (id)JreStrcat("$I$@$@C", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"StructGroupSourceReq[gsr_interface=");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)LibcoreIoStructGroupSourceReq;
  [(LibcoreIoStructGroupSourceReq *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10042F568;
}

@end