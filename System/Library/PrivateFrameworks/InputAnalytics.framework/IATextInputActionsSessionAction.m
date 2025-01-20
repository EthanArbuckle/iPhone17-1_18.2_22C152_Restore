@interface IATextInputActionsSessionAction
+ (BOOL)shouldSeparatelyTrackKeystrokesForSource:(int64_t)a3 type:(int64_t)a4;
+ (BOOL)supportsSecureCoding;
- (BOOL)changedContent;
- (BOOL)isCapableOfTextInsertion;
- (BOOL)isMergeableWith:(id)a3;
- (IATextInputActionsInputMode)inputMode;
- (IATextInputActionsSessionAction)initWithCoder:(id)a3;
- (IATextInputActionsSessionBeganAction)asBegan;
- (IATextInputActionsSessionCopyAction)asCopy;
- (IATextInputActionsSessionCutAction)asCut;
- (IATextInputActionsSessionDeletionAction)asDeletion;
- (IATextInputActionsSessionDictationBeganAction)asDictationBegan;
- (IATextInputActionsSessionDictationEndedAction)asDictationEnded;
- (IATextInputActionsSessionEndAction)asEnd;
- (IATextInputActionsSessionGlomojiTapAction)asGlomojiTap;
- (IATextInputActionsSessionInsertionAction)asInsertion;
- (IATextInputActionsSessionKBMenuAppearAction)asKBMenuAppear;
- (IATextInputActionsSessionKBMenuDismissAction)asKBMenuDismiss;
- (IATextInputActionsSessionKBMenuInteractionAction)asKBMenuInteraction;
- (IATextInputActionsSessionKeyboardDockItemButtonPressAction)asKeyboardDockItemButtonPress;
- (IATextInputActionsSessionPasteAction)asPaste;
- (IATextInputActionsSessionRedoAction)asRedo;
- (IATextInputActionsSessionReplaceTextAction)asReplaceText;
- (IATextInputActionsSessionReplaceWithCandidateAction)asReplaceWithCandidate;
- (IATextInputActionsSessionSelectionAction)asSelection;
- (IATextInputActionsSessionUndoAction)asUndo;
- (NSString)processBundleId;
- (_NSRange)relativeRangeBefore;
- (id)description;
- (int64_t)flagOptions;
- (int64_t)inputActionCount;
- (int64_t)inputActionCountFromMergedActions;
- (int64_t)mergeActionIfPossible:(id)a3;
- (int64_t)netCharacterCount;
- (int64_t)source;
- (int64_t)textInputActionsType;
- (unint64_t)insertedEmojiCount;
- (unint64_t)insertedPunctuationCount;
- (unint64_t)insertedTextLength;
- (unint64_t)largestSingleDeletionLength;
- (unint64_t)largestSingleInsertionLength;
- (unint64_t)removedEmojiCount;
- (unint64_t)removedPunctuationCount;
- (unint64_t)removedTextLength;
- (void)encodeWithCoder:(id)a3;
- (void)setFlagOptions:(int64_t)a3;
- (void)setInputActionCountFromMergedActions:(int64_t)a3;
- (void)setInputMode:(id)a3;
- (void)setInsertedEmojiCount:(unint64_t)a3;
- (void)setInsertedPunctuationCount:(unint64_t)a3;
- (void)setInsertedTextLength:(unint64_t)a3;
- (void)setInsertedTextLengthWithoutTracking:(unint64_t)a3;
- (void)setLargestSingleDeletionLength:(unint64_t)a3;
- (void)setLargestSingleInsertionLength:(unint64_t)a3;
- (void)setProcessBundleId:(id)a3;
- (void)setRelativeRangeBefore:(_NSRange)a3;
- (void)setRemovedEmojiCount:(unint64_t)a3;
- (void)setRemovedPunctuationCount:(unint64_t)a3;
- (void)setRemovedTextLength:(unint64_t)a3;
- (void)setRemovedTextLengthWithoutTracking:(unint64_t)a3;
- (void)setSource:(int64_t)a3;
- (void)setTextInputActionsType:(int64_t)a3;
@end

@implementation IATextInputActionsSessionAction

- (IATextInputActionsSessionBeganAction)asBegan
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (IATextInputActionsSessionBeganAction *)v3;
}

- (IATextInputActionsSessionEndAction)asEnd
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (IATextInputActionsSessionEndAction *)v3;
}

