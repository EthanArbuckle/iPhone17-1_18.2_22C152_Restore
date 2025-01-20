@interface CXSetGroupCallAction
+ (BOOL)supportsSecureCoding;
- (CXSetGroupCallAction)initWithCallUUID:(NSUUID *)callUUID callUUIDToGroupWith:(NSUUID *)callUUIDToGroupWith;
- (CXSetGroupCallAction)initWithCoder:(NSCoder *)aDecoder;
- (NSUUID)callUUIDToGroupWith;
- (id)customDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setCallUUIDToGroupWith:(NSUUID *)callUUIDToGroupWith;
- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXSetGroupCallAction

- (CXSetGroupCallAction)initWithCallUUID:(NSUUID *)callUUID callUUIDToGroupWith:(NSUUID *)callUUIDToGroupWith
{
  v7 = callUUIDToGroupWith;
  v11.receiver = self;
  v11.super_class = (Class)CXSetGroupCallAction;
  v8 = [(CXCallAction *)&v11 initWithCallUUID:callUUID];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_callUUIDToGroupWith, callUUIDToGroupWith);
  }

  return v9;
}

- (id)customDescription
{
  v6.receiver = self;
  v6.super_class = (Class)CXSetGroupCallAction;
  v3 = [(CXCallAction *)&v6 customDescription];
  v4 = [(CXSetGroupCallAction *)self callUUIDToGroupWith];
  [v3 appendFormat:@" callUUIDToGroupWith=%@", v4];

  return v3;
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CXSetGroupCallAction;
  id v6 = a3;
  [(CXCallAction *)&v8 updateSanitizedCopy:v6 withZone:a4];
  v7 = [(CXSetGroupCallAction *)self callUUIDToGroupWith];
  [v6 setCallUUIDToGroupWith:v7];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSetGroupCallAction)initWithCoder:(NSCoder *)aDecoder
{
  v4 = aDecoder;
  v11.receiver = self;
  v11.super_class = (Class)CXSetGroupCallAction;
  v5 = [(CXCallAction *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_callUUIDToGroupWith);
    uint64_t v8 = [(NSCoder *)v4 decodeObjectOfClass:v6 forKey:v7];
    callUUIDToGroupWith = v5->_callUUIDToGroupWith;
    v5->_callUUIDToGroupWith = (NSUUID *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CXSetGroupCallAction;
  id v4 = a3;
  [(CXCallAction *)&v7 encodeWithCoder:v4];
  v5 = [(CXSetGroupCallAction *)self callUUIDToGroupWith];
  uint64_t v6 = NSStringFromSelector(sel_callUUIDToGroupWith);
  [v4 encodeObject:v5 forKey:v6];
}

- (NSUUID)callUUIDToGroupWith
{
  return self->_callUUIDToGroupWith;
}

- (void)setCallUUIDToGroupWith:(NSUUID *)callUUIDToGroupWith
{
}

- (void).cxx_destruct
{
}

@end