@interface CXCallDTMFUpdate
+ (BOOL)supportsSecureCoding;
- (CXCallDTMFUpdate)initWithCoder:(id)a3;
- (CXCallDTMFUpdate)initWithDigits:(id)a3;
- (NSString)description;
- (NSString)digits;
- (NSUUID)UUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sanitizedCopy;
- (id)sanitizedCopyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDigits:(id)a3;
- (void)setUUID:(id)a3;
- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXCallDTMFUpdate

- (CXCallDTMFUpdate)initWithDigits:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CXCallDTMFUpdate;
  v5 = [(CXCallDTMFUpdate *)&v11 init];
  if (v5)
  {
    if (!v4) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXCallDTMFUpdate initWithDigits:]", @"digits" format];
    }
    uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    uint64_t v8 = [v4 copy];
    digits = v5->_digits;
    v5->_digits = (NSString *)v8;
  }
  return v5;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CXCallDTMFUpdate *)self digits];
  uint64_t v6 = [v3 stringWithFormat:@"<%@ %p digits=%@>", v4, self, v5];

  return (NSString *)v6;
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v6 = a3;
  v7 = [(CXCallDTMFUpdate *)self UUID];
  uint64_t v8 = (void *)[v7 copyWithZone:a4];
  [v6 setUUID:v8];

  id v10 = [(CXCallDTMFUpdate *)self digits];
  v9 = (void *)[v10 copyWithZone:a4];
  [v6 setDigits:v9];
}

- (id)sanitizedCopy
{
  return [(CXCallDTMFUpdate *)self sanitizedCopyWithZone:0];
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(CXCallDTMFUpdate *)self updateSanitizedCopy:v5 withZone:a3];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(CXCallDTMFUpdate *)self updateCopy:v5 withZone:a3];
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXCallDTMFUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CXCallDTMFUpdate;
  v5 = [(CXCallDTMFUpdate *)&v15 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_UUID);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v8;

    uint64_t v10 = objc_opt_class();
    objc_super v11 = NSStringFromSelector(sel_digits);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    digits = v5->_digits;
    v5->_digits = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CXCallDTMFUpdate *)self UUID];
  uint64_t v6 = NSStringFromSelector(sel_UUID);
  [v4 encodeObject:v5 forKey:v6];

  id v8 = [(CXCallDTMFUpdate *)self digits];
  v7 = NSStringFromSelector(sel_digits);
  [v4 encodeObject:v8 forKey:v7];
}

- (NSString)digits
{
  return self->_digits;
}

- (void)setDigits:(id)a3
{
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);

  objc_storeStrong((id *)&self->_digits, 0);
}

@end