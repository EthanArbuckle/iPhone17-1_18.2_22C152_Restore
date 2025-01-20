@interface CHTextInputTargetContentInfo
- (BOOL)containsCommittedStrokes;
- (BOOL)isCursorStrong;
- (BOOL)isSingleLine;
- (BOOL)supportsAutoLineBreaks;
- (CGRect)characterRectForCharacterIndex:(int64_t)a3;
- (CGRect)characterRectForComposedCharacterAtIndex:(int64_t)a3;
- (CGRect)characterRectsInReferenceSubstring;
- (CGRect)unionCharacterRects;
- (CGRect)visualCharacterRectForCharacterIndex:(int64_t)a3;
- (CHTextInputTarget)textInputTarget;
- (CHTextInputTargetContentInfo)initWithTextInputTarget:(id)a3 contentLength:(int64_t)a4 referenceSubstring:(id)a5 referenceSubstringRange:(_NSRange)a6 charRectsInReferenceSubstring:(CGRect *)a7 strokeCoveredTextRange:(_NSRange)a8 selectedTextRange:(_NSRange)a9 activePreviewRange:(_NSRange)a10 contentType:(int)a11 lastCharacterLevelPosition:(int64_t)a12;
- (CHTextInputTargetContentInfo)initWithTextInputTarget:(id)a3 contentLength:(int64_t)a4 referenceSubstring:(id)a5 referenceSubstringRange:(_NSRange)a6 charRectsInReferenceSubstring:(CGRect *)a7 strokeCoveredTextRange:(_NSRange)a8 selectedTextRange:(_NSRange)a9 activePreviewRange:(_NSRange)a10 lastCharacterLevelPosition:(int64_t)a11;
- (CHTextInputTargetContentInfo)initWithTextInputTarget:(id)a3 contentLength:(int64_t)a4 referenceSubstring:(id)a5 referenceSubstringRange:(_NSRange)a6 charRectsInReferenceSubstring:(CGRect *)a7 strokeCoveredTextRange:(_NSRange)a8 selectedTextRange:(_NSRange)a9 isCursorStrong:(BOOL)a10 activePreviewRange:(_NSRange)a11 contentType:(int)a12 autoCapitalizationMode:(int)a13 autoCorrectionMode:(int)a14 isSingleLine:(BOOL)a15 lastCharacterLevelPosition:(int64_t)a16;
- (CHTextInputTargetContentInfo)initWithTextInputTarget:(id)a3 contentLength:(int64_t)a4 referenceSubstring:(id)a5 referenceSubstringRange:(_NSRange)a6 charRectsInReferenceSubstring:(CGRect *)a7 strokeCoveredTextRange:(_NSRange)a8 selectedTextRange:(_NSRange)a9 isCursorStrong:(BOOL)a10 activePreviewRange:(_NSRange)a11 contentType:(int)a12 isSingleLine:(BOOL)a13 lastCharacterLevelPosition:(int64_t)a14;
- (NSIndexSet)protectedCharacterIndexes;
- (NSString)referenceSubstring;
- (_NSRange)activePreviewRange;
- (_NSRange)referenceSubstringRange;
- (_NSRange)referenceSubstringRangeOfComposedCharacterAtIndex:(int64_t)a3;
- (_NSRange)selectedTextRange;
- (_NSRange)strokeCoveredTextRange;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)referenceSubstringInRange:(_NSRange)a3;
- (int)autoCapitalizationMode;
- (int)autoCorrectionMode;
- (int)baseWritingDirection;
- (int)contentType;
- (int64_t)absoluteLocationFromRelativeLocation:(int64_t)a3;
- (int64_t)lastCharacterLevelPosition;
- (int64_t)relativeLocationFromAbsoluteLocation:(int64_t)a3;
- (int64_t)textContentLength;
- (void)dealloc;
- (void)enumerateCharacterRectsInRange:(_NSRange)a3 block:(id)a4;
- (void)enumerateCharacterRectsInRange:(_NSRange)a3 reverse:(BOOL)a4 block:(id)a5;
@end

@implementation CHTextInputTargetContentInfo

