@interface LibcoreIoStructPollfd
+ (const)__metadata;
- (id)description;
- (void)dealloc;
@end

@implementation LibcoreIoStructPollfd

- (id)description
{
  return (id)JreStrcat("$@$S$SC", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"StructPollfd[fd=");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)LibcoreIoStructPollfd;
  [(LibcoreIoStructPollfd *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10047FA08;
}

@end