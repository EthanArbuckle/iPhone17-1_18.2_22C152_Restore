@interface CXSendMMIOrUSSDCodeAction
+ (BOOL)supportsSecureCoding;
- (CXSendMMIOrUSSDCodeAction)initWithCoder:(id)a3;
- (NSString)code;
- (NSUUID)senderIdentityUUID;
- (id)customDescription;
- (id)sanitizedCopyWithZone:(_NSZone *)a3;
- (int64_t)ttyType;
- (void)encodeWithCoder:(id)a3;
- (void)setCode:(id)a3;
- (void)setSenderIdentityUUID:(id)a3;
- (void)setTtyType:(int64_t)a3;
- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXSendMMIOrUSSDCodeAction

- (id)customDescription
{
  v7.receiver = self;
  v7.super_class = (Class)CXSendMMIOrUSSDCodeAction;
  v3 = [(CXAction *)&v7 customDescription];
  v4 = [(CXSendMMIOrUSSDCodeAction *)self code];
  [v3 appendFormat:@" code=%@", v4];

  objc_msgSend(v3, "appendFormat:", @" ttyType=%ld", -[CXSendMMIOrUSSDCodeAction ttyType](self, "ttyType"));
  v5 = [(CXSendMMIOrUSSDCodeAction *)self senderIdentityUUID];
  [v3 appendFormat:@" senderIdentityUUID=%@", v5];

  return v3;
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CXSendMMIOrUSSDCodeAction;
  id v6 = a3;
  [(CXAction *)&v9 updateCopy:v6 withZone:a4];
  objc_super v7 = [(CXSendMMIOrUSSDCodeAction *)self code];
  [v6 setCode:v7];

  objc_msgSend(v6, "setTtyType:", -[CXSendMMIOrUSSDCodeAction ttyType](self, "ttyType"));
  v8 = [(CXSendMMIOrUSSDCodeAction *)self senderIdentityUUID];
  [v6 setSenderIdentityUUID:v8];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSendMMIOrUSSDCodeAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CXSendMMIOrUSSDCodeAction;
  v5 = [(CXAction *)&v16 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    objc_super v7 = NSStringFromSelector(sel_code);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    code = v5->_code;
    v5->_code = (NSString *)v8;

    v10 = NSStringFromSelector(sel_ttyType);
    v5->_ttyType = [v4 decodeIntegerForKey:v10];

    uint64_t v11 = objc_opt_class();
    v12 = NSStringFromSelector(sel_senderIdentityUUID);
    uint64_t v13 = [v4 decodeObjectOfClass:v11 forKey:v12];
    senderIdentityUUID = v5->_senderIdentityUUID;
    v5->_senderIdentityUUID = (NSUUID *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CXSendMMIOrUSSDCodeAction;
  id v4 = a3;
  [(CXAction *)&v11 encodeWithCoder:v4];
  v5 = [(CXSendMMIOrUSSDCodeAction *)self code];
  uint64_t v6 = NSStringFromSelector(sel_code);
  [v4 encodeObject:v5 forKey:v6];

  int64_t v7 = [(CXSendMMIOrUSSDCodeAction *)self ttyType];
  uint64_t v8 = NSStringFromSelector(sel_ttyType);
  [v4 encodeInteger:v7 forKey:v8];

  objc_super v9 = [(CXSendMMIOrUSSDCodeAction *)self senderIdentityUUID];
  v10 = NSStringFromSelector(sel_senderIdentityUUID);
  [v4 encodeObject:v9 forKey:v10];
}

- (NSString)code
{
  return self->_code;
}

- (void)setCode:(id)a3
{
}

- (int64_t)ttyType
{
  return self->_ttyType;
}

- (void)setTtyType:(int64_t)a3
{
  self->_ttyType = a3;
}

- (NSUUID)senderIdentityUUID
{
  return self->_senderIdentityUUID;
}

- (void)setSenderIdentityUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderIdentityUUID, 0);

  objc_storeStrong((id *)&self->_code, 0);
}

@end