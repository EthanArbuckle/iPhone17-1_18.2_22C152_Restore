@interface DDRTaskResetAVVolumeLimits
- (NSNumber)oldLimit;
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)configure;
- (void)run;
- (void)setOldLimit:(id)a3;
@end

@implementation DDRTaskResetAVVolumeLimits

- (void)configure
{
  id v4 = +[AVSystemController sharedAVSystemController];
  v3 = [v4 attributeForKey:AVSystemController_HeadphoneVolumeLimitAttribute];
  [(DDRTaskResetAVVolumeLimits *)self setOldLimit:v3];
}

- (void)run
{
  v3 = [(DDRTaskResetAVVolumeLimits *)self oldLimit];

  if (v3)
  {
    id v5 = +[AVSystemController sharedAVSystemController];
    id v4 = [(DDRTaskResetAVVolumeLimits *)self oldLimit];
    [v5 setAttribute:v4 forKey:AVSystemController_HeadphoneVolumeLimitAttribute error:0];
  }
}

- (double)estimatedTimeOfCompletion
{
  return 0.05;
}

- (id)identifier
{
  return @"com.apple.devicedatareset.resetAVVolumeLimits";
}

- (NSNumber)oldLimit
{
  return self->_oldLimit;
}

- (void)setOldLimit:(id)a3
{
}

- (void).cxx_destruct
{
}

@end