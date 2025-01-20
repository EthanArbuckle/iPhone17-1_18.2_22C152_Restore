@interface AWSampleLogData
- (BOOL)activateMotionDetect;
- (BOOL)pollingClient;
- (BOOL)sampleSucceeded;
- (NSString)identifier;
- (unint64_t)cumulativeSamplingTime;
- (unint64_t)samplingInterval;
- (unint64_t)samplingStartTime;
- (void)setActivateMotionDetect:(BOOL)a3;
- (void)setCumulativeSamplingTime:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setPollingClient:(BOOL)a3;
- (void)setSampleSucceeded:(BOOL)a3;
- (void)setSamplingInterval:(unint64_t)a3;
- (void)setSamplingStartTime:(unint64_t)a3;
@end

@implementation AWSampleLogData

- (void).cxx_destruct
{
}

- (void)setActivateMotionDetect:(BOOL)a3
{
  self->_activateMotionDetect = a3;
}

- (BOOL)activateMotionDetect
{
  return self->_activateMotionDetect;
}

- (void)setSampleSucceeded:(BOOL)a3
{
  self->_sampleSucceeded = a3;
}

- (BOOL)sampleSucceeded
{
  return self->_sampleSucceeded;
}

- (void)setSamplingStartTime:(unint64_t)a3
{
  self->_samplingStartTime = a3;
}

- (unint64_t)samplingStartTime
{
  return self->_samplingStartTime;
}

- (void)setCumulativeSamplingTime:(unint64_t)a3
{
  self->_cumulativeSamplingTime = a3;
}

- (unint64_t)cumulativeSamplingTime
{
  return self->_cumulativeSamplingTime;
}

- (void)setPollingClient:(BOOL)a3
{
  self->_pollingClient = a3;
}

- (BOOL)pollingClient
{
  return self->_pollingClient;
}

- (void)setSamplingInterval:(unint64_t)a3
{
  self->_samplingInterval = a3;
}

- (unint64_t)samplingInterval
{
  return self->_samplingInterval;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

@end