@interface RemoteUIController
- (void)registerPartsInfoViewWithComponentsMap:(id)a3;
@end

@implementation RemoteUIController

- (void)registerPartsInfoViewWithComponentsMap:(id)a3
{
  sub_100010CF0();
  uint64_t v4 = qword_10001E170;
  v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  v6 = *(void (**)(uint64_t))(*(void *)qword_10001E688 + 96);
  uint64_t v7 = swift_bridgeObjectRetain();
  v6(v7);
  sub_10000F168();
  sub_100010D20();

  swift_bridgeObjectRelease();
}

@end