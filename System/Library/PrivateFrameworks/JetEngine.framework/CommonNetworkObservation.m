@interface CommonNetworkObservation
- (void)networkStateDidChange:(id)a3;
@end

@implementation CommonNetworkObservation

- (void)networkStateDidChange:(id)a3
{
  uint64_t v3 = sub_19F1DAEBC();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19F1DAE8C();
  swift_retain();
  sub_19EF4EA24();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end