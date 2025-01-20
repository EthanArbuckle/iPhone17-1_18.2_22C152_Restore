@interface BLSHFlipbookRequestDatesTelemetryData
- (BLSHFlipbookRequestDatesTelemetryData)initWithTimestamp:(double)a3 environmentIdentifiers:(id)a4 shortestInterval:(double)a5 averageInterval:(double)a6 longestInterval:(double)a7 completionDuration:(double)a8 didReset:(BOOL)a9 timedOutCount:(unsigned int)a10;
- (BOOL)didReset;
- (NSArray)environmentIdentifiers;
- (NSString)firstEnvironmentIdentifier;
- (double)averageInterval;
- (double)completionDuration;
- (double)longestInterval;
- (double)shortestInterval;
- (double)timestamp;
- (id)description;
- (unint64_t)timedOutCount;
- (unsigned)environmentCount;
@end

@implementation BLSHFlipbookRequestDatesTelemetryData

- (BLSHFlipbookRequestDatesTelemetryData)initWithTimestamp:(double)a3 environmentIdentifiers:(id)a4 shortestInterval:(double)a5 averageInterval:(double)a6 longestInterval:(double)a7 completionDuration:(double)a8 didReset:(BOOL)a9 timedOutCount:(unsigned int)a10
{
  id v19 = a4;
  v23.receiver = self;
  v23.super_class = (Class)BLSHFlipbookRequestDatesTelemetryData;
  v20 = [(BLSHFlipbookRequestDatesTelemetryData *)&v23 init];
  v21 = v20;
  if (v20)
  {
    v20->_timestamp = a3;
    objc_storeStrong((id *)&v20->_environmentIdentifiers, a4);
    v21->_shortestInterval = a5;
    v21->_averageInterval = a6;
    v21->_longestInterval = a7;
    v21->_completionDuration = a8;
    v21->_didReset = a9;
    v21->_timedOutCount = a10;
  }

  return v21;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = BLSShortLoggingStringForContinuousMachTime();
  id v5 = (id)[v3 appendObject:v4 withName:@"timestamp"];

  id v6 = (id)[v3 appendTimeInterval:@"shortestInterval" withName:1 decomposeUnits:self->_shortestInterval];
  id v7 = (id)[v3 appendTimeInterval:@"averageInterval" withName:1 decomposeUnits:self->_averageInterval];
  id v8 = (id)[v3 appendTimeInterval:@"longestInterval" withName:1 decomposeUnits:self->_longestInterval];
  id v9 = (id)[v3 appendTimeInterval:@"completionDuration" withName:1 decomposeUnits:self->_completionDuration];
  id v10 = (id)[v3 appendBool:self->_didReset withName:@"didReset"];
  id v11 = (id)[v3 appendUnsignedInteger:self->_timedOutCount withName:@"timedOutCount"];
  [v3 appendArraySection:self->_environmentIdentifiers withName:@"environments" skipIfEmpty:1];
  v12 = [v3 build];

  return v12;
}

- (NSString)firstEnvironmentIdentifier
{
  return (NSString *)[(NSArray *)self->_environmentIdentifiers firstObject];
}

- (unsigned)environmentCount
{
  return [(NSArray *)self->_environmentIdentifiers count];
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSArray)environmentIdentifiers
{
  return self->_environmentIdentifiers;
}

- (double)shortestInterval
{
  return self->_shortestInterval;
}

- (double)averageInterval
{
  return self->_averageInterval;
}

- (double)longestInterval
{
  return self->_longestInterval;
}

- (double)completionDuration
{
  return self->_completionDuration;
}

- (BOOL)didReset
{
  return self->_didReset;
}

- (unint64_t)timedOutCount
{
  return self->_timedOutCount;
}

- (void).cxx_destruct
{
}

@end