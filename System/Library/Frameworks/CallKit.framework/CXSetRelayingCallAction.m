@interface CXSetRelayingCallAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isRelaying;
- (CXSetRelayingCallAction)initWithCallUUID:(id)a3 relaying:(BOOL)a4;
- (CXSetRelayingCallAction)initWithCoder:(id)a3;
- (id)customDescription;
- (id)sanitizedCopyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setRelaying:(BOOL)a3;
- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXSetRelayingCallAction

- (CXSetRelayingCallAction)initWithCallUUID:(id)a3 relaying:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CXSetRelayingCallAction;
  result = [(CXCallAction *)&v6 initWithCallUUID:a3];
  if (result) {
    result->_relaying = a4;
  }
  return result;
}

- (id)customDescription
{
  v5.receiver = self;
  v5.super_class = (Class)CXSetRelayingCallAction;
  v3 = [(CXCallAction *)&v5 customDescription];
  objc_msgSend(v3, "appendFormat:", @" relaying=%d", -[CXSetRelayingCallAction isRelaying](self, "isRelaying"));

  return v3;
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CXSetRelayingCallAction;
  id v6 = a3;
  [(CXAction *)&v7 updateCopy:v6 withZone:a4];
  objc_msgSend(v6, "setRelaying:", -[CXSetRelayingCallAction isRelaying](self, "isRelaying", v7.receiver, v7.super_class));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSetRelayingCallAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CXSetRelayingCallAction;
  objc_super v5 = [(CXCallAction *)&v8 initWithCoder:v4];
  if (v5)
  {
    id v6 = NSStringFromSelector(sel_isRelaying);
    v5->_relaying = [v4 decodeBoolForKey:v6];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CXSetRelayingCallAction;
  id v4 = a3;
  [(CXCallAction *)&v7 encodeWithCoder:v4];
  BOOL v5 = [(CXSetRelayingCallAction *)self isRelaying];
  id v6 = NSStringFromSelector(sel_isRelaying);
  [v4 encodeBool:v5 forKey:v6];
}

- (BOOL)isRelaying
{
  return self->_relaying;
}

- (void)setRelaying:(BOOL)a3
{
  self->_relaying = a3;
}

@end