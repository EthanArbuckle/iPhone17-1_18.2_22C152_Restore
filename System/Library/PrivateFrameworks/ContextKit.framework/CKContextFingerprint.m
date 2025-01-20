@interface CKContextFingerprint
+ (BOOL)supportsSecureCoding;
+ (id)parse:(id)a3;
- (CKContextFingerprint)initWithCoder:(id)a3;
- (id)debugDescription;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CKContextFingerprint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKContextFingerprint)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CKContextFingerprint;
  v5 = [(CKContextFingerprint *)&v7 init];
  if (v5) {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"%@ type:%i", objc_opt_class(), self->_type];
}

+ (id)parse:(id)a3
{
  id v3 = a3;
  if ([v3 rangeOfString:@"CKContextFingerprintMinHash "])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = +[CKContextFingerprintMinHash parse:v3];
  }

  return v4;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

@end