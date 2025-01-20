@interface LNProgressPropertySynchronizer
- (LNProgressPropertySynchronizer)init;
- (LNProgressPropertySynchronizer)initWithSourceProgress:(id)a3 destinationProgress:(id)a4;
- (void)dealloc;
- (void)startSynchronization;
- (void)stopSynchronization;
@end

@implementation LNProgressPropertySynchronizer

- (LNProgressPropertySynchronizer)initWithSourceProgress:(id)a3 destinationProgress:(id)a4
{
  return (LNProgressPropertySynchronizer *)ProgressPropertySynchronizer.init(sourceProgress:destinationProgress:)(a3, a4);
}

- (void)dealloc
{
  v2 = self;
  ProgressPropertySynchronizer.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (void)startSynchronization
{
  v2 = self;
  sub_1A4451AE8();
}

- (void)stopSynchronization
{
  v2 = self;
  sub_1A4452254();
}

- (LNProgressPropertySynchronizer)init
{
}

@end