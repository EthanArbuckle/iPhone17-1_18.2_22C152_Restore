@interface DDRTaskResetDeviceMagneticCover
- (BOOL)hasSeenCaseLatchCover;
- (NSUserDefaults)defaults;
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)configure;
- (void)run;
- (void)setDefaults:(id)a3;
- (void)setHasSeenCaseLatchCover:(BOOL)a3;
@end

@implementation DDRTaskResetDeviceMagneticCover

- (void)configure
{
  id v3 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.springboard"];
  [(DDRTaskResetDeviceMagneticCover *)self setDefaults:v3];

  id v4 = [(DDRTaskResetDeviceMagneticCover *)self defaults];
  -[DDRTaskResetDeviceMagneticCover setHasSeenCaseLatchCover:](self, "setHasSeenCaseLatchCover:", [v4 BOOLForKey:@"SBHasSeenACaseLatchCoverOnce"]);
}

- (void)run
{
  if ([(DDRTaskResetDeviceMagneticCover *)self hasSeenCaseLatchCover])
  {
    id v3 = [(DDRTaskResetDeviceMagneticCover *)self defaults];
    [v3 setBool:1 forKey:@"SBHasSeenACaseLatchCoverOnce"];
  }
}

- (double)estimatedTimeOfCompletion
{
  return 0.05;
}

- (id)identifier
{
  return @"com.apple.devicedatareset.resetDeviceMagneticCover";
}

- (BOOL)hasSeenCaseLatchCover
{
  return self->_hasSeenCaseLatchCover;
}

- (void)setHasSeenCaseLatchCover:(BOOL)a3
{
  self->_hasSeenCaseLatchCover = a3;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end