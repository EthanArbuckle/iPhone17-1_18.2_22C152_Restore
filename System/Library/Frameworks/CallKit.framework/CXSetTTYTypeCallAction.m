@interface CXSetTTYTypeCallAction
+ (BOOL)supportsSecureCoding;
- (CXSetTTYTypeCallAction)initWithCallUUID:(id)a3 ttyType:(int64_t)a4;
- (CXSetTTYTypeCallAction)initWithCoder:(id)a3;
- (id)customDescription;
- (id)sanitizedCopyWithZone:(_NSZone *)a3;
- (int64_t)ttyType;
- (void)encodeWithCoder:(id)a3;
- (void)setTtyType:(int64_t)a3;
- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXSetTTYTypeCallAction

- (CXSetTTYTypeCallAction)initWithCallUUID:(id)a3 ttyType:(int64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CXSetTTYTypeCallAction;
  result = [(CXCallAction *)&v6 initWithCallUUID:a3];
  if (result) {
    result->_ttyType = a4;
  }
  return result;
}

- (id)customDescription
{
  v5.receiver = self;
  v5.super_class = (Class)CXSetTTYTypeCallAction;
  v3 = [(CXCallAction *)&v5 customDescription];
  objc_msgSend(v3, "appendFormat:", @" ttyType=%ld", -[CXSetTTYTypeCallAction ttyType](self, "ttyType"));

  return v3;
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CXSetTTYTypeCallAction;
  id v6 = a3;
  [(CXAction *)&v7 updateCopy:v6 withZone:a4];
  objc_msgSend(v6, "setTtyType:", -[CXSetTTYTypeCallAction ttyType](self, "ttyType", v7.receiver, v7.super_class));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSetTTYTypeCallAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CXSetTTYTypeCallAction;
  objc_super v5 = [(CXCallAction *)&v8 initWithCoder:v4];
  if (v5)
  {
    id v6 = NSStringFromSelector(sel_ttyType);
    v5->_ttyType = [v4 decodeIntegerForKey:v6];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CXSetTTYTypeCallAction;
  id v4 = a3;
  [(CXCallAction *)&v7 encodeWithCoder:v4];
  int64_t v5 = [(CXSetTTYTypeCallAction *)self ttyType];
  id v6 = NSStringFromSelector(sel_ttyType);
  [v4 encodeInteger:v5 forKey:v6];
}

- (int64_t)ttyType
{
  return self->_ttyType;
}

- (void)setTtyType:(int64_t)a3
{
  self->_ttyType = a3;
}

@end