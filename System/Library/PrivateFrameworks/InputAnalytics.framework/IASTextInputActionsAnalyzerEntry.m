@interface IASTextInputActionsAnalyzerEntry
+ (id)generateAnalyzerEntryFromAction:(id)a3;
- (BOOL)isAllZeroes;
- (int64_t)inputActions;
- (int64_t)netCharacters;
- (int64_t)netEmojiCharacters;
- (int64_t)userRemovedCharacters;
- (int64_t)userRemovedEmojiCharacters;
- (void)increaseWithEntry:(id)a3;
- (void)setInputActions:(int64_t)a3;
- (void)setNetCharacters:(int64_t)a3;
- (void)setNetEmojiCharacters:(int64_t)a3;
- (void)setUserRemovedCharacters:(int64_t)a3;
- (void)setUserRemovedEmojiCharacters:(int64_t)a3;
@end

@implementation IASTextInputActionsAnalyzerEntry

+ (id)generateAnalyzerEntryFromAction:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(IASTextInputActionsAnalyzerEntry);
  objc_msgSend_setNetCharacters_(v4, v5, 0, v6);
  objc_msgSend_setUserRemovedCharacters_(v4, v7, 0, v8);
  objc_msgSend_setNetEmojiCharacters_(v4, v9, 0, v10);
  objc_msgSend_setUserRemovedEmojiCharacters_(v4, v11, 0, v12);
  uint64_t v16 = objc_msgSend_inputActionCount(v3, v13, v14, v15);
  objc_msgSend_setInputActions_(v4, v17, v16, v18);
  v22 = objc_msgSend_asInsertion(v3, v19, v20, v21);
  v26 = v22;
  if (v22)
  {
    uint64_t v27 = objc_msgSend_insertedTextLength(v22, v23, v24, v25);
    uint64_t v31 = objc_msgSend_insertedEmojiCount(v26, v28, v29, v30);
    objc_msgSend_setNetCharacters_(v4, v32, v27 - v31, v33);
    objc_msgSend_setUserRemovedCharacters_(v4, v34, 0, v35);
    uint64_t v39 = objc_msgSend_insertedEmojiCount(v26, v36, v37, v38);
    objc_msgSend_setNetEmojiCharacters_(v4, v40, v39, v41);
    objc_msgSend_setUserRemovedEmojiCharacters_(v4, v42, 0, v43);
    v44 = v4;
  }
  else
  {
    v45 = objc_msgSend_asDeletion(v3, v23, v24, v25);
    v49 = v45;
    if (v45)
    {
      uint64_t v50 = objc_msgSend_removedTextLength(v45, v46, v47, v48);
      uint64_t v54 = v50 - objc_msgSend_removedEmojiCount(v49, v51, v52, v53);
      objc_msgSend_setNetCharacters_(v4, v55, -v54, v56);
      objc_msgSend_setUserRemovedCharacters_(v4, v57, v54, v58);
      uint64_t v62 = objc_msgSend_removedEmojiCount(v49, v59, v60, v61);
      objc_msgSend_setNetEmojiCharacters_(v4, v63, -v62, v64);
      uint64_t v68 = objc_msgSend_removedEmojiCount(v49, v65, v66, v67);
      objc_msgSend_setUserRemovedEmojiCharacters_(v4, v69, v68, v70);
      v71 = v4;
    }
    else
    {
      v72 = objc_msgSend_asReplaceText(v3, v46, v47, v48);
      v76 = v72;
      if (v72)
      {
        uint64_t v77 = objc_msgSend_insertedTextLength(v72, v73, v74, v75);
        uint64_t v81 = objc_msgSend_insertedEmojiCount(v76, v78, v79, v80);
        uint64_t v85 = objc_msgSend_removedTextLength(v76, v82, v83, v84);
        uint64_t v89 = objc_msgSend_removedEmojiCount(v76, v86, v87, v88);
        objc_msgSend_setNetCharacters_(v4, v90, v77 - (v81 + v85) + v89, v91);
        objc_msgSend_setUserRemovedCharacters_(v4, v92, 0, v93);
        uint64_t v97 = objc_msgSend_insertedEmojiCount(v76, v94, v95, v96);
        uint64_t v101 = objc_msgSend_removedEmojiCount(v76, v98, v99, v100);
        objc_msgSend_setNetEmojiCharacters_(v4, v102, v97 - v101, v103);
        objc_msgSend_setUserRemovedEmojiCharacters_(v4, v104, 0, v105);
      }
      v106 = v4;
    }
  }

  return v4;
}

- (void)increaseWithEntry:(id)a3
{
  id v4 = a3;
  self->_netCharacters += objc_msgSend_netCharacters(v4, v5, v6, v7);
  self->_userRemovedCharacters += objc_msgSend_userRemovedCharacters(v4, v8, v9, v10);
  self->_netEmojiCharacters += objc_msgSend_netEmojiCharacters(v4, v11, v12, v13);
  self->_userRemovedEmojiCharacters += objc_msgSend_userRemovedEmojiCharacters(v4, v14, v15, v16);
  uint64_t v20 = objc_msgSend_inputActions(v4, v17, v18, v19);

  self->_inputActions += v20;
}

- (BOOL)isAllZeroes
{
  return !self->_netCharacters
      && !self->_userRemovedCharacters
      && !self->_netEmojiCharacters
      && !self->_userRemovedEmojiCharacters
      && self->_inputActions == 0;
}

- (int64_t)netCharacters
{
  return self->_netCharacters;
}

- (void)setNetCharacters:(int64_t)a3
{
  self->_netCharacters = a3;
}

- (int64_t)userRemovedCharacters
{
  return self->_userRemovedCharacters;
}

- (void)setUserRemovedCharacters:(int64_t)a3
{
  self->_userRemovedCharacters = a3;
}

- (int64_t)netEmojiCharacters
{
  return self->_netEmojiCharacters;
}

- (void)setNetEmojiCharacters:(int64_t)a3
{
  self->_netEmojiCharacters = a3;
}

- (int64_t)userRemovedEmojiCharacters
{
  return self->_userRemovedEmojiCharacters;
}

- (void)setUserRemovedEmojiCharacters:(int64_t)a3
{
  self->_userRemovedEmojiCharacters = a3;
}

- (int64_t)inputActions
{
  return self->_inputActions;
}

- (void)setInputActions:(int64_t)a3
{
  self->_inputActions = a3;
}

@end