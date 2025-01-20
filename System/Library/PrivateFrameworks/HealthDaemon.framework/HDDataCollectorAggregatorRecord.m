@interface HDDataCollectorAggregatorRecord
- (id)description;
@end

@implementation HDDataCollectorAggregatorRecord

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)HDDataCollectorAggregatorRecord;
  uint64_t v4 = [(HDDataCollectorAggregatorRecord *)&v9 description];
  v5 = (void *)v4;
  if (self->_hasSetLastSensorDatum) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  v7 = [v3 stringWithFormat:@"<%@: aggregator: %@, identifier: %@, configuration: %@, hasSetLastSensorDatum: %@, lastSensorDatum: %@>", v4, *(_OWORD *)&self->_aggregator, self->_configuration, v6, self->_lastSensorDatum];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSensorDatum, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_aggregator, 0);
}

@end