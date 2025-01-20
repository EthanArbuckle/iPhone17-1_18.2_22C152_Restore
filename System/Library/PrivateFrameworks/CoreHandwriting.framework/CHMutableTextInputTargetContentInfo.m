@interface CHMutableTextInputTargetContentInfo
- (CGRect)characterRectsInReferenceSubstring;
- (_NSRange)referenceSubstringRange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)referenceSubstring;
- (void)setActivePreviewRange:(_NSRange)a3;
- (void)setAutoCapitalizationMode:(int)a3;
- (void)setAutoCorrectionMode:(int)a3;
- (void)setBaseWritingDirection:(int)a3;
- (void)setContainsCommittedStrokes:(BOOL)a3;
- (void)setContentType:(int)a3;
- (void)setIsCursorStrong:(BOOL)a3;
- (void)setIsSingleLine:(BOOL)a3;
- (void)setLastCharacterLevelPosition:(int64_t)a3;
- (void)setProtectedCharacterIndexes:(id)a3;
- (void)setReferenceSubstring:(id)a3 range:(_NSRange)a4 characterRects:(CGRect *)a5;
- (void)setSelectedTextRange:(_NSRange)a3;
- (void)setStrokeCoveredTextRange:(_NSRange)a3;
- (void)setSupportsAutoLineBreaks:(BOOL)a3;
- (void)setTextContentLength:(int64_t)a3;
- (void)setTextInputTarget:(id)a3;
@end

@implementation CHMutableTextInputTargetContentInfo

- (id)copyWithZone:(_NSZone *)a3
{
  v120 = [CHTextInputTargetContentInfo alloc];
  v119 = objc_msgSend_textInputTarget(self, v4, v5, v6, v7, v8);
  unint64_t v118 = objc_msgSend_textContentLength(self, v9, v10, v11, v12, v13);
  v117 = objc_msgSend_referenceSubstring(self, v14, v15, v16, v17, v18);
  uint64_t v24 = objc_msgSend_referenceSubstringRange(self, v19, v20, v21, v22, v23);
  NSUInteger v115 = (NSUInteger)v25;
  NSUInteger v116 = v24;
  v114 = (const void *)objc_msgSend_characterRectsInReferenceSubstring(self, v25, v26, v27, v28, v29);
  uint64_t v35 = objc_msgSend_strokeCoveredTextRange(self, v30, v31, v32, v33, v34);
  NSUInteger v112 = (NSUInteger)v36;
  NSUInteger v113 = v35;
  uint64_t v41 = objc_msgSend_selectedTextRange(self, v36, v37, v38, v39, v40);
  NSUInteger v110 = (NSUInteger)v42;
  NSUInteger v111 = v41;
  char isCursorStrong = objc_msgSend_isCursorStrong(self, v42, v43, v44, v45, v46);
  NSUInteger active = objc_msgSend_activePreviewRange(self, v47, v48, v49, v50, v51);
  NSUInteger v54 = (NSUInteger)v53;
  int v59 = objc_msgSend_contentType(self, v53, v55, v56, v57, v58);
  int v65 = objc_msgSend_autoCapitalizationMode(self, v60, v61, v62, v63, v64);
  int v71 = objc_msgSend_autoCorrectionMode(self, v66, v67, v68, v69, v70);
  v77 = objc_msgSend_baseWritingDirection(self, v72, v73, v74, v75, v76);
  char isSingleLine = objc_msgSend_isSingleLine(self, v78, v79, v80, v81, v82);
  CharacterLevelPosition = objc_msgSend_lastCharacterLevelPosition(self, v84, v85, v86, v87, v88);
  v95 = objc_msgSend_protectedCharacterIndexes(self, v90, v91, v92, v93, v94);
  v97 = sub_1C49DAC28(v120, v119, v118, v117, v116, v115, v114, v96, v113, v112, v111, v110, isCursorStrong, active, v54, v59, v65, v71, v77,
          isSingleLine,
          CharacterLevelPosition,
          v95);

  *((unsigned char *)v97 + 89) = objc_msgSend_containsCommittedStrokes(self, v98, v99, v100, v101, v102);
  *((unsigned char *)v97 + 137) = objc_msgSend_supportsAutoLineBreaks(self, v103, v104, v105, v106, v107);
  return v97;
}

