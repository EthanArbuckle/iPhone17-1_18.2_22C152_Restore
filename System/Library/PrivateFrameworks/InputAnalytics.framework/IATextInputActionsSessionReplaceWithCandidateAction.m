@interface IATextInputActionsSessionReplaceWithCandidateAction
+ (BOOL)supportsSecureCoding;
- (BOOL)changedContent;
- (BOOL)isCapableOfTextInsertion;
- (IATextInputActionsSessionReplaceWithCandidateAction)initWithCoder:(id)a3;
- (int64_t)replaceWithCandidateType;
- (void)encodeWithCoder:(id)a3;
- (void)setReplaceWithCandidateType:(int64_t)a3;
@end

@implementation IATextInputActionsSessionReplaceWithCandidateAction

- (BOOL)changedContent
{
  return 1;
}

- (BOOL)isCapableOfTextInsertion
{
  return 1;
}

- (int64_t)replaceWithCandidateType
{
  return self->_replaceWithCandidateType;
}

- (void)setReplaceWithCandidateType:(int64_t)a3
{
  self->_replaceWithCandidateType = a3;
}

- (IATextInputActionsSessionReplaceWithCandidateAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IATextInputActionsSessionReplaceWithCandidateAction;
  v5 = [(IATextInputActionsSessionAction *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"replaceWithCandidateType");
    v5->_replaceWithCandidateType = objc_msgSend_longValue(v8, v9, v10, v11);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IATextInputActionsSessionReplaceWithCandidateAction;
  id v4 = a3;
  [(IATextInputActionsSessionAction *)&v9 encodeWithCoder:v4];
  v7 = objc_msgSend_numberWithLong_(NSNumber, v5, self->_replaceWithCandidateType, v6, v9.receiver, v9.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v7, @"replaceWithCandidateType");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end