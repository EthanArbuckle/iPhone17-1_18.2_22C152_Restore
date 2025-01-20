@interface HDIDSInvitation
- (HDIDSInvitation)initWithUUID:(id)a3 fromID:(id)a4 codableObject:(id)a5;
- (NSString)fromID;
- (NSUUID)UUID;
- (id)codableObject;
@end

@implementation HDIDSInvitation

- (HDIDSInvitation)initWithUUID:(id)a3 fromID:(id)a4 codableObject:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDIDSInvitation;
  v11 = [(HDIDSInvitation *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    UUID = v11->_UUID;
    v11->_UUID = (NSUUID *)v12;

    uint64_t v14 = [v9 copy];
    fromID = v11->_fromID;
    v11->_fromID = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    id codableObject = v11->_codableObject;
    v11->_id codableObject = (id)v16;
  }
  return v11;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)fromID
{
  return self->_fromID;
}

- (id)codableObject
{
  return self->_codableObject;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_codableObject, 0);
  objc_storeStrong((id *)&self->_fromID, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end