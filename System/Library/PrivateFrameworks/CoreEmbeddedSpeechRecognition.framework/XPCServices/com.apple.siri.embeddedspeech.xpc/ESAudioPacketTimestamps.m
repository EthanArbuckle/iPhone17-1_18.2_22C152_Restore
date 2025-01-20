@interface ESAudioPacketTimestamps
- (ESAudioPacketTimestamps)initWithPacketRecordedTimeInTicks:(id)a3 packetReadyUpstreamTimeInTicks:(id)a4 packetReceivedTime:(double)a5 packetReceivedTimeInTicks:(id)a6;
- (NSNumber)packetReadyUpstreamTimeInTicks;
- (NSNumber)packetReceivedTimeInTicks;
- (NSNumber)packetRecordedTimeInTicks;
- (double)cumulativeAudioDuration;
- (double)packetReceivedTime;
- (id)description;
- (void)setCumulativeAudioDuration:(double)a3;
- (void)setPacketReadyUpstreamTimeInTicks:(id)a3;
- (void)setPacketReceivedTime:(double)a3;
- (void)setPacketReceivedTimeInTicks:(id)a3;
- (void)setPacketRecordedTimeInTicks:(id)a3;
@end

@implementation ESAudioPacketTimestamps

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packetReceivedTimeInTicks, 0);
  objc_storeStrong((id *)&self->_packetReadyUpstreamTimeInTicks, 0);

  objc_storeStrong((id *)&self->_packetRecordedTimeInTicks, 0);
}

- (void)setCumulativeAudioDuration:(double)a3
{
  self->_cumulativeAudioDuration = a3;
}

- (double)cumulativeAudioDuration
{
  return self->_cumulativeAudioDuration;
}

- (void)setPacketReceivedTimeInTicks:(id)a3
{
}

- (NSNumber)packetReceivedTimeInTicks
{
  return self->_packetReceivedTimeInTicks;
}

- (void)setPacketReceivedTime:(double)a3
{
  self->_packetReceivedTime = a3;
}

- (double)packetReceivedTime
{
  return self->_packetReceivedTime;
}

- (void)setPacketReadyUpstreamTimeInTicks:(id)a3
{
}

- (NSNumber)packetReadyUpstreamTimeInTicks
{
  return self->_packetReadyUpstreamTimeInTicks;
}

- (void)setPacketRecordedTimeInTicks:(id)a3
{
}

- (NSNumber)packetRecordedTimeInTicks
{
  return self->_packetRecordedTimeInTicks;
}

- (id)description
{
  v3 = [(NSNumber *)self->_packetRecordedTimeInTicks stringValue];
  v4 = [(NSNumber *)self->_packetReadyUpstreamTimeInTicks stringValue];
  v5 = [(NSNumber *)self->_packetReceivedTimeInTicks stringValue];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Audio packet timestamps in ticks: recorded %@, ready upstream %@, received %@; cumulative duration (sec): %f",
    v3,
    v4,
    v5,
  v6 = *(void *)&self->_cumulativeAudioDuration);

  return v6;
}

- (ESAudioPacketTimestamps)initWithPacketRecordedTimeInTicks:(id)a3 packetReadyUpstreamTimeInTicks:(id)a4 packetReceivedTime:(double)a5 packetReceivedTimeInTicks:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)ESAudioPacketTimestamps;
  v14 = [(ESAudioPacketTimestamps *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_packetRecordedTimeInTicks, a3);
    objc_storeStrong((id *)&v15->_packetReadyUpstreamTimeInTicks, a4);
    v15->_packetReceivedTime = a5;
    objc_storeStrong((id *)&v15->_packetReceivedTimeInTicks, a6);
  }

  return v15;
}

@end