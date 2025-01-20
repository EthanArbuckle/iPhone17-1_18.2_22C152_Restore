@interface SSHBPresenceInputs
- (BOOL)disableGapSubtraction;
- (BOOL)frequentSampling;
- (BOOL)sendRawData;
- (BOOL)validateAndInitializeParameters:(id)a3;
- (BOOL)validateAndInitializeSpecifications:(id)a3;
- (double)sampleDuration;
- (float)acceptedDeviation;
- (void)setAcceptedDeviation:(float)a3;
- (void)setDisableGapSubtraction:(BOOL)a3;
- (void)setFrequentSampling:(BOOL)a3;
- (void)setSampleDuration:(double)a3;
- (void)setSendRawData:(BOOL)a3;
@end

@implementation SSHBPresenceInputs

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  char v6 = 0;
  v4 = [a3 dk_numberFromKey:@"acceptedDeviation" lowerBound:&off_10000CDC8 upperBound:&off_10000CDD8 defaultValue:&off_10000CDE8 failed:&v6];
  [v4 floatValue];
  -[SSHBPresenceInputs setAcceptedDeviation:](self, "setAcceptedDeviation:");

  return v6 == 0;
}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  char v7 = 0;
  id v4 = a3;
  -[SSHBPresenceInputs setFrequentSampling:[v4 dk_BOOLFromKey:@"frequentSampling" defaultValue:0 failed:&v7]];
  [self setDisableGapSubtraction:[v4 dk_BOOLFromKey:@"disableGapSubtraction" defaultValue:0 failed:&v7]];
  -[SSHBPresenceInputs setSendRawData:[self dk_BOOLFromKey:@"sendRawData" defaultValue:1 failed:&v7]];
  v5 = [v4 dk_numberFromKey:@"sampleDuration" lowerBound:&off_10000CDF8 upperBound:&off_10000CE08 defaultValue:&off_10000CE18 failed:&v7];

  [v5 doubleValue];
  -[SSHBPresenceInputs setSampleDuration:](self, "setSampleDuration:");

  return v7 == 0;
}

- (BOOL)frequentSampling
{
  return self->_frequentSampling;
}

- (void)setFrequentSampling:(BOOL)a3
{
  self->_frequentSampling = a3;
}

- (BOOL)disableGapSubtraction
{
  return self->_disableGapSubtraction;
}

- (void)setDisableGapSubtraction:(BOOL)a3
{
  self->_disableGapSubtraction = a3;
}

- (BOOL)sendRawData
{
  return self->_sendRawData;
}

- (void)setSendRawData:(BOOL)a3
{
  self->_sendRawData = a3;
}

- (double)sampleDuration
{
  return self->_sampleDuration;
}

- (void)setSampleDuration:(double)a3
{
  self->_sampleDuration = a3;
}

- (float)acceptedDeviation
{
  return self->_acceptedDeviation;
}

- (void)setAcceptedDeviation:(float)a3
{
  self->_acceptedDeviation = a3;
}

@end