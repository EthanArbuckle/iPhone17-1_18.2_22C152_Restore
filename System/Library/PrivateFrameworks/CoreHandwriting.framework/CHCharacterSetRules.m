@interface CHCharacterSetRules
+ (unint64_t)characterType:(unsigned int)a3;
+ (unint64_t)characterTypeFromString:(id)a3;
+ (unint64_t)expectedMaxDotCount:(unsigned int)a3;
+ (unint64_t)expectedMaxStrokeCount:(unsigned int)a3;
+ (unint64_t)expectedMinStrokeCount:(unsigned int)a3;
- (CHCharacterSetRules)init;
- (id).cxx_construct;
@end

@implementation CHCharacterSetRules

+ (unint64_t)expectedMaxStrokeCount:(unsigned int)a3
{
  self;
  if (qword_1EA3C94D0 != -1) {
    dispatch_once(&qword_1EA3C94D0, &unk_1F2012FF0);
  }
  v4 = (id)qword_1EA3C94C8;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  if (v4) {
    v5 = v4[33];
  }
  else {
    v5 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4BB9718;
  block[3] = &unk_1E64E4D68;
  id v10 = v4;
  v11 = &v13;
  unsigned int v12 = a3;
  v6 = v4;
  dispatch_sync(v5, block);
  unint64_t v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

+ (unint64_t)expectedMinStrokeCount:(unsigned int)a3
{
  self;
  if (qword_1EA3C94D0 != -1) {
    dispatch_once(&qword_1EA3C94D0, &unk_1F2012FF0);
  }
  v4 = (id)qword_1EA3C94C8;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  if (v4) {
    v5 = v4[33];
  }
  else {
    v5 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4BB9FCC;
  block[3] = &unk_1E64E4D68;
  id v10 = v4;
  v11 = &v13;
  unsigned int v12 = a3;
  v6 = v4;
  dispatch_sync(v5, block);
  unint64_t v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

+ (unint64_t)expectedMaxDotCount:(unsigned int)a3
{
  self;
  if (qword_1EA3C94D0 != -1) {
    dispatch_once(&qword_1EA3C94D0, &unk_1F2012FF0);
  }
  v4 = (id)qword_1EA3C94C8;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  if (v4) {
    v5 = v4[33];
  }
  else {
    v5 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4BBA6BC;
  block[3] = &unk_1E64E4D68;
  id v10 = v4;
  v11 = &v13;
  unsigned int v12 = a3;
  v6 = v4;
  dispatch_sync(v5, block);
  unint64_t v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

+ (unint64_t)characterType:(unsigned int)a3
{
  self;
  if (qword_1EA3C94D0 != -1) {
    dispatch_once(&qword_1EA3C94D0, &unk_1F2012FF0);
  }
  v4 = (id)qword_1EA3C94C8;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  if (v4) {
    v5 = v4[33];
  }
  else {
    v5 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4BBA838;
  block[3] = &unk_1E64E4D68;
  id v10 = v4;
  v11 = &v13;
  unsigned int v12 = a3;
  v6 = v4;
  dispatch_sync(v5, block);
  unint64_t v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

+ (unint64_t)characterTypeFromString:(id)a3
{
  *(void *)&v32[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v4, v5, 0, v6, v7, v8);
  if (v16 != (const char *)objc_msgSend_length(v4, v16, v9, v10, v11, v12))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v17 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      int v31 = 138412290;
      *(void *)v32 = v4;
      _os_log_impl(&dword_1C492D000, v17, OS_LOG_TYPE_FAULT, "Method can only be called on a single character string: %@", (uint8_t *)&v31, 0xCu);
    }
  }
  uint64_t v18 = objc_msgSend_codepointAtIndex_outRange_(v4, v13, 0, (uint64_t)&v31, v14, v15);
  uint64_t v19 = *(void *)&v32[1];
  if (v19 == objc_msgSend_length(v4, v20, v21, v22, v23, v24)) {
    unint64_t v29 = objc_msgSend_characterType_(a1, v25, v18, v26, v27, v28);
  }
  else {
    unint64_t v29 = 0;
  }

  return v29;
}

- (CHCharacterSetRules)init
{
  v208.receiver = self;
  v208.super_class = (Class)CHCharacterSetRules;
  v2 = [(CHCharacterSetRules *)&v208 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.CoreHandwriting.CHCharacterSetsRules", v3);
    charSetRulesQueue = v2->__charSetRulesQueue;
    v2->__charSetRulesQueue = (OS_dispatch_queue *)v4;

    uint64_t v10 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v6, @"abcdefghijklmnopqrstuvwxyzàáâãäçèéêëìíîïñòóôõöùúûü\xFFœæß", v7, v8, v9);
    lowercaseCharSet = v2->_lowercaseCharSet;
    v2->_lowercaseCharSet = (NSCharacterSet *)v10;

    uint64_t v16 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v12, @"ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÄÇÈÉÊËÌÍÎÏÑÒÓÔÕÖÙÚÛÜŸŒÆ", v13, v14, v15);
    uppercaseCharSet = v2->_uppercaseCharSet;
    v2->_uppercaseCharSet = (NSCharacterSet *)v16;

    uint64_t v23 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x1E4F28B88], v18, v19, v20, v21, v22);
    digitCharSet = v2->_digitCharSet;
    v2->_digitCharSet = (NSCharacterSet *)v23;

    uint64_t v29 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v25, @"\"#@(¡¿“„«"), v26, v27, v28;
    startPunctuationCharSet = v2->_startPunctuationCharSet;
    v2->_startPunctuationCharSet = (NSCharacterSet *)v29;

    uint64_t v35 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v31, @"-'_", v32, v33, v34);
    middlePunctuationCharSet = v2->_middlePunctuationCharSet;
    v2->_middlePunctuationCharSet = (NSCharacterSet *)v35;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v37, @".,;:!?\"“»"),
      v38,
      v39,
    uint64_t v41 = v40);
    endOfWordPunctuationCharSet = v2->_endOfWordPunctuationCharSet;
    v2->_endOfWordPunctuationCharSet = (NSCharacterSet *)v41;

    uint64_t v47 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v43, @".!?", v44, v45, v46);
    endOfSentencePunctuationCharSet = v2->_endOfSentencePunctuationCharSet;
    v2->_endOfSentencePunctuationCharSet = (NSCharacterSet *)v47;

    uint64_t v53 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v49, @"$€¢£-.+[", v50, v51, v52);
    digitStartPunctuationCharSet = v2->_digitStartPunctuationCharSet;
    v2->_digitStartPunctuationCharSet = (NSCharacterSet *)v53;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v55, @"%?!.,:;\"])$€¢£₽°"),
      v56,
      v57,
    uint64_t v59 = v58);
    digitEndPunctuationCharSet = v2->_digitEndPunctuationCharSet;
    v2->_digitEndPunctuationCharSet = (NSCharacterSet *)v59;

    uint64_t v65 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v61, @"^*+=<>.,", v62, v63, v64);
    arithmeticOperatorCharSet = v2->_arithmeticOperatorCharSet;
    v2->_arithmeticOperatorCharSet = (NSCharacterSet *)v65;

    uint64_t v71 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v67, @":'\"-/", v68, v69, v70);
    dateTimeSeparatorCharSet = v2->_dateTimeSeparatorCharSet;
    v2->_dateTimeSeparatorCharSet = (NSCharacterSet *)v71;

    uint64_t v77 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v73, @"apmAPM.", v74, v75, v76);
    dateTimeEndLetterCharSet = v2->_dateTimeEndLetterCharSet;
    v2->_dateTimeEndLetterCharSet = (NSCharacterSet *)v77;

    uint64_t v83 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v79, @"strdndth.", v80, v81, v82);
    numeralEndLetterCharSet = v2->_numeralEndLetterCharSet;
    v2->_numeralEndLetterCharSet = (NSCharacterSet *)v83;

    v90 = objc_msgSend_alphanumericCharacterSet(MEMORY[0x1E4F28B88], v85, v86, v87, v88, v89);
    uint64_t v96 = objc_msgSend_invertedSet(v90, v91, v92, v93, v94, v95);
    lexiconSkipCharSet = v2->_lexiconSkipCharSet;
    v2->_lexiconSkipCharSet = (NSCharacterSet *)v96;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v98, @"!?:;ij%¡¿ÄËÏÖÜŸäëïöü\xFF",
      v99,
      v100,
    uint64_t v102 = v101);
    containsDotCharSet = v2->_containsDotCharSet;
    v2->_containsDotCharSet = (NSCharacterSet *)v102;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v104, @":;%ÄËÏÖÜŸäëïöü\xFF",
      v105,
      v106,
    uint64_t v108 = v107);
    containsTwoDotsCharSet = v2->_containsTwoDotsCharSet;
    v2->_containsTwoDotsCharSet = (NSCharacterSet *)v108;

    uint64_t v114 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v110, @"@#", v111, v112, v113);
    prefixCapitalizationExceptionCharSet = v2->_prefixCapitalizationExceptionCharSet;
    v2->_prefixCapitalizationExceptionCharSet = (NSCharacterSet *)v114;

    uint64_t v120 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v116, @"!?.", v117, v118, v119);
    selfLoopPunctuationCharSet = v2->_selfLoopPunctuationCharSet;
    v2->_selfLoopPunctuationCharSet = (NSCharacterSet *)v120;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v122, @":;B=",
      v123,
      v124,
    uint64_t v126 = v125);
    emoticonTopCharSet = v2->_emoticonTopCharSet;
    v2->_emoticonTopCharSet = (NSCharacterSet *)v126;

    uint64_t v132 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v128, @"-'", v129, v130, v131);
    emoticonMiddleCharSet = v2->_emoticonMiddleCharSet;
    v2->_emoticonMiddleCharSet = (NSCharacterSet *)v132;

    uint64_t v138 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v134, @"(pPDoOxX*"), v135, v136, v137);
    emoticonBottomCharSet = v2->_emoticonBottomCharSet;
    v2->_emoticonBottomCharSet = (NSCharacterSet *)v138;

    uint64_t v144 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v140, @"@", v141, v142, v143);
    emailAtCharSet = v2->_emailAtCharSet;
    v2->_emailAtCharSet = (NSCharacterSet *)v144;

    uint64_t v150 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v146, @"_-.+", v147, v148, v149);
    emailPunctuationCharSet = v2->_emailPunctuationCharSet;
    v2->_emailPunctuationCharSet = (NSCharacterSet *)v150;

    uint64_t v156 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v152, @"_-.:/+&?%()$=", v153, v154, v155);
    urlPunctuationCharSet = v2->_urlPunctuationCharSet;
    v2->_urlPunctuationCharSet = (NSCharacterSet *)v156;

    uint64_t v162 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v158, @"-/.@_", v159, v160, v161);
    nonSpaceSeparatorCharSet = v2->_nonSpaceSeparatorCharSet;
    v2->_nonSpaceSeparatorCharSet = (NSCharacterSet *)v162;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v164, @".,!?;:۔،؛؟",
      v165,
      v166,
    uint64_t v168 = v167);
    punctuationThatNeedSpaceCleanup = v2->_punctuationThatNeedSpaceCleanup;
    v2->_punctuationThatNeedSpaceCleanup = (NSCharacterSet *)v168;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v170, @"!?:;",
      v171,
      v172,
    uint64_t v174 = v173);
    symbolsRequiringSpaceBeforeInFrench = v2->_symbolsRequiringSpaceBeforeInFrench;
    v2->_symbolsRequiringSpaceBeforeInFrench = (NSCharacterSet *)v174;

    uint64_t v180 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v176, @"$£€¥₽₫", v177, v178, v179);
    currencySymbols = v2->_currencySymbols;
    v2->_currencySymbols = (NSCharacterSet *)v180;

    uint64_t v186 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v182, @"¡¿", v183, v184, v185);
    sentenceStartPunctuationInSpanish = v2->_sentenceStartPunctuationInSpanish;
    v2->_sentenceStartPunctuationInSpanish = (NSCharacterSet *)v186;

    uint64_t v192 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v188, @"〒", v189, v190, v191);
    commonJapaneseSymbols = v2->_commonJapaneseSymbols;
    v2->_commonJapaneseSymbols = (NSCharacterSet *)v192;

    uint64_t v198 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v194, @"()［］【】《》『』「」〈〉｛｝（）〝〟", v195, v196, v197);
    CJKPairedPunctuationsCharSet = v2->_CJKPairedPunctuationsCharSet;
    v2->_CJKPairedPunctuationsCharSet = (NSCharacterSet *)v198;

    uint64_t v205 = objc_msgSend_alphanumericCharacterSet(MEMORY[0x1E4F28B88], v200, v201, v202, v203, v204);
    alphaNumericCharSet = v2->_alphaNumericCharSet;
    v2->_alphaNumericCharSet = (NSCharacterSet *)v205;
  }
  return v2;
}