- (CHTextInputTargetContentInfo)initWithTextInputTarget:(id)a3 contentLength:(int64_t)a4 referenceSubstring:(id)a5 referenceSubstringRange:(_NSRange)a6 charRectsInReferenceSubstring:(CGRect *)a7 strokeCoveredTextRange:(_NSRange)a8 selectedTextRange:(_NSRange)a9 activePreviewRange:(_NSRange)a10 lastCharacterLevelPosition:(int64_t)a11
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v68 = a3;
  id v69 = a5;
  if (a9.location == 0x7FFFFFFFFFFFFFFFLL || a9.location + a9.length <= a4)
  {
    if (a10.location == 0x7FFFFFFFFFFFFFFFLL || a10.location + a10.length <= a4) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
  if (qword_1EA3CA000 == -1)
  {
    v26 = (id)qword_1EA3C9F90[0];
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  v26 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
  {
LABEL_16:
    v27 = NSStringFromRange(a9);
    *(_DWORD *)buf = 138412546;
    v72 = v27;
    __int16 v73 = 2048;
    int64_t v74 = a4;
    _os_log_impl(&dword_1C492D000, v26, OS_LOG_TYPE_FAULT, "selectedTextRange %@ beyond text length %ld", buf, 0x16u);
  }
LABEL_17:

  if (a10.location == 0x7FFFFFFFFFFFFFFFLL || a10.location + a10.length <= a4)
  {
LABEL_9:
    if (location != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_22:
  if (qword_1EA3CA000 == -1)
  {
    v29 = (id)qword_1EA3C9F90[0];
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  v29 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
  {
LABEL_24:
    v30 = NSStringFromRange(a10);
    *(_DWORD *)buf = 138412546;
    v72 = v30;
    __int16 v73 = 2048;
    int64_t v74 = a4;
    _os_log_impl(&dword_1C492D000, v29, OS_LOG_TYPE_FAULT, "activePreviewRange %@ beyond text length %ld", buf, 0x16u);
  }
LABEL_25:

  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_10:
    NSUInteger v23 = location + length;
    if (location + length <= a4) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_26:
  if (qword_1EA3CA000 == -1)
  {
    v31 = (id)qword_1EA3C9F90[0];
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  v31 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
  {
LABEL_28:
    v76.NSUInteger location = location;
    v76.NSUInteger length = length;
    v32 = NSStringFromRange(v76);
    *(_DWORD *)buf = 138412290;
    v72 = v32;
    _os_log_impl(&dword_1C492D000, v31, OS_LOG_TYPE_FAULT, "Invalid referenceSubstringRange %@", buf, 0xCu);
  }
LABEL_29:

  NSUInteger v23 = location + length;
  if (location + length <= a4)
  {
LABEL_11:
    NSUInteger v24 = a8.location;
    if (length == objc_msgSend_length(v69, v16, v17, v18, v19, v20)) {
      goto LABEL_12;
    }
LABEL_34:
    if (qword_1EA3CA000 == -1)
    {
      v40 = (id)qword_1EA3C9F90[0];
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
        goto LABEL_37;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      v40 = (id)qword_1EA3C9F90[0];
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      {
LABEL_37:

        NSUInteger v25 = a8.length;
        if (v24 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_46;
        }
        goto LABEL_38;
      }
    }
    v78.NSUInteger location = location;
    v78.NSUInteger length = length;
    v41 = NSStringFromRange(v78);
    uint64_t v47 = objc_msgSend_length(v69, v42, v43, v44, v45, v46);
    *(_DWORD *)buf = 138412546;
    v72 = v41;
    __int16 v73 = 2048;
    int64_t v74 = v47;
    _os_log_impl(&dword_1C492D000, v40, OS_LOG_TYPE_FAULT, "Invalid referenceSubstringRange %@, length doesn't match string length %ld", buf, 0x16u);

    goto LABEL_37;
  }
LABEL_30:
  if (qword_1EA3CA000 == -1)
  {
    v33 = (id)qword_1EA3C9F90[0];
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  v33 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
  {
LABEL_32:
    v77.NSUInteger location = location;
    v77.NSUInteger length = length;
    v34 = NSStringFromRange(v77);
    *(_DWORD *)buf = 138412546;
    v72 = v34;
    __int16 v73 = 2048;
    int64_t v74 = a4;
    _os_log_impl(&dword_1C492D000, v33, OS_LOG_TYPE_FAULT, "referenceSubstringRange %@ beyond text length %ld", buf, 0x16u);
  }
LABEL_33:

  NSUInteger v24 = a8.location;
  if (length != objc_msgSend_length(v69, v35, v36, v37, v38, v39)) {
    goto LABEL_34;
  }
LABEL_12:
  NSUInteger v25 = a8.length;
  if (v24 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_46;
  }
LABEL_38:
  if (v24 < location || v24 - location >= length || v24 + v25 > v23)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v48 = (id)qword_1EA3C9FC0;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v79.NSUInteger location = v24;
      v79.NSUInteger length = v25;
      NSStringFromRange(v79);
      v49 = v65 = a7;
      v80.NSUInteger location = location;
      v80.NSUInteger length = length;
      v50 = NSStringFromRange(v80);
      *(_DWORD *)buf = 138412546;
      v72 = v49;
      __int16 v73 = 2112;
      int64_t v74 = (int64_t)v50;
      _os_log_impl(&dword_1C492D000, v48, OS_LOG_TYPE_ERROR, "The strokeCoveredTextRange %@ must be within the referenceSubstringRange %@", buf, 0x16u);

      a7 = v65;
    }
  }
LABEL_46:
  v70.receiver = self;
  v70.super_class = (Class)CHTextInputTargetContentInfo;
  v51 = [(CHTextInputTargetContentInfo *)&v70 init];
  v52 = v51;
  if (v51)
  {
    objc_storeStrong((id *)&v51->_textInputTarget, a3);
    v52->_textContentLength = a4;
    uint64_t v58 = objc_msgSend_copy(v69, v53, v54, v55, v56, v57);
    referenceSubstring = v52->_referenceSubstring;
    v52->_referenceSubstring = (NSString *)v58;

    v52->_referenceSubstringRange.NSUInteger location = location;
    v52->_referenceSubstringRange.NSUInteger length = length;
    v52->_strokeCoveredTextRange.NSUInteger location = v24;
    v52->_strokeCoveredTextRange.NSUInteger length = v25;
    v52->_selectedTextRange = a9;
    v52->_isCursorStrong = 1;
    v52->_activePreviewRange = a10;
    *(void *)&v52->_contentType = 0x100000000;
    v52->_autoCorrectionMode = 0;
    *(void *)&v52->_isSingleLine = 255;
    LOBYTE(v52->_lastCharacterLevelPosition) = 1;
    Class isa = v52[1].super.isa;
    v52->_protectedCharacterIndexes = (NSIndexSet *)a11;
    v52[1].super.Class isa = 0;

    if (length)
    {
      if (!a7)
      {
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v61 = (id)qword_1EA3C9F90[0];
        if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
        {
          v81.NSUInteger location = location;
          v81.NSUInteger length = length;
          v62 = NSStringFromRange(v81);
          *(_DWORD *)buf = 138412290;
          v72 = v62;
          _os_log_impl(&dword_1C492D000, v61, OS_LOG_TYPE_FAULT, "charRectsInReferenceSubstring cannot be NULL for referenceSubstringRange: %@", buf, 0xCu);
        }
      }
      v63 = (CGRect *)malloc_type_calloc(length, 0x20uLL, 0x1000040E0EAB150uLL);
      v52->_characterRectsInReferenceSubstring = v63;
      memcpy(v63, a7, 32 * length);
    }
  }

  return v52;
}

- (CHTextInputTargetContentInfo)initWithTextInputTarget:(id)a3 contentLength:(int64_t)a4 referenceSubstring:(id)a5 referenceSubstringRange:(_NSRange)a6 charRectsInReferenceSubstring:(CGRect *)a7 strokeCoveredTextRange:(_NSRange)a8 selectedTextRange:(_NSRange)a9 isCursorStrong:(BOOL)a10 activePreviewRange:(_NSRange)a11 contentType:(int)a12 autoCapitalizationMode:(int)a13 autoCorrectionMode:(int)a14 isSingleLine:(BOOL)a15 lastCharacterLevelPosition:(int64_t)a16
{
  return (CHTextInputTargetContentInfo *)sub_1C49DAC28(self, a3, a4, a5, a6.location, a6.length, a7, (uint64_t)a7, a8.location, a8.length, a9.location, a9.length, a10, a11.location, a11.length, a12, a13, a14, (void *)0xFF,
                                           a15,
                                           (void *)a16,
                                           0);
}

- (CHTextInputTargetContentInfo)initWithTextInputTarget:(id)a3 contentLength:(int64_t)a4 referenceSubstring:(id)a5 referenceSubstringRange:(_NSRange)a6 charRectsInReferenceSubstring:(CGRect *)a7 strokeCoveredTextRange:(_NSRange)a8 selectedTextRange:(_NSRange)a9 isCursorStrong:(BOOL)a10 activePreviewRange:(_NSRange)a11 contentType:(int)a12 isSingleLine:(BOOL)a13 lastCharacterLevelPosition:(int64_t)a14
{
  return (CHTextInputTargetContentInfo *)sub_1C49DAC28(self, a3, a4, a5, a6.location, a6.length, a7, (uint64_t)a7, a8.location, a8.length, a9.location, a9.length, a10, a11.location, a11.length, a12, 1, 0, (void *)0xFF,
                                           a13,
                                           (void *)a14,
                                           0);
}

- (CHTextInputTargetContentInfo)initWithTextInputTarget:(id)a3 contentLength:(int64_t)a4 referenceSubstring:(id)a5 referenceSubstringRange:(_NSRange)a6 charRectsInReferenceSubstring:(CGRect *)a7 strokeCoveredTextRange:(_NSRange)a8 selectedTextRange:(_NSRange)a9 activePreviewRange:(_NSRange)a10 contentType:(int)a11 lastCharacterLevelPosition:(int64_t)a12
{
  BYTE4(v14) = 1;
  LODWORD(v14) = a11;
  char v13 = 1;
  return (CHTextInputTargetContentInfo *)objc_msgSend_initWithTextInputTarget_contentLength_referenceSubstring_referenceSubstringRange_charRectsInReferenceSubstring_strokeCoveredTextRange_selectedTextRange_isCursorStrong_activePreviewRange_contentType_isSingleLine_lastCharacterLevelPosition_(self, a2, (uint64_t)a3, a4, (uint64_t)a5, a6.location, a6.length, a7, a8.location, a8.length, a9.location, a9.length, v13, a10.location, a10.length, v14, a12);
}

- (void)dealloc
{
  characterRectsInReferenceSubstring = self->_characterRectsInReferenceSubstring;
  if (characterRectsInReferenceSubstring) {
    free(characterRectsInReferenceSubstring);
  }
  v4.receiver = self;
  v4.super_class = (Class)CHTextInputTargetContentInfo;
  [(CHTextInputTargetContentInfo *)&v4 dealloc];
}

- (id)description
{
  v7 = (void *)MEMORY[0x1E4F1CA48];
  objc_msgSend_referenceSubstringRange(self, a2, v2, v3, v4, v5);
  v12 = objc_msgSend_arrayWithCapacity_(v7, v8, (uint64_t)v8, v9, v10, v11);
  objc_msgSend_referenceSubstringRange(self, v13, v14, v15, v16, v17);
  if (v18)
  {
    uint64_t v23 = 0;
    for (unint64_t i = 0; i < (unint64_t)v18; ++i)
    {
      unint64_t v25 = objc_msgSend_referenceSubstringRange(self, v18, v19, v20, v21, v22) + i;
      uint64_t v31 = objc_msgSend_characterRectsInReferenceSubstring(self, v26, v27, v28, v29, v30);
      uint64_t v36 = objc_msgSend_stringWithFormat_(NSString, v32, @"  %ld: origin: (%0.2f, %0.2f), size: (%0.2f, %0.2f)", v33, v34, v35, v25, *(void *)(v31 + v23), *(void *)(v31 + v23 + 8), *(void *)(v31 + v23 + 16), *(void *)(v31 + v23 + 24));
      objc_msgSend_addObject_(v12, v37, (uint64_t)v36, v38, v39, v40);

      objc_msgSend_referenceSubstringRange(self, v41, v42, v43, v44, v45);
      v23 += 32;
    }
  }
  uint64_t v46 = objc_msgSend_ch_descriptionWithSeparator_filterBlock_(v12, v18, @"\n", (uint64_t)&unk_1F2012A90, v21, v22);
  if (objc_msgSend_length(v46, v47, v48, v49, v50, v51))
  {
    uint64_t v57 = objc_msgSend_stringWithFormat_(NSString, v52, @"\n%@\n", v54, v55, v56, v46);

    uint64_t v46 = (void *)v57;
  }
  uint64_t v58 = objc_msgSend_contentType(self, v52, v53, v54, v55, v56);
  uint64_t v63 = objc_msgSend_stringForRecognitionContentType_(CHRecognizerConfiguration, v59, v58, v60, v61, v62);
  if (objc_msgSend_referenceSubstringRange(self, v64, v65, v66, v67, v68) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v166 = @"(none)";
    if (objc_msgSend_selectedTextRange(self, v69, v70, v71, v72, v73) != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_8;
    }
  }
  else
  {
    v177.NSUInteger location = objc_msgSend_referenceSubstringRange(self, v69, v70, v71, v72, v73);
    NSStringFromRange(v177);
    v166 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_selectedTextRange(self, v116, v117, v118, v119, v120) != 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_8:
      v174.NSUInteger location = objc_msgSend_selectedTextRange(self, v74, v75, v76, v77, v78);
      NSStringFromRange(v174);
      v165 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_activePreviewRange(self, v79, v80, v81, v82, v83) != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_9;
      }
      goto LABEL_14;
    }
  }
  v165 = @"(none)";
  if (objc_msgSend_activePreviewRange(self, v74, v75, v76, v77, v78) != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_9:
    v175.NSUInteger location = objc_msgSend_activePreviewRange(self, v84, v85, v86, v87, v88);
    NSStringFromRange(v175);
    v164 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_strokeCoveredTextRange(self, v89, v90, v91, v92, v93) != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_10;
    }
LABEL_15:
    v163 = @"(none)";
    v170 = (void *)v63;
    v171 = v46;
    if (objc_msgSend_lastCharacterLevelPosition(self, v94, v95, v96, v97, v98) != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_11;
    }
    goto LABEL_16;
  }
LABEL_14:
  v164 = @"(none)";
  if (objc_msgSend_strokeCoveredTextRange(self, v84, v85, v86, v87, v88) == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_15;
  }
LABEL_10:
  v176.NSUInteger location = objc_msgSend_strokeCoveredTextRange(self, v94, v95, v96, v97, v98);
  NSStringFromRange(v176);
  v163 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v170 = (void *)v63;
  v171 = v46;
  if (objc_msgSend_lastCharacterLevelPosition(self, v99, v100, v101, v102, v103) != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_11:
    v109 = NSString;
    uint64_t CharacterLevelPosition = objc_msgSend_lastCharacterLevelPosition(self, v104, v105, v106, v107, v108);
    objc_msgSend_stringWithFormat_(v109, v111, @"%ld", v112, v113, v114, CharacterLevelPosition);
    v115 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
LABEL_16:
  v115 = @"(none)";
LABEL_17:
  v172.receiver = self;
  v172.super_class = (Class)CHTextInputTargetContentInfo;
  v169 = [(CHTextInputTargetContentInfo *)&v172 description];
  v126 = objc_msgSend_textInputTarget(self, v121, v122, v123, v124, v125);
  uint64_t v167 = objc_msgSend_textContentLength(self, v127, v128, v129, v130, v131);
  v137 = objc_msgSend_referenceSubstring(self, v132, v133, v134, v135, v136);
  v148 = @"Yes";
  if (objc_msgSend_isCursorStrong(self, v138, v139, v140, v141, v142)) {
    v149 = @"Yes";
  }
  else {
    v149 = @"No";
  }
  if (objc_msgSend_containsCommittedStrokes(self, v143, v144, v145, v146, v147)) {
    v155 = @"Yes";
  }
  else {
    v155 = @"No";
  }
  if (LOBYTE(self->_lastCharacterLevelPosition)) {
    v156 = @"Yes";
  }
  else {
    v156 = @"No";
  }
  if (!BYTE1(self->_lastCharacterLevelPosition)) {
    v148 = @"No";
  }
  v157 = objc_msgSend_protectedCharacterIndexes(self, v150, v151, v152, v153, v154);
  objc_msgSend_stringByAppendingFormat_(v169, v158, @" textInputTarget: (%@), contentType: %@, textContentLength: %ld, referenceSubstring: \"%@\", referenceSubstringRange: %@, selectedRange: %@, isCursorStrong: %@, containsCommittedStrokes: %@, activePreviewRange: %@, strokeCoveredTextRange: %@, lastCharacterLevelPosition: %@, isSingleLine: %@, supportsAutoLineBreaks: %@, characterRectsInReferenceSubstring: {%@}, protectedCharacterIndexes: {%@}", v159, v160, v161, v126, v170, v167, v137, v166, v165, v149, v155, v164, v163, v115, v156, v148,
    v171,
  v168 = v157);

  return v168;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(CHMutableTextInputTargetContentInfo);
  uint64_t v10 = objc_msgSend_referenceSubstring(self, v5, v6, v7, v8, v9);
  uint64_t v16 = objc_msgSend_referenceSubstringRange(self, v11, v12, v13, v14, v15);
  uint64_t v18 = (uint64_t)v17;
  uint64_t v23 = objc_msgSend_characterRectsInReferenceSubstring(self, v17, v19, v20, v21, v22);
  objc_msgSend_setReferenceSubstring_range_characterRects_(v4, v24, (uint64_t)v10, v16, v18, v23);

  uint64_t v30 = objc_msgSend_textInputTarget(self, v25, v26, v27, v28, v29);
  objc_msgSend_setTextInputTarget_(v4, v31, (uint64_t)v30, v32, v33, v34);

  uint64_t v40 = objc_msgSend_textContentLength(self, v35, v36, v37, v38, v39);
  objc_msgSend_setTextContentLength_(v4, v41, v40, v42, v43, v44);
  uint64_t v50 = objc_msgSend_strokeCoveredTextRange(self, v45, v46, v47, v48, v49);
  objc_msgSend_setStrokeCoveredTextRange_(v4, v51, v50, (uint64_t)v51, v52, v53);
  uint64_t v59 = objc_msgSend_selectedTextRange(self, v54, v55, v56, v57, v58);
  objc_msgSend_setSelectedTextRange_(v4, v60, v59, (uint64_t)v60, v61, v62);
  uint64_t isCursorStrong = objc_msgSend_isCursorStrong(self, v63, v64, v65, v66, v67);
  objc_msgSend_setIsCursorStrong_(v4, v69, isCursorStrong, v70, v71, v72);
  uint64_t v78 = objc_msgSend_containsCommittedStrokes(self, v73, v74, v75, v76, v77);
  objc_msgSend_setContainsCommittedStrokes_(v4, v79, v78, v80, v81, v82);
  uint64_t active = objc_msgSend_activePreviewRange(self, v83, v84, v85, v86, v87);
  objc_msgSend_setActivePreviewRange_(v4, v89, active, (uint64_t)v89, v90, v91);
  uint64_t v97 = objc_msgSend_contentType(self, v92, v93, v94, v95, v96);
  objc_msgSend_setContentType_(v4, v98, v97, v99, v100, v101);
  uint64_t v107 = objc_msgSend_autoCapitalizationMode(self, v102, v103, v104, v105, v106);
  objc_msgSend_setAutoCapitalizationMode_(v4, v108, v107, v109, v110, v111);
  uint64_t v117 = objc_msgSend_autoCorrectionMode(self, v112, v113, v114, v115, v116);
  objc_msgSend_setAutoCorrectionMode_(v4, v118, v117, v119, v120, v121);
  uint64_t v127 = objc_msgSend_baseWritingDirection(self, v122, v123, v124, v125, v126);
  objc_msgSend_setBaseWritingDirection_(v4, v128, v127, v129, v130, v131);
  uint64_t isSingleLine = objc_msgSend_isSingleLine(self, v132, v133, v134, v135, v136);
  objc_msgSend_setIsSingleLine_(v4, v138, isSingleLine, v139, v140, v141);
  uint64_t v147 = objc_msgSend_supportsAutoLineBreaks(self, v142, v143, v144, v145, v146);
  objc_msgSend_setSupportsAutoLineBreaks_(v4, v148, v147, v149, v150, v151);
  uint64_t CharacterLevelPosition = objc_msgSend_lastCharacterLevelPosition(self, v152, v153, v154, v155, v156);
  objc_msgSend_setLastCharacterLevelPosition_(v4, v158, CharacterLevelPosition, v159, v160, v161);
  uint64_t v167 = objc_msgSend_protectedCharacterIndexes(self, v162, v163, v164, v165, v166);
  objc_msgSend_setProtectedCharacterIndexes_(v4, v168, (uint64_t)v167, v169, v170, v171);

  return v4;
}

- (int64_t)absoluteLocationFromRelativeLocation:(int64_t)a3
{
  int64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL) {
    return self->_referenceSubstringRange.location + a3;
  }
  return result;
}

- (int64_t)relativeLocationFromAbsoluteLocation:(int64_t)a3
{
  int64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL) {
    return a3 - self->_referenceSubstringRange.location;
  }
  return result;
}

