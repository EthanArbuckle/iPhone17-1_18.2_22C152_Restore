@interface HomeEnergyListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC16HomeEnergyDaemon18HomeEnergyListener)init;
- (void)dealloc;
@end

@implementation HomeEnergyListener

- (_TtC16HomeEnergyDaemon18HomeEnergyListener)init
{
  return (_TtC16HomeEnergyDaemon18HomeEnergyListener *)HomeEnergyListener.init()();
}

- (void)dealloc
{
  v2 = self;
  HomeEnergyListener.__deallocating_deinit();
}

- (void).cxx_destruct
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  v9 = (void *)MEMORY[0x2533AF2E0]();
  sub_251FFA638(v7, (char *)&v11);

  return v11;
}

@end