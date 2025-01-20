@interface BWMetadataTimeMachineMetadataRequest
- (id)completeWithMetadata:(id)result;
- (id)description;
- (void)dealloc;
@end

@implementation BWMetadataTimeMachineMetadataRequest

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWMetadataTimeMachineMetadataRequest;
  [(BWMetadataTimeMachineRequest *)&v3 dealloc];
}

- (id)completeWithMetadata:(id)result
{
  if (result)
  {
    v2 = result;
    *((void *)result + 8) = a2;
    v3.receiver = v2;
    v3.super_class = (Class)BWMetadataTimeMachineMetadataRequest;
    return objc_msgSendSuper2(&v3, sel_complete);
  }
  return result;
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  *(_OWORD *)&time.start.value = *(_OWORD *)&self->_ptsRange.start.value;
  time.start.epoch = self->_ptsRange.start.epoch;
  Float64 Seconds = CMTimeGetSeconds(&time.start);
  long long v6 = *(_OWORD *)&self->_ptsRange.start.epoch;
  *(_OWORD *)&time.start.value = *(_OWORD *)&self->_ptsRange.start.value;
  *(_OWORD *)&time.start.epoch = v6;
  *(_OWORD *)&time.duration.timescale = *(_OWORD *)&self->_ptsRange.duration.timescale;
  CMTimeRangeGetEnd(&v9, &time);
  return (id)[v3 stringWithFormat:@"<%@ %p>: PTS range: %.3fs -> %.3fs, metadata count:%d", v4, self, *(void *)&Seconds, CMTimeGetSeconds(&v9), -[NSArray count](self->_metadataForPTSRange, "count")];
}

@end