@interface CTStewieEmergencyNotifyOptionMessage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEmergencyUpdateNotifyOptionMessage:(id)a3;
- (CTStewieEmergencyNotifyOptionMessage)initWithCoder:(id)a3;
- (CTStewieEmergencyNotifyOptionMessage)initWithNotifyOption:(int64_t)a3 error:(id *)a4;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)notifyOption;
- (void)encodeWithCoder:(id)a3;
- (void)setNotifyOption:(int64_t)a3;
@end

@implementation CTStewieEmergencyNotifyOptionMessage

- (CTStewieEmergencyNotifyOptionMessage)initWithNotifyOption:(int64_t)a3 error:(id *)a4
{
  v4 = self;
  v13[1] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v7 = (CTStewieEmergencyNotifyOptionMessage *)a4;
    if (!a4) {
      goto LABEL_8;
    }
    v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = @"Invalid notifyOption";
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    v7->super.isa = [v8 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v9];

LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  v11.receiver = self;
  v11.super_class = (Class)CTStewieEmergencyNotifyOptionMessage;
  v6 = [(CTStewieEmergencyNotifyOptionMessage *)&v11 init];
  if (!v6)
  {
    v4 = 0;
    goto LABEL_7;
  }
  v6->_notifyOption = a3;
  v4 = v6;
  v7 = v4;
LABEL_8:

  return v7;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  unint64_t v4 = [(CTStewieEmergencyNotifyOptionMessage *)self notifyOption];
  if (v4 > 3) {
    v5 = "???";
  }
  else {
    v5 = off_1E5263F58[v4];
  }
  [v3 appendFormat:@", notifyOption=%s", v5];
  [v3 appendString:@">"];

  return (NSString *)v3;
}

- (BOOL)isEqualToEmergencyUpdateNotifyOptionMessage:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CTStewieEmergencyNotifyOptionMessage *)self notifyOption];
  LOBYTE(v5) = v5 == [v4 notifyOption];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTStewieEmergencyNotifyOptionMessage *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CTStewieEmergencyNotifyOptionMessage *)self isEqualToEmergencyUpdateNotifyOptionMessage:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setNotifyOption:", -[CTStewieEmergencyNotifyOptionMessage notifyOption](self, "notifyOption"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieEmergencyNotifyOptionMessage notifyOption](self, "notifyOption"), @"notifyOption");
}

- (CTStewieEmergencyNotifyOptionMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CTStewieEmergencyNotifyOptionMessage;
  BOOL v5 = [(CTStewieEmergencyNotifyOptionMessage *)&v8 init];
  if (v5)
  {
    -[CTStewieEmergencyNotifyOptionMessage setNotifyOption:](v5, "setNotifyOption:", [v4 decodeIntegerForKey:@"notifyOption"]);
    v6 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)notifyOption
{
  return self->_notifyOption;
}

- (void)setNotifyOption:(int64_t)a3
{
  self->_notifyOption = a3;
}

@end