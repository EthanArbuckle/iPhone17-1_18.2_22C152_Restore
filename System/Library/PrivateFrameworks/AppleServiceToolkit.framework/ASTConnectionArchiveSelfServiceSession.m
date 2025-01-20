@interface ASTConnectionArchiveSelfServiceSession
- (id)endpoint;
- (id)rawBody;
- (void)setSessionId:(id)a3;
@end

@implementation ASTConnectionArchiveSelfServiceSession

- (void)setSessionId:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ASTConnectionArchiveSelfServiceSession;
  [(ASTMaterializedConnection *)&v7 setSessionId:v4];
  if (v4)
  {
    v8 = @"sessionId";
    v9[0] = v4;
    v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    rawBody = self->_rawBody;
    self->_rawBody = v5;

    [(ASTMaterializedConnection *)self addBody:self->_rawBody];
  }
}

- (id)endpoint
{
  return @"archive/session";
}

- (id)rawBody
{
  return self->_rawBody;
}

- (void).cxx_destruct
{
}

@end