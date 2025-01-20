@interface CTSweetgumUsagePlanItemVoice
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTSweetgumUsagePlanItemVoice)init;
- (CTSweetgumUsagePlanItemVoice)initWithCoder:(id)a3;
- (NSString)minutesCapacity;
- (NSString)minutesUsed;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setMinutesCapacity:(id)a3;
- (void)setMinutesUsed:(id)a3;
@end

@implementation CTSweetgumUsagePlanItemVoice

- (CTSweetgumUsagePlanItemVoice)init
{
  v7.receiver = self;
  v7.super_class = (Class)CTSweetgumUsagePlanItemVoice;
  v2 = [(CTSweetgumUsagePlanItemVoice *)&v7 init];
  v3 = v2;
  if (v2)
  {
    minutesCapacity = v2->_minutesCapacity;
    v2->_minutesCapacity = 0;

    minutesUsed = v3->_minutesUsed;
    v3->_minutesUsed = 0;
  }
  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTSweetgumUsagePlanItemVoice *)self minutesCapacity];
  [v3 appendFormat:@", minutesCapacity=%@", v4];

  v5 = [(CTSweetgumUsagePlanItemVoice *)self minutesUsed];
  [v3 appendFormat:@", minutesUsed=%@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (CTSweetgumUsagePlanItemVoice *)a3;
  if (v6 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v7 = [(CTSweetgumUsagePlanItemVoice *)self minutesCapacity];
      v8 = [(CTSweetgumUsagePlanItemVoice *)v6 minutesCapacity];
      if (v7 == v8
        || ([(CTSweetgumUsagePlanItemVoice *)self minutesCapacity],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(CTSweetgumUsagePlanItemVoice *)v6 minutesCapacity],
            v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqualToString:v4]))
      {
        v10 = [(CTSweetgumUsagePlanItemVoice *)self minutesUsed];
        v11 = [(CTSweetgumUsagePlanItemVoice *)v6 minutesUsed];
        if (v10 == v11)
        {
          char v9 = 1;
        }
        else
        {
          v12 = [(CTSweetgumUsagePlanItemVoice *)self minutesUsed];
          v13 = [(CTSweetgumUsagePlanItemVoice *)v6 minutesUsed];
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
  minutesCapacity = self->_minutesCapacity;
  id v5 = a3;
  [v5 encodeObject:minutesCapacity forKey:@"minutesCapacity"];
  [v5 encodeObject:self->_minutesUsed forKey:@"minutesUsed"];
}

- (CTSweetgumUsagePlanItemVoice)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTSweetgumUsagePlanItemVoice;
  id v5 = [(CTSweetgumUsagePlanItemVoice *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minutesCapacity"];
    minutesCapacity = v5->_minutesCapacity;
    v5->_minutesCapacity = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minutesUsed"];
    minutesUsed = v5->_minutesUsed;
    v5->_minutesUsed = (NSString *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)minutesCapacity
{
  return self->_minutesCapacity;
}

- (void)setMinutesCapacity:(id)a3
{
}

- (NSString)minutesUsed
{
  return self->_minutesUsed;
}

- (void)setMinutesUsed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minutesUsed, 0);

  objc_storeStrong((id *)&self->_minutesCapacity, 0);
}

@end