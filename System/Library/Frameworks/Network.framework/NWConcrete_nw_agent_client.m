@interface NWConcrete_nw_agent_client
- (void)dealloc;
@end

@implementation NWConcrete_nw_agent_client

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->channel, 0);
  objc_storeStrong((id *)&self->group_descriptor, 0);
  objc_storeStrong((id *)&self->browse_descriptor, 0);
  objc_storeStrong((id *)&self->advertise_descriptor, 0);
  objc_storeStrong((id *)&self->path, 0);
  objc_storeStrong((id *)&self->parameters, 0);

  objc_storeStrong((id *)&self->endpoint, 0);
}

- (void)dealloc
{
  if (self->framer_protocol)
  {
    id v3 = nw_parameters_copy_context(self->parameters);
    framer_protocol = self->framer_protocol;
    self->framer_protocol = 0;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __37__NWConcrete_nw_agent_client_dealloc__block_invoke;
    v6[3] = &__block_descriptor_40_e5_v8__0l;
    v6[4] = framer_protocol;
    nw_queue_context_async(v3, v6);
  }
  v5.receiver = self;
  v5.super_class = (Class)NWConcrete_nw_agent_client;
  [(NWConcrete_nw_agent_client *)&v5 dealloc];
}

@end