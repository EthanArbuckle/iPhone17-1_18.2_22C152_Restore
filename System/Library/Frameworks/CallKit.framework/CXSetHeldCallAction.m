@interface CXSetHeldCallAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isOnHold;
- (CXSetHeldCallAction)initWithCallUUID:(NSUUID *)callUUID onHold:(BOOL)onHold;
- (CXSetHeldCallAction)initWithCoder:(NSCoder *)aDecoder;
- (id)customDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setOnHold:(BOOL)onHold;
- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXSetHeldCallAction

- (CXSetHeldCallAction)initWithCallUUID:(NSUUID *)callUUID onHold:(BOOL)onHold
{
  v6.receiver = self;
  v6.super_class = (Class)CXSetHeldCallAction;
  result = [(CXCallAction *)&v6 initWithCallUUID:callUUID];
  if (result) {
    result->_onHold = onHold;
  }
  return result;
}

- (id)customDescription
{
  v5.receiver = self;
  v5.super_class = (Class)CXSetHeldCallAction;
  v3 = [(CXCallAction *)&v5 customDescription];
  objc_msgSend(v3, "appendFormat:", @" isOnHold=%d", -[CXSetHeldCallAction isOnHold](self, "isOnHold"));

  return v3;
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CXSetHeldCallAction;
  id v6 = a3;
  [(CXCallAction *)&v7 updateSanitizedCopy:v6 withZone:a4];
  objc_msgSend(v6, "setOnHold:", -[CXSetHeldCallAction isOnHold](self, "isOnHold", v7.receiver, v7.super_class));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSetHeldCallAction)initWithCoder:(NSCoder *)aDecoder
{
  v4 = aDecoder;
  v8.receiver = self;
  v8.super_class = (Class)CXSetHeldCallAction;
  objc_super v5 = [(CXCallAction *)&v8 initWithCoder:v4];
  if (v5)
  {
    id v6 = NSStringFromSelector(sel_isOnHold);
    v5->_onHold = [(NSCoder *)v4 decodeBoolForKey:v6];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CXSetHeldCallAction;
  id v4 = a3;
  [(CXCallAction *)&v7 encodeWithCoder:v4];
  BOOL v5 = [(CXSetHeldCallAction *)self isOnHold];
  id v6 = NSStringFromSelector(sel_isOnHold);
  [v4 encodeBool:v5 forKey:v6];
}

- (BOOL)isOnHold
{
  return self->_onHold;
}

- (void)setOnHold:(BOOL)onHold
{
  self->_onHold = onHold;
}

@end