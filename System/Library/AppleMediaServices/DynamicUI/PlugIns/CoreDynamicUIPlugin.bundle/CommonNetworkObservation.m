@interface CommonNetworkObservation
- (void)networkStateDidChange:(id)a3;
@end

@implementation CommonNetworkObservation

- (void)networkStateDidChange:(id)a3
{
  uint64_t v3 = sub_8E8C0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_8E8A0();
  swift_retain();
  sub_2A2CC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end