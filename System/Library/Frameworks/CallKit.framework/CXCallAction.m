@interface CXCallAction
+ (BOOL)supportsSecureCoding;
- (CXCallAction)init;
- (CXCallAction)initWithCallUUID:(NSUUID *)callUUID;
- (CXCallAction)initWithCoder:(NSCoder *)aDecoder;
- (NSUUID)callUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customDescription;
- (id)sanitizedCopyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCallUUID:(id)a3;
- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXCallAction

- (CXCallAction)initWithCallUUID:(NSUUID *)callUUID
{
  v5 = callUUID;
  v8.receiver = self;
  v8.super_class = (Class)CXCallAction;
  v6 = [(CXAction *)&v8 init];
  if (v6)
  {
    if (!v5) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXCallAction initWithCallUUID:]", @"callUUID" format];
    }
    objc_storeStrong((id *)&v6->_callUUID, callUUID);
  }

  return v6;
}

- (CXCallAction)init
{
  return 0;
}

- (id)customDescription
{
  v7.receiver = self;
  v7.super_class = (Class)CXCallAction;
  v3 = [(CXAction *)&v7 customDescription];
  v4 = [(CXCallAction *)self callUUID];
  v5 = [v4 UUIDString];
  [v3 appendFormat:@" callUUID=%@", v5];

  return v3;
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CXCallAction;
  id v6 = a3;
  [(CXAction *)&v8 updateSanitizedCopy:v6 withZone:a4];
  objc_super v7 = [(CXCallAction *)self callUUID];
  [v6 setCallUUID:v7];
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v6 = [(CXCallAction *)self callUUID];
  objc_super v7 = (void *)[v5 initWithCallUUID:v6];

  [(CXCallAction *)self updateSanitizedCopy:v7 withZone:a3];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v6 = [(CXCallAction *)self callUUID];
  objc_super v7 = (void *)[v5 initWithCallUUID:v6];

  [(CXAction *)self updateCopy:v7 withZone:a3];
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXCallAction)initWithCoder:(NSCoder *)aDecoder
{
  v4 = aDecoder;
  v11.receiver = self;
  v11.super_class = (Class)CXCallAction;
  v5 = [(CXAction *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    objc_super v7 = NSStringFromSelector(sel_callUUID);
    uint64_t v8 = [(NSCoder *)v4 decodeObjectOfClass:v6 forKey:v7];
    callUUID = v5->_callUUID;
    v5->_callUUID = (NSUUID *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CXCallAction;
  id v4 = a3;
  [(CXAction *)&v7 encodeWithCoder:v4];
  v5 = [(CXCallAction *)self callUUID];
  uint64_t v6 = NSStringFromSelector(sel_callUUID);
  [v4 encodeObject:v5 forKey:v6];
}

- (NSUUID)callUUID
{
  return self->_callUUID;
}

- (void)setCallUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end