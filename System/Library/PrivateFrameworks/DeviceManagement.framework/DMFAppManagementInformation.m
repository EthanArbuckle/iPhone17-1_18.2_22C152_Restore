@interface DMFAppManagementInformation
+ (BOOL)supportsSecureCoding;
+ (id)stringForState:(unint64_t)a3;
- (DMFAppManagementInformation)initWithCoder:(id)a3;
- (NSString)displayName;
- (NSString)redemptionCode;
- (NSString)unusedRedemptionCode;
- (id)_stringForOptions:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)options;
- (unint64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setRedemptionCode:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setUnusedRedemptionCode:(id)a3;
@end

@implementation DMFAppManagementInformation

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  v4 = objc_opt_new();
  objc_msgSend(v4, "setState:", -[DMFAppManagementInformation state](self, "state"));
  objc_msgSend(v4, "setOptions:", -[DMFAppManagementInformation options](self, "options"));
  v5 = [(DMFAppManagementInformation *)self redemptionCode];
  [v4 setRedemptionCode:v5];

  v6 = [(DMFAppManagementInformation *)self unusedRedemptionCode];
  [v4 setUnusedRedemptionCode:v6];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFAppManagementInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DMFAppManagementInformation;
  v5 = [(DMFAppManagementInformation *)&v15 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
    v5->_state = [v6 integerValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"options"];
    v5->_options = [v7 integerValue];

    v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"redemptionCode"];
    redemptionCode = v5->_redemptionCode;
    v5->_redemptionCode = (NSString *)v9;

    v11 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"unusedRedemptionCode"];
    unusedRedemptionCode = v5->_unusedRedemptionCode;
    v5->_unusedRedemptionCode = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", -[DMFAppManagementInformation state](self, "state"));
  [v5 encodeObject:v6 forKey:@"state"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DMFAppManagementInformation options](self, "options"));
  [v5 encodeObject:v7 forKey:@"options"];

  v8 = [(DMFAppManagementInformation *)self redemptionCode];
  [v5 encodeObject:v8 forKey:@"redemptionCode"];

  id v9 = [(DMFAppManagementInformation *)self unusedRedemptionCode];
  [v5 encodeObject:v9 forKey:@"unusedRedemptionCode"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@:%p {\n", objc_opt_class(), self];
  id v4 = objc_msgSend((id)objc_opt_class(), "stringForState:", -[DMFAppManagementInformation state](self, "state"));
  [v3 appendFormat:@"State                  : %@\n", v4];

  id v5 = [(DMFAppManagementInformation *)self _stringForOptions:[(DMFAppManagementInformation *)self options]];
  [v3 appendFormat:@"Options                : %@\n", v5];

  v6 = [(DMFAppManagementInformation *)self redemptionCode];
  [v3 appendFormat:@"Redemption Code        : %@\n", v6];

  v7 = [(DMFAppManagementInformation *)self unusedRedemptionCode];
  [v3 appendFormat:@"Unused Redemption Code : %@\n", v7];

  [v3 appendString:@"}>"];
  v8 = (void *)[v3 copy];

  return v8;
}

+ (id)stringForState:(unint64_t)a3
{
  if (a3 > 0x12) {
    return @"Unknown";
  }
  else {
    return off_1E6372138[a3];
  }
}

- (id)_stringForOptions:(unint64_t)a3
{
  id v4 = objc_opt_new();
  id v5 = v4;
  if (!a3)
  {
    [v4 appendString:@"None"];
    goto LABEL_12;
  }
  v6 = &stru_1F18939E8;
  if (a3)
  {
    [v4 appendFormat:@"%@Remove App", &stru_1F18939E8];
    v6 = @", ";
    if ((a3 & 2) == 0)
    {
LABEL_4:
      if ((a3 & 4) == 0) {
        goto LABEL_5;
      }
LABEL_10:
      [v5 appendFormat:@"%@Prevent Backup", v6];
      v6 = @", ";
      if ((a3 & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_4;
  }
  [v5 appendFormat:@"%@Remove Keychain Group", v6];
  v6 = @", ";
  if ((a3 & 4) != 0) {
    goto LABEL_10;
  }
LABEL_5:
  if ((a3 & 8) != 0) {
LABEL_11:
  }
    [v5 appendFormat:@"%@Prevent Document Sync", v6];
LABEL_12:
  v7 = (void *)[v5 copy];

  return v7;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (NSString)redemptionCode
{
  return self->_redemptionCode;
}

- (void)setRedemptionCode:(id)a3
{
}

- (NSString)unusedRedemptionCode
{
  return self->_unusedRedemptionCode;
}

- (void)setUnusedRedemptionCode:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_unusedRedemptionCode, 0);

  objc_storeStrong((id *)&self->_redemptionCode, 0);
}

@end