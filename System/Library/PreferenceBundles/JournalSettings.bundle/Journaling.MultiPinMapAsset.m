@interface Journaling.MultiPinMapAsset
- (BOOL)isEqual:(id)a3;
@end

@implementation Journaling.MultiPinMapAsset

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1466A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_4D070((uint64_t)v8);

  sub_1248C((uint64_t)v8, &qword_19B1E0);
  return v6 & 1;
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

@end