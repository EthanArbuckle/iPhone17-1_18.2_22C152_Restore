@interface MockDoorLockCluster
- (_TtC13HomeDataModel19MockDoorLockCluster)initWithDevice:(id)a3 endpoint:(unsigned __int16)a4 queue:(id)a5;
- (_TtC13HomeDataModel19MockDoorLockCluster)initWithDevice:(id)a3 endpointID:(id)a4 queue:(id)a5;
- (void)writeAttributeAutoRelockTimeWithValue:(id)a3 expectedValueInterval:(id)a4;
@end

@implementation MockDoorLockCluster

- (void)writeAttributeAutoRelockTimeWithValue:(id)a3 expectedValueInterval:(id)a4
{
  uint64_t v6 = sub_251F35550();
  v9[3] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269BA5550);
  v9[0] = v6;
  swift_beginAccess();
  id v7 = a4;
  v8 = self;
  swift_bridgeObjectRetain();
  sub_2519F8580((uint64_t)v9, 35);
  swift_endAccess();

  swift_bridgeObjectRelease();
}

- (_TtC13HomeDataModel19MockDoorLockCluster)initWithDevice:(id)a3 endpointID:(id)a4 queue:(id)a5
{
}

- (_TtC13HomeDataModel19MockDoorLockCluster)initWithDevice:(id)a3 endpoint:(unsigned __int16)a4 queue:(id)a5
{
}

- (void).cxx_destruct
{
}

@end