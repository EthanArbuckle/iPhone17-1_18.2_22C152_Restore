@interface CUMessageRequestEntry
- (NSDictionary)options;
- (id)handler;
- (void)setHandler:(id)a3;
- (void)setOptions:(id)a3;
@end

@implementation CUMessageRequestEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong(&self->_handler, 0);
}

- (void)setOptions:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setHandler:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

@end