- (void).cxx_destruct
{
  sub_1C49A1374((void *)self->_signatureUniChar.__tree_.__pair1_.__value_.__left_);
  sub_1C4999C7C((uint64_t)&self->_strokeMaxPenalties, (void *)self->_strokeMaxPenalties.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->__charSetRulesQueue, 0);
  objc_storeStrong((id *)&self->_alphaNumericCharSet, 0);
  objc_storeStrong((id *)&self->_CJKPairedPunctuationsCharSet, 0);
  objc_storeStrong((id *)&self->_commonJapaneseSymbols, 0);
  objc_storeStrong((id *)&self->_sentenceStartPunctuationInSpanish, 0);
  objc_storeStrong((id *)&self->_symbolsRequiringSpaceBeforeInFrench, 0);
  objc_storeStrong((id *)&self->_currencySymbols, 0);
  objc_storeStrong((id *)&self->_punctuationThatNeedSpaceCleanup, 0);
  objc_storeStrong((id *)&self->_nonSpaceSeparatorCharSet, 0);
  objc_storeStrong((id *)&self->_urlPunctuationCharSet, 0);
  objc_storeStrong((id *)&self->_emailPunctuationCharSet, 0);
  objc_storeStrong((id *)&self->_emailAtCharSet, 0);
  objc_storeStrong((id *)&self->_emoticonBottomCharSet, 0);
  objc_storeStrong((id *)&self->_emoticonMiddleCharSet, 0);
  objc_storeStrong((id *)&self->_emoticonTopCharSet, 0);
  objc_storeStrong((id *)&self->_selfLoopPunctuationCharSet, 0);
  objc_storeStrong((id *)&self->_prefixCapitalizationExceptionCharSet, 0);
  objc_storeStrong((id *)&self->_containsTwoDotsCharSet, 0);
  objc_storeStrong((id *)&self->_containsDotCharSet, 0);
  objc_storeStrong((id *)&self->_lexiconSkipCharSet, 0);
  objc_storeStrong((id *)&self->_numeralEndLetterCharSet, 0);
  objc_storeStrong((id *)&self->_dateTimeEndLetterCharSet, 0);
  objc_storeStrong((id *)&self->_dateTimeSeparatorCharSet, 0);
  objc_storeStrong((id *)&self->_arithmeticOperatorCharSet, 0);
  objc_storeStrong((id *)&self->_digitEndPunctuationCharSet, 0);
  objc_storeStrong((id *)&self->_digitStartPunctuationCharSet, 0);
  objc_storeStrong((id *)&self->_endOfSentencePunctuationCharSet, 0);
  objc_storeStrong((id *)&self->_endOfWordPunctuationCharSet, 0);
  objc_storeStrong((id *)&self->_middlePunctuationCharSet, 0);
  objc_storeStrong((id *)&self->_startPunctuationCharSet, 0);
  objc_storeStrong((id *)&self->_digitCharSet, 0);
  objc_storeStrong((id *)&self->_uppercaseCharSet, 0);
  objc_storeStrong((id *)&self->_lowercaseCharSet, 0);
}

- (id).cxx_construct
{
  *((void *)self + 34) = (char *)self + 280;
  *((void *)self + 35) = 0;
  *((void *)self + 38) = 0;
  *((void *)self + 39) = 0;
  *((void *)self + 36) = 0;
  *((void *)self + 37) = (char *)self + 304;
  return self;
}

@end