@interface CEKDisplayLinkTarget
- (CEKDisplayLinkTarget)initWithHandler:(id)a3;
- (id)handler;
- (void)displayLinkDidFire:(id)a3;
@end

@implementation CEKDisplayLinkTarget

- (void)displayLinkDidFire:(id)a3
{
  id v6 = a3;
  v4 = [(CEKDisplayLinkTarget *)self handler];

  if (v4)
  {
    v5 = [(CEKDisplayLinkTarget *)self handler];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (id)handler
{
  return self->_handler;
}

- (CEKDisplayLinkTarget)initWithHandler:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CEKDisplayLinkTarget;
  v5 = [(CEKDisplayLinkTarget *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id handler = v5->_handler;
    v5->_id handler = (id)v6;

    v8 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end