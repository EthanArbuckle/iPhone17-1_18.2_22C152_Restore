@interface AFUITTRReport
- (AFUITTRReport)init;
- (BOOL)asrIsCorrect;
- (NSString)actualASRTranscript;
- (NSString)actualDomain;
- (NSString)expectedBehavior;
- (NSString)observedBehavior;
- (NSString)timestamp;
- (NSString)userSuggestedASRTranscript;
- (NSString)userSuggestedDomain;
- (id)analyzeASRIsCorrect;
- (id)analyzeASRIsWrong;
- (id)composeAdditionalDetails;
- (id)composeRadarOutput;
- (id)getTimestampFormatted;
- (id)getTranscriptQuoted;
- (int64_t)audioRecordingIsUnderstandable;
- (int64_t)domainIsCorrect;
- (void)setActualASRTranscript:(id)a3;
- (void)setActualDomain:(id)a3;
- (void)setAsrIsCorrect:(BOOL)a3;
- (void)setAudioRecordingIsUnderstandable:(int64_t)a3;
- (void)setDomainIsCorrect:(int64_t)a3;
- (void)setExpectedBehavior:(id)a3;
- (void)setObservedBehavior:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setUserSuggestedASRTranscript:(id)a3;
- (void)setUserSuggestedDomain:(id)a3;
@end

@implementation AFUITTRReport

