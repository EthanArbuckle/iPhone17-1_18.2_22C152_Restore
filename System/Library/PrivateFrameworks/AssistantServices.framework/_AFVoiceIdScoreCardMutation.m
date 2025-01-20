@interface _AFVoiceIdScoreCardMutation
- (BOOL)isDirty;
- (_AFVoiceIdScoreCardMutation)initWithBase:(id)a3;
- (id)getConfidentScoreThreshold;
- (id)getDeltaScoreThreshold;
- (id)getHighScoreThreshold;
- (id)getLowScoreThreshold;
- (id)getSpIdAssetVersion;
- (id)getSpIdAudioProcessedDuration;
- (id)getSpIdKnownUserScores;
- (id)getSpIdScoreThresholdingType;
- (id)getSpIdUnknownUserScore;
- (id)getSpIdUserScoresVersion;
- (id)getUserClassified;
- (int64_t)getUserIdentityClassification;
- (void)setConfidentScoreThreshold:(id)a3;
- (void)setDeltaScoreThreshold:(id)a3;
- (void)setHighScoreThreshold:(id)a3;
- (void)setLowScoreThreshold:(id)a3;
- (void)setSpIdAssetVersion:(id)a3;
- (void)setSpIdAudioProcessedDuration:(id)a3;
- (void)setSpIdKnownUserScores:(id)a3;
- (void)setSpIdScoreThresholdingType:(id)a3;
- (void)setSpIdUnknownUserScore:(id)a3;
- (void)setSpIdUserScoresVersion:(id)a3;
- (void)setUserClassified:(id)a3;
- (void)setUserIdentityClassification:(int64_t)a3;
@end

@implementation _AFVoiceIdScoreCardMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deltaScoreThreshold, 0);
  objc_storeStrong((id *)&self->_confidentScoreThreshold, 0);
  objc_storeStrong((id *)&self->_highScoreThreshold, 0);
  objc_storeStrong((id *)&self->_lowScoreThreshold, 0);
  objc_storeStrong((id *)&self->_userClassified, 0);
  objc_storeStrong((id *)&self->_spIdAssetVersion, 0);
  objc_storeStrong((id *)&self->_spIdScoreThresholdingType, 0);
  objc_storeStrong((id *)&self->_spIdUserScoresVersion, 0);
  objc_storeStrong((id *)&self->_spIdKnownUserScores, 0);
  objc_storeStrong((id *)&self->_spIdUnknownUserScore, 0);
  objc_storeStrong((id *)&self->_spIdAudioProcessedDuration, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setDeltaScoreThreshold:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x1001u;
}

- (id)getDeltaScoreThreshold
{
  if ((*(_WORD *)&self->_mutationFlags & 0x1000) != 0)
  {
    v2 = self->_deltaScoreThreshold;
  }
  else
  {
    v2 = [(AFVoiceIdScoreCard *)self->_base deltaScoreThreshold];
  }
  return v2;
}

- (void)setConfidentScoreThreshold:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x801u;
}

- (id)getConfidentScoreThreshold
{
  if ((*(_WORD *)&self->_mutationFlags & 0x800) != 0)
  {
    v2 = self->_confidentScoreThreshold;
  }
  else
  {
    v2 = [(AFVoiceIdScoreCard *)self->_base confidentScoreThreshold];
  }
  return v2;
}

- (void)setHighScoreThreshold:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x401u;
}

- (id)getHighScoreThreshold
{
  if ((*(_WORD *)&self->_mutationFlags & 0x400) != 0)
  {
    v2 = self->_highScoreThreshold;
  }
  else
  {
    v2 = [(AFVoiceIdScoreCard *)self->_base highScoreThreshold];
  }
  return v2;
}

- (void)setLowScoreThreshold:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (id)getLowScoreThreshold
{
  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0)
  {
    v2 = self->_lowScoreThreshold;
  }
  else
  {
    v2 = [(AFVoiceIdScoreCard *)self->_base lowScoreThreshold];
  }
  return v2;
}

- (void)setUserIdentityClassification:(int64_t)a3
{
  self->_userIdentityClassification = a3;
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (int64_t)getUserIdentityClassification
{
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0) {
    return self->_userIdentityClassification;
  }
  else {
    return [(AFVoiceIdScoreCard *)self->_base userIdentityClassification];
  }
}

- (void)setUserClassified:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (id)getUserClassified
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
  {
    v2 = self->_userClassified;
  }
  else
  {
    v2 = [(AFVoiceIdScoreCard *)self->_base userClassified];
  }
  return v2;
}

- (void)setSpIdAssetVersion:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (id)getSpIdAssetVersion
{
  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_spIdAssetVersion;
  }
  else
  {
    v2 = [(AFVoiceIdScoreCard *)self->_base spIdAssetVersion];
  }
  return v2;
}

- (void)setSpIdScoreThresholdingType:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getSpIdScoreThresholdingType
{
  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_spIdScoreThresholdingType;
  }
  else
  {
    v2 = [(AFVoiceIdScoreCard *)self->_base spIdScoreThresholdingType];
  }
  return v2;
}

- (void)setSpIdUserScoresVersion:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (id)getSpIdUserScoresVersion
{
  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_spIdUserScoresVersion;
  }
  else
  {
    v2 = [(AFVoiceIdScoreCard *)self->_base spIdUserScoresVersion];
  }
  return v2;
}

- (void)setSpIdKnownUserScores:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (id)getSpIdKnownUserScores
{
  if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_spIdKnownUserScores;
  }
  else
  {
    v2 = [(AFVoiceIdScoreCard *)self->_base spIdKnownUserScores];
  }
  return v2;
}

- (void)setSpIdUnknownUserScore:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (id)getSpIdUnknownUserScore
{
  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_spIdUnknownUserScore;
  }
  else
  {
    v2 = [(AFVoiceIdScoreCard *)self->_base spIdUnknownUserScore];
  }
  return v2;
}

- (void)setSpIdAudioProcessedDuration:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (id)getSpIdAudioProcessedDuration
{
  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_spIdAudioProcessedDuration;
  }
  else
  {
    v2 = [(AFVoiceIdScoreCard *)self->_base spIdAudioProcessedDuration];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (_AFVoiceIdScoreCardMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFVoiceIdScoreCardMutation;
  v6 = [(_AFVoiceIdScoreCardMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end