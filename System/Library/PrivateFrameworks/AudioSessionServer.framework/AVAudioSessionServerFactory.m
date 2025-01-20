@interface AVAudioSessionServerFactory
+ (id)createServer;
+ (id)createServerWithAudioControlQueue:(id)a3 delegate:(id)a4;
+ (id)createServerWithDelegate:(id)a3 audioControlQueue:(id)a4;
@end

@implementation AVAudioSessionServerFactory

+ (id)createServer
{
  return objc_alloc_init(AVAudioSessionServerPriv);
}

+ (id)createServerWithAudioControlQueue:(id)a3 delegate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [[AVAudioSessionServerPriv alloc] initWithAudioControlQueue:v5 delegate:v6];

  return v7;
}

+ (id)createServerWithDelegate:(id)a3 audioControlQueue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [[AVAudioSessionServerPriv alloc] initWithAudioControlQueue:v6 delegate:v5];

  return v7;
}

@end