- (AFUITTRReport)init
{
  v11.receiver = self;
  v11.super_class = (Class)AFUITTRReport;
  v2 = [(AFUITTRReport *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_asrIsCorrect = 1;
    v2->_audioRecordingIsUnderstandable = 0;
    v2->_domainIsCorrect = 0;
    timestamp = v2->_timestamp;
    v2->_timestamp = (NSString *)&stru_26D61DD68;

    actualASRTranscript = v3->_actualASRTranscript;
    v3->_actualASRTranscript = (NSString *)&stru_26D61DD68;

    observedBehavior = v3->_observedBehavior;
    v3->_observedBehavior = (NSString *)&stru_26D61DD68;

    expectedBehavior = v3->_expectedBehavior;
    v3->_expectedBehavior = (NSString *)&stru_26D61DD68;

    userSuggestedASRTranscript = v3->_userSuggestedASRTranscript;
    v3->_userSuggestedASRTranscript = (NSString *)&stru_26D61DD68;

    userSuggestedDomain = v3->_userSuggestedDomain;
    v3->_userSuggestedDomain = (NSString *)&stru_26D61DD68;
  }
  return v3;
}

- (id)composeRadarOutput
{
  v3 = [@"Siri Tap-To-Radar" stringByAppendingFormat:@"\n\n"];
  v4 = [(AFUITTRReport *)self getTimestampFormatted];
  if (([v4 isEqualToString:&stru_26D61DD68] & 1) == 0)
  {
    uint64_t v5 = [v3 stringByAppendingFormat:@"%@: %@\n", @"Timestamp", v4];

    v3 = (void *)v5;
  }
  if (![(NSString *)self->_actualASRTranscript isEqualToString:&stru_26D61DD68])
  {
    v6 = [NSString stringWithFormat:@"\"%@\"", self->_actualASRTranscript];
    uint64_t v7 = [v3 stringByAppendingFormat:@"%@ → %@\n", @"[Utterance]", v6];

    v3 = (void *)v7;
  }
  if (self->_asrIsCorrect) {
    [(AFUITTRReport *)self analyzeASRIsCorrect];
  }
  else {
  v8 = [(AFUITTRReport *)self analyzeASRIsWrong];
  }
  v9 = [v3 stringByAppendingString:v8];

  v10 = [(AFUITTRReport *)self composeAdditionalDetails];
  objc_super v11 = [v9 stringByAppendingString:v10];

  return v11;
}

- (id)analyzeASRIsCorrect
{
  v3 = [NSString stringWithFormat:@"%@ → %@\n", @"[ASR]", @"No issues reported"];
  v4 = v3;
  int64_t domainIsCorrect = self->_domainIsCorrect;
  if (domainIsCorrect == 1)
  {
    v6 = [v3 stringByAppendingFormat:@"%@ → %@\n", @"[Domain]", @"Reported as incorrect"];

    v4 = [v6 stringByAppendingFormat:@"\t- %@: %@\n", @"Siri predicted domain", self->_actualDomain];

    if ([(NSString *)self->_userSuggestedDomain isEqualToString:&stru_26D61DD68]) {
      goto LABEL_7;
    }
    [v4 stringByAppendingFormat:@"\t- %@: %@\n", @"User suggested domain", self->_userSuggestedDomain];
  }
  else
  {
    if (domainIsCorrect != 2) {
      goto LABEL_7;
    }
    [v3 stringByAppendingFormat:@"%@ → %@\n", @"[Domain]", @"No issues reported"];
  uint64_t v7 = };

  v4 = (void *)v7;
LABEL_7:

  return v4;
}

- (id)analyzeASRIsWrong
{
  v3 = [NSString stringWithFormat:@"%@ → %@\n", @"[ASR]", @"Reported as incorrect"];
  if (self->_userSuggestedASRTranscript)
  {
    v4 = [NSString stringWithFormat:@"\"%@\"", self->_userSuggestedASRTranscript];
    uint64_t v5 = [v3 stringByAppendingFormat:@"%@ → %@\n", @"[User suggested ASR Transcript]", v4];

    v3 = (void *)v5;
  }
  int64_t audioRecordingIsUnderstandable = self->_audioRecordingIsUnderstandable;
  if (audioRecordingIsUnderstandable == 1)
  {
    uint64_t v8 = [v3 stringByAppendingFormat:@"%@: %@\n", @"Audio Recording", @"Reported as incorrect"];
  }
  else
  {
    if (audioRecordingIsUnderstandable != 2) {
      goto LABEL_8;
    }
    uint64_t v7 = [v3 stringByAppendingFormat:@"%@: %@\n", @"Audio Recording", @"No issues reported"];

    uint64_t v8 = [v7 stringByAppendingFormat:@"%@: %@\n", @"Actual ASR Transcript", self->_actualASRTranscript];
    v3 = v7;
  }

  v3 = (void *)v8;
LABEL_8:

  return v3;
}

- (id)composeAdditionalDetails
{
  v3 = [NSString stringWithFormat:@"%@: %@\n", @"\nAdditional Details", &stru_26D61DD68];
  if (![(NSString *)self->_observedBehavior isEqualToString:&stru_26D61DD68])
  {
    uint64_t v4 = [v3 stringByAppendingFormat:@"%@ → %@\n", @"[Observed Behavior]", self->_observedBehavior];

    v3 = (void *)v4;
  }
  if (![(NSString *)self->_expectedBehavior isEqualToString:&stru_26D61DD68])
  {
    uint64_t v5 = [v3 stringByAppendingFormat:@"%@ → %@\n", @"[Expected Behavior]", self->_expectedBehavior];

    v3 = (void *)v5;
  }

  return v3;
}

- (id)getTimestampFormatted
{
  return self->_timestamp;
}

- (id)getTranscriptQuoted
{
  actualASRTranscript = self->_actualASRTranscript;
  if (actualASRTranscript)
  {
    v3 = [NSString stringWithFormat:@"“%@”", actualASRTranscript];
  }
  else
  {
    v3 = &stru_26D61DD68;
  }

  return v3;
}

- (NSString)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (BOOL)asrIsCorrect
{
  return self->_asrIsCorrect;
}

- (void)setAsrIsCorrect:(BOOL)a3
{
  self->_asrIsCorrect = a3;
}

- (NSString)actualASRTranscript
{
  return self->_actualASRTranscript;
}

- (void)setActualASRTranscript:(id)a3
{
}

- (NSString)userSuggestedASRTranscript
{
  return self->_userSuggestedASRTranscript;
}

- (void)setUserSuggestedASRTranscript:(id)a3
{
}

- (int64_t)audioRecordingIsUnderstandable
{
  return self->_audioRecordingIsUnderstandable;
}

- (void)setAudioRecordingIsUnderstandable:(int64_t)a3
{
  self->_int64_t audioRecordingIsUnderstandable = a3;
}

- (int64_t)domainIsCorrect
{
  return self->_domainIsCorrect;
}

- (void)setDomainIsCorrect:(int64_t)a3
{
  self->_int64_t domainIsCorrect = a3;
}

- (NSString)actualDomain
{
  return self->_actualDomain;
}

- (void)setActualDomain:(id)a3
{
}

- (NSString)userSuggestedDomain
{
  return self->_userSuggestedDomain;
}

- (void)setUserSuggestedDomain:(id)a3
{
}

- (NSString)observedBehavior
{
  return self->_observedBehavior;
}

- (void)setObservedBehavior:(id)a3
{
}

- (NSString)expectedBehavior
{
  return self->_expectedBehavior;
}

- (void)setExpectedBehavior:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedBehavior, 0);
  objc_storeStrong((id *)&self->_observedBehavior, 0);
  objc_storeStrong((id *)&self->_userSuggestedDomain, 0);
  objc_storeStrong((id *)&self->_actualDomain, 0);
  objc_storeStrong((id *)&self->_userSuggestedASRTranscript, 0);
  objc_storeStrong((id *)&self->_actualASRTranscript, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end