@interface CXPlayDTMFCallAction
+ (BOOL)supportsSecureCoding;
- (CXPlayDTMFCallAction)initWithCallUUID:(NSUUID *)callUUID digits:(NSString *)digits type:(CXPlayDTMFCallActionType)type;
- (CXPlayDTMFCallAction)initWithCoder:(NSCoder *)aDecoder;
- (CXPlayDTMFCallActionType)type;
- (NSString)digits;
- (id)customDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setDigits:(NSString *)digits;
- (void)setType:(CXPlayDTMFCallActionType)type;
- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXPlayDTMFCallAction

- (CXPlayDTMFCallAction)initWithCallUUID:(NSUUID *)callUUID digits:(NSString *)digits type:(CXPlayDTMFCallActionType)type
{
  v8 = digits;
  v13.receiver = self;
  v13.super_class = (Class)CXPlayDTMFCallAction;
  v9 = [(CXCallAction *)&v13 initWithCallUUID:callUUID];
  if (v9)
  {
    if (!v8) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXPlayDTMFCallAction initWithCallUUID:digits:type:]", @"digits" format];
    }
    uint64_t v10 = [(NSString *)v8 copy];
    v11 = v9->_digits;
    v9->_digits = (NSString *)v10;

    v9->_type = type;
  }

  return v9;
}

- (id)customDescription
{
  v6.receiver = self;
  v6.super_class = (Class)CXPlayDTMFCallAction;
  v3 = [(CXCallAction *)&v6 customDescription];
  v4 = [(CXPlayDTMFCallAction *)self digits];
  [v3 appendFormat:@" digits=%@", v4];

  objc_msgSend(v3, "appendFormat:", @" type=%ld", -[CXPlayDTMFCallAction type](self, "type"));

  return v3;
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CXPlayDTMFCallAction;
  id v6 = a3;
  [(CXCallAction *)&v8 updateSanitizedCopy:v6 withZone:a4];
  v7 = [(CXPlayDTMFCallAction *)self digits];
  [v6 setDigits:v7];

  objc_msgSend(v6, "setType:", -[CXPlayDTMFCallAction type](self, "type"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXPlayDTMFCallAction)initWithCoder:(NSCoder *)aDecoder
{
  v4 = aDecoder;
  v12.receiver = self;
  v12.super_class = (Class)CXPlayDTMFCallAction;
  v5 = [(CXCallAction *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_digits);
    uint64_t v8 = [(NSCoder *)v4 decodeObjectOfClass:v6 forKey:v7];
    digits = v5->_digits;
    v5->_digits = (NSString *)v8;

    uint64_t v10 = NSStringFromSelector(sel_type);
    v5->_type = [(NSCoder *)v4 decodeIntegerForKey:v10];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CXPlayDTMFCallAction;
  id v4 = a3;
  [(CXCallAction *)&v9 encodeWithCoder:v4];
  v5 = [(CXPlayDTMFCallAction *)self digits];
  uint64_t v6 = NSStringFromSelector(sel_digits);
  [v4 encodeObject:v5 forKey:v6];

  CXPlayDTMFCallActionType v7 = [(CXPlayDTMFCallAction *)self type];
  uint64_t v8 = NSStringFromSelector(sel_type);
  [v4 encodeInteger:v7 forKey:v8];
}

- (NSString)digits
{
  return self->_digits;
}

- (void)setDigits:(NSString *)digits
{
}

- (CXPlayDTMFCallActionType)type
{
  return self->_type;
}

- (void)setType:(CXPlayDTMFCallActionType)type
{
  self->_type = type;
}

- (void).cxx_destruct
{
}

@end