@interface DOCUSBStorageKitManager
- (_TtC26DocumentManagerExecutables23DOCUSBStorageKitManager)init;
- (void)initialPopulateComplete;
@end

@implementation DOCUSBStorageKitManager

- (_TtC26DocumentManagerExecutables23DOCUSBStorageKitManager)init
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC26DocumentManagerExecutables23DOCUSBStorageKitManager_prewarmStarted) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC26DocumentManagerExecutables23DOCUSBStorageKitManager_prewarmComplete) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCUSBStorageKitManager();
  return [(DOCUSBStorageKitManager *)&v3 init];
}

- (void)initialPopulateComplete
{
  v2 = self;
  DOCUSBStorageKitManager.initialPopulateComplete()();
}

@end