@interface OutputSpecification
- (NSNumber)channel;
- (NSNumber)mode;
- (void)setChannel:(id)a3;
- (void)setMode:(id)a3;
@end

@implementation OutputSpecification

- (NSNumber)mode
{
  return self->_mode;
}

- (void)setMode:(id)a3
{
}

- (NSNumber)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);

  objc_storeStrong((id *)&self->_mode, 0);
}

@end