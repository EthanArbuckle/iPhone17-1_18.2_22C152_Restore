@interface CTCallForwardingValue
+ (BOOL)supportsSecureCoding;
- (BOOL)enabled;
- (CTCallForwardingValue)initWithCoder:(id)a3;
- (NSNumber)noReplyTime;
- (NSString)saveNumber;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)clss;
- (int)reason;
- (void)encodeWithCoder:(id)a3;
- (void)setClss:(int)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setNoReplyTime:(id)a3;
- (void)setReason:(int)a3;
- (void)setSaveNumber:(id)a3;
@end

@implementation CTCallForwardingValue

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", reason=%i", -[CTCallForwardingValue reason](self, "reason")];
  [v3 appendFormat:@", clss=%i", -[CTCallForwardingValue clss](self, "clss")];
  BOOL v4 = [(CTCallForwardingValue *)self enabled];
  v5 = @"NO";
  if (v4) {
    v5 = @"YES";
  }
  [v3 appendFormat:@", enabled=%@", v5];
  v6 = [(CTCallForwardingValue *)self saveNumber];
  [v3 appendFormat:@", saveNumber=%@", v6];

  v7 = [(CTCallForwardingValue *)self noReplyTime];
  [v3 appendFormat:@", noReplyTime=%@", v7];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setReason:", -[CTCallForwardingValue reason](self, "reason"));
  objc_msgSend(v4, "setClss:", -[CTCallForwardingValue clss](self, "clss"));
  objc_msgSend(v4, "setEnabled:", -[CTCallForwardingValue enabled](self, "enabled"));
  v5 = [(CTCallForwardingValue *)self saveNumber];
  v6 = (void *)[v5 copy];
  [v4 setSaveNumber:v6];

  v7 = [(CTCallForwardingValue *)self noReplyTime];
  v8 = (void *)[v7 copy];
  [v4 setNoReplyTime:v8];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTCallForwardingValue reason](self, "reason"), @"reason");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTCallForwardingValue clss](self, "clss"), @"clss");
  objc_msgSend(v4, "encodeBool:forKey:", -[CTCallForwardingValue enabled](self, "enabled"), @"enabled");
  v5 = [(CTCallForwardingValue *)self saveNumber];
  [v4 encodeObject:v5 forKey:@"saveNumber"];

  id v6 = [(CTCallForwardingValue *)self noReplyTime];
  [v4 encodeObject:v6 forKey:@"noReplyTime"];
}

- (CTCallForwardingValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTCallForwardingValue;
  v5 = [(CTCallForwardingValue *)&v11 init];
  if (v5)
  {
    v5->_reason = [v4 decodeIntegerForKey:@"reason"];
    v5->_clss = [v4 decodeIntegerForKey:@"clss"];
    v5->_enabled = [v4 decodeBoolForKey:@"enabled"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"saveNumber"];
    saveNumber = v5->_saveNumber;
    v5->_saveNumber = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"noReplyTime"];
    noReplyTime = v5->_noReplyTime;
    v5->_noReplyTime = (NSNumber *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int)reason
{
  return self->_reason;
}

- (void)setReason:(int)a3
{
  self->_reason = a3;
}

- (int)clss
{
  return self->_clss;
}

- (void)setClss:(int)a3
{
  self->_clss = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSString)saveNumber
{
  return self->_saveNumber;
}

- (void)setSaveNumber:(id)a3
{
}

- (NSNumber)noReplyTime
{
  return self->_noReplyTime;
}

- (void)setNoReplyTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noReplyTime, 0);

  objc_storeStrong((id *)&self->_saveNumber, 0);
}

@end