@interface HAPPGSegment
- (HAPPGFrameEnumerator)frameEnumerator;
- (HAPPGSegment)initWithBinaryRepresentation:(id)a3;
@end

@implementation HAPPGSegment

- (HAPPGSegment)initWithBinaryRepresentation:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAPPGSegment;
  v5 = [(HAPPGSegment *)&v9 init];
  uint64_t v6 = [v4 copy];
  mimosaData = v5->_mimosaData;
  v5->_mimosaData = (NSData *)v6;

  return v5;
}

- (HAPPGFrameEnumerator)frameEnumerator
{
  v2 = [[HAPPGFrameEnumerator alloc] initWithBinaryRepresentation:self->_mimosaData];
  return v2;
}

- (void).cxx_destruct
{
}

@end