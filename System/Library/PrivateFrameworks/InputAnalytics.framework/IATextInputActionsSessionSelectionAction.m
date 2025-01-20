@interface IATextInputActionsSessionSelectionAction
+ (BOOL)supportsSecureCoding;
- (IATextInputActionsSessionSelectionAction)initWithCoder:(id)a3;
- (_NSRange)rangeAfter;
- (id)description;
- (int64_t)mergeActionIfPossible:(id)a3;
- (int64_t)textInputActionsType;
- (void)encodeWithCoder:(id)a3;
- (void)setRangeAfter:(_NSRange)a3;
@end

@implementation IATextInputActionsSessionSelectionAction

- (int64_t)mergeActionIfPossible:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_source(self, v5, v6, v7);
  if (v8 == objc_msgSend_source(v4, v9, v10, v11)
    && (uint64_t v15 = objc_msgSend_flagOptions(self, v12, v13, v14), v15 == objc_msgSend_flagOptions(v4, v16, v17, v18)))
  {
    v25 = objc_msgSend_asSelection(v4, v19, v20, v21);
    if (v25
      && ((objc_msgSend_rangeAfter(self, v22, v23, v24), !v26)
       && (objc_msgSend_relativeRangeBefore(self, 0, v27, v28), !v26)
       && (objc_msgSend_rangeAfter(v25, 0, v27, v28), !v26)
       || (objc_msgSend_rangeAfter(self, v26, v27, v28), v29)
       && (objc_msgSend_relativeRangeBefore(self, v29, v30, v31), v32)
       && (objc_msgSend_rangeAfter(v25, v32, v33, v34), v26)))
    {
      uint64_t v35 = objc_msgSend_rangeAfter(v25, v26, v27, v28);
      objc_msgSend_setRangeAfter_(self, v36, v35, (uint64_t)v36);
      uint64_t v40 = objc_msgSend_inputActionCount(v25, v37, v38, v39);
      uint64_t v44 = objc_msgSend_inputActionCountFromMergedActions(self, v41, v42, v43);
      objc_msgSend_setInputActionCountFromMergedActions_(self, v45, v44 + v40, v46);
      int64_t v47 = 1;
    }
    else
    {
      int64_t v47 = 0;
    }
  }
  else
  {
    int64_t v47 = 0;
  }

  return v47;
}

- (id)description
{
  v25.receiver = self;
  v25.super_class = (Class)IATextInputActionsSessionSelectionAction;
  v3 = [(IATextInputActionsSessionAction *)&v25 description];
  uint64_t v7 = objc_msgSend_array(MEMORY[0x263EFF980], v4, v5, v6);
  uint64_t v8 = NSString;
  v27.location = objc_msgSend_rangeAfter(self, v9, v10, v11);
  v12 = NSStringFromRange(v27);
  uint64_t v15 = objc_msgSend_stringWithFormat_(v8, v13, @"rangeAfter=%@", v14, v12);
  objc_msgSend_addObject_(v7, v16, (uint64_t)v15, v17);

  uint64_t v20 = objc_msgSend_componentsJoinedByString_(v7, v18, @", ", v19);
  uint64_t v23 = objc_msgSend_stringByAppendingFormat_(v3, v21, @", %@", v22, v20);

  return v23;
}

- (int64_t)textInputActionsType
{
  objc_msgSend_rangeAfter(self, a2, v2, v3);
  if (v4) {
    return 9;
  }
  else {
    return 8;
  }
}

- (_NSRange)rangeAfter
{
  p_rangeAfter = &self->_rangeAfter;
  NSUInteger location = self->_rangeAfter.location;
  NSUInteger length = p_rangeAfter->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRangeAfter:(_NSRange)a3
{
  self->_rangeAfter = a3;
}

- (IATextInputActionsSessionSelectionAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)IATextInputActionsSessionSelectionAction;
  uint64_t v5 = [(IATextInputActionsSessionAction *)&v23 initWithCoder:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    p_rangeAfter = &v5->_rangeAfter;
    uint64_t v8 = objc_opt_class();
    uint64_t v10 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v8, @"rangeAfter_location");
    uint64_t v14 = objc_msgSend_unsignedLongValue(v10, v11, v12, v13);
    uint64_t v15 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, @"rangeAfter_length");
    uint64_t v21 = objc_msgSend_unsignedLongValue(v17, v18, v19, v20);
    p_rangeAfter->NSUInteger location = v14;
    v6->_rangeAfter.NSUInteger length = v21;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)IATextInputActionsSessionSelectionAction;
  id v4 = a3;
  [(IATextInputActionsSessionAction *)&v14 encodeWithCoder:v4];
  p_rangeAfter = &self->_rangeAfter;
  uint64_t v8 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v6, self->_rangeAfter.location, v7, v14.receiver, v14.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, @"rangeAfter_location");

  uint64_t v12 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v10, p_rangeAfter->length, v11);
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)v12, @"rangeAfter_length");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end