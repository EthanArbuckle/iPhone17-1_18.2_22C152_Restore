@interface CATTaskMessageStart
+ (BOOL)supportsSecureCoding;
- (CATTaskMessageStart)initWithCoder:(id)a3;
- (CATTaskMessageStart)initWithTaskUUID:(id)a3 request:(id)a4;
- (CATTaskRequest)request;
- (void)encodeWithCoder:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation CATTaskMessageStart

- (CATTaskMessageStart)initWithTaskUUID:(id)a3 request:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"CATTaskMessageStart.m", 28, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)CATTaskMessageStart;
  v9 = [(CATTaskMessage *)&v13 initWithTaskUUID:v7];
  v10 = v9;
  if (v9) {
    objc_storeStrong((id *)&v9->_request, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CATTaskMessageStart)initWithCoder:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CATTaskMessageStart;
  v5 = [(CATTaskMessage *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"request"];
    request = v5->_request;
    v5->_request = (CATTaskRequest *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CATTaskMessageStart;
  id v4 = a3;
  [(CATTaskMessage *)&v6 encodeWithCoder:v4];
  v5 = [(CATTaskMessageStart *)self request];
  [v4 encodeObject:v5 forKey:@"request"];
}

- (CATTaskRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end