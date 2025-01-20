@interface CTCarrierSpaceUsagePlanItemMessages
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTCarrierSpaceUsagePlanItemMessages)init;
- (CTCarrierSpaceUsagePlanItemMessages)initWithCoder:(id)a3;
- (NSString)capacity;
- (NSString)used;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCapacity:(id)a3;
- (void)setUsed:(id)a3;
@end

@implementation CTCarrierSpaceUsagePlanItemMessages

- (CTCarrierSpaceUsagePlanItemMessages)init
{
  v7.receiver = self;
  v7.super_class = (Class)CTCarrierSpaceUsagePlanItemMessages;
  v2 = [(CTCarrierSpaceUsagePlanItemMessages *)&v7 init];
  v3 = v2;
  if (v2)
  {
    capacity = v2->_capacity;
    v2->_capacity = 0;

    used = v3->_used;
    v3->_used = 0;
  }
  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTCarrierSpaceUsagePlanItemMessages *)self capacity];
  [v3 appendFormat:@", capacity=%@", v4];

  v5 = [(CTCarrierSpaceUsagePlanItemMessages *)self used];
  [v3 appendFormat:@", used=%@", v5];

  [v3 appendString:@">"];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (CTCarrierSpaceUsagePlanItemMessages *)a3;
  if (v6 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v7 = [(CTCarrierSpaceUsagePlanItemMessages *)self capacity];
      v8 = [(CTCarrierSpaceUsagePlanItemMessages *)v6 capacity];
      if (v7 == v8
        || ([(CTCarrierSpaceUsagePlanItemMessages *)self capacity],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(CTCarrierSpaceUsagePlanItemMessages *)v6 capacity],
            v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqualToString:v4]))
      {
        v10 = [(CTCarrierSpaceUsagePlanItemMessages *)self used];
        v11 = [(CTCarrierSpaceUsagePlanItemMessages *)v6 used];
        if (v10 == v11)
        {
          char v9 = 1;
        }
        else
        {
          v12 = [(CTCarrierSpaceUsagePlanItemMessages *)self used];
          v13 = [(CTCarrierSpaceUsagePlanItemMessages *)v6 used];
          char v9 = [v12 isEqualToString:v13];
        }
        if (v7 == v8) {
          goto LABEL_13;
        }
      }
      else
      {
        char v9 = 0;
      }

LABEL_13:
      goto LABEL_14;
    }
    char v9 = 0;
  }
LABEL_14:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  capacity = self->_capacity;
  id v5 = a3;
  [v5 encodeObject:capacity forKey:@"capacity"];
  [v5 encodeObject:self->_used forKey:@"used"];
}

- (CTCarrierSpaceUsagePlanItemMessages)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTCarrierSpaceUsagePlanItemMessages;
  id v5 = [(CTCarrierSpaceUsagePlanItemMessages *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"capacity"];
    capacity = v5->_capacity;
    v5->_capacity = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"used"];
    used = v5->_used;
    v5->_used = (NSString *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(id)a3
{
}

- (NSString)used
{
  return self->_used;
}

- (void)setUsed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_used, 0);
  objc_storeStrong((id *)&self->_capacity, 0);
}

@end