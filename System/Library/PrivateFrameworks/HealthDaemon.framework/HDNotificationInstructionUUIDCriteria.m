@interface HDNotificationInstructionUUIDCriteria
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HDNotificationInstructionUUIDCriteria)initWithCodableNotificationInstructionCriteria:(id)a3;
- (HDNotificationInstructionUUIDCriteria)initWithCoder:(id)a3;
- (HDNotificationInstructionUUIDCriteria)initWithMessageDictionary:(id)a3;
- (HDNotificationInstructionUUIDCriteria)initWithUUID:(id)a3;
- (NSUUID)UUID;
- (id)_initWithUUID:(id)a1;
- (id)_initWithUUIDString:(id)a1;
- (id)codableCriteria;
- (id)description;
- (id)messageDictionary;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDNotificationInstructionUUIDCriteria

- (HDNotificationInstructionUUIDCriteria)initWithUUID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDNotificationInstructionUUIDCriteria;
  v5 = [(HDNotificationInstructionUUIDCriteria *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;
  }
  return v5;
}

- (id)_initWithUUID:(id)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1 && v3)
  {
    a1 = (id)[a1 initWithUUID:v3];
    id v5 = a1;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_initWithUUIDString:(id)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1 && v3)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v3];
    a1 = -[HDNotificationInstructionUUIDCriteria _initWithUUID:](a1, v5);

    id v6 = a1;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDNotificationInstructionUUIDCriteria;
  if (![(HDNotificationInstructionCriteria *)&v9 isEqual:v4]) {
    goto LABEL_5;
  }
  UUID = self->_UUID;
  id v6 = (NSUUID *)v4[1];
  if (UUID == v6)
  {
    char v7 = 1;
    goto LABEL_7;
  }
  if (v6) {
    char v7 = -[NSUUID isEqual:](UUID, "isEqual:");
  }
  else {
LABEL_5:
  }
    char v7 = 0;
LABEL_7:

  return v7;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_UUID hash];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %@>", objc_opt_class(), self->_UUID];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDNotificationInstructionUUIDCriteria)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];

  id v6 = (HDNotificationInstructionUUIDCriteria *)-[HDNotificationInstructionUUIDCriteria _initWithUUID:](self, v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (HDNotificationInstructionUUIDCriteria)initWithMessageDictionary:(id)a3
{
  id v4 = objc_msgSend(a3, "hk_safeStringForKeyPath:error:", @"UUID", 0);
  id v5 = (HDNotificationInstructionUUIDCriteria *)-[HDNotificationInstructionUUIDCriteria _initWithUUIDString:](self, v4);

  return v5;
}

- (id)messageDictionary
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v5 = @"UUID";
  v2 = [(NSUUID *)self->_UUID UUIDString];
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (HDNotificationInstructionUUIDCriteria)initWithCodableNotificationInstructionCriteria:(id)a3
{
  id v4 = a3;
  if ([v4 hasUUIDString])
  {
    id v5 = [v4 uUIDString];
  }
  else
  {
    id v5 = 0;
  }
  id v6 = (HDNotificationInstructionUUIDCriteria *)-[HDNotificationInstructionUUIDCriteria _initWithUUIDString:](self, v5);

  return v6;
}

- (id)codableCriteria
{
  v6.receiver = self;
  v6.super_class = (Class)HDNotificationInstructionUUIDCriteria;
  id v3 = [(HDNotificationInstructionCriteria *)&v6 codableCriteria];
  id v4 = [(NSUUID *)self->_UUID UUIDString];
  [v3 setUUIDString:v4];

  return v3;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
}

@end