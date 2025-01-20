@interface TrackingSummaryInternal
+ (id)decodeWithData:(id)a3;
- (NSDate)time;
- (NSString)description;
- (id)encode;
- (void)setTime:(id)a3;
@end

@implementation TrackingSummaryInternal

- (NSDate)time
{
  return (NSDate *)sub_24CF2F384((uint64_t)self, (uint64_t)a2, MEMORY[0x263F07490], &OBJC_IVAR____TtC11DockKitCore23TrackingSummaryInternal_time, MEMORY[0x263F073A8]);
}

- (void)setTime:(id)a3
{
}

+ (id)decodeWithData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_24CF3A870();
  unint64_t v6 = v5;

  swift_getObjCClassMetadata();
  v7 = (void *)static TrackingSummaryInternal.decode(data:)();
  sub_24CE3D2EC(v4, v6);
  return v7;
}

- (id)encode
{
  swift_retain();
  uint64_t v2 = sub_24CF2FE90();
  unint64_t v4 = v3;
  swift_release();
  if (v4 >> 60 == 15)
  {
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v5 = (void *)sub_24CF3A860();
    sub_24CE8F2C8(v2, v4);
  }
  return v5;
}

- (NSString)description
{
  swift_retain();
  sub_24CF300F0();
  swift_release();
  uint64_t v2 = (void *)sub_24CF3B300();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

@end