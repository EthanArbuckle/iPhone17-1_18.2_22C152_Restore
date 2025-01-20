@interface NWConcrete_nw_protocol_instance_stub
- (nw_protocol)getProtocolStructure;
- (void)dealloc;
@end

@implementation NWConcrete_nw_protocol_instance_stub

- (nw_protocol)getProtocolStructure
{
  return self->protocol;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NWConcrete_nw_protocol_instance_stub;
  [(NWConcrete_nw_protocol_instance_stub *)&v2 dealloc];
}

@end