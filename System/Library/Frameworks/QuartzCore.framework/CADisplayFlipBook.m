@interface CADisplayFlipBook
+ (id)new;
- (BOOL)renderForTime:(double)a3 options:(id)a4 error:(id *)a5;
- (CAContext)context;
- (CADisplayFlipBook)init;
- (double)cancelAtTime:(double)a3;
- (id)description;
- (unint64_t)capacity;
- (void)dealloc;
@end

@implementation CADisplayFlipBook

- (id)description
{
  return 0;
}

- (unint64_t)capacity
{
  return 0;
}

- (CAContext)context
{
  return 0;
}

- (double)cancelAtTime:(double)a3
{
  return 0.0;
}

- (BOOL)renderForTime:(double)a3 options:(id)a4 error:(id *)a5
{
  return 0;
}

- (void)dealloc
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2.receiver = self;
  v2.super_class = (Class)CADisplayFlipBook;
  [(CADisplayFlipBook *)&v2 dealloc];
}

- (CADisplayFlipBook)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

@end