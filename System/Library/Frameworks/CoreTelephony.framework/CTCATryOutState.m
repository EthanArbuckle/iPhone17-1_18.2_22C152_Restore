@interface CTCATryOutState
+ (BOOL)supportsSecureCoding;
- (BOOL)tryOutOfferPending;
- (CTCATryOutState)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setTryOutOfferPending:(BOOL)a3;
@end

@implementation CTCATryOutState

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  BOOL v4 = [(CTCATryOutState *)self tryOutOfferPending];
  v5 = "no";
  if (v4) {
    v5 = "yes";
  }
  [v3 appendFormat:@", tryOutOfferPending=%s", v5];
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setTryOutOfferPending:", -[CTCATryOutState tryOutOfferPending](self, "tryOutOfferPending"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CTCATryOutState tryOutOfferPending](self, "tryOutOfferPending"), @"tryOutOfferPending");
}

- (CTCATryOutState)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTCATryOutState;
  v5 = [(CTCATryOutState *)&v7 init];
  if (v5) {
    v5->_tryOutOfferPending = [v4 decodeBoolForKey:@"tryOutOfferPending"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)tryOutOfferPending
{
  return self->_tryOutOfferPending;
}

- (void)setTryOutOfferPending:(BOOL)a3
{
  self->_tryOutOfferPending = a3;
}

@end