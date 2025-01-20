@interface NWConcrete_nw_ws_ping_request
- (void)dealloc;
@end

@implementation NWConcrete_nw_ws_ping_request

- (void).cxx_destruct
{
  objc_storeStrong(&self->pong_handler, 0);
  objc_storeStrong((id *)&self->client_queue, 0);

  objc_storeStrong((id *)&self->contents, 0);
}

- (void)dealloc
{
  contents = self->contents;
  self->contents = 0;

  client_queue = self->client_queue;
  self->client_queue = 0;

  id pong_handler = self->pong_handler;
  self->id pong_handler = 0;

  v6.receiver = self;
  v6.super_class = (Class)NWConcrete_nw_ws_ping_request;
  [(NWConcrete_nw_ws_ping_request *)&v6 dealloc];
}

@end