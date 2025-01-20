@interface CTPhoneNumberInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEditable;
- (BOOL)isPresent;
- (BOOL)isRead;
- (CTPhoneNumberInfo)initWithCoder:(id)a3;
- (NSString)displayPhoneNumber;
- (NSString)label;
- (NSString)number;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayPhoneNumber:(id)a3;
- (void)setIsEditable:(BOOL)a3;
- (void)setIsPresent:(BOOL)a3;
- (void)setIsRead:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setNumber:(id)a3;
@end

@implementation CTPhoneNumberInfo

- (CTPhoneNumberInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTPhoneNumberInfo;
  v5 = [(CTPhoneNumberInfo *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"number"];
    number = v5->_number;
    v5->_number = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayPhoneNumber"];
    displayPhoneNumber = v5->_displayPhoneNumber;
    v5->_displayPhoneNumber = (NSString *)v10;

    v5->_isPresent = [v4 decodeBoolForKey:@"isPresent"];
    v5->_isEditable = [v4 decodeBoolForKey:@"isEditable"];
    v5->_isRead = [v4 decodeBoolForKey:@"isRead"];
  }

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = [(CTPhoneNumberInfo *)self label];
  [v3 appendFormat:@", label=%@", v4];

  v5 = [(CTPhoneNumberInfo *)self number];
  [v3 appendFormat:@", number=%@", v5];

  uint64_t v6 = [(CTPhoneNumberInfo *)self displayPhoneNumber];
  [v3 appendFormat:@", displayPhoneNumber=%@", v6];

  [v3 appendFormat:@", isPresent=%d", -[CTPhoneNumberInfo isPresent](self, "isPresent")];
  [v3 appendFormat:@", isEditable=%d", -[CTPhoneNumberInfo isEditable](self, "isEditable")];
  [v3 appendFormat:@", isRead=%d", -[CTPhoneNumberInfo isRead](self, "isRead")];
  [v3 appendString:@">"];

  return v3;
}

- (NSString)number
{
  return self->_number;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(CTPhoneNumberInfo *)self label];
  [v7 encodeObject:v4 forKey:@"label"];

  v5 = [(CTPhoneNumberInfo *)self number];
  [v7 encodeObject:v5 forKey:@"number"];

  uint64_t v6 = [(CTPhoneNumberInfo *)self displayPhoneNumber];
  [v7 encodeObject:v6 forKey:@"displayPhoneNumber"];

  objc_msgSend(v7, "encodeBool:forKey:", -[CTPhoneNumberInfo isPresent](self, "isPresent"), @"isPresent");
  objc_msgSend(v7, "encodeBool:forKey:", -[CTPhoneNumberInfo isEditable](self, "isEditable"), @"isEditable");
  objc_msgSend(v7, "encodeBool:forKey:", -[CTPhoneNumberInfo isRead](self, "isRead"), @"isRead");
}

- (NSString)displayPhoneNumber
{
  return self->_displayPhoneNumber;
}

- (NSString)label
{
  return self->_label;
}

- (BOOL)isRead
{
  return self->_isRead;
}

- (BOOL)isPresent
{
  return self->_isPresent;
}

- (BOOL)isEditable
{
  return self->_isEditable;
}

- (void)setIsRead:(BOOL)a3
{
  self->_isRead = a3;
}

- (void)setIsPresent:(BOOL)a3
{
  self->_isPresent = a3;
}

- (void)setIsEditable:(BOOL)a3
{
  self->_isEditable = a3;
}

- (void)setNumber:(id)a3
{
}

- (void)setLabel:(id)a3
{
}

- (void)setDisplayPhoneNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayPhoneNumber, 0);
  objc_storeStrong((id *)&self->_number, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CTPhoneNumberInfo *)self label];
  [v4 setLabel:v5];

  uint64_t v6 = [(CTPhoneNumberInfo *)self number];
  [v4 setNumber:v6];

  id v7 = [(CTPhoneNumberInfo *)self displayPhoneNumber];
  [v4 setDisplayPhoneNumber:v7];

  objc_msgSend(v4, "setIsPresent:", -[CTPhoneNumberInfo isPresent](self, "isPresent"));
  objc_msgSend(v4, "setIsEditable:", -[CTPhoneNumberInfo isEditable](self, "isEditable"));
  objc_msgSend(v4, "setIsRead:", -[CTPhoneNumberInfo isRead](self, "isRead"));
  return v4;
}

@end