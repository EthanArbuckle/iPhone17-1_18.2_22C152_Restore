@interface ObjCRLE
- (NSString)description;
- (_TtC9Coherence7ObjCRLE)init;
- (int64_t)rangeCount;
- (int64_t)rangeCountIn:(_NSRange)a3;
- (void)enumerateRangesIn:(_NSRange)a3 :(id)a4;
@end

@implementation ObjCRLE

- (_TtC9Coherence7ObjCRLE)init
{
  uint64_t v5 = MEMORY[0x1E4FBC860];
  swift_weakInit();
  swift_weakAssign();
  sub_1C3FAAC94((uint64_t)&v5, (uint64_t)self + OBJC_IVAR____TtC9Coherence7ObjCRLE_rle);
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ObjCRLE();
  return [(ObjCRLE *)&v4 init];
}

- (int64_t)rangeCount
{
  return (*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC9Coherence7ObjCRLE_rle))[2];
}

- (int64_t)rangeCountIn:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v5 = self;
  int64_t v6 = sub_1C447CCD0(location, length);

  return v6;
}

- (void)enumerateRangesIn:(_NSRange)a3 :(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v7 = _Block_copy(a4);
  _Block_copy(v7);
  v8 = self;
  sub_1C448026C(location, length, (uint64_t)v8, (uint64_t)v7);
  _Block_release(v7);
  _Block_release(v7);
}

- (NSString)description
{
  sub_1C3FAA63C((uint64_t)self + OBJC_IVAR____TtC9Coherence7ObjCRLE_rle, (uint64_t)v6);
  v3 = self;
  sub_1C4479E2C();
  sub_1C3F903E8((uint64_t)v6);

  objc_super v4 = (void *)sub_1C4497188();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (void).cxx_destruct
{
}

@end