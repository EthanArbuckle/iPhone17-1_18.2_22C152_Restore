@interface IATextInputActionsSessionInsertionAction
+ (BOOL)supportsSecureCoding;
- (BOOL)changedContent;
- (BOOL)isCapableOfTextInsertion;
- (IATextInputActionsSessionInsertionAction)initWithCoder:(id)a3;
- (id)description;
- (int64_t)inputActionCount;
- (int64_t)mergeActionIfPossible:(id)a3;
- (unint64_t)options;
- (unint64_t)withAlternativesCount;
- (void)encodeWithCoder:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setWithAlternativesCount:(unint64_t)a3;
@end

@implementation IATextInputActionsSessionInsertionAction

- (int64_t)mergeActionIfPossible:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_isMergeableWith_(self, v5, (uint64_t)v4, v6))
  {
    v13 = objc_msgSend_asInsertion(v4, v7, v8, v9);
    if (!v13)
    {
      int64_t v84 = 0;
LABEL_13:

      goto LABEL_14;
    }
    uint64_t v14 = objc_msgSend_insertedTextLength(self, v10, v11, v12);
    uint64_t v18 = objc_msgSend_insertedTextLength(v13, v15, v16, v17);
    objc_msgSend_setInsertedTextLengthWithoutTracking_(self, v19, v18 + v14, v20);
    uint64_t v24 = objc_msgSend_inputActionCount(v13, v21, v22, v23);
    uint64_t v28 = objc_msgSend_inputActionCountFromMergedActions(self, v25, v26, v27);
    objc_msgSend_setInputActionCountFromMergedActions_(self, v29, v28 + v24, v30);
    uint64_t v34 = objc_msgSend_withAlternativesCount(v13, v31, v32, v33);
    uint64_t v38 = objc_msgSend_withAlternativesCount(self, v35, v36, v37);
    objc_msgSend_setWithAlternativesCount_(self, v39, v38 + v34, v40);
    uint64_t v44 = objc_msgSend_options(self, v41, v42, v43);
    uint64_t v48 = objc_msgSend_options(v13, v45, v46, v47);
    objc_msgSend_setOptions_(self, v49, v48 | v44, v50);
    uint64_t v54 = objc_msgSend_insertedEmojiCount(v13, v51, v52, v53);
    uint64_t v58 = objc_msgSend_insertedEmojiCount(self, v55, v56, v57);
    objc_msgSend_setInsertedEmojiCount_(self, v59, v58 + v54, v60);
    uint64_t v64 = objc_msgSend_insertedPunctuationCount(v13, v61, v62, v63);
    uint64_t v68 = objc_msgSend_insertedPunctuationCount(self, v65, v66, v67);
    objc_msgSend_setInsertedPunctuationCount_(self, v69, v68 + v64, v70);
    unint64_t v74 = objc_msgSend_largestSingleInsertionLength(self, v71, v72, v73);
    if (v74 <= objc_msgSend_insertedTextLength(v13, v75, v76, v77)) {
      uint64_t v81 = objc_msgSend_insertedTextLength(v13, v78, v79, v80);
    }
    else {
      uint64_t v81 = objc_msgSend_largestSingleInsertionLength(self, v78, v79, v80);
    }
    objc_msgSend_setLargestSingleInsertionLength_(self, v82, v81, v83);
    v88 = objc_msgSend_inputMode(v4, v85, v86, v87);
    v92 = objc_msgSend_language(v88, v89, v90, v91);
    if (v92)
    {
    }
    else
    {
      v99 = objc_msgSend_inputMode(v4, v93, v94, v95);
      v103 = objc_msgSend_region(v99, v100, v101, v102);

      if (!v103)
      {
LABEL_12:
        int64_t v84 = 1;
        goto LABEL_13;
      }
    }
    v104 = objc_msgSend_inputMode(v4, v96, v97, v98);
    v108 = objc_msgSend_copy(v104, v105, v106, v107);
    objc_msgSend_setInputMode_(self, v109, (uint64_t)v108, v110);

    goto LABEL_12;
  }
  int64_t v84 = 0;
LABEL_14:

  return v84;
}

- (BOOL)changedContent
{
  return 1;
}

- (BOOL)isCapableOfTextInsertion
{
  return 1;
}

- (id)description
{
  v25.receiver = self;
  v25.super_class = (Class)IATextInputActionsSessionInsertionAction;
  v3 = [(IATextInputActionsSessionAction *)&v25 description];
  v7 = objc_msgSend_array(MEMORY[0x263EFF980], v4, v5, v6);
  uint64_t v8 = NSString;
  uint64_t v12 = objc_msgSend_withAlternativesCount(self, v9, v10, v11);
  v15 = objc_msgSend_stringWithFormat_(v8, v13, @"withAlternativesCount=%lu", v14, v12);
  objc_msgSend_addObject_(v7, v16, (uint64_t)v15, v17);

  uint64_t v20 = objc_msgSend_componentsJoinedByString_(v7, v18, @", ", v19);
  uint64_t v23 = objc_msgSend_stringByAppendingFormat_(v3, v21, @", %@", v22, v20);

  return v23;
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

- (unint64_t)withAlternativesCount
{
  return self->_withAlternativesCount;
}

- (void)setWithAlternativesCount:(unint64_t)a3
{
  self->_withAlternativesCount = a3;
}

- (IATextInputActionsSessionInsertionAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)IATextInputActionsSessionInsertionAction;
  uint64_t v5 = [(IATextInputActionsSessionAction *)&v19 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"options");
    v5->_options = objc_msgSend_longValue(v8, v9, v10, v11);

    uint64_t v12 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, @"withAlternativesCount");
    v5->_withAlternativesCount = objc_msgSend_unsignedLongValue(v14, v15, v16, v17);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)IATextInputActionsSessionInsertionAction;
  id v4 = a3;
  [(IATextInputActionsSessionAction *)&v13 encodeWithCoder:v4];
  uint64_t v7 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v5, self->_options, v6, v13.receiver, v13.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v7, @"options");

  uint64_t v11 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v9, self->_withAlternativesCount, v10);
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, @"withAlternativesCount");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end