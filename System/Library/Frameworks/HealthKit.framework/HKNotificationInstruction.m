@interface HKNotificationInstruction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKNotificationInstruction)initWithAction:(int64_t)a3 categoryIdentifier:(id)a4 expirationDate:(id)a5;
- (HKNotificationInstruction)initWithCoder:(id)a3;
- (NSDate)expirationDate;
- (NSString)categoryIdentifier;
- (id)description;
- (int64_t)action;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKNotificationInstruction

- (HKNotificationInstruction)initWithAction:(int64_t)a3 categoryIdentifier:(id)a4 expirationDate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HKNotificationInstruction;
  v10 = [(HKNotificationInstruction *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_action = a3;
    uint64_t v12 = [v8 copy];
    categoryIdentifier = v11->_categoryIdentifier;
    v11->_categoryIdentifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    expirationDate = v11->_expirationDate;
    v11->_expirationDate = (NSDate *)v14;
  }
  return v11;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = NSStringFromHKNotificationInstructionAction(self->_action);
  v6 = [v3 stringWithFormat:@"<%@:%@ cat:%@ expires:%@", v4, v5, self->_categoryIdentifier, self->_expirationDate];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKNotificationInstruction *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (self->_action != v5->_action) {
        goto LABEL_12;
      }
      categoryIdentifier = self->_categoryIdentifier;
      v7 = v5->_categoryIdentifier;
      if (categoryIdentifier != v7 && (!v7 || !-[NSString isEqualToString:](categoryIdentifier, "isEqualToString:"))) {
        goto LABEL_12;
      }
      expirationDate = self->_expirationDate;
      id v9 = v5->_expirationDate;
      if (expirationDate == v9)
      {
        char v10 = 1;
        goto LABEL_13;
      }
      if (v9) {
        char v10 = -[NSDate isEqual:](expirationDate, "isEqual:");
      }
      else {
LABEL_12:
      }
        char v10 = 0;
LABEL_13:

      goto LABEL_14;
    }
    char v10 = 0;
  }
LABEL_14:

  return v10;
}

- (unint64_t)hash
{
  int64_t action = self->_action;
  NSUInteger v4 = [(NSString *)self->_categoryIdentifier hash] ^ action;
  return v4 ^ [(NSDate *)self->_expirationDate hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKNotificationInstruction)initWithCoder:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 decodeIntegerForKey:@"action"];
  v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"categoryIdentifier"];
  id v8 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];

  if (!v7)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HKNotificationInstruction.m", 78, @"Invalid parameter not satisfying: %@", @"categoryIdentifier" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HKNotificationInstruction.m", 79, @"Invalid parameter not satisfying: %@", @"expirationDate" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  id v9 = [(HKNotificationInstruction *)self initWithAction:v6 categoryIdentifier:v7 expirationDate:v8];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t action = self->_action;
  id v5 = a3;
  [v5 encodeInteger:action forKey:@"action"];
  [v5 encodeObject:self->_categoryIdentifier forKey:@"categoryIdentifier"];
  [v5 encodeObject:self->_expirationDate forKey:@"expirationDate"];
}

- (int64_t)action
{
  return self->_action;
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);

  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
}

@end