- (CGRect)characterRectForCharacterIndex:(int64_t)a3
{
  double x = *MEMORY[0x1E4F1DB20];
  double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || (int64_t v7 = a3 - self->_referenceSubstringRange.location, v7 >= 0))
  {
    if (v7 < self->_referenceSubstringRange.length)
    {
      uint64_t v8 = &self->_characterRectsInReferenceSubstring[v7];
      double x = v8->origin.x;
      double y = v8->origin.y;
      double width = v8->size.width;
      double height = v8->size.height;
    }
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)visualCharacterRectForCharacterIndex:(int64_t)a3
{
  objc_msgSend_characterRectForComposedCharacterAtIndex_(self, a2, a3, v3, v4, v5);
  CGFloat x = v46.origin.x;
  double y = v46.origin.y;
  CGFloat width = v46.size.width;
  double height = v46.size.height;
  if (CGRectIsNull(v46)) {
    goto LABEL_11;
  }
  if (qword_1EA3C9118 == -1)
  {
    uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
    if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  dispatch_once(&qword_1EA3C9118, &unk_1F2013150);
  uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL) {
LABEL_4:
  }
    uint64_t v17 = a3 - self->_referenceSubstringRange.location;
LABEL_5:
  uint64_t v18 = objc_msgSend_referenceSubstring(self, v12, v13, v14, v15, v16);
  uint64_t v23 = objc_msgSend_characterAtIndex_(v18, v19, v17, v20, v21, v22);

  double v24 = height * 0.25;
  char IsMember = objc_msgSend_characterIsMember_((void *)qword_1EA3C9100, v25, v23, v26, v27, v28);
  double v34 = 2.0;
  double v35 = v24;
  if ((IsMember & 1) == 0)
  {
    char v36 = objc_msgSend_characterIsMember_((void *)qword_1EA3C9108, v30, v23, v31, v32, v33, 2.0, v24);
    double v34 = 3.0;
    double v35 = v24;
    if ((v36 & 1) == 0)
    {
      int v41 = objc_msgSend_characterIsMember_((void *)qword_1EA3C9110, v37, v23, v38, v39, v40, 3.0, v24);
      double v34 = 4.0;
      if (v41) {
        double v34 = 3.0;
      }
      double v35 = 0.0;
    }
  }
  double height = v24 * v34;
  double y = y + v35;
LABEL_11:
  double v42 = x;
  double v43 = y;
  double v44 = width;
  double v45 = height;
  result.size.double height = v45;
  result.size.CGFloat width = v44;
  result.origin.double y = v43;
  result.origin.CGFloat x = v42;
  return result;
}

