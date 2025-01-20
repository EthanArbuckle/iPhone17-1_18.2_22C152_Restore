@interface SNMovieRemixFinalResult
- (NSArray)dspParameters;
- (SNMovieRemixFinalResult)init;
- (float)ambienceGain;
- (float)ambienceLoudness;
- (float)dialogueGain;
- (float)dialogueLoudness;
- (float)recordingLoudness;
- (unsigned)algorithmVersion;
- (void)setAlgorithmVersion:(unsigned int)a3;
- (void)setAmbienceGain:(float)a3;
- (void)setAmbienceLoudness:(float)a3;
- (void)setDialogueGain:(float)a3;
- (void)setDialogueLoudness:(float)a3;
- (void)setRecordingLoudness:(float)a3;
@end

@implementation SNMovieRemixFinalResult

- (unsigned)algorithmVersion
{
  return SNMovieRemixFinalResult.algorithmVersion.getter();
}

- (void)setAlgorithmVersion:(unsigned int)a3
{
}

- (float)dialogueGain
{
  return SNMovieRemixFinalResult.dialogueGain.getter();
}

- (void)setDialogueGain:(float)a3
{
}

- (float)ambienceGain
{
  return SNMovieRemixFinalResult.ambienceGain.getter();
}

- (void)setAmbienceGain:(float)a3
{
}

- (float)dialogueLoudness
{
  return SNMovieRemixFinalResult.dialogueLoudness.getter();
}

- (void)setDialogueLoudness:(float)a3
{
}

- (float)ambienceLoudness
{
  return SNMovieRemixFinalResult.ambienceLoudness.getter();
}

- (void)setAmbienceLoudness:(float)a3
{
}

- (float)recordingLoudness
{
  return SNMovieRemixFinalResult.recordingLoudness.getter();
}

- (void)setRecordingLoudness:(float)a3
{
}

- (NSArray)dspParameters
{
  v2 = self;
  SNMovieRemixFinalResult.dspParameters.getter();

  type metadata accessor for SNMovieRemixDSPParameter();
  v3 = (void *)sub_1DCB87C08();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (SNMovieRemixFinalResult)init
{
}

- (void).cxx_destruct
{
}

@end