- (IATextInputActionsSessionInsertionAction)asInsertion
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (IATextInputActionsSessionInsertionAction *)v3;
}

- (IATextInputActionsSessionDeletionAction)asDeletion
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (IATextInputActionsSessionDeletionAction *)v3;
}

- (IATextInputActionsSessionSelectionAction)asSelection
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (IATextInputActionsSessionSelectionAction *)v3;
}

- (IATextInputActionsSessionCopyAction)asCopy
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (IATextInputActionsSessionCopyAction *)v3;
}

- (IATextInputActionsSessionCutAction)asCut
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (IATextInputActionsSessionCutAction *)v3;
}

- (IATextInputActionsSessionPasteAction)asPaste
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (IATextInputActionsSessionPasteAction *)v3;
}

- (IATextInputActionsSessionUndoAction)asUndo
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (IATextInputActionsSessionUndoAction *)v3;
}

- (IATextInputActionsSessionRedoAction)asRedo
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (IATextInputActionsSessionRedoAction *)v3;
}

- (IATextInputActionsSessionKeyboardDockItemButtonPressAction)asKeyboardDockItemButtonPress
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (IATextInputActionsSessionKeyboardDockItemButtonPressAction *)v3;
}

- (IATextInputActionsSessionDictationBeganAction)asDictationBegan
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (IATextInputActionsSessionDictationBeganAction *)v3;
}

- (IATextInputActionsSessionDictationEndedAction)asDictationEnded
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (IATextInputActionsSessionDictationEndedAction *)v3;
}

- (IATextInputActionsSessionReplaceTextAction)asReplaceText
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (IATextInputActionsSessionReplaceTextAction *)v3;
}

- (IATextInputActionsSessionReplaceWithCandidateAction)asReplaceWithCandidate
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (IATextInputActionsSessionReplaceWithCandidateAction *)v3;
}

- (IATextInputActionsSessionGlomojiTapAction)asGlomojiTap
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (IATextInputActionsSessionGlomojiTapAction *)v3;
}

- (IATextInputActionsSessionKBMenuAppearAction)asKBMenuAppear
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (IATextInputActionsSessionKBMenuAppearAction *)v3;
}

- (IATextInputActionsSessionKBMenuInteractionAction)asKBMenuInteraction
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (IATextInputActionsSessionKBMenuInteractionAction *)v3;
}

- (IATextInputActionsSessionKBMenuDismissAction)asKBMenuDismiss
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (IATextInputActionsSessionKBMenuDismissAction *)v3;
}

- (int64_t)mergeActionIfPossible:(id)a3
{
  return 0;
}

- (BOOL)changedContent
{
  return 0;
}

