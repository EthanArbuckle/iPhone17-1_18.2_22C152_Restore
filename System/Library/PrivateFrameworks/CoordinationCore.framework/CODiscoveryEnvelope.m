@interface CODiscoveryEnvelope
+ (id)envelopeWithRecord:(id)a3;
- (CODiscoveryRecord)record;
- (id)_initWithRecord:(id)a3;
- (unint64_t)received;
@end

@implementation CODiscoveryEnvelope

- (id)_initWithRecord:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CODiscoveryEnvelope;
  v6 = [(CODiscoveryEnvelope *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_record, a3);
    v7->_received = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  }

  return v7;
}

+ (id)envelopeWithRecord:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) _initWithRecord:v4];

  return v5;
}

- (CODiscoveryRecord)record
{
  return self->_record;
}

- (unint64_t)received
{
  return self->_received;
}

- (void).cxx_destruct
{
}

@end