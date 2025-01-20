@interface CXSetPlayedVoicemailAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isPlayed;
- (CXSetPlayedVoicemailAction)initWithCoder:(id)a3;
- (CXSetPlayedVoicemailAction)initWithVoicemailUUID:(id)a3 played:(BOOL)a4;
- (id)customDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setPlayed:(BOOL)a3;
- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXSetPlayedVoicemailAction

- (CXSetPlayedVoicemailAction)initWithVoicemailUUID:(id)a3 played:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CXSetPlayedVoicemailAction;
  result = [(CXVoicemailAction *)&v6 initWithVoicemailUUID:a3];
  if (result) {
    result->_played = a4;
  }
  return result;
}

- (id)customDescription
{
  v5.receiver = self;
  v5.super_class = (Class)CXSetPlayedVoicemailAction;
  v3 = [(CXVoicemailAction *)&v5 customDescription];
  objc_msgSend(v3, "appendFormat:", @" played=%d", -[CXSetPlayedVoicemailAction isPlayed](self, "isPlayed"));

  return v3;
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CXSetPlayedVoicemailAction;
  id v6 = a3;
  [(CXVoicemailAction *)&v7 updateSanitizedCopy:v6 withZone:a4];
  objc_msgSend(v6, "setPlayed:", -[CXSetPlayedVoicemailAction isPlayed](self, "isPlayed", v7.receiver, v7.super_class));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSetPlayedVoicemailAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CXSetPlayedVoicemailAction;
  objc_super v5 = [(CXVoicemailAction *)&v8 initWithCoder:v4];
  if (v5)
  {
    id v6 = NSStringFromSelector(sel_isPlayed);
    v5->_played = [v4 decodeBoolForKey:v6];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CXSetPlayedVoicemailAction;
  id v4 = a3;
  [(CXVoicemailAction *)&v7 encodeWithCoder:v4];
  BOOL v5 = [(CXSetPlayedVoicemailAction *)self isPlayed];
  id v6 = NSStringFromSelector(sel_isPlayed);
  [v4 encodeBool:v5 forKey:v6];
}

- (BOOL)isPlayed
{
  return self->_played;
}

- (void)setPlayed:(BOOL)a3
{
  self->_played = a3;
}

@end