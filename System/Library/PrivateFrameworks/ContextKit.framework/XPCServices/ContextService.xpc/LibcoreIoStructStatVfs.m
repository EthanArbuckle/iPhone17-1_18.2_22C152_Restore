@interface LibcoreIoStructStatVfs
+ (const)__metadata;
- (LibcoreIoStructStatVfs)initWithLong:(int64_t)a3 withLong:(int64_t)a4 withLong:(int64_t)a5 withLong:(int64_t)a6 withLong:(int64_t)a7 withLong:(int64_t)a8 withLong:(int64_t)a9 withLong:(int64_t)a10 withLong:(int64_t)a11 withLong:(int64_t)a12 withLong:(int64_t)a13;
@end

@implementation LibcoreIoStructStatVfs

- (LibcoreIoStructStatVfs)initWithLong:(int64_t)a3 withLong:(int64_t)a4 withLong:(int64_t)a5 withLong:(int64_t)a6 withLong:(int64_t)a7 withLong:(int64_t)a8 withLong:(int64_t)a9 withLong:(int64_t)a10 withLong:(int64_t)a11 withLong:(int64_t)a12 withLong:(int64_t)a13
{
  self->f_bsize_ = a3;
  self->f_frsize_ = a4;
  self->f_blocks_ = a5;
  self->f_bfree_ = a6;
  self->f_bavail_ = a7;
  self->f_files_ = a8;
  *(_OWORD *)&self->f_ffree_ = *(_OWORD *)&a9;
  *(_OWORD *)&self->f_fsid_ = *(_OWORD *)&a11;
  self->f_namemax_ = a13;
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100483E08;
}

@end