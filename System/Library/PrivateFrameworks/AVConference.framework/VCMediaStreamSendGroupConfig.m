@interface VCMediaStreamSendGroupConfig
- (AVCStatisticsCollector)statisticsCollector;
- (BOOL)shouldSynchronizeWithSourceRTPTimestamps;
- (BOOL)streamGroupRedundancyControlEnabled;
- (VCRedundancyControllerProtocol)redundancyController;
- (unsigned)redundancyMode;
- (unsigned)redundancyPercentage;
- (unsigned)streamGroupMode;
- (void)dealloc;
- (void)setRedundancyController:(id)a3;
- (void)setRedundancyMode:(unsigned int)a3;
- (void)setRedundancyPercentage:(unsigned int)a3;
- (void)setShouldSynchronizeWithSourceRTPTimestamps:(BOOL)a3;
- (void)setStatisticsCollector:(id)a3;
- (void)setStreamGroupMode:(unsigned int)a3;
- (void)setStreamGroupRedundancyControlEnabled:(BOOL)a3;
@end

@implementation VCMediaStreamSendGroupConfig

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaStreamSendGroupConfig;
  [(VCMediaStreamGroupConfig *)&v3 dealloc];
}

- (BOOL)shouldSynchronizeWithSourceRTPTimestamps
{
  return self->_shouldSynchronizeWithSourceRTPTimestamps;
}

- (void)setShouldSynchronizeWithSourceRTPTimestamps:(BOOL)a3
{
  self->_shouldSynchronizeWithSourceRTPTimestamps = a3;
}

- (unsigned)streamGroupMode
{
  return self->_streamGroupMode;
}

- (void)setStreamGroupMode:(unsigned int)a3
{
  self->_streamGroupMode = a3;
}

- (unsigned)redundancyMode
{
  return self->_redundancyMode;
}

- (void)setRedundancyMode:(unsigned int)a3
{
  self->_redundancyMode = a3;
}

- (unsigned)redundancyPercentage
{
  return self->_redundancyPercentage;
}

- (void)setRedundancyPercentage:(unsigned int)a3
{
  self->_redundancyPercentage = a3;
}

- (AVCStatisticsCollector)statisticsCollector
{
  return self->_statisticsCollector;
}

- (void)setStatisticsCollector:(id)a3
{
}

- (BOOL)streamGroupRedundancyControlEnabled
{
  return self->_streamGroupRedundancyControlEnabled;
}

- (void)setStreamGroupRedundancyControlEnabled:(BOOL)a3
{
  self->_streamGroupRedundancyControlEnabled = a3;
}

- (VCRedundancyControllerProtocol)redundancyController
{
  return self->_redundancyController;
}

- (void)setRedundancyController:(id)a3
{
}

@end