- (BOOL)isCapableOfTextInsertion
{
  return 0;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v8 = objc_msgSend_array(MEMORY[0x263EFF980], v5, v6, v7);
  v195.receiver = self;
  v195.super_class = (Class)IATextInputActionsSessionAction;
  v9 = [(IAXPCObject *)&v195 description];
  objc_msgSend_addObject_(v8, v10, (uint64_t)v9, v11);

  v12 = NSString;
  v16 = objc_msgSend_appBundleId(self, v13, v14, v15);
  v19 = objc_msgSend_stringWithFormat_(v12, v17, @"appBundleId=%@", v18, v16);
  objc_msgSend_addObject_(v8, v20, (uint64_t)v19, v21);

  v22 = NSString;
  v26 = objc_msgSend_processBundleId(self, v23, v24, v25);
  v29 = objc_msgSend_stringWithFormat_(v22, v27, @"procBundleId=%@", v28, v26);
  objc_msgSend_addObject_(v8, v30, (uint64_t)v29, v31);

  v32 = NSString;
  uint64_t v36 = objc_msgSend_source(self, v33, v34, v35);
  v39 = objc_msgSend_stringForSource_(IATextInputActionsUtils, v37, v36, v38);
  v42 = objc_msgSend_stringWithFormat_(v32, v40, @"source=%@", v41, v39);
  objc_msgSend_addObject_(v8, v43, (uint64_t)v42, v44);

  v45 = NSString;
  uint64_t v49 = objc_msgSend_textInputActionsType(self, v46, v47, v48);
  v52 = objc_msgSend_stringForType_(IATextInputActionsUtils, v50, v49, v51);
  v55 = objc_msgSend_stringWithFormat_(v45, v53, @"textInputActionsType=%@", v54, v52);
  objc_msgSend_addObject_(v8, v56, (uint64_t)v55, v57);

  if (objc_msgSend_changedContent(self, v58, v59, v60))
  {
    v64 = NSString;
    uint64_t v65 = objc_msgSend_removedTextLength(self, v61, v62, v63);
    v68 = objc_msgSend_stringWithFormat_(v64, v66, @"removedTextLength=%lu", v67, v65);
    objc_msgSend_addObject_(v8, v69, (uint64_t)v68, v70);

    v71 = NSString;
    uint64_t v75 = objc_msgSend_insertedTextLength(self, v72, v73, v74);
    v78 = objc_msgSend_stringWithFormat_(v71, v76, @"insertedTextLength=%lu", v77, v75);
    objc_msgSend_addObject_(v8, v79, (uint64_t)v78, v80);

    v81 = NSString;
    uint64_t v85 = objc_msgSend_removedEmojiCount(self, v82, v83, v84);
    v88 = objc_msgSend_stringWithFormat_(v81, v86, @"removedEmojiCount=%lu", v87, v85);
    objc_msgSend_addObject_(v8, v89, (uint64_t)v88, v90);

    v91 = NSString;
    uint64_t v95 = objc_msgSend_insertedEmojiCount(self, v92, v93, v94);
    v98 = objc_msgSend_stringWithFormat_(v91, v96, @"insertedEmojiCount=%lu", v97, v95);
    objc_msgSend_addObject_(v8, v99, (uint64_t)v98, v100);

    v101 = NSString;
    uint64_t v105 = objc_msgSend_removedPunctuationCount(self, v102, v103, v104);
    v108 = objc_msgSend_stringWithFormat_(v101, v106, @"removedPunctuationCount=%lu", v107, v105);
    objc_msgSend_addObject_(v8, v109, (uint64_t)v108, v110);

    v111 = NSString;
    uint64_t v115 = objc_msgSend_insertedPunctuationCount(self, v112, v113, v114);
    v118 = objc_msgSend_stringWithFormat_(v111, v116, @"insertedPunctuationCount=%lu", v117, v115);
    objc_msgSend_addObject_(v8, v119, (uint64_t)v118, v120);

    v121 = NSString;
    uint64_t v125 = objc_msgSend_largestSingleDeletionLength(self, v122, v123, v124);
    v128 = objc_msgSend_stringWithFormat_(v121, v126, @"largestSingleDeletionLength=%lu", v127, v125);
    objc_msgSend_addObject_(v8, v129, (uint64_t)v128, v130);

    v131 = NSString;
    uint64_t v135 = objc_msgSend_largestSingleInsertionLength(self, v132, v133, v134);
    v138 = objc_msgSend_stringWithFormat_(v131, v136, @"largestSingleInsertionLength=%lu", v137, v135);
    objc_msgSend_addObject_(v8, v139, (uint64_t)v138, v140);
  }
  v141 = objc_msgSend_inputMode(self, v61, v62, v63);
  char isEmpty = objc_msgSend_isEmpty(v141, v142, v143, v144);

  if ((isEmpty & 1) == 0)
  {
    v149 = NSString;
    v150 = objc_msgSend_inputMode(self, v146, v147, v148);
    v154 = objc_msgSend_description(v150, v151, v152, v153);
    v157 = objc_msgSend_stringWithFormat_(v149, v155, @"inputMode=%@", v156, v154);
    objc_msgSend_addObject_(v8, v158, (uint64_t)v157, v159);
  }
  if (objc_msgSend_flagOptions(self, v146, v147, v148))
  {
    v163 = NSString;
    uint64_t v164 = objc_msgSend_flagOptions(self, v160, v161, v162);
    v167 = objc_msgSend_stringWithFormat_(v163, v165, @"flagOptions=%lu", v166, v164);
    objc_msgSend_addObject_(v8, v168, (uint64_t)v167, v169);
  }
  if (objc_msgSend_inputActionCount(self, v160, v161, v162))
  {
    v173 = NSString;
    uint64_t v174 = objc_msgSend_inputActionCount(self, v170, v171, v172);
    v177 = objc_msgSend_stringWithFormat_(v173, v175, @"inputActionCount=%ld", v176, v174);
    objc_msgSend_addObject_(v8, v178, (uint64_t)v177, v179);
  }
  if (objc_msgSend_relativeRangeBefore(self, v170, v171, v172)
    || (objc_msgSend_relativeRangeBefore(self, v180, v181, v182), v180))
  {
    v183 = NSString;
    v197.location = objc_msgSend_relativeRangeBefore(self, v180, v181, v182);
    v184 = NSStringFromRange(v197);
    v187 = objc_msgSend_stringWithFormat_(v183, v185, @"relativeRangeBefore=%@", v186, v184);
    objc_msgSend_addObject_(v8, v188, (uint64_t)v187, v189);
  }
  v190 = objc_msgSend_componentsJoinedByString_(v8, v180, @", ", v182);
  v193 = objc_msgSend_stringByAppendingFormat_(v4, v191, @": %@", v192, v190);

  return v193;
}