- (void)enumerateCharacterRectsInRange:(_NSRange)a3 block:(id)a4
{
}

- (void)enumerateCharacterRectsInRange:(_NSRange)a3 reverse:(BOOL)a4 block:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v14 = a5;
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  if (location != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v15 = location - self->_referenceSubstringRange.location;
  }
  objc_msgSend_referenceSubstringRange(self, v9, v10, v11, v12, v13);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1C49DC6A8;
  v22[3] = &unk_1E64E1B68;
  uint64_t v24 = v16;
  v22[4] = self;
  id v17 = v14;
  id v23 = v17;
  uint64_t v18 = (void (**)(void, void, void))MEMORY[0x1C8786E90](v22);
  char v21 = 0;
  if (a4)
  {
    uint64_t v19 = length + v15 - 1;
    do
    {
      if (v19 < v15) {
        break;
      }
      ((void (**)(void, uint64_t, char *))v18)[2](v18, v19--, &v21);
    }
    while (!v21);
  }
  else if (v15 < v15 + length)
  {
    NSUInteger v20 = length - 1;
    do
    {
      ((void (**)(void, uint64_t, char *))v18)[2](v18, v15, &v21);
      if (!v20) {
        break;
      }
      ++v15;
      --v20;
    }
    while (!v21);
  }
}

