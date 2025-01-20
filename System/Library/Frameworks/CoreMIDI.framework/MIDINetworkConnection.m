@interface MIDINetworkConnection
+ (MIDINetworkConnection)connectionWithHost:(MIDINetworkHost *)host;
- (MIDINetworkConnection)init;
- (MIDINetworkHost)host;
- (void)dealloc;
@end

@implementation MIDINetworkConnection

- (MIDINetworkHost)host
{
  return (MIDINetworkHost *)*(id *)self->_imp;
}

- (void)dealloc
{
  imp = (id *)self->_imp;
  if (imp)
  {

    MEMORY[0x1E01BB8C0](imp, 0x80C40B8603338);
  }
  v4.receiver = self;
  v4.super_class = (Class)MIDINetworkConnection;
  [(MIDINetworkConnection *)&v4 dealloc];
}

- (MIDINetworkConnection)init
{
  v3.receiver = self;
  v3.super_class = (Class)MIDINetworkConnection;
  if ([(MIDINetworkConnection *)&v3 init]) {
    operator new();
  }
  return 0;
}

+ (MIDINetworkConnection)connectionWithHost:(MIDINetworkHost *)host
{
  objc_super v3 = host;
  objc_super v4 = objc_alloc_init(MIDINetworkConnection);
  imp = (void **)v4->_imp;
  v6 = *imp;
  id *imp = v3;

  return v4;
}

@end