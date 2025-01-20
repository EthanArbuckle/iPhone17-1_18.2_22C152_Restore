@interface NWConcrete_nw_protocol_options
- (void)dealloc;
@end

@implementation NWConcrete_nw_protocol_options

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->legacy_parameters, 0);
  objc_storeStrong((id *)&self->proxy_next_hops, 0);
  objc_storeStrong((id *)&self->proxy_endpoint, 0);

  objc_storeStrong((id *)&self->definition, 0);
}

- (void)dealloc
{
  if (self->handle)
  {
    definition = self->definition;
    if (definition)
    {
      deallocate_options = (void (*)(void))definition->deallocate_options;
      if (deallocate_options) {
        deallocate_options();
      }
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)NWConcrete_nw_protocol_options;
  [(NWConcrete_nw_protocol_options *)&v5 dealloc];
}

@end