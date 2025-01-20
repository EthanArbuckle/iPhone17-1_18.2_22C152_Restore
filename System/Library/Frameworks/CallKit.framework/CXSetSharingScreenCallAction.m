@interface CXSetSharingScreenCallAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isSharingScreen;
- (CXScreenShareAttributes)attributes;
- (CXSetSharingScreenCallAction)initWithCallUUID:(id)a3 sharingScreen:(BOOL)a4;
- (CXSetSharingScreenCallAction)initWithCoder:(id)a3;
- (id)customDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setSharingScreen:(BOOL)a3;
- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXSetSharingScreenCallAction

- (CXSetSharingScreenCallAction)initWithCallUUID:(id)a3 sharingScreen:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CXSetSharingScreenCallAction;
  result = [(CXCallAction *)&v6 initWithCallUUID:a3];
  if (result) {
    result->_sharingScreen = a4;
  }
  return result;
}

- (id)customDescription
{
  v6.receiver = self;
  v6.super_class = (Class)CXSetSharingScreenCallAction;
  v3 = [(CXCallAction *)&v6 customDescription];
  objc_msgSend(v3, "appendFormat:", @" sharingScreen=%d", -[CXSetSharingScreenCallAction isSharingScreen](self, "isSharingScreen"));
  v4 = [(CXSetSharingScreenCallAction *)self attributes];
  [v3 appendFormat:@" attributes=%@", v4];

  return v3;
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CXSetSharingScreenCallAction;
  id v6 = a3;
  [(CXCallAction *)&v9 updateSanitizedCopy:v6 withZone:a4];
  objc_msgSend(v6, "setSharingScreen:", -[CXSetSharingScreenCallAction isSharingScreen](self, "isSharingScreen", v9.receiver, v9.super_class));
  v7 = [(CXSetSharingScreenCallAction *)self attributes];
  v8 = (void *)[v7 copy];
  [v6 setAttributes:v8];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSetSharingScreenCallAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CXSetSharingScreenCallAction;
  v5 = [(CXCallAction *)&v12 initWithCoder:v4];
  if (v5)
  {
    id v6 = NSStringFromSelector(sel_isSharingScreen);
    v5->_sharingScreen = [v4 decodeBoolForKey:v6];

    uint64_t v7 = objc_opt_class();
    v8 = NSStringFromSelector(sel_attributes);
    uint64_t v9 = [v4 decodeObjectOfClass:v7 forKey:v8];
    attributes = v5->_attributes;
    v5->_attributes = (CXScreenShareAttributes *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CXSetSharingScreenCallAction;
  id v4 = a3;
  [(CXCallAction *)&v9 encodeWithCoder:v4];
  BOOL v5 = [(CXSetSharingScreenCallAction *)self isSharingScreen];
  id v6 = NSStringFromSelector(sel_isSharingScreen);
  [v4 encodeBool:v5 forKey:v6];

  uint64_t v7 = [(CXSetSharingScreenCallAction *)self attributes];
  v8 = NSStringFromSelector(sel_attributes);
  [v4 encodeObject:v7 forKey:v8];
}

- (BOOL)isSharingScreen
{
  return self->_sharingScreen;
}

- (void)setSharingScreen:(BOOL)a3
{
  self->_sharingScreen = a3;
}

- (CXScreenShareAttributes)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end