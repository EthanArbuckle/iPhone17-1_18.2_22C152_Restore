@interface HMAccessoryInfoMediaState
- (BOOL)isEqual:(id)a3;
- (HMAccessoryInfoMediaState)initWithMediaIdentifier:(id)a3 volume:(double)a4 playbackState:(int64_t)a5 shuffleState:(int64_t)a6 repeatState:(int64_t)a7;
- (HMAccessoryInfoMediaState)initWithProtoData:(id)a3;
- (HMAccessoryInfoMediaState)initWithProtoPayload:(id)a3;
- (NSString)mediaIdentifier;
- (double)volume;
- (id)description;
- (id)protoData;
- (id)protoPayload;
- (int64_t)playbackState;
- (int64_t)repeatState;
- (int64_t)shuffleState;
- (unint64_t)hash;
@end

@implementation HMAccessoryInfoMediaState

- (void).cxx_destruct
{
}

- (int64_t)repeatState
{
  return self->_repeatState;
}

- (int64_t)shuffleState
{
  return self->_shuffleState;
}

- (int64_t)playbackState
{
  return self->_playbackState;
}

- (double)volume
{
  return self->_volume;
}

- (NSString)mediaIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  v3 = [(HMAccessoryInfoMediaState *)self mediaIdentifier];
  uint64_t v4 = [v3 hash];

  return [(HMAccessoryInfoMediaState *)self playbackState] ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMAccessoryInfoMediaState *)a3;
  if (self == v4)
  {
    BOOL v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      v7 = [(HMAccessoryInfoMediaState *)self mediaIdentifier];
      v8 = [(HMAccessoryInfoMediaState *)v6 mediaIdentifier];
      if (HMFEqualObjects()
        && ([(HMAccessoryInfoMediaState *)self volume],
            double v10 = v9,
            [(HMAccessoryInfoMediaState *)v6 volume],
            vabdd_f64(v10, v11) < 2.22044605e-16)
        && (int64_t v12 = [(HMAccessoryInfoMediaState *)self playbackState],
            v12 == [(HMAccessoryInfoMediaState *)v6 playbackState])
        && (int64_t v13 = [(HMAccessoryInfoMediaState *)self shuffleState],
            v13 == [(HMAccessoryInfoMediaState *)v6 shuffleState]))
      {
        int64_t v14 = [(HMAccessoryInfoMediaState *)self repeatState];
        BOOL v15 = v14 == [(HMAccessoryInfoMediaState *)v6 repeatState];
      }
      else
      {
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  return v15;
}

- (HMAccessoryInfoMediaState)initWithProtoData:(id)a3
{
  id v4 = a3;
  v5 = [[HMAccessoryInfoProtoMediaStateEvent alloc] initWithData:v4];

  v6 = [(HMAccessoryInfoMediaState *)self initWithProtoPayload:v5];
  return v6;
}

- (HMAccessoryInfoMediaState)initWithProtoPayload:(id)a3
{
  id v4 = a3;
  v5 = [v4 mediaIdentifier];
  [v4 volume];
  double v7 = v6;
  uint64_t v8 = [v4 playbackState];
  uint64_t v9 = [v4 shuffleState];
  uint64_t v10 = [v4 repeatState];

  double v11 = [(HMAccessoryInfoMediaState *)self initWithMediaIdentifier:v5 volume:v8 playbackState:v9 shuffleState:v10 repeatState:v7];
  return v11;
}

- (id)protoData
{
  v2 = [(HMAccessoryInfoMediaState *)self protoPayload];
  v3 = [v2 data];

  return v3;
}

- (id)protoPayload
{
  v3 = objc_alloc_init(HMAccessoryInfoProtoMediaStateEvent);
  id v4 = [(HMAccessoryInfoMediaState *)self mediaIdentifier];
  [(HMAccessoryInfoProtoMediaStateEvent *)v3 setMediaIdentifier:v4];

  [(HMAccessoryInfoMediaState *)self volume];
  -[HMAccessoryInfoProtoMediaStateEvent setVolume:](v3, "setVolume:");
  [(HMAccessoryInfoProtoMediaStateEvent *)v3 setRepeatState:[(HMAccessoryInfoMediaState *)self repeatState]];
  [(HMAccessoryInfoProtoMediaStateEvent *)v3 setShuffleState:[(HMAccessoryInfoMediaState *)self shuffleState]];
  [(HMAccessoryInfoProtoMediaStateEvent *)v3 setPlaybackState:[(HMAccessoryInfoMediaState *)self playbackState]];

  return v3;
}

- (id)description
{
  v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)HMAccessoryInfoMediaState;
  id v4 = [(HMAccessoryInfoMediaState *)&v13 description];
  v5 = [(HMAccessoryInfoMediaState *)self mediaIdentifier];
  double v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMAccessoryInfoMediaState playbackState](self, "playbackState"));
  double v7 = NSNumber;
  [(HMAccessoryInfoMediaState *)self volume];
  uint64_t v8 = objc_msgSend(v7, "numberWithDouble:");
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMAccessoryInfoMediaState shuffleState](self, "shuffleState"));
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMAccessoryInfoMediaState repeatState](self, "repeatState"));
  double v11 = [v3 stringWithFormat:@"%@, mID: %@, ps: %@, v: %@, sh: %@, rs: %@", v4, v5, v6, v8, v9, v10];

  return v11;
}

- (HMAccessoryInfoMediaState)initWithMediaIdentifier:(id)a3 volume:(double)a4 playbackState:(int64_t)a5 shuffleState:(int64_t)a6 repeatState:(int64_t)a7
{
  id v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMAccessoryInfoMediaState;
  objc_super v13 = [(HMAccessoryInfoMediaState *)&v17 init];
  if (v13)
  {
    uint64_t v14 = [v12 copy];
    mediaIdentifier = v13->_mediaIdentifier;
    v13->_mediaIdentifier = (NSString *)v14;

    v13->_volume = a4;
    v13->_playbackState = a5;
    v13->_shuffleState = a6;
    v13->_repeatState = a7;
  }

  return v13;
}

@end