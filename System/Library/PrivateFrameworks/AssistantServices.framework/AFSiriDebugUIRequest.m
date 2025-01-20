@interface AFSiriDebugUIRequest
+ (BOOL)supportsSecureCoding;
- (AFSiriDebugUIRequest)initWithCoder:(id)a3;
- (AFSiriDebugUIRequest)initWithMessage:(id)a3 makeAppFrontmost:(BOOL)a4;
- (BOOL)_makeAppFrontmost;
- (id)createResponse;
- (id)message;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFSiriDebugUIRequest

- (void).cxx_destruct
{
}

- (AFSiriDebugUIRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AFSiriDebugUIRequest;
  v5 = [(AFSiriRequest *)&v11 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Message"];
    uint64_t v7 = [v6 copy];
    message = v5->_message;
    v5->_message = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Frontmost"];
    v5->_frontmost = [v9 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AFSiriDebugUIRequest;
  id v4 = a3;
  [(AFSiriRequest *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_message, @"Message", v6.receiver, v6.super_class);
  v5 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_frontmost];
  [v4 encodeObject:v5 forKey:@"Frontmost"];
}

- (BOOL)_makeAppFrontmost
{
  return self->_frontmost;
}

- (id)createResponse
{
  id v2 = [(AFSiriResponse *)[AFSiriRequestSucceededResponse alloc] _initWithRequest:self];
  return v2;
}

- (id)message
{
  return self->_message;
}

- (AFSiriDebugUIRequest)initWithMessage:(id)a3 makeAppFrontmost:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AFSiriDebugUIRequest;
  uint64_t v7 = [(AFSiriRequest *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    message = v7->_message;
    v7->_message = (NSString *)v8;

    v7->_frontmost = a4;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end