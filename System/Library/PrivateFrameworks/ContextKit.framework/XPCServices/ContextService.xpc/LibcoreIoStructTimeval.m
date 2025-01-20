@interface LibcoreIoStructTimeval
+ (const)__metadata;
+ (id)fromMillisWithLong:(int64_t)a3;
- (LibcoreIoStructTimeval)initWithLong:(int64_t)a3 withLong:(int64_t)a4;
- (id)description;
- (int64_t)toMillis;
@end

@implementation LibcoreIoStructTimeval

- (LibcoreIoStructTimeval)initWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  self->tv_sec_ = a3;
  self->tv_usec_ = a4;
  return self;
}

+ (id)fromMillisWithLong:(int64_t)a3
{
  int64_t v3 = a3 / 1000;
  int64_t v4 = 1000 * (a3 % 1000);
  v5 = [LibcoreIoStructTimeval alloc];
  v5->tv_sec_ = v3;
  v5->tv_usec_ = v4;
  return v5;
}

- (int64_t)toMillis
{
  return self->tv_usec_ / 1000 + 1000 * self->tv_sec_;
}

- (id)description
{
  return (id)JreStrcat("$J$JC", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"StructTimeval[tv_sec=");
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10045C800;
}

@end