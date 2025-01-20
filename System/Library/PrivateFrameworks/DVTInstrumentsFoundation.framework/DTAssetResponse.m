@interface DTAssetResponse
+ (BOOL)supportsSecureCoding;
+ (id)completedResponseWithIdentifier:(id)a3;
+ (id)responseWithIdentifier:(id)a3 data:(id)a4;
- (BOOL)isCompleted;
- (DTAssetResponse)initWithCoder:(id)a3;
- (DTAssetResponse)initWithIdentifier:(id)a3 data:(id)a4 completed:(BOOL)a5;
- (DTXMessage)message;
- (NSData)data;
- (NSString)identifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DTAssetResponse

+ (id)responseWithIdentifier:(id)a3 data:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v7 data:v6 completed:0];

  return v8;
}

+ (id)completedResponseWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v4 data:0 completed:1];

  return v5;
}

- (DTAssetResponse)initWithIdentifier:(id)a3 data:(id)a4 completed:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DTAssetResponse;
  v10 = [(DTAssetResponse *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    objc_storeStrong((id *)&v10->_data, a4);
    v10->_completed = a5;
  }

  return v10;
}

- (DTAssetResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  uint64_t v7 = [v4 decodeBoolForKey:@"completed"];

  id v8 = [(DTAssetResponse *)self initWithIdentifier:v5 data:v6 completed:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(DTAssetResponse *)self identifier];
  [v6 encodeObject:v4 forKey:@"identifier"];

  v5 = [(DTAssetResponse *)self data];
  [v6 encodeObject:v5 forKey:@"data"];

  [v6 encodeBool:-[DTAssetResponse isCompleted](self, "isCompleted") forKey:@"completed"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DTXMessage)message
{
  return (DTXMessage *)[MEMORY[0x263F38CA0] messageWithObject:self];
}

- (id)description
{
  v3 = NSString;
  id v4 = [(DTAssetResponse *)self identifier];
  v5 = [(DTAssetResponse *)self data];
  uint64_t v6 = [v5 length];
  BOOL v7 = [(DTAssetResponse *)self isCompleted];
  id v8 = "NO";
  if (v7) {
    id v8 = "YES";
  }
  id v9 = [v3 stringWithFormat:@"<DTAssetResponse:%@ dataLength=%lu completed:%s>", v4, v6, v8];

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSData)data
{
  return self->_data;
}

- (BOOL)isCompleted
{
  return self->_completed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end