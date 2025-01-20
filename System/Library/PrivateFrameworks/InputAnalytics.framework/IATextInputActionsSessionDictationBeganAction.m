@interface IATextInputActionsSessionDictationBeganAction
+ (BOOL)supportsSecureCoding;
- (IATextInputActionsSessionDictationBeganAction)initWithCoder:(id)a3;
- (id)description;
- (int64_t)inputActionCount;
- (int64_t)mergeActionIfPossible:(id)a3;
- (unint64_t)dictationBeganCount;
- (unint64_t)modelessUsedAtLeastOnceCount;
- (unint64_t)multiModalDictationBeganCount;
- (void)encodeWithCoder:(id)a3;
- (void)setDictationBeganCount:(unint64_t)a3;
- (void)setModelessUsedAtLeastOnceCount:(unint64_t)a3;
- (void)setMultiModalDictationBeganCount:(unint64_t)a3;
@end

@implementation IATextInputActionsSessionDictationBeganAction

- (int64_t)mergeActionIfPossible:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_source(self, v5, v6, v7);
  if (v8 == objc_msgSend_source(v4, v9, v10, v11))
  {
    v15 = objc_msgSend_asDictationBegan(v4, v12, v13, v14);
    v19 = v15;
    if (v15)
    {
      uint64_t v20 = objc_msgSend_dictationBeganCount(v15, v16, v17, v18);
      uint64_t v24 = objc_msgSend_dictationBeganCount(self, v21, v22, v23);
      objc_msgSend_setDictationBeganCount_(self, v25, v24 + v20, v26);
      uint64_t v30 = objc_msgSend_modelessUsedAtLeastOnceCount(v19, v27, v28, v29);
      uint64_t v34 = objc_msgSend_modelessUsedAtLeastOnceCount(self, v31, v32, v33);
      objc_msgSend_setModelessUsedAtLeastOnceCount_(self, v35, v34 + v30, v36);
      uint64_t v40 = objc_msgSend_multiModalDictationBeganCount(v19, v37, v38, v39);
      uint64_t v44 = objc_msgSend_multiModalDictationBeganCount(self, v41, v42, v43);
      objc_msgSend_setMultiModalDictationBeganCount_(self, v45, v44 + v40, v46);
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
  v45.receiver = self;
  v45.super_class = (Class)IATextInputActionsSessionDictationBeganAction;
  v3 = [(IATextInputActionsSessionAction *)&v45 description];
  uint64_t v7 = objc_msgSend_array(MEMORY[0x263EFF980], v4, v5, v6);
  uint64_t v8 = NSString;
  uint64_t v12 = objc_msgSend_dictationBeganCount(self, v9, v10, v11);
  v15 = objc_msgSend_stringWithFormat_(v8, v13, @"dictationBeganCount=%lu", v14, v12);
  objc_msgSend_addObject_(v7, v16, (uint64_t)v15, v17);

  uint64_t v18 = NSString;
  uint64_t v22 = objc_msgSend_modelessUsedAtLeastOnceCount(self, v19, v20, v21);
  v25 = objc_msgSend_stringWithFormat_(v18, v23, @"modelessUsedAtLeastOnceCount=%lu", v24, v22);
  objc_msgSend_addObject_(v7, v26, (uint64_t)v25, v27);

  uint64_t v28 = NSString;
  uint64_t v32 = objc_msgSend_multiModalDictationBeganCount(self, v29, v30, v31);
  v35 = objc_msgSend_stringWithFormat_(v28, v33, @"multiModalDictationBeganCount=%lu", v34, v32);
  objc_msgSend_addObject_(v7, v36, (uint64_t)v35, v37);

  uint64_t v40 = objc_msgSend_componentsJoinedByString_(v7, v38, @", ", v39);
  uint64_t v43 = objc_msgSend_stringByAppendingFormat_(v3, v41, @", %@", v42, v40);

  return v43;
}

- (int64_t)inputActionCount
{
  return 0;
}

- (unint64_t)dictationBeganCount
{
  return self->_dictationBeganCount;
}

- (void)setDictationBeganCount:(unint64_t)a3
{
  self->_dictationBeganCount = a3;
}

- (unint64_t)modelessUsedAtLeastOnceCount
{
  return self->_modelessUsedAtLeastOnceCount;
}

- (void)setModelessUsedAtLeastOnceCount:(unint64_t)a3
{
  self->_modelessUsedAtLeastOnceCount = a3;
}

- (unint64_t)multiModalDictationBeganCount
{
  return self->_multiModalDictationBeganCount;
}

- (void)setMultiModalDictationBeganCount:(unint64_t)a3
{
  self->_multiModalDictationBeganCount = a3;
}

- (IATextInputActionsSessionDictationBeganAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)IATextInputActionsSessionDictationBeganAction;
  uint64_t v5 = [(IATextInputActionsSessionAction *)&v25 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"dictationBeganCount");
    v5->_dictationBeganCount = objc_msgSend_unsignedLongValue(v8, v9, v10, v11);

    uint64_t v12 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, @"modelessUsedAtLeastOnceCount");
    v5->_modelessUsedAtLeastOnceCount = objc_msgSend_unsignedLongValue(v14, v15, v16, v17);

    uint64_t v18 = objc_opt_class();
    uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, @"multiModalDictationBeganCount");
    v5->_multiModalDictationBeganCount = objc_msgSend_unsignedLongValue(v20, v21, v22, v23);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)IATextInputActionsSessionDictationBeganAction;
  id v4 = a3;
  [(IATextInputActionsSessionAction *)&v17 encodeWithCoder:v4];
  uint64_t v7 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v5, self->_dictationBeganCount, v6, v17.receiver, v17.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v7, @"dictationBeganCount");

  uint64_t v11 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v9, self->_modelessUsedAtLeastOnceCount, v10);
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, @"modelessUsedAtLeastOnceCount");

  v15 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v13, self->_multiModalDictationBeganCount, v14);
  objc_msgSend_encodeObject_forKey_(v4, v16, (uint64_t)v15, @"multiModalDictationBeganCount");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end