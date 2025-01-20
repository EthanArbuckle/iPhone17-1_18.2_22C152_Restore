@interface RSRawPointCloud
- (int64_t)count;
- (uint64_t)points;
- (void)setCount:(int64_t)a3;
- (void)setPoints:(_TtC8RoomPlan15RSRawPointCloud *)self;
@end

@implementation RSRawPointCloud

- (int64_t)count
{
  return *(void *)self->count;
}

- (void)setCount:(int64_t)a3
{
  *(void *)self->count = a3;
}

- (uint64_t)points
{
  return *(void *)(a1 + 24);
}

- (void)setPoints:(_TtC8RoomPlan15RSRawPointCloud *)self
{
  *(void *)self->points = v2;
}

@end