@interface ReporterWithRefApp
- (_TtC12GameCenterUIP33_5352B16A5002CB36501838DE2FD945EE18ReporterWithRefApp)init;
- (void)reportEvent:(id)a3 type:(id)a4;
@end

@implementation ReporterWithRefApp

- (void)reportEvent:(id)a3 type:(id)a4
{
  id v4 = a4;
  if (a3)
  {
    uint64_t v6 = sub_1AF7AE0E0();
    uint64_t v8 = v7;
    if (v4)
    {
LABEL_3:
      uint64_t v9 = sub_1AF7AE0E0();
      id v4 = v10;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v9 = 0;
LABEL_6:
  v11 = self;
  sub_1AF70A0E0(v6, v8, v9, v4);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC12GameCenterUIP33_5352B16A5002CB36501838DE2FD945EE18ReporterWithRefApp)init
{
}

- (void).cxx_destruct
{
}

@end