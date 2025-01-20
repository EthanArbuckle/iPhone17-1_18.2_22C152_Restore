@interface BPSMulticastDownstream
- (BOOL)completed;
- (BPSMulticast)multicast;
- (BPSMulticastDownstream)initWithMulticast:(id)a3;
- (BPSSubscriber)subscriber;
- (NSNumber)identifier;
- (id)nextEvent;
- (id)startWithSubscriber:(id)a3;
- (id)upstreamPublishers;
- (void)reset;
- (void)setIdentifier:(id)a3;
- (void)setSubscriber:(id)a3;
@end

@implementation BPSMulticastDownstream

- (BOOL)completed
{
  v2 = self;
  v3 = [(BPSMulticastDownstream *)self multicast];
  LOBYTE(v2) = [v3 completedForMulticastDownstream:v2];

  return (char)v2;
}

- (id)upstreamPublishers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BPSMulticastDownstream *)self multicast];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (BPSMulticast)multicast
{
  return self->_multicast;
}

- (id)nextEvent
{
  v3 = [(BPSMulticastDownstream *)self multicast];
  v4 = [v3 nextEventForMulticastDownstream:self];

  return v4;
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (id)startWithSubscriber:(id)a3
{
  id v4 = a3;
  [(BPSMulticastDownstream *)self setSubscriber:v4];
  v7.receiver = self;
  v7.super_class = (Class)BPSMulticastDownstream;
  v5 = [(BPSPublisher *)&v7 startWithSubscriber:v4];

  return v5;
}

- (void)reset
{
  [(BPSMulticastDownstream *)self setSubscriber:0];
  v3.receiver = self;
  v3.super_class = (Class)BPSMulticastDownstream;
  [(BPSPublisher *)&v3 reset];
}

- (void)setSubscriber:(id)a3
{
}

- (BPSSubscriber)subscriber
{
  return self->_subscriber;
}

- (void)setIdentifier:(id)a3
{
}

- (BPSMulticastDownstream)initWithMulticast:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BPSMulticastDownstream;
  v6 = [(BPSMulticastDownstream *)&v9 init];
  objc_super v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_multicast, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriber, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_multicast, 0);
}

@end