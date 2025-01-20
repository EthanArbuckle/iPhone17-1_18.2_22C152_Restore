@interface CXSetTrashedVoicemailAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isTrashed;
- (CXSetTrashedVoicemailAction)initWithCoder:(id)a3;
- (CXSetTrashedVoicemailAction)initWithVoicemailUUID:(id)a3 trashed:(BOOL)a4;
- (id)customDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setTrashed:(BOOL)a3;
- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXSetTrashedVoicemailAction

- (CXSetTrashedVoicemailAction)initWithVoicemailUUID:(id)a3 trashed:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CXSetTrashedVoicemailAction;
  result = [(CXVoicemailAction *)&v6 initWithVoicemailUUID:a3];
  if (result) {
    result->_trashed = a4;
  }
  return result;
}

- (id)customDescription
{
  v5.receiver = self;
  v5.super_class = (Class)CXSetTrashedVoicemailAction;
  v3 = [(CXVoicemailAction *)&v5 customDescription];
  objc_msgSend(v3, "appendFormat:", @" trashed=%d", -[CXSetTrashedVoicemailAction isTrashed](self, "isTrashed"));

  return v3;
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CXSetTrashedVoicemailAction;
  id v6 = a3;
  [(CXVoicemailAction *)&v7 updateSanitizedCopy:v6 withZone:a4];
  objc_msgSend(v6, "setTrashed:", -[CXSetTrashedVoicemailAction isTrashed](self, "isTrashed", v7.receiver, v7.super_class));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSetTrashedVoicemailAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CXSetTrashedVoicemailAction;
  objc_super v5 = [(CXVoicemailAction *)&v8 initWithCoder:v4];
  if (v5)
  {
    id v6 = NSStringFromSelector(sel_isTrashed);
    v5->_trashed = [v4 decodeBoolForKey:v6];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CXSetTrashedVoicemailAction;
  id v4 = a3;
  [(CXVoicemailAction *)&v7 encodeWithCoder:v4];
  BOOL v5 = [(CXSetTrashedVoicemailAction *)self isTrashed];
  id v6 = NSStringFromSelector(sel_isTrashed);
  [v4 encodeBool:v5 forKey:v6];
}

- (BOOL)isTrashed
{
  return self->_trashed;
}

- (void)setTrashed:(BOOL)a3
{
  self->_trashed = a3;
}

@end