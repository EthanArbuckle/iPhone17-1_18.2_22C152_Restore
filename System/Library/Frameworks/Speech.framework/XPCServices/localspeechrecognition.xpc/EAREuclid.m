@interface EAREuclid
- (_TtC22localspeechrecognition9EAREuclid)init;
- (void)computeEmbeddings:(id)a3 reply:(id)a4;
- (void)distanceBetweenSource:(id)a3 target:(id)a4 reply:(id)a5;
- (void)embeddingDimWithReply:(id)a3;
- (void)findNearestNeighbors:(id)a3 numberOfNeighbors:(int64_t)a4 reply:(id)a5;
- (void)fullVersionWithReply:(id)a3;
- (void)majorVersionWithReply:(id)a3;
- (void)maxInputLengthWithReply:(id)a3;
- (void)minorVersionWithReply:(id)a3;
- (void)patchVersionWithReply:(id)a3;
@end

@implementation EAREuclid

- (void)findNearestNeighbors:(id)a3 numberOfNeighbors:(int64_t)a4 reply:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = sub_1000411F0();
  uint64_t v10 = v9;
  _Block_copy(v7);
  v11 = self;
  sub_100010EA4(v8, v10, a4, (uint64_t)v11, (void (**)(void, void))v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)distanceBetweenSource:(id)a3 target:(id)a4 reply:(id)a5
{
  v6 = _Block_copy(a5);
  uint64_t v7 = sub_1000411F0();
  uint64_t v9 = v8;
  uint64_t v10 = sub_1000411F0();
  uint64_t v12 = v11;
  _Block_copy(v6);
  v13 = self;
  sub_100011460(v7, v9, v10, v12, (uint64_t)v13, (void (**)(void, void))v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)computeEmbeddings:(id)a3 reply:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_100041270();
  _Block_copy(v5);
  uint64_t v7 = self;
  sub_1000118EC(v6, (uint64_t)v7, (void (**)(void, void))v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)maxInputLengthWithReply:(id)a3
{
}

- (void)embeddingDimWithReply:(id)a3
{
}

- (void)fullVersionWithReply:(id)a3
{
}

- (void)majorVersionWithReply:(id)a3
{
}

- (void)minorVersionWithReply:(id)a3
{
}

- (void)patchVersionWithReply:(id)a3
{
}

- (_TtC22localspeechrecognition9EAREuclid)init
{
}

- (void).cxx_destruct
{
}

@end