@interface LibcoreIoStructStat
+ (const)__metadata;
- (LibcoreIoStructStat)initWithLong:(int64_t)a3 withLong:(int64_t)a4 withInt:(int)a5 withLong:(int64_t)a6 withInt:(int)a7 withInt:(int)a8 withLong:(int64_t)a9 withLong:(int64_t)a10 withLong:(int64_t)a11 withLong:(int64_t)a12 withLong:(int64_t)a13 withLong:(int64_t)a14 withLong:(int64_t)a15;
@end

@implementation LibcoreIoStructStat

- (LibcoreIoStructStat)initWithLong:(int64_t)a3 withLong:(int64_t)a4 withInt:(int)a5 withLong:(int64_t)a6 withInt:(int)a7 withInt:(int)a8 withLong:(int64_t)a9 withLong:(int64_t)a10 withLong:(int64_t)a11 withLong:(int64_t)a12 withLong:(int64_t)a13 withLong:(int64_t)a14 withLong:(int64_t)a15
{
  self->st_dev_ = a3;
  self->st_ino_ = a4;
  self->st_mode_ = a5;
  self->st_nlink_ = a6;
  self->st_uid_ = a7;
  self->st_gid_ = a8;
  *(_OWORD *)&self->st_rdev_ = *(_OWORD *)&a9;
  *(_OWORD *)&self->st_atime_ = *(_OWORD *)&a11;
  *(_OWORD *)&self->st_ctime_ = *(_OWORD *)&a13;
  self->st_blocks_ = a15;
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100446BA8;
}

@end