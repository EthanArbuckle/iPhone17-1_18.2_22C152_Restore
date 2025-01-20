@interface IATextInputActionsSessionReplaceTextAction
+ (BOOL)supportsSecureCoding;
- (BOOL)changedContent;
- (BOOL)isCapableOfTextInsertion;
- (IATextInputActionsSessionReplaceTextAction)initWithCoder:(id)a3;
- (int64_t)mergeActionIfPossible:(id)a3;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
- (void)setOptions:(unint64_t)a3;
@end

@implementation IATextInputActionsSessionReplaceTextAction

- (int64_t)mergeActionIfPossible:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_isMergeableWith_(self, v5, (uint64_t)v4, v6))
  {
    v13 = objc_msgSend_asReplaceText(v4, v7, v8, v9);
    if (!v13)
    {
      int64_t v82 = 0;
LABEL_18:

      goto LABEL_19;
    }
    uint64_t v14 = objc_msgSend_insertedTextLength(self, v10, v11, v12);
    uint64_t v18 = objc_msgSend_insertedTextLength(v13, v15, v16, v17);
    objc_msgSend_setInsertedTextLengthWithoutTracking_(self, v19, v18 + v14, v20);
    uint64_t v24 = objc_msgSend_removedTextLength(self, v21, v22, v23);
    uint64_t v28 = objc_msgSend_removedTextLength(v13, v25, v26, v27);
    objc_msgSend_setRemovedTextLengthWithoutTracking_(self, v29, v28 + v24, v30);
    uint64_t v34 = objc_msgSend_inputActionCount(v13, v31, v32, v33);
    uint64_t v38 = objc_msgSend_inputActionCountFromMergedActions(self, v35, v36, v37);
    objc_msgSend_setInputActionCountFromMergedActions_(self, v39, v38 + v34, v40);
    uint64_t v44 = objc_msgSend_options(self, v41, v42, v43);
    uint64_t v48 = objc_msgSend_options(v13, v45, v46, v47);
    objc_msgSend_setOptions_(self, v49, v48 | v44, v50);
    uint64_t v54 = objc_msgSend_removedEmojiCount(v13, v51, v52, v53);
    uint64_t v58 = objc_msgSend_removedEmojiCount(self, v55, v56, v57);
    objc_msgSend_setRemovedEmojiCount_(self, v59, v58 + v54, v60);
    uint64_t v64 = objc_msgSend_insertedEmojiCount(v13, v61, v62, v63);
    uint64_t v68 = objc_msgSend_insertedEmojiCount(self, v65, v66, v67);
    objc_msgSend_setInsertedEmojiCount_(self, v69, v68 + v64, v70);
    uint64_t v74 = objc_msgSend_netCharacterCount(v13, v71, v72, v73);
    uint64_t v78 = v74;
    if (v74 < 1)
    {
      if (v74 < 0)
      {
        unint64_t v83 = objc_msgSend_largestSingleDeletionLength(self, v75, v76, v77);
        uint64_t v86 = -v78;
        if (v83 > -v78) {
          uint64_t v86 = objc_msgSend_largestSingleDeletionLength(self, v84, v86, v85);
        }
        objc_msgSend_setLargestSingleDeletionLength_(self, v84, v86, v85);
      }
    }
    else
    {
      if (objc_msgSend_largestSingleInsertionLength(self, v75, v76, v77) > (unint64_t)v74) {
        uint64_t v78 = objc_msgSend_largestSingleInsertionLength(self, v79, v80, v81);
      }
      objc_msgSend_setLargestSingleInsertionLength_(self, v79, v78, v81);
    }
    v87 = objc_msgSend_inputMode(v4, v75, v76, v77);
    v91 = objc_msgSend_language(v87, v88, v89, v90);
    if (v91)
    {
    }
    else
    {
      v98 = objc_msgSend_inputMode(v4, v92, v93, v94);
      v102 = objc_msgSend_region(v98, v99, v100, v101);

      if (!v102)
      {
LABEL_17:
        int64_t v82 = 1;
        goto LABEL_18;
      }
    }
    v103 = objc_msgSend_inputMode(v4, v95, v96, v97);
    v107 = objc_msgSend_copy(v103, v104, v105, v106);
    objc_msgSend_setInputMode_(self, v108, (uint64_t)v107, v109);

    goto LABEL_17;
  }
  int64_t v82 = 0;
LABEL_19:

  return v82;
}

- (BOOL)changedContent
{
  return 1;
}

- (BOOL)isCapableOfTextInsertion
{
  return 1;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (IATextInputActionsSessionReplaceTextAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IATextInputActionsSessionReplaceTextAction;
  v5 = [(IATextInputActionsSessionAction *)&v13 initWithCoder:v4];
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
  v9.super_class = (Class)IATextInputActionsSessionReplaceTextAction;
  id v4 = a3;
  [(IATextInputActionsSessionAction *)&v9 encodeWithCoder:v4];
  v7 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v5, self->_options, v6, v9.receiver, v9.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v7, @"options");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end