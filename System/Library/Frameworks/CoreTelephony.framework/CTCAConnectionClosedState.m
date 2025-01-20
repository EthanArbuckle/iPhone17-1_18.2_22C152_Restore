@interface CTCAConnectionClosedState
+ (BOOL)supportsSecureCoding;
- (CTCAConnectionClosedState)initWithCoder:(id)a3;
- (NSDate)closedAt;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)reason;
- (unint64_t)wasActiveServices;
- (void)encodeWithCoder:(id)a3;
- (void)setClosedAt:(id)a3;
- (void)setReason:(int64_t)a3;
- (void)setWasActiveServices:(unint64_t)a3;
@end

@implementation CTCAConnectionClosedState

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", reason=%s", CTCAStewieExitReasonAsString(-[CTCAConnectionClosedState reason](self, "reason"))];
  v4 = [(CTCAConnectionClosedState *)self closedAt];
  [v3 appendFormat:@", closedAt=%@", v4];

  [v3 appendFormat:@", wasActiveServices=%lu", -[CTCAConnectionClosedState wasActiveServices](self, "wasActiveServices")];
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setReason:", -[CTCAConnectionClosedState reason](self, "reason"));
  v6 = [(CTCAConnectionClosedState *)self closedAt];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setClosedAt:v7];

  objc_msgSend(v5, "setWasActiveServices:", -[CTCAConnectionClosedState wasActiveServices](self, "wasActiveServices"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", -[CTCAConnectionClosedState reason](self, "reason"), @"reason");
  v4 = [(CTCAConnectionClosedState *)self closedAt];
  [v6 encodeObject:v4 forKey:@"closedAt"];

  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CTCAConnectionClosedState wasActiveServices](self, "wasActiveServices"));
  [v6 encodeObject:v5 forKey:@"wasActiveServices"];
}

- (CTCAConnectionClosedState)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTCAConnectionClosedState;
  v5 = [(CTCAConnectionClosedState *)&v10 init];
  if (v5)
  {
    v5->_reason = [v4 decodeIntegerForKey:@"reason"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"closedAt"];
    closedAt = v5->_closedAt;
    v5->_closedAt = (NSDate *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wasActiveServices"];
    v5->_wasActiveServices = [v8 unsignedIntegerValue];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (NSDate)closedAt
{
  return self->_closedAt;
}

- (void)setClosedAt:(id)a3
{
}

- (unint64_t)wasActiveServices
{
  return self->_wasActiveServices;
}

- (void)setWasActiveServices:(unint64_t)a3
{
  self->_wasActiveServices = a3;
}

- (void).cxx_destruct
{
}

@end