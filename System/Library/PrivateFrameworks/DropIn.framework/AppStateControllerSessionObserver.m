@interface AppStateControllerSessionObserver
- (_TtC6DropIn33AppStateControllerSessionObserver)init;
- (void)controller:(id)a3 didUpdateDownlinkAudioPower:(float)a4;
- (void)manager:(id)a3 didReceiveIncomingPendingSession:(id)a4;
- (void)manager:(id)a3 didUpdateActiveSession:(id)a4;
- (void)serverDisconnectedForDropInCenter:(id)a3;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didUpdateParticipants:(id)a4;
- (void)session:(id)a3 didUpdateSessionEndDate:(id)a4;
- (void)session:(id)a3 didUpdateState:(unint64_t)a4 reason:(unint64_t)a5;
@end

@implementation AppStateControllerSessionObserver

- (void)manager:(id)a3 didReceiveIncomingPendingSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_24D0308E8((uint64_t)v8, v7);
}

- (void)manager:(id)a3 didUpdateActiveSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_24D0308E8((uint64_t)v8, v7);
}

- (void)session:(id)a3 didUpdateState:(unint64_t)a4 reason:(unint64_t)a5
{
  id v8 = a3;
  v9 = self;
  sub_24D030B30(v8, a4, a5);
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_24D030E6C(v6, v8);
}

- (void)session:(id)a3 didUpdateParticipants:(id)a4
{
  sub_24D02FFD4();
  unint64_t v6 = sub_24D044498();
  id v7 = a3;
  id v8 = self;
  sub_24D0311A8(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)session:(id)a3 didUpdateSessionEndDate:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26984FCB8);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_24D0441F8();
    uint64_t v10 = sub_24D044218();
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v10 = sub_24D044218();
    uint64_t v11 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v9, v11, 1, v10);
  id v12 = a3;
  v13 = self;
  sub_24D031588(v12, (uint64_t)v9);

  sub_24D0322D0((uint64_t)v9);
}

- (void)serverDisconnectedForDropInCenter:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24D031AAC();
}

- (void)controller:(id)a3 didUpdateDownlinkAudioPower:(float)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_24D031CF8(a4);
}

- (_TtC6DropIn33AppStateControllerSessionObserver)init
{
  return (_TtC6DropIn33AppStateControllerSessionObserver *)sub_24D031F64();
}

- (void).cxx_destruct
{
}

@end