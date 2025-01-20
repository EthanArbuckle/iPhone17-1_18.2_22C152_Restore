@interface _BlastDoorLPWalletPassMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)isEqual:(id)a3;
- (NSDate)eventDate;
- (NSDate)expirationDate;
- (NSString)name;
- (_BlastDoorLPWalletPassMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)style;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEventDate:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setName:(id)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation _BlastDoorLPWalletPassMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPWalletPassMetadata)initWithCoder:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_BlastDoorLPWalletPassMetadata;
  v5 = [(_BlastDoorLPWalletPassMetadata *)&v14 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"name");
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_style = [v4 decodeIntegerForKey:@"style"];
    uint64_t v8 = objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"eventDate");
    eventDate = v5->_eventDate;
    v5->_eventDate = (NSDate *)v8;

    uint64_t v10 = objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"expirationDate");
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", name, @"name");
  [v5 encodeInteger:self->_style forKey:@"style"];
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_eventDate, @"eventDate");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_expirationDate, @"expirationDate");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[_BlastDoorLPWalletPassMetadata allocWithZone:a3];
  if (v4)
  {
    id v5 = [(_BlastDoorLPWalletPassMetadata *)self name];
    [(_BlastDoorLPWalletPassMetadata *)v4 setName:v5];

    [(_BlastDoorLPWalletPassMetadata *)v4 setStyle:[(_BlastDoorLPWalletPassMetadata *)self style]];
    uint64_t v6 = [(_BlastDoorLPWalletPassMetadata *)self eventDate];
    [(_BlastDoorLPWalletPassMetadata *)v4 setEventDate:v6];

    v7 = [(_BlastDoorLPWalletPassMetadata *)self expirationDate];
    [(_BlastDoorLPWalletPassMetadata *)v4 setExpirationDate:v7];

    uint64_t v8 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_BlastDoorLPWalletPassMetadata;
  if ([(_BlastDoorLPWalletPassMetadata *)&v11 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v4;
      unint64_t v7 = v6[2];
      if ((!(v7 | (unint64_t)self->_name) || objc_msgSend((id)v7, "isEqual:"))
        && v6[3] == self->_style
        && ((unint64_t v8 = v6[4], !(v8 | (unint64_t)self->_eventDate)) || objc_msgSend((id)v8, "isEqual:")))
      {
        unint64_t v9 = v6[5];
        if (v9 | (unint64_t)self->_expirationDate) {
          char v5 = objc_msgSend((id)v9, "isEqual:");
        }
        else {
          char v5 = 1;
        }
      }
      else
      {
        char v5 = 0;
      }
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_name hash];
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"name", @"style", @"eventDate", @"expirationDate", 0);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (void)setEventDate:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_eventDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end