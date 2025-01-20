@interface VOTAudiographManager
- (BOOL)willPlayheadPositionChangePassGridline:(double)a3;
- (VOTElement)currentChartElement;
- (double)lastProgressNotificationTime;
- (void)announceValueForPlayheadPosition;
- (void)dataSonifierPlaybackDidBeginAtPosition:(double)a3;
- (void)dataSonifierPlaybackDidEndAtPosition:(double)a3;
- (void)dataSonifierPlaybackDidPauseAtPosition:(double)a3;
- (void)dataSonifierPlaybackDidResumeAtPosition:(double)a3;
- (void)dataSonifierPlaybackProgressDidChange:(double)a3;
- (void)dataSonifierScrubbingDidBeginAtPosition:(double)a3;
- (void)dataSonifierScrubbingDidEndAtPosition:(double)a3;
- (void)notifyElementOfPlaybackProgress:(double)a3;
- (void)notifyElementOfPlaybackStatusChange;
- (void)playHapticWithType:(int64_t)a3;
- (void)scrubToPosition:(double)a3;
- (void)setCurrentChartElement:(id)a3;
- (void)setLastProgressNotificationTime:(double)a3;
- (void)stopSpeaking;
@end

@implementation VOTAudiographManager

- (void)setCurrentChartElement:(id)a3
{
  id v9 = a3;
  id v5 = [(VOTAudiographManager *)self currentChartElement];

  v6 = v9;
  if (v5 != v9)
  {
    v7 = [v9 chartDescriptor];
    v8 = +[AXMDataSonifier sharedInstance];
    [v8 setCurrentChartDescriptor:v7];

    objc_storeStrong((id *)&self->_currentChartElement, a3);
    v6 = v9;
  }
}

- (void)scrubToPosition:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VOTAudiographManager;
  -[VOTAudiographManager scrubToPosition:](&v5, "scrubToPosition:");
  if ([(VOTAudiographManager *)self willPlayheadPositionChangePassGridline:a3])
  {
    [(VOTAudiographManager *)self playHapticWithType:19];
  }
}

- (void)announceValueForPlayheadPosition
{
  id v4 = [(VOTAudiographManager *)self valueDescriptionForPlayheadPosition];
  if ([v4 length])
  {
    v2 = +[VOTOutputManager outputManager];
    id v3 = [v4 copy];
    [v2 speakSimpleString:v3];
  }
}

- (void)stopSpeaking
{
  id v2 = +[VOTOutputManager outputManager];
  [v2 stopSpeakingAtBoundary:0];
}

- (void)dataSonifierPlaybackDidBeginAtPosition:(double)a3
{
  -[VOTAudiographManager playHapticWithType:](self, "playHapticWithType:", 18, a3);

  [(VOTAudiographManager *)self notifyElementOfPlaybackStatusChange];
}

- (void)dataSonifierPlaybackDidPauseAtPosition:(double)a3
{
  [(VOTAudiographManager *)self notifyElementOfPlaybackProgress:a3];

  [(VOTAudiographManager *)self notifyElementOfPlaybackStatusChange];
}

- (void)dataSonifierPlaybackDidResumeAtPosition:(double)a3
{
  [(VOTAudiographManager *)self notifyElementOfPlaybackProgress:a3];

  [(VOTAudiographManager *)self notifyElementOfPlaybackStatusChange];
}

- (void)dataSonifierPlaybackDidEndAtPosition:(double)a3
{
  -[VOTAudiographManager playHapticWithType:](self, "playHapticWithType:", 18, a3);
  id v4 = off_1001EA9E8;
  objc_super v5 = [(VOTAudiographManager *)self currentChartElement];
  v6 = [v5 language];
  sub_100051804(v4, @"search.rotor.audiograph.completed.sonification", v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = +[VOTOutputManager outputManager];
  [v7 speakSimpleString:v8];

  [(VOTAudiographManager *)self notifyElementOfPlaybackStatusChange];
}

- (void)dataSonifierPlaybackProgressDidChange:(double)a3
{
  if (-[VOTAudiographManager willPlayheadPositionChangePassGridline:](self, "willPlayheadPositionChangePassGridline:")) {
    [(VOTAudiographManager *)self playHapticWithType:19];
  }
  [(VOTAudiographManager *)self notifyElementOfPlaybackProgress:a3];

  [(VOTAudiographManager *)self setLastPlayheadPosition:a3];
}

- (void)dataSonifierScrubbingDidBeginAtPosition:(double)a3
{
  [(VOTAudiographManager *)self notifyElementOfPlaybackProgress:a3];

  [(VOTAudiographManager *)self notifyElementOfPlaybackStatusChange];
}

- (void)dataSonifierScrubbingDidEndAtPosition:(double)a3
{
  [(VOTAudiographManager *)self notifyElementOfPlaybackProgress:a3];

  [(VOTAudiographManager *)self notifyElementOfPlaybackStatusChange];
}

- (void)notifyElementOfPlaybackProgress:(double)a3
{
  double Current = CFAbsoluteTimeGetCurrent();
  [(VOTAudiographManager *)self lastProgressNotificationTime];
  if (Current > v6 + 0.01)
  {
    v7 = [(VOTAudiographManager *)self currentChartElement];
    id v8 = [v7 uiElement];
    *(float *)&double v9 = a3;
    [v8 setAXAttribute:2708 withFloat:v9];

    [(VOTAudiographManager *)self setLastProgressNotificationTime:Current];
  }
}

- (void)notifyElementOfPlaybackStatusChange
{
  id v3 = +[VOTAudiographManager sharedManager];
  id v4 = [v3 playbackStatus];

  id v7 = [(VOTAudiographManager *)self currentChartElement];
  objc_super v5 = [v7 uiElement];
  double v6 = +[NSNumber numberWithUnsignedInteger:v4];
  [v5 setAXAttribute:2716 withNumber:v6];
}

- (BOOL)willPlayheadPositionChangePassGridline:(double)a3
{
  objc_super v5 = [(VOTAudiographManager *)self xGridlinePositions];
  id v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    BOOL v8 = 1;
    do
    {
      double v9 = (double)v7 / (double)(unint64_t)v6;
      if (v9 != 0.0 && v9 != 1.0)
      {
        [(VOTAudiographManager *)self lastPlayheadPosition];
        if (v9 <= a3 && v11 <= v9) {
          break;
        }
        [(VOTAudiographManager *)self lastPlayheadPosition];
        if (v9 >= a3 && v13 >= v9) {
          break;
        }
      }
      BOOL v8 = ++v7 < (unint64_t)v6;
    }
    while (v6 != (id)v7);
  }
  else
  {
    return 0;
  }
  return v8;
}

- (void)playHapticWithType:(int64_t)a3
{
  if ([(VOTAudiographManager *)self hapticsEnabled])
  {
    id v4 = +[AXHapticFeedbackManager sharedManager];
    [v4 playHapticFeedbackForType:a3];
  }
}

- (VOTElement)currentChartElement
{
  return self->_currentChartElement;
}

- (double)lastProgressNotificationTime
{
  return self->_lastProgressNotificationTime;
}

- (void)setLastProgressNotificationTime:(double)a3
{
  self->_lastProgressNotificationTime = a3;
}

- (void).cxx_destruct
{
}

@end