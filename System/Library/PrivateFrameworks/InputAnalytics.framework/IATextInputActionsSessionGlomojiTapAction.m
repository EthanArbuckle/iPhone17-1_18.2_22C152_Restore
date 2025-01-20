@interface IATextInputActionsSessionGlomojiTapAction
+ (BOOL)supportsSecureCoding;
- (IATextInputActionsSessionGlomojiTapAction)init;
- (IATextInputActionsSessionGlomojiTapAction)initWithCoder:(id)a3;
- (NSString)originalInputMode;
- (NSString)updatedInputMode;
- (int64_t)inputActionCount;
- (int64_t)mergeActionIfPossible:(id)a3;
- (int64_t)mergedActionsCount;
- (unint64_t)glomojiType;
- (void)encodeWithCoder:(id)a3;
- (void)setGlomojiType:(unint64_t)a3;
- (void)setMergedActionsCount:(int64_t)a3;
- (void)setOriginalInputMode:(id)a3;
- (void)setUpdatedInputMode:(id)a3;
@end

@implementation IATextInputActionsSessionGlomojiTapAction

- (IATextInputActionsSessionGlomojiTapAction)init
{
  v7.receiver = self;
  v7.super_class = (Class)IATextInputActionsSessionGlomojiTapAction;
  v2 = [(IAXPCObject *)&v7 init];
  v5 = v2;
  if (v2) {
    objc_msgSend_setMergedActionsCount_(v2, v3, 1, v4);
  }
  return v5;
}

- (int64_t)inputActionCount
{
  return 0;
}

- (int64_t)mergeActionIfPossible:(id)a3
{
  v8 = objc_msgSend_asGlomojiTap(a3, a2, (uint64_t)a3, v3);
  if (v8
    && (objc_msgSend_updatedInputMode(self, v5, v6, v7),
        v9 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_originalInputMode(v8, v10, v11, v12),
        v13 = objc_claimAutoreleasedReturnValue(),
        int isEqualToString = objc_msgSend_isEqualToString_(v9, v14, (uint64_t)v13, v15),
        v13,
        v9,
        isEqualToString))
  {
    v20 = objc_msgSend_updatedInputMode(v8, v17, v18, v19);
    objc_msgSend_setUpdatedInputMode_(self, v21, (uint64_t)v20, v22);

    uint64_t v26 = objc_msgSend_mergedActionsCount(v8, v23, v24, v25);
    uint64_t v30 = objc_msgSend_mergedActionsCount(self, v27, v28, v29);
    objc_msgSend_setMergedActionsCount_(self, v31, v30 + v26, v32);
    int64_t v33 = 1;
  }
  else
  {
    int64_t v33 = 0;
  }

  return v33;
}

- (unint64_t)glomojiType
{
  return self->_glomojiType;
}

- (void)setGlomojiType:(unint64_t)a3
{
  self->_glomojiType = a3;
}

- (NSString)originalInputMode
{
  return self->_originalInputMode;
}

- (void)setOriginalInputMode:(id)a3
{
}

- (NSString)updatedInputMode
{
  return self->_updatedInputMode;
}

- (void)setUpdatedInputMode:(id)a3
{
}

- (int64_t)mergedActionsCount
{
  return self->_mergedActionsCount;
}

- (void)setMergedActionsCount:(int64_t)a3
{
  self->_mergedActionsCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedInputMode, 0);
  objc_storeStrong((id *)&self->_originalInputMode, 0);
}

- (IATextInputActionsSessionGlomojiTapAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)IATextInputActionsSessionGlomojiTapAction;
  v5 = [(IATextInputActionsSessionAction *)&v27 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"glomojiType");
    v5->_glomojiType = objc_msgSend_unsignedLongValue(v8, v9, v10, v11);

    uint64_t v12 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, @"originalInputMode");
    originalInputMode = v5->_originalInputMode;
    v5->_originalInputMode = (NSString *)v14;

    uint64_t v16 = objc_opt_class();
    uint64_t v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, @"updatedInputMode");
    updatedInputMode = v5->_updatedInputMode;
    v5->_updatedInputMode = (NSString *)v18;

    uint64_t v20 = objc_opt_class();
    uint64_t v22 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v21, v20, @"mergedActionsCount");
    v5->_mergedActionsCount = objc_msgSend_unsignedLongValue(v22, v23, v24, v25);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)IATextInputActionsSessionGlomojiTapAction;
  id v4 = a3;
  [(IATextInputActionsSessionAction *)&v15 encodeWithCoder:v4];
  uint64_t v7 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v5, self->_glomojiType, v6, v15.receiver, v15.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v7, @"glomojiType");

  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)self->_originalInputMode, @"originalInputMode");
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)self->_updatedInputMode, @"updatedInputMode");
  v13 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v11, self->_mergedActionsCount, v12);
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v13, @"mergedActionsCount");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end