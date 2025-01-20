@interface WFSetVolumeAction
- (void)runWithInput:(id)a3 error:(id *)a4;
- (void)setMediaVolume:(float)a3;
- (void)setRingtoneVolume:(float)a3;
@end

@implementation WFSetVolumeAction

- (void)setMediaVolume:(float)a3
{
  id v5 = [getAVSystemControllerClass() sharedAVSystemController];
  *(float *)&double v4 = a3;
  [v5 setVolumeTo:@"Audio/Video" forCategory:v4];
}

- (void)setRingtoneVolume:(float)a3
{
  id v5 = [getAVSystemControllerClass() sharedAVSystemController];
  *(float *)&double v4 = a3;
  [v5 setVolumeTo:@"Ringtone" forCategory:v4];
}

- (void)runWithInput:(id)a3 error:(id *)a4
{
  id v5 = [(WFSetVolumeAction *)self parameterValueForKey:@"WFVolume" ofClass:objc_opt_class()];
  [v5 floatValue];
  int v7 = v6;

  id v9 = [(WFSetVolumeAction *)self parameterValueForKey:@"WFVolumeSetting" ofClass:objc_opt_class()];
  if ([v9 isEqualToString:@"Ringtone"])
  {
    LODWORD(v8) = v7;
    [(WFSetVolumeAction *)self setRingtoneVolume:v8];
  }
  else
  {
    LODWORD(v8) = v7;
    [(WFSetVolumeAction *)self setMediaVolume:v8];
  }
}

@end