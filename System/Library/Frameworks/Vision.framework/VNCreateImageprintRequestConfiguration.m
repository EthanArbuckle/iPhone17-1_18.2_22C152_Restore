@interface VNCreateImageprintRequestConfiguration
- (NSNumber)timeStamp;
- (VNCreateImageprintRequestConfiguration)initWithRequestClass:(Class)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setTimeStamp:(id)a3;
@end

@implementation VNCreateImageprintRequestConfiguration

- (void).cxx_destruct
{
}

- (void)setTimeStamp:(id)a3
{
}

- (NSNumber)timeStamp
{
  return self->_timeStamp;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNCreateImageprintRequestConfiguration;
  id v4 = [(VNImageBasedRequestConfiguration *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4) {
    [v4 setTimeStamp:self->_timeStamp];
  }
  return v5;
}

- (VNCreateImageprintRequestConfiguration)initWithRequestClass:(Class)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNCreateImageprintRequestConfiguration;
  v3 = [(VNImageBasedRequestConfiguration *)&v7 initWithRequestClass:a3];
  id v4 = v3;
  if (v3)
  {
    timeStamp = v3->_timeStamp;
    v3->_timeStamp = (NSNumber *)&unk_1EF7A7370;
  }
  return v4;
}

@end