@interface OSDFeatures(Logging)
- (id)dictionary;
@end

@implementation OSDFeatures(Logging)

- (id)dictionary
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v12[0] = @"SilenceFramesCountMs";
  v2 = NSNumber;
  [a1 silenceFramesCountMs];
  v3 = objc_msgSend(v2, "numberWithDouble:");
  v13[0] = v3;
  v12[1] = @"SilenceProbability";
  v4 = NSNumber;
  [a1 silenceProbability];
  v5 = objc_msgSend(v4, "numberWithDouble:");
  v13[1] = v5;
  v12[2] = @"SilenceDurationMs";
  v6 = NSNumber;
  [a1 silenceDurationMs];
  v7 = objc_msgSend(v6, "numberWithDouble:");
  v13[2] = v7;
  v12[3] = @"ProcessedAudioMs";
  v8 = NSNumber;
  [a1 processedAudioMs];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  v13[3] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];

  return v10;
}

@end