- (id)referenceSubstringInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSRange referenceSubstringRange = self->_referenceSubstringRange;
  v20.NSUInteger location = location;
  v20.NSUInteger length = length;
  NSRange v10 = NSIntersectionRange(v20, referenceSubstringRange);
  if (v10.length == length)
  {
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    if (location != 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v11 = location - self->_referenceSubstringRange.location;
    }
    uint64_t v12 = objc_msgSend_referenceSubstring(self, (const char *)v10.length, v6, v7, v8, v9);
    uint64_t v16 = objc_msgSend_substringWithRange_(v12, v13, v11, length, v14, v15);

    id v17 = (void *)v16;
  }
  else
  {
    id v17 = 0;
  }
  return v17;
}

- (_NSRange)referenceSubstringRangeOfComposedCharacterAtIndex:(int64_t)a3
{
  int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || (int64_t v7 = a3 - self->_referenceSubstringRange.location, v7 >= 0))
  {
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    if (v7 >= self->_referenceSubstringRange.length)
    {
      NSUInteger v16 = 0;
    }
    else
    {
      uint64_t v9 = objc_msgSend_referenceSubstring(self, a2, a3, v3, v4, v5);
      uint64_t v14 = objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v9, v10, v7, v11, v12, v13);
      NSUInteger v16 = v15;

      if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v8 = self->_referenceSubstringRange.location + v14;
      }
    }
  }
  else
  {
    NSUInteger v16 = 0;
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger v17 = v8;
  NSUInteger v18 = v16;
  result.NSUInteger length = v18;
  result.NSUInteger location = v17;
  return result;
}

