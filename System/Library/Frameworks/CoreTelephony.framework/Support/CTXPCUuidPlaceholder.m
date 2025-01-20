@interface CTXPCUuidPlaceholder
- (CTXPCUuidPlaceholder)initWithUUID:(id)a3;
- (NSUUID)uuid;
- (void)setUuid:(id)a3;
@end

@implementation CTXPCUuidPlaceholder

- (CTXPCUuidPlaceholder)initWithUUID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTXPCUuidPlaceholder;
  v6 = [(CTXPCUuidPlaceholder *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_uuid, a3);
  }

  return v7;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end