+ (BOOL)shouldSeparatelyTrackKeystrokesForSource:(int64_t)a3 type:(int64_t)a4
{
  BOOL v5 = a4 == 1 || a4 == 16;
  return a3 == 4 && v5;
}

- (int64_t)inputActionCount
{
  return objc_msgSend_inputActionCountFromMergedActions(self, a2, v2, v3) + 1;
}

- (void)setInsertedTextLength:(unint64_t)a3
{
  if (a3 && (objc_msgSend_changedContent(self, a2, a3, v3) & 1) == 0)
  {
    uint64_t v14 = objc_msgSend_currentHandler(MEMORY[0x263F08690], a2, a3, v3);
    uint64_t v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v17, (uint64_t)a2, (uint64_t)self, @"IATextInputActionsSessionAction.m", 178, @"Attempted to set insertedTextLength on an action of class %@, which does not support changing content", v16);
  }
  self->_insertedTextLength = a3;
  uint64_t v7 = a3 - objc_msgSend_removedTextLength(self, a2, a3, v3);
  objc_msgSend_setLargestSingleInsertionLength_(self, v8, 0, v9);
  objc_msgSend_setLargestSingleDeletionLength_(self, v10, 0, v11);
  if (v7 < 1)
  {
    if (v7 < 0)
    {
      objc_msgSend_setLargestSingleDeletionLength_(self, v12, -v7, v13);
    }
  }
  else
  {
    objc_msgSend_setLargestSingleInsertionLength_(self, v12, v7, v13);
  }
}

- (void)setRemovedTextLength:(unint64_t)a3
{
  if (a3 && (objc_msgSend_changedContent(self, a2, a3, v3) & 1) == 0)
  {
    uint64_t v14 = objc_msgSend_currentHandler(MEMORY[0x263F08690], a2, a3, v3);
    uint64_t v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v17, (uint64_t)a2, (uint64_t)self, @"IATextInputActionsSessionAction.m", 199, @"Attempted to set removedTextLength on an action of class %@, which does not support changing content", v16);
  }
  self->_removedTextLength = a3;
  uint64_t v7 = objc_msgSend_insertedTextLength(self, a2, a3, v3) - a3;
  objc_msgSend_setLargestSingleInsertionLength_(self, v8, 0, v9);
  objc_msgSend_setLargestSingleDeletionLength_(self, v10, 0, v11);
  if (v7 < 1)
  {
    if (v7 < 0)
    {
      objc_msgSend_setLargestSingleDeletionLength_(self, v12, -v7, v13);
    }
  }
  else
  {
    objc_msgSend_setLargestSingleInsertionLength_(self, v12, v7, v13);
  }
}

- (void)setInsertedTextLengthWithoutTracking:(unint64_t)a3
{
  if (a3 && (objc_msgSend_changedContent(self, a2, a3, v3) & 1) == 0)
  {
    v10 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v7, v8, v9);
    uint64_t v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v13, (uint64_t)a2, (uint64_t)self, @"IATextInputActionsSessionAction.m", 218, @"Attempted to set insertedTextLength on an action of class %@, which does not support changing content", v12);
  }
  self->_insertedTextLength = a3;
}

- (void)setRemovedTextLengthWithoutTracking:(unint64_t)a3
{
  if (a3 && (objc_msgSend_changedContent(self, a2, a3, v3) & 1) == 0)
  {
    v10 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v7, v8, v9);
    uint64_t v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v13, (uint64_t)a2, (uint64_t)self, @"IATextInputActionsSessionAction.m", 226, @"Attempted to set removedTextLength on an action of class %@, which does not support changing content", v12);
  }
  self->_removedTextLength = a3;
}

