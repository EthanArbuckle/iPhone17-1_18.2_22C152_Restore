@interface RESharedResourcePayload
+ (BOOL)supportsSecureCoding;
- (NSObject)clientObject;
- (RESharedResourcePayload)init;
- (RESharedResourcePayload)initWithCoder:(id)a3;
- (void)setClientObject:(id)a3;
@end

@implementation RESharedResourcePayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RESharedResourcePayload)init
{
  v3.receiver = self;
  v3.super_class = (Class)RESharedResourcePayload;
  return [(RESharedResourcePayload *)&v3 init];
}

- (RESharedResourcePayload)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RESharedResourcePayload;
  return [(RESharedResourcePayload *)&v4 init];
}

- (NSObject)clientObject
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientObject);
  return WeakRetained;
}

- (void)setClientObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end