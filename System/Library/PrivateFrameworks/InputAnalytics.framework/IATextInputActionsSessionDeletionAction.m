@interface IATextInputActionsSessionDeletionAction
+ (BOOL)supportsSecureCoding;
- (BOOL)changedContent;
- (IATextInputActionsSessionDeletionAction)initWithCoder:(id)a3;
- (id)description;
- (int64_t)inputActionCount;
- (int64_t)mergeActionIfPossible:(id)a3;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
- (void)setOptions:(unint64_t)a3;
@end

@implementation IATextInputActionsSessionDeletionAction

- (int64_t)mergeActionIfPossible:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_isMergeableWith_(self, v5, (uint64_t)v4, v6))
  {
    v13 = objc_msgSend_asDeletion(v4, v7, v8, v9);
    if (!v13)
    {
      int64_t v64 = 0;
LABEL_13:

      goto LABEL_14;
    }
    uint64_t v14 = objc_msgSend_removedTextLength(self, v10, v11, v12);
    uint64_t v18 = objc_msgSend_removedTextLength(v13, v15, v16, v17);
    objc_msgSend_setRemovedTextLengthWithoutTracking_(self, v19, v18 + v14, v20);
    uint64_t v24 = objc_msgSend_inputActionCount(v13, v21, v22, v23);
    uint64_t v28 = objc_msgSend_inputActionCountFromMergedActions(self, v25, v26, v27);
    objc_msgSend_setInputActionCountFromMergedActions_(self, v29, v28 + v24, v30);
    uint64_t v34 = objc_msgSend_options(self, v31, v32, v33);
    uint64_t v38 = objc_msgSend_options(v13, v35, v36, v37);
    objc_msgSend_setOptions_(self, v39, v38 | v34, v40);
    uint64_t v44 = objc_msgSend_removedEmojiCount(v13, v41, v42, v43);
    uint64_t v48 = objc_msgSend_removedEmojiCount(self, v45, v46, v47);
    objc_msgSend_setRemovedEmojiCount_(self, v49, v48 + v44, v50);
    unint64_t v54 = objc_msgSend_largestSingleDeletionLength(self, v51, v52, v53);
    if (v54 <= objc_msgSend_removedTextLength(v13, v55, v56, v57)) {
      uint64_t v61 = objc_msgSend_removedTextLength(v13, v58, v59, v60);
    }
    else {
      uint64_t v61 = objc_msgSend_largestSingleDeletionLength(self, v58, v59, v60);
    }
    objc_msgSend_setLargestSingleDeletionLength_(self, v62, v61, v63);
    v68 = objc_msgSend_inputMode(v4, v65, v66, v67);
    v72 = objc_msgSend_language(v68, v69, v70, v71);
    if (v72)
    {
    }
    else
    {
      v79 = objc_msgSend_inputMode(v4, v73, v74, v75);
      v83 = objc_msgSend_region(v79, v80, v81, v82);

      if (!v83)
      {
LABEL_12:
        int64_t v64 = 1;
        goto LABEL_13;
      }
    }
    v84 = objc_msgSend_inputMode(v4, v76, v77, v78);
    v88 = objc_msgSend_copy(v84, v85, v86, v87);
    objc_msgSend_setInputMode_(self, v89, (uint64_t)v88, v90);

    goto LABEL_12;
  }
  int64_t v64 = 0;
LABEL_14:

  return v64;
}

- (BOOL)changedContent
{
  return 1;
}

- (id)description
{
  v35.receiver = self;
  v35.super_class = (Class)IATextInputActionsSessionDeletionAction;
  v3 = [(IATextInputActionsSessionAction *)&v35 description];
  v7 = objc_msgSend_array(MEMORY[0x263EFF980], v4, v5, v6);
  uint64_t v8 = NSString;
  uint64_t v12 = objc_msgSend_removedTextLength(self, v9, v10, v11);
  v15 = objc_msgSend_stringWithFormat_(v8, v13, @"removedTextLength=%lu", v14, v12);
  objc_msgSend_addObject_(v7, v16, (uint64_t)v15, v17);

  uint64_t v18 = NSString;
  uint64_t v22 = objc_msgSend_removedEmojiCount(self, v19, v20, v21);
  v25 = objc_msgSend_stringWithFormat_(v18, v23, @"removedEmojiCount=%lu", v24, v22);
  objc_msgSend_addObject_(v7, v26, (uint64_t)v25, v27);

  uint64_t v30 = objc_msgSend_componentsJoinedByString_(v7, v28, @", ", v29);
  uint64_t v33 = objc_msgSend_stringByAppendingFormat_(v3, v31, @", %@", v32, v30);

  return v33;
}

- (int64_t)inputActionCount
{
  uint64_t v5 = objc_msgSend_source(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_textInputActionsType(self, v6, v7, v8);
  uint64_t v11 = objc_msgSend_shouldSeparatelyTrackKeystrokesForSource_type_(IATextInputActionsSessionAction, v10, v5, v9) ^ 1;
  return objc_msgSend_inputActionCountFromMergedActions(self, v12, v13, v14) + v11;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (IATextInputActionsSessionDeletionAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IATextInputActionsSessionDeletionAction;
  uint64_t v5 = [(IATextInputActionsSessionAction *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"options");
    v5->_options = objc_msgSend_longValue(v8, v9, v10, v11);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IATextInputActionsSessionDeletionAction;
  id v4 = a3;
  [(IATextInputActionsSessionAction *)&v9 encodeWithCoder:v4];
  uint64_t v7 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v5, self->_options, v6, v9.receiver, v9.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v7, @"options");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end