- (void)setInsertedEmojiCount:(unint64_t)a3
{
  if (a3 && (objc_msgSend_changedContent(self, a2, a3, v3) & 1) == 0)
  {
    v10 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v7, v8, v9);
    uint64_t v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v13, (uint64_t)a2, (uint64_t)self, @"IATextInputActionsSessionAction.m", 234, @"Attempted to set insertedEmojiCount on an action of class %@, which does not support changing content", v12);
  }
  self->_insertedEmojiCount = a3;
}

- (void)setRemovedEmojiCount:(unint64_t)a3
{
  if (a3 && (objc_msgSend_changedContent(self, a2, a3, v3) & 1) == 0)
  {
    v10 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v7, v8, v9);
    uint64_t v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v13, (uint64_t)a2, (uint64_t)self, @"IATextInputActionsSessionAction.m", 242, @"Attempted to set removedEmojiCount on an action of class %@, which does not support changing content", v12);
  }
  self->_removedEmojiCount = a3;
}

- (void)setInsertedPunctuationCount:(unint64_t)a3
{
  if (a3 && (objc_msgSend_changedContent(self, a2, a3, v3) & 1) == 0)
  {
    v10 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v7, v8, v9);
    uint64_t v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v13, (uint64_t)a2, (uint64_t)self, @"IATextInputActionsSessionAction.m", 250, @"Attempted to set insertedPunctuationCount on an action of class %@, which does not support changing content", v12);
  }
  self->_insertedPunctuationCount = a3;
}

- (void)setRemovedPunctuationCount:(unint64_t)a3
{
  if (a3 && (objc_msgSend_changedContent(self, a2, a3, v3) & 1) == 0)
  {
    v10 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v7, v8, v9);
    uint64_t v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v13, (uint64_t)a2, (uint64_t)self, @"IATextInputActionsSessionAction.m", 258, @"Attempted to set removedPunctuationCount on an action of class %@, which does not support changing content", v12);
  }
  self->_removedPunctuationCount = a3;
}

- (int64_t)netCharacterCount
{
  uint64_t v5 = objc_msgSend_insertedTextLength(self, a2, v2, v3);
  return v5 - objc_msgSend_removedTextLength(self, v6, v7, v8);
}

