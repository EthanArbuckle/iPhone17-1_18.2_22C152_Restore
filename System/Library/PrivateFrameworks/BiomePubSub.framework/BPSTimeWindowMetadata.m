@interface BPSTimeWindowMetadata
- (BPSTimeWindowMetadata)initWithDateInterval:(id)a3;
- (NSDateInterval)dateInterval;
@end

@implementation BPSTimeWindowMetadata

- (BPSTimeWindowMetadata)initWithDateInterval:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BPSTimeWindowMetadata;
  v5 = [(BPSTimeWindowMetadata *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v6;
  }
  return v5;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void).cxx_destruct
{
}

@end