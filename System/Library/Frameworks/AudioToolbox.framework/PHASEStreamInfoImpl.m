@interface PHASEStreamInfoImpl
- (AVAudioFormat)format;
- (NSDictionary)streamDescription;
- (PHASEStreamInfoImpl)initWithFormat:(id)a3 latencyInFrames:(unsigned int)a4;
- (PHASEStreamInfoImpl)initWithFormat:(id)a3 latencyInFrames:(unsigned int)a4 streamDescription:(id)a5;
- (unsigned)latencyInFrames;
@end

@implementation PHASEStreamInfoImpl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamDescription, 0);

  objc_storeStrong((id *)&self->_format, 0);
}

- (NSDictionary)streamDescription
{
  return self->_streamDescription;
}

- (unsigned)latencyInFrames
{
  return self->_latencyInFrames;
}

- (AVAudioFormat)format
{
  return self->_format;
}

- (PHASEStreamInfoImpl)initWithFormat:(id)a3 latencyInFrames:(unsigned int)a4 streamDescription:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PHASEStreamInfoImpl;
  v11 = [(PHASEStreamInfoImpl *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_format, a3);
    v12->_latencyInFrames = a4;
    objc_storeStrong((id *)&v12->_streamDescription, a5);
  }

  return v12;
}

- (PHASEStreamInfoImpl)initWithFormat:(id)a3 latencyInFrames:(unsigned int)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PHASEStreamInfoImpl;
  v8 = [(PHASEStreamInfoImpl *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_format, a3);
    v9->_latencyInFrames = a4;
  }

  return v9;
}

@end