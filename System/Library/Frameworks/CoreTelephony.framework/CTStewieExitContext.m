@interface CTStewieExitContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTStewieExitContext)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)reason;
- (void)encodeWithCoder:(id)a3;
- (void)setReason:(int64_t)a3;
@end

@implementation CTStewieExitContext

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  int64_t v4 = [(CTStewieExitContext *)self reason];
  if ((unint64_t)(v4 - 1) > 3) {
    v5 = "CTStewieExitReasonUnknown";
  }
  else {
    v5 = off_1E5267568[v4 - 1];
  }
  [v3 appendFormat:@", reason=%s", v5];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = (CTStewieExitContext *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v5 = [(CTStewieExitContext *)self reason];
      BOOL v6 = v5 == [(CTStewieExitContext *)v4 reason];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setReason:", -[CTStewieExitContext reason](self, "reason"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieExitContext reason](self, "reason"), @"reason");
}

- (CTStewieExitContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTStewieExitContext;
  int64_t v5 = [(CTStewieExitContext *)&v7 init];
  if (v5) {
    v5->_reason = [v4 decodeIntegerForKey:@"reason"];
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

@end