@interface Output
- (NSNumber)source;
- (NSNumber)volume;
- (NSString)outputDevice;
- (void)setOutputDevice:(id)a3;
- (void)setSource:(id)a3;
- (void)setVolume:(id)a3;
@end

@implementation Output

- (NSString)outputDevice
{
  return self->_outputDevice;
}

- (void)setOutputDevice:(id)a3
{
}

- (NSNumber)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (NSNumber)volume
{
  return self->_volume;
}

- (void)setVolume:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_source, 0);

  objc_storeStrong((id *)&self->_outputDevice, 0);
}

@end