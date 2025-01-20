@interface AVAudioDeviceTestServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation AVAudioDeviceTestServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = [v4 valueForEntitlement:@"com.apple.avfaudio.devicetest"];
  unsigned __int8 v6 = [v5 BOOLValue];

  if (v6)
  {
    v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___AVAudioDeviceTestServiceProtocol];
    [v4 setExportedInterface:v7];

    v8 = objc_opt_new();
    [v4 setExportedObject:v8];
    [v4 resume];
  }
  else
  {
    [v4 invalidate];
  }

  return v6;
}

@end