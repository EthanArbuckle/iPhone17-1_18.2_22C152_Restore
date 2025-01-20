@interface CXVoicemailAction
+ (BOOL)supportsSecureCoding;
- (CXVoicemailAction)initWithCoder:(id)a3;
- (CXVoicemailAction)initWithVoicemailUUID:(id)a3;
- (NSUUID)voicemailUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customDescription;
- (id)sanitizedCopyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setVoicemailUUID:(id)a3;
- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXVoicemailAction

- (CXVoicemailAction)initWithVoicemailUUID:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CXVoicemailAction;
  v6 = [(CXAction *)&v8 init];
  if (v6)
  {
    if (!v5) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXVoicemailAction initWithVoicemailUUID:]", @"voicemailUUID" format];
    }
    objc_storeStrong((id *)&v6->_voicemailUUID, a3);
  }

  return v6;
}

- (id)customDescription
{
  v7.receiver = self;
  v7.super_class = (Class)CXVoicemailAction;
  v3 = [(CXAction *)&v7 customDescription];
  v4 = [(CXVoicemailAction *)self voicemailUUID];
  id v5 = [v4 UUIDString];
  [v3 appendFormat:@" voicemailUUID=%@", v5];

  return v3;
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CXVoicemailAction;
  id v6 = a3;
  [(CXAction *)&v8 updateSanitizedCopy:v6 withZone:a4];
  objc_super v7 = [(CXVoicemailAction *)self voicemailUUID];
  [v6 setVoicemailUUID:v7];
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  id v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v6 = [(CXVoicemailAction *)self voicemailUUID];
  objc_super v7 = (void *)[v5 initWithVoicemailUUID:v6];

  [(CXVoicemailAction *)self updateSanitizedCopy:v7 withZone:a3];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v6 = [(CXVoicemailAction *)self voicemailUUID];
  objc_super v7 = (void *)[v5 initWithVoicemailUUID:v6];

  [(CXAction *)self updateCopy:v7 withZone:a3];
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXVoicemailAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CXVoicemailAction;
  id v5 = [(CXAction *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    objc_super v7 = NSStringFromSelector(sel_voicemailUUID);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    voicemailUUID = v5->_voicemailUUID;
    v5->_voicemailUUID = (NSUUID *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CXVoicemailAction;
  id v4 = a3;
  [(CXAction *)&v7 encodeWithCoder:v4];
  id v5 = [(CXVoicemailAction *)self voicemailUUID];
  uint64_t v6 = NSStringFromSelector(sel_voicemailUUID);
  [v4 encodeObject:v5 forKey:v6];
}

- (NSUUID)voicemailUUID
{
  return self->_voicemailUUID;
}

- (void)setVoicemailUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end