- (CGRect)unionCharacterRects
{
  uint64_t v7 = objc_msgSend_referenceSubstringRange(self, a2, v2, v3, v4, v5);
  if (self)
  {
    uint64_t v20 = 0;
    char v21 = (double *)&v20;
    uint64_t v22 = 0x4010000000;
    id v23 = &unk_1C4CB5C62;
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    long long v24 = *MEMORY[0x1E4F1DB20];
    long long v25 = v10;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_1C49DC87C;
    v19[3] = &unk_1E64E1B90;
    v19[4] = &v20;
    objc_msgSend_enumerateCharacterRectsInRange_block_(self, v8, v7, (uint64_t)v8, (uint64_t)v19, v9);
    double v12 = v21[4];
    double v11 = v21[5];
    double v14 = v21[6];
    double v13 = v21[7];
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    double v13 = 0.0;
    double v14 = 0.0;
    double v11 = 0.0;
    double v12 = 0.0;
  }
  double v15 = v12;
  double v16 = v11;
  double v17 = v14;
  double v18 = v13;
  result.size.double height = v18;
  result.size.CGFloat width = v17;
  result.origin.double y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (CGRect)characterRectForComposedCharacterAtIndex:(int64_t)a3
{
  uint64_t v7 = objc_msgSend_referenceSubstringRangeOfComposedCharacterAtIndex_(self, a2, a3, v3, v4, v5);
  if (self)
  {
    uint64_t v20 = 0;
    char v21 = (double *)&v20;
    uint64_t v22 = 0x4010000000;
    id v23 = &unk_1C4CB5C62;
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    long long v24 = *MEMORY[0x1E4F1DB20];
    long long v25 = v10;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_1C49DC87C;
    v19[3] = &unk_1E64E1B90;
    v19[4] = &v20;
    objc_msgSend_enumerateCharacterRectsInRange_block_(self, v8, v7, (uint64_t)v8, (uint64_t)v19, v9);
    double v12 = v21[4];
    double v11 = v21[5];
    double v14 = v21[6];
    double v13 = v21[7];
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    double v13 = 0.0;
    double v14 = 0.0;
    double v11 = 0.0;
    double v12 = 0.0;
  }
  double v15 = v12;
  double v16 = v11;
  double v17 = v14;
  double v18 = v13;
  result.size.double height = v18;
  result.size.CGFloat width = v17;
  result.origin.double y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (CHTextInputTarget)textInputTarget
{
  return self->_textInputTarget;
}

- (int64_t)textContentLength
{
  return self->_textContentLength;
}

- (NSString)referenceSubstring
{
  return self->_referenceSubstring;
}

- (_NSRange)referenceSubstringRange
{
  NSUInteger length = self->_referenceSubstringRange.length;
  NSUInteger location = self->_referenceSubstringRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)strokeCoveredTextRange
{
  NSUInteger length = self->_strokeCoveredTextRange.length;
  NSUInteger location = self->_strokeCoveredTextRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)selectedTextRange
{
  NSUInteger length = self->_selectedTextRange.length;
  NSUInteger location = self->_selectedTextRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (BOOL)isCursorStrong
{
  return self->_isCursorStrong;
}

- (BOOL)containsCommittedStrokes
{
  return self->_containsCommittedStrokes;
}

- (_NSRange)activePreviewRange
{
  NSUInteger length = self->_activePreviewRange.length;
  NSUInteger location = self->_activePreviewRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (int)contentType
{
  return self->_contentType;
}

- (int)autoCapitalizationMode
{
  return self->_autoCapitalizationMode;
}

- (int)autoCorrectionMode
{
  return self->_autoCorrectionMode;
}

- (int)baseWritingDirection
{
  return *(void *)&self->_isSingleLine;
}

- (BOOL)isSingleLine
{
  return self->_lastCharacterLevelPosition;
}

- (BOOL)supportsAutoLineBreaks
{
  return BYTE1(self->_lastCharacterLevelPosition);
}

- (int64_t)lastCharacterLevelPosition
{
  return (int64_t)self->_protectedCharacterIndexes;
}

- (CGRect)characterRectsInReferenceSubstring
{
  return self->_characterRectsInReferenceSubstring;
}

- (NSIndexSet)protectedCharacterIndexes
{
  return (NSIndexSet *)self[1].super.isa;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self[1].super.isa, 0);
  objc_storeStrong((id *)&self->_referenceSubstring, 0);
  objc_storeStrong((id *)&self->_textInputTarget, 0);
}

@end