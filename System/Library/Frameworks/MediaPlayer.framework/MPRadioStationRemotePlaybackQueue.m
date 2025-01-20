@interface MPRadioStationRemotePlaybackQueue
+ (BOOL)supportsSecureCoding;
- (BOOL)verifyWithError:(id *)a3;
- (MPRadioStationRemotePlaybackQueue)initWithMediaRemotePlaybackQueue:(_MRSystemAppPlaybackQueue *)a3 options:(id)a4;
- (NSString)stationStringID;
- (id)description;
- (int64_t)stationID;
@end

@implementation MPRadioStationRemotePlaybackQueue

- (void).cxx_destruct
{
}

- (NSString)stationStringID
{
  return self->_stationStringID;
}

- (int64_t)stationID
{
  return self->_stationID;
}

- (BOOL)verifyWithError:(id *)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (self->_stationID || self->_stationStringID) {
    return 1;
  }
  if (a3)
  {
    uint64_t v7 = *MEMORY[0x1E4F28568];
    v8[0] = @"Radio station is invalid or not found.";
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    id v6 = (id) [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MPErrorDomain" code:100 userInfo:v5];
    *a3 = v6;
  }
  return 0;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [NSNumber numberWithLongLong:self->_stationID];
  id v6 = [v3 stringWithFormat:@"<%@ %p, stationID = %@, stationStringID = %@>", v4, self, v5, self->_stationStringID];

  return v6;
}

- (MPRadioStationRemotePlaybackQueue)initWithMediaRemotePlaybackQueue:(_MRSystemAppPlaybackQueue *)a3 options:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MPRadioStationRemotePlaybackQueue;
  uint64_t v4 = -[MPRemotePlaybackQueue initWithMediaRemotePlaybackQueue:options:](&v9, sel_initWithMediaRemotePlaybackQueue_options_);
  if (v4)
  {
    int RadioStationIDType = MRSystemAppPlaybackQueueGetRadioStationIDType();
    if (RadioStationIDType == 2)
    {
      uint64_t v6 = MRSystemAppPlaybackQueueCopyRadioStationStringIdentifier();
      stationStringID = v4->_stationStringID;
      v4->_stationStringID = (NSString *)v6;
    }
    else if (RadioStationIDType == 1)
    {
      v4->_stationID = MRSystemAppPlaybackQueueGetRadioStationIntegerPID();
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end