- (BOOL)isMergeableWith:(id)a3
{
  id v7 = a3;
  uint64_t v11 = objc_msgSend_source(self, v8, v9, v10);
  if (v11 != objc_msgSend_source(v7, v12, v13, v14)
    || (uint64_t v18 = objc_msgSend_flagOptions(self, v15, v16, v17), v18 != objc_msgSend_flagOptions(v7, v19, v20, v21))
    || (uint64_t v25 = objc_msgSend_textInputActionsType(self, v22, v23, v24),
        v25 != objc_msgSend_textInputActionsType(v7, v26, v27, v28)))
  {
    char isEqualToString = 0;
    goto LABEL_9;
  }
  uint64_t v35 = objc_msgSend_inputMode(self, v29, v30, v31);
  if (v35 || (objc_msgSend_inputMode(v7, v32, v33, v34), (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = objc_msgSend_inputMode(self, v32, v33, v34);
    uint64_t v5 = objc_msgSend_inputMode(v7, v36, v37, v38);
    if (!objc_msgSend_isEqual_(v4, v39, (uint64_t)v5, v40))
    {
      char isEqualToString = 0;
LABEL_13:

      goto LABEL_14;
    }
    int v41 = 1;
  }
  else
  {
    int v41 = 0;
  }
  uint64_t v44 = objc_msgSend_appBundleId(self, v32, v33, v34);
  uint64_t v48 = objc_msgSend_appBundleId(v7, v45, v46, v47);
  char isEqualToString = objc_msgSend_isEqualToString_(v44, v49, (uint64_t)v48, v50);

  if (v41) {
    goto LABEL_13;
  }
LABEL_14:
  if (!v35) {

  }
LABEL_9:
  return isEqualToString;
}

- (_NSRange)relativeRangeBefore
{
  p_relativeRangeBefore = &self->_relativeRangeBefore;
  NSUInteger location = self->_relativeRangeBefore.location;
  NSUInteger length = p_relativeRangeBefore->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRelativeRangeBefore:(_NSRange)a3
{
  self->_relativeRangeBefore = a3;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (int64_t)textInputActionsType
{
  return self->_textInputActionsType;
}

- (void)setTextInputActionsType:(int64_t)a3
{
  self->_textInputActionsType = a3;
}

- (unint64_t)insertedTextLength
{
  return self->_insertedTextLength;
}

- (unint64_t)insertedEmojiCount
{
  return self->_insertedEmojiCount;
}

- (unint64_t)insertedPunctuationCount
{
  return self->_insertedPunctuationCount;
}

- (unint64_t)removedTextLength
{
  return self->_removedTextLength;
}

- (unint64_t)removedEmojiCount
{
  return self->_removedEmojiCount;
}

- (unint64_t)removedPunctuationCount
{
  return self->_removedPunctuationCount;
}

- (int64_t)inputActionCountFromMergedActions
{
  return self->_inputActionCountFromMergedActions;
}

- (void)setInputActionCountFromMergedActions:(int64_t)a3
{
  self->_inputActionCountFromMergedActions = a3;
}

- (unint64_t)largestSingleInsertionLength
{
  return self->_largestSingleInsertionLength;
}

- (void)setLargestSingleInsertionLength:(unint64_t)a3
{
  self->_largestSingleInsertionLength = a3;
}

- (unint64_t)largestSingleDeletionLength
{
  return self->_largestSingleDeletionLength;
}

- (void)setLargestSingleDeletionLength:(unint64_t)a3
{
  self->_largestSingleDeletionLength = a3;
}

- (IATextInputActionsInputMode)inputMode
{
  return self->_inputMode;
}

- (void)setInputMode:(id)a3
{
}

- (NSString)processBundleId
{
  return self->_processBundleId;
}

- (void)setProcessBundleId:(id)a3
{
}

- (int64_t)flagOptions
{
  return self->_flagOptions;
}

- (void)setFlagOptions:(int64_t)a3
{
  self->_flagOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processBundleId, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
}

- (IATextInputActionsSessionAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v103.receiver = self;
  v103.super_class = (Class)IATextInputActionsSessionAction;
  uint64_t v5 = [(IAXPCObject *)&v103 initWithCoder:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    p_relativeRangeBefore = &v5->_relativeRangeBefore;
    uint64_t v8 = objc_opt_class();
    uint64_t v10 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v8, @"relativeRangeBefore_location");
    uint64_t v14 = objc_msgSend_unsignedLongValue(v10, v11, v12, v13);
    uint64_t v15 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, @"relativeRangeBefore_length");
    uint64_t v21 = objc_msgSend_unsignedLongValue(v17, v18, v19, v20);
    p_relativeRangeBefore->NSUInteger location = v14;
    v6->_relativeRangeBefore.NSUInteger length = v21;

    uint64_t v22 = objc_opt_class();
    uint64_t v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, @"source");
    v6->_source = objc_msgSend_unsignedLongValue(v24, v25, v26, v27);

    uint64_t v28 = objc_opt_class();
    uint64_t v30 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v29, v28, @"textInputActionsType");
    v6->_textInputActionsType = objc_msgSend_unsignedLongValue(v30, v31, v32, v33);

    uint64_t v34 = objc_opt_class();
    uint64_t v36 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v35, v34, @"inputActionCountFromMergedActions");
    v6->_inputActionCountFromMergedActions = objc_msgSend_longValue(v36, v37, v38, v39);

    uint64_t v40 = objc_opt_class();
    uint64_t v42 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v41, v40, @"inputMode");
    inputMode = v6->_inputMode;
    v6->_inputMode = (IATextInputActionsInputMode *)v42;

    uint64_t v44 = objc_opt_class();
    uint64_t v46 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v45, v44, @"processBundleId");
    processBundleId = v6->_processBundleId;
    v6->_processBundleId = (NSString *)v46;

    uint64_t v48 = objc_opt_class();
    uint64_t v50 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v49, v48, @"flagOptions");
    v6->_flagOptions = objc_msgSend_unsignedLongValue(v50, v51, v52, v53);

    uint64_t v54 = objc_opt_class();
    v56 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v55, v54, @"insertedTextLength");
    v6->_insertedTextLength = objc_msgSend_unsignedLongValue(v56, v57, v58, v59);

    uint64_t v60 = objc_opt_class();
    uint64_t v62 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v61, v60, @"insertedEmojiCount");
    v6->_insertedEmojiCount = objc_msgSend_unsignedLongValue(v62, v63, v64, v65);

    uint64_t v66 = objc_opt_class();
    v68 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v67, v66, @"insertedPunctuationCount");
    v6->_insertedPunctuationCount = objc_msgSend_unsignedLongValue(v68, v69, v70, v71);

    uint64_t v72 = objc_opt_class();
    uint64_t v74 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v73, v72, @"removedTextLength");
    v6->_removedTextLength = objc_msgSend_unsignedLongValue(v74, v75, v76, v77);

    uint64_t v78 = objc_opt_class();
    uint64_t v80 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v79, v78, @"removedEmojiCount");
    v6->_removedEmojiCount = objc_msgSend_unsignedLongValue(v80, v81, v82, v83);

    uint64_t v84 = objc_opt_class();
    v86 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v85, v84, @"removedPunctuationCount");
    v6->_removedPunctuationCount = objc_msgSend_unsignedLongValue(v86, v87, v88, v89);

    uint64_t v90 = objc_opt_class();
    v92 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v91, v90, @"largestSingleInsertionLength");
    v6->_largestSingleInsertionLength = objc_msgSend_unsignedLongValue(v92, v93, v94, v95);

    uint64_t v96 = objc_opt_class();
    v98 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v97, v96, @"largestSingleDeletionLength");
    v6->_largestSingleDeletionLength = objc_msgSend_unsignedLongValue(v98, v99, v100, v101);
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v63.receiver = self;
  v63.super_class = (Class)IATextInputActionsSessionAction;
  id v4 = a3;
  [(IAXPCObject *)&v63 encodeWithCoder:v4];
  id v7 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v5, self->_relativeRangeBefore.location, v6, v63.receiver, v63.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v7, @"relativeRangeBefore_location");

  uint64_t v11 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v9, self->_relativeRangeBefore.length, v10);
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, @"relativeRangeBefore_length");

  uint64_t v15 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v13, self->_source, v14);
  objc_msgSend_encodeObject_forKey_(v4, v16, (uint64_t)v15, @"source");

  uint64_t v19 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v17, self->_textInputActionsType, v18);
  objc_msgSend_encodeObject_forKey_(v4, v20, (uint64_t)v19, @"textInputActionsType");

  uint64_t v23 = objc_msgSend_numberWithLong_(NSNumber, v21, self->_inputActionCountFromMergedActions, v22);
  objc_msgSend_encodeObject_forKey_(v4, v24, (uint64_t)v23, @"inputActionCountFromMergedActions");

  objc_msgSend_encodeObject_forKey_(v4, v25, (uint64_t)self->_inputMode, @"inputMode");
  objc_msgSend_encodeObject_forKey_(v4, v26, (uint64_t)self->_processBundleId, @"processBundleId");
  v29 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v27, self->_flagOptions, v28);
  objc_msgSend_encodeObject_forKey_(v4, v30, (uint64_t)v29, @"flagOptions");

  uint64_t v33 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v31, self->_insertedTextLength, v32);
  objc_msgSend_encodeObject_forKey_(v4, v34, (uint64_t)v33, @"insertedTextLength");

  uint64_t v37 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v35, self->_insertedEmojiCount, v36);
  objc_msgSend_encodeObject_forKey_(v4, v38, (uint64_t)v37, @"insertedEmojiCount");

  int v41 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v39, self->_insertedPunctuationCount, v40);
  objc_msgSend_encodeObject_forKey_(v4, v42, (uint64_t)v41, @"insertedPunctuationCount");

  v45 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v43, self->_removedTextLength, v44);
  objc_msgSend_encodeObject_forKey_(v4, v46, (uint64_t)v45, @"removedTextLength");

  uint64_t v49 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v47, self->_removedEmojiCount, v48);
  objc_msgSend_encodeObject_forKey_(v4, v50, (uint64_t)v49, @"removedEmojiCount");

  uint64_t v53 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v51, self->_removedPunctuationCount, v52);
  objc_msgSend_encodeObject_forKey_(v4, v54, (uint64_t)v53, @"removedPunctuationCount");

  uint64_t v57 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v55, self->_largestSingleInsertionLength, v56);
  objc_msgSend_encodeObject_forKey_(v4, v58, (uint64_t)v57, @"largestSingleInsertionLength");

  v61 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v59, self->_largestSingleDeletionLength, v60);
  objc_msgSend_encodeObject_forKey_(v4, v62, (uint64_t)v61, @"largestSingleDeletionLength");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end