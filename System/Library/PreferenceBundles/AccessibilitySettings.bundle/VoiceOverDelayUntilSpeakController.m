@interface VoiceOverDelayUntilSpeakController
- (VoiceOverDelayUntilSpeakController)initWithCoder:(id)a3;
- (VoiceOverDelayUntilSpeakController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)maximumValue;
- (double)minimumValue;
- (double)numericalPreferenceValue;
- (double)stepAmount;
- (id)localizedFooterText;
- (id)localizedTitle;
- (void)setNumericalPreferenceValueFromUser:(double)a3;
@end

@implementation VoiceOverDelayUntilSpeakController

- (double)minimumValue
{
  return kAXSVoiceOverDelayUntilSpeakIntervalMin;
}

- (double)maximumValue
{
  return kAXSVoiceOverDelayUntilSpeakIntervalMax;
}

- (double)numericalPreferenceValue
{
  v3 = self;
  v4 = self;
  id v5 = [v3 sharedInstance];
  [v5 voiceOverDelayUntilSpeakUnderTouch];
  double v7 = v6;

  return v7;
}

- (void)setNumericalPreferenceValueFromUser:(double)a3
{
  id v5 = self;
  double v6 = self;
  id v7 = [v5 sharedInstance];
  [v7 setVoiceOverDelayUntilSpeakUnderTouch:a3];
}

- (id)localizedFooterText
{
  v2 = self;
  NSString v3 = sub_169850();
  NSString v4 = sub_169850();
  id v5 = settingsLocString(v3, v4);

  if (v5)
  {
    sub_169880();

    NSString v7 = sub_169850();
    swift_bridgeObjectRelease();
    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)localizedTitle
{
  v2 = self;
  NSString v3 = sub_169850();
  NSString v4 = sub_169850();
  id v5 = settingsLocString(v3, v4);

  if (v5)
  {
    sub_169880();

    NSString v7 = sub_169850();
    swift_bridgeObjectRelease();
    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (double)stepAmount
{
  return 0.05;
}

- (VoiceOverDelayUntilSpeakController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_169880();
    id v8 = a4;
    a3 = sub_169850();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = [(VoiceOverDelayUntilSpeakController *)&v12 initWithNibName:a3 bundle:a4];

  return v10;
}

- (VoiceOverDelayUntilSpeakController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(VoiceOverDelayUntilSpeakController *)&v5 initWithCoder:a3];
}

@end