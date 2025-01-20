@interface VMVoicemail
- (BOOL)hasAcceptableConfidenceForDisplay;
- (BOOL)hasReducedConfidence;
- (BOOL)shouldMarkAsReadForPlaybackCurrentTime:(float)a3;
@end

@implementation VMVoicemail

- (BOOL)hasAcceptableConfidenceForDisplay
{
  v3 = [(VMVoicemail *)self transcript];
  id v4 = [v3 confidenceRating];

  v5 = [(VMVoicemail *)self transcript];
  v6 = v5;
  if (v4)
  {
    BOOL v7 = (unint64_t)[v5 confidenceRating] > 1;
  }
  else
  {
    [v5 confidence];
    BOOL v7 = v8 >= PHVoicemailConfidenceThresholdForTranscript();
  }

  return v7;
}

- (BOOL)hasReducedConfidence
{
  v3 = [(VMVoicemail *)self transcript];
  id v4 = [v3 confidenceRating];

  v5 = [(VMVoicemail *)self transcript];
  v6 = v5;
  if (v4)
  {
    unsigned __int8 v7 = [v5 confidenceRating] == (id)2;
  }
  else
  {
    [v5 confidence];
    if (v8 <= PHVoicemailLowQualityConfidenceThresholdForTranscript()) {
      unsigned __int8 v7 = [(VMVoicemail *)self hasAcceptableConfidenceForDisplay];
    }
    else {
      unsigned __int8 v7 = 0;
    }
  }

  return v7;
}

- (BOOL)shouldMarkAsReadForPlaybackCurrentTime:(float)a3
{
  if ([(VMVoicemail *)self isRead]) {
    return 0;
  }
  if (a3 > 5.0) {
    return 1;
  }
  [(VMVoicemail *)self duration];
  return v6 / 3.0 < a3;
}

@end