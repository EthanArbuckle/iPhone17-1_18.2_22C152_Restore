@interface DataFrameBatchProvider
- (id)featuresAtIndex:(int64_t)a3;
- (int64_t)count;
@end

@implementation DataFrameBatchProvider

- (int64_t)count
{
  return *(void *)self->count;
}

- (id)featuresAtIndex:(int64_t)a3
{
  swift_retain();
  v4 = (void *)sub_2394E96C8(a3);
  swift_release();

  return v4;
}

@end