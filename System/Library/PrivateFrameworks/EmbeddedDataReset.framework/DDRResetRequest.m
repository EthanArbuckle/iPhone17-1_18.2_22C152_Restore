@interface DDRResetRequest
+ (BOOL)supportsSecureCoding;
- (DDRResetOptions)options;
- (DDRResetRequest)initWithCoder:(id)a3;
- (DDRResetRequest)initWithMode:(int64_t)a3 options:(id)a4 reason:(id)a5;
- (NSString)reason;
- (int64_t)mode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DDRResetRequest

- (DDRResetRequest)initWithMode:(int64_t)a3 options:(id)a4 reason:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)DDRResetRequest;
  v11 = [(DDRResetRequest *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_mode = a3;
    objc_storeStrong((id *)&v11->_options, a4);
    objc_storeStrong((id *)&v12->_reason, a5);
  }

  return v12;
}

- (DDRResetRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectForKey:@"options"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"mode"];
  v7 = [v4 decodeObjectForKey:@"reason"];

  v8 = [(DDRResetRequest *)self initWithMode:v6 options:v5 reason:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  reason = self->_reason;
  id v5 = a3;
  [v5 encodeObject:reason forKey:@"reason"];
  [v5 encodeObject:self->_options forKey:@"options"];
  [v5 encodeInteger:self->_mode forKey:@"mode"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)mode
{
  return self->_mode;
}

- (DDRResetOptions)options
{
  return self->_options;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end