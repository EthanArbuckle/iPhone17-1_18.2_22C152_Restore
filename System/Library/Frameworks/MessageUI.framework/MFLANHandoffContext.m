@interface MFLANHandoffContext
- (NSString)host;
- (unsigned)port;
- (void)dealloc;
- (void)setHost:(id)a3;
- (void)setPort:(unsigned __int16)a3;
@end

@implementation MFLANHandoffContext

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFLANHandoffContext;
  [(MFLANHandoffContext *)&v3 dealloc];
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
}

- (unsigned)port
{
  return self->_port;
}

- (void)setPort:(unsigned __int16)a3
{
  self->_port = a3;
}

@end