- (_NSRange)referenceSubstringRange
{
  NSUInteger length = self->super._referenceSubstringRange.length;
  NSUInteger location = self->super._referenceSubstringRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (CGRect)characterRectsInReferenceSubstring
{
  return self->super._characterRectsInReferenceSubstring;
}

- (id)referenceSubstring
{
  return self->super._referenceSubstring;
}

- (void)setTextInputTarget:(id)a3
{
  uint64_t v5 = (CHTextInputTarget *)a3;
  textInputTarget = self->super._textInputTarget;
  p_textInputTarget = &self->super._textInputTarget;
  if (textInputTarget != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_textInputTarget, a3);
    uint64_t v5 = v8;
  }
}

- (void)setTextContentLength:(int64_t)a3
{
  self->super._textContentLength = a3;
}

- (void)setStrokeCoveredTextRange:(_NSRange)a3
{
  self->super._strokeCoveredTextRange = a3;
}

- (void)setSelectedTextRange:(_NSRange)a3
{
  self->super._selectedTextRange = a3;
}

- (void)setIsCursorStrong:(BOOL)a3
{
  self->super._char isCursorStrong = a3;
}

- (void)setContainsCommittedStrokes:(BOOL)a3
{
  self->super._containsCommittedStrokes = a3;
}

- (void)setActivePreviewRange:(_NSRange)a3
{
  self->super._activePreviewRange = a3;
}

- (void)setContentType:(int)a3
{
  self->super._contentType = a3;
}

- (void)setAutoCapitalizationMode:(int)a3
{
  self->super._autoCapitalizationMode = a3;
}

- (void)setAutoCorrectionMode:(int)a3
{
  self->super._autoCorrectionMode = a3;
}

- (void)setBaseWritingDirection:(int)a3
{
  *(void *)&self->super._char isSingleLine = *(void *)&a3;
}

- (void)setIsSingleLine:(BOOL)a3
{
  LOBYTE(self->super._lastCharacterLevelPosition) = a3;
}

- (void)setSupportsAutoLineBreaks:(BOOL)a3
{
  BYTE1(self->super._lastCharacterLevelPosition) = a3;
}

- (void)setLastCharacterLevelPosition:(int64_t)a3
{
  self->super._protectedCharacterIndexes = (NSIndexSet *)a3;
}

- (void)setProtectedCharacterIndexes:(id)a3
{
  if (self[1].super.super.isa != a3)
  {
    uint64_t v7 = (objc_class *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4, v5);
    Class isa = self[1].super.super.isa;
    self[1].super.super.Class isa = v7;
  }
}

- (void)setReferenceSubstring:(id)a3 range:(_NSRange)a4 characterRects:(CGRect *)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v9 = (NSString *)a3;
  if (objc_msgSend_length(v9, v10, v11, v12, v13, v14) != length)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v20 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_1C492D000, v20, OS_LOG_TYPE_FAULT, "The referenceSubstring length must be equal to the range that it covers", (uint8_t *)&v27, 2u);
    }
  }
  self->super._referenceSubstringRange.NSUInteger location = location;
  self->super._referenceSubstringRange.NSUInteger length = length;
  if (self->super._referenceSubstring != v9)
  {
    uint64_t v21 = (NSString *)objc_msgSend_copy(v9, v15, v16, v17, v18, v19);
    referenceSubstring = self->super._referenceSubstring;
    self->super._referenceSubstring = v21;

    NSUInteger length = self->super._referenceSubstringRange.length;
  }
  if (length)
  {
    if (!a5)
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      uint64_t v23 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        uint64_t v24 = NSStringFromRange(self->super._referenceSubstringRange);
        int v27 = 138412290;
        uint64_t v28 = v24;
        _os_log_impl(&dword_1C492D000, v23, OS_LOG_TYPE_FAULT, "charRectsInReferenceSubstring cannot be NULL for referenceSubstringRange: %@", (uint8_t *)&v27, 0xCu);
      }
    }
    characterRectsInReferenceSubstring = self->super._characterRectsInReferenceSubstring;
    if (characterRectsInReferenceSubstring != a5)
    {
      if (characterRectsInReferenceSubstring) {
        free(characterRectsInReferenceSubstring);
      }
      uint64_t v26 = (CGRect *)malloc_type_calloc(self->super._referenceSubstringRange.length, 0x20uLL, 0x1000040E0EAB150uLL);
      self->super._characterRectsInReferenceSubstring = v26;
      memcpy(v26, a5, 32 * self->super._referenceSubstringRange.length);
    }
  }
}

@end