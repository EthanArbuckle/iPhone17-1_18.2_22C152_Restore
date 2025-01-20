@interface NWConcrete_nw_flow_final_read
- (void)dealloc;
@end

@implementation NWConcrete_nw_flow_final_read

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NWConcrete_nw_flow_final_read;
  [(NWConcrete_nw_flow_final_read *)&v2 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->error, 0);
  objc_storeStrong((id *)&self->content_context, 0);

  objc_storeStrong((id *)&self->content, 0);
}

@end