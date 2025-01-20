@interface CXSetScreeningCallAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isScreening;
- (CXSetScreeningCallAction)initWithCallUUID:(id)a3 screening:(BOOL)a4;
- (CXSetScreeningCallAction)initWithCoder:(id)a3;
- (id)customDescription;
- (id)sanitizedCopyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setScreening:(BOOL)a3;
- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXSetScreeningCallAction

- (CXSetScreeningCallAction)initWithCallUUID:(id)a3 screening:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CXSetScreeningCallAction;
  result = [(CXCallAction *)&v6 initWithCallUUID:a3];
  if (result) {
    result->_screening = a4;
  }
  return result;
}

- (id)customDescription
{
  v5.receiver = self;
  v5.super_class = (Class)CXSetScreeningCallAction;
  v3 = [(CXCallAction *)&v5 customDescription];
  objc_msgSend(v3, "appendFormat:", @" screening=%d", -[CXSetScreeningCallAction isScreening](self, "isScreening"));

  return v3;
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CXSetScreeningCallAction;
  id v6 = a3;
  [(CXAction *)&v7 updateCopy:v6 withZone:a4];
  objc_msgSend(v6, "setScreening:", -[CXSetScreeningCallAction isScreening](self, "isScreening", v7.receiver, v7.super_class));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSetScreeningCallAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CXSetScreeningCallAction;
  objc_super v5 = [(CXCallAction *)&v8 initWithCoder:v4];
  if (v5)
  {
    id v6 = NSStringFromSelector(sel_isScreening);
    v5->_screening = [v4 decodeBoolForKey:v6];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CXSetScreeningCallAction;
  id v4 = a3;
  [(CXCallAction *)&v7 encodeWithCoder:v4];
  BOOL v5 = [(CXSetScreeningCallAction *)self isScreening];
  id v6 = NSStringFromSelector(sel_isScreening);
  [v4 encodeBool:v5 forKey:v6];
}

- (BOOL)isScreening
{
  return self->_screening;
}

- (void)setScreening:(BOOL)a3
{
  self->_screening = a3;
}

@end