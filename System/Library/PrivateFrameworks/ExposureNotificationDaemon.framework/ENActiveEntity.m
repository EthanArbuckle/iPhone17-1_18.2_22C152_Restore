@interface ENActiveEntity
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (ENActiveEntity)initWithCoder:(id)a3;
- (ENActiveEntity)initWithEntity:(id)a3 activeStatus:(int)a4;
- (ENEntity)entity;
- (id)description;
- (int)activeStatus;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveStatus:(int)a3;
- (void)setEntity:(id)a3;
@end

@implementation ENActiveEntity

- (ENActiveEntity)initWithEntity:(id)a3 activeStatus:(int)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ENActiveEntity;
  v7 = [(ENActiveEntity *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    entity = v7->_entity;
    v7->_entity = (ENEntity *)v8;

    v7->_activeStatus = a4;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ENActiveEntity)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entity"];
  uint64_t v6 = [v4 decodeInt32ForKey:@"status"];

  v7 = [(ENActiveEntity *)self initWithEntity:v5 activeStatus:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  entity = self->_entity;
  id v5 = a3;
  [v5 encodeObject:entity forKey:@"entity"];
  [v5 encodeInt32:self->_activeStatus forKey:@"status"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([(ENEntity *)self->_entity isEqual:*((void *)v5 + 2)]) {
      BOOL v6 = self->_activeStatus == v5[2];
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(ENEntity *)self->_entity hash];
}

- (id)description
{
  uint64_t activeStatus = self->_activeStatus;
  if (activeStatus > 3) {
    v3 = "?";
  }
  else {
    v3 = off_1E69ADE08[activeStatus];
  }
  return (id)[MEMORY[0x1E4F29020] stringWithFormat:@"[ %@ ], Status: %s", self->_entity, v3];
}

- (ENEntity)entity
{
  return self->_entity;
}

- (void)setEntity:(id)a3
{
}

- (int)activeStatus
{
  return self->_activeStatus;
}

- (void)setActiveStatus:(int)a3
{
  self->_uint64_t activeStatus = a3;
}

- (void).cxx_destruct
{
}

@end