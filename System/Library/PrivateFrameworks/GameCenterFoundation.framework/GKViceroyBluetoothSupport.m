@interface GKViceroyBluetoothSupport
+ (int)status;
+ (void)turnOnAndObserveWith:(id)a3 selector:(SEL)a4;
@end

@implementation GKViceroyBluetoothSupport

+ (int)status
{
  return [MEMORY[0x1E4F63B28] bluetoothStatus];
}

+ (void)turnOnAndObserveWith:(id)a3 selector:(SEL)a4
{
  v5 = (void *)MEMORY[0x1E4F28EB8];
  id v6 = a3;
  v7 = [v5 defaultCenter];
  [v7 addObserver:v6 selector:a4 name:*MEMORY[0x1E4F63A40] object:0];

  v8 = (void *)MEMORY[0x1E4F63B28];

  [v8 turnBluetoothOn];
}

@end