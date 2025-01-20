@interface TrampolineXPCListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC13SoundAnalysis29TrampolineXPCListenerDelegate)init;
@end

@implementation TrampolineXPCListenerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1DC9C8860();

  return v9 & 1;
}

- (_TtC13SoundAnalysis29TrampolineXPCListenerDelegate)init
{
}

- (void).cxx_destruct
{
}

@end