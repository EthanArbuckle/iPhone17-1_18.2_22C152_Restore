@interface CSVTSecondPassLatencyMetrics
- (unint64_t)secondPassAssetLoadCompleteTime;
- (unint64_t)secondPassAssetLoadStartTime;
- (unint64_t)secondPassAssetQueryCompleteTime;
- (unint64_t)secondPassAssetQueryStartTime;
- (unint64_t)secondPassAudioStreamReadyTime;
- (unint64_t)secondPassAudioStreamStartTime;
- (unint64_t)secondPassCheckerModelKeywordDetectionEndTime;
- (unint64_t)secondPassCheckerModelKeywordDetectionStartTime;
- (unint64_t)secondPassFirstAudioPacketReceptionTime;
- (unint64_t)secondPassLastAudioPacketReceptionTime;
- (void)setSecondPassAssetLoadCompleteTime:(unint64_t)a3;
- (void)setSecondPassAssetLoadStartTime:(unint64_t)a3;
- (void)setSecondPassAssetQueryCompleteTime:(unint64_t)a3;
- (void)setSecondPassAssetQueryStartTime:(unint64_t)a3;
- (void)setSecondPassAudioStreamReadyTime:(unint64_t)a3;
- (void)setSecondPassAudioStreamStartTime:(unint64_t)a3;
- (void)setSecondPassCheckerModelKeywordDetectionEndTime:(unint64_t)a3;
- (void)setSecondPassCheckerModelKeywordDetectionStartTime:(unint64_t)a3;
- (void)setSecondPassFirstAudioPacketReceptionTime:(unint64_t)a3;
- (void)setSecondPassLastAudioPacketReceptionTime:(unint64_t)a3;
@end

@implementation CSVTSecondPassLatencyMetrics

- (void)setSecondPassCheckerModelKeywordDetectionEndTime:(unint64_t)a3
{
  self->_secondPassCheckerModelKeywordDetectionEndTime = a3;
}

- (unint64_t)secondPassCheckerModelKeywordDetectionEndTime
{
  return self->_secondPassCheckerModelKeywordDetectionEndTime;
}

- (void)setSecondPassCheckerModelKeywordDetectionStartTime:(unint64_t)a3
{
  self->_secondPassCheckerModelKeywordDetectionStartTime = a3;
}

- (unint64_t)secondPassCheckerModelKeywordDetectionStartTime
{
  return self->_secondPassCheckerModelKeywordDetectionStartTime;
}

- (void)setSecondPassLastAudioPacketReceptionTime:(unint64_t)a3
{
  self->_secondPassLastAudioPacketReceptionTime = a3;
}

- (unint64_t)secondPassLastAudioPacketReceptionTime
{
  return self->_secondPassLastAudioPacketReceptionTime;
}

- (void)setSecondPassFirstAudioPacketReceptionTime:(unint64_t)a3
{
  self->_secondPassFirstAudioPacketReceptionTime = a3;
}

- (unint64_t)secondPassFirstAudioPacketReceptionTime
{
  return self->_secondPassFirstAudioPacketReceptionTime;
}

- (void)setSecondPassAudioStreamReadyTime:(unint64_t)a3
{
  self->_secondPassAudioStreamReadyTime = a3;
}

- (unint64_t)secondPassAudioStreamReadyTime
{
  return self->_secondPassAudioStreamReadyTime;
}

- (void)setSecondPassAudioStreamStartTime:(unint64_t)a3
{
  self->_secondPassAudioStreamStartTime = a3;
}

- (unint64_t)secondPassAudioStreamStartTime
{
  return self->_secondPassAudioStreamStartTime;
}

- (void)setSecondPassAssetLoadCompleteTime:(unint64_t)a3
{
  self->_secondPassAssetLoadCompleteTime = a3;
}

- (unint64_t)secondPassAssetLoadCompleteTime
{
  return self->_secondPassAssetLoadCompleteTime;
}

- (void)setSecondPassAssetLoadStartTime:(unint64_t)a3
{
  self->_secondPassAssetLoadStartTime = a3;
}

- (unint64_t)secondPassAssetLoadStartTime
{
  return self->_secondPassAssetLoadStartTime;
}

- (void)setSecondPassAssetQueryCompleteTime:(unint64_t)a3
{
  self->_secondPassAssetQueryCompleteTime = a3;
}

- (unint64_t)secondPassAssetQueryCompleteTime
{
  return self->_secondPassAssetQueryCompleteTime;
}

- (void)setSecondPassAssetQueryStartTime:(unint64_t)a3
{
  self->_secondPassAssetQueryStartTime = a3;
}

- (unint64_t)secondPassAssetQueryStartTime
{
  return self->_secondPassAssetQueryStartTime;
}

@end