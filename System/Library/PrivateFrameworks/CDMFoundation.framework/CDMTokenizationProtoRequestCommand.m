@interface CDMTokenizationProtoRequestCommand
- (CDMTokenizationProtoRequestCommand)initWithRequest:(id)a3;
- (CDMTokenizationProtoRequestCommand)initWithRequests:(id)a3;
- (NSArray)requests;
- (void)setRequests:(id)a3;
@end

@implementation CDMTokenizationProtoRequestCommand

- (void).cxx_destruct
{
}

- (void)setRequests:(id)a3
{
}

- (NSArray)requests
{
  return self->_requests;
}

- (CDMTokenizationProtoRequestCommand)initWithRequests:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMTokenizationProtoRequestCommand;
  v6 = [(CDMBaseCommand *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_requests, a3);
  }

  return v7;
}

- (CDMTokenizationProtoRequestCommand)initWithRequest:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMTokenizationProtoRequestCommand;
  id v5 = [(CDMBaseCommand *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObject:v4];
    requests = v5->_requests;
    v5->_requests = (NSArray *)v6;
  }
  return v5;
}

@end