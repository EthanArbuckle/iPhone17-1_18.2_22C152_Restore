@interface CVNLPCTCTextDecodingPath
+ (id)_getQueue;
+ (void)applyWordLanguageModelProbabilityToPath:(id)a3 stemmedFromPath:(id)a4 isCommittingToken:(BOOL)a5;
- (BOOL)hasExpanded;
- (BOOL)hasProblematicMixedScriptWords;
- (BOOL)optimizingAlignment;
- (CVNLPCTCTextDecodingPath)initWithLanguageResourceBundle:(id)a3 scoringFunction:(id)a4 initialCharacterLMState:(CVNLPLanguageModelWithState *)a5 characterTokenIDs:(vector<unsigned)int wordTokenIDs:(std:(vector<unsigned)int :(std:(BOOL)a8 :(BOOL)a9 allocator<unsigned int>> *)a7 allocator<unsigned int>> *)a6 optimizingAlignment:hasContext:;
- (CVNLPLanguageModelWithState)characterLMState;
- (CVNLPLanguageResourceBundle)languageResourceBundle;
- (CVNLPLexiconCursors)cursors;
- (NSString)latestExpandedSymbol;
- (NSString)latestExpandedSymbolIncludingPseudospace;
- (double)activeWordLexiconLogProbability;
- (double)blankLogProbability;
- (double)historyLexiconLogProbability;
- (double)languageResourceLogProbability;
- (double)lastTokenBoundaryLogProbability;
- (double)lexiconScore;
- (double)modelLogProbability;
- (double)nonBlankLogProbability;
- (double)normalizedActivationLogProbability;
- (double)normalizedTotalLogProbability;
- (double)scoreForTokenIndex:(int64_t)a3;
- (float)_wordLanguageModelLogProbabilityForString:(id)a3 originalWordRanges:(id)a4 originalWordIDs:(vector<unsigned)int wordRanges:(std:(id)a6 :(vector<unsigned)int allocator<unsigned int>> *)a5 wordIDs:(std::allocator<unsigned int>> *)a7;
- (id).cxx_construct;
- (id)childPathWithBlankLogProb:(double)a3;
- (id)debugDescription;
- (id)description;
- (id)pathByExtendingWithString:(id)a3 extendedPathString:(id)a4 blankLogProb:(double)a5 nonBlankLogProb:(double)a6 timestep:(int64_t)a7 commitAction:(int64_t)a8 symbolLogProb:(double)a9;
- (id)scoringFunction;
- (id)tokensWithTimestep:(int64_t)a3 isFinalTimestep:(BOOL)a4;
- (int64_t)characterCount;
- (int64_t)compare:(id)a3;
- (int64_t)pseudoSpaceCount;
- (int64_t)tokenCount;
- (unint64_t)_currentTokenStringLength;
- (void)_updateCharacterLanguageModelLogProbabilityForString:(id)a3 stemmingFromPath:(id)a4 normalizedCodepoint:(unsigned int)a5;
- (void)_updateLexiconLogProbabilityForString:(id)a3 stemmingFromPath:(id)a4;
- (void)commitTokenAtTimestep:(int64_t)a3 currentSymbolLogProbability:(double)a4 commitAction:(int64_t)a5 string:(id)a6 stemmingFromPath:(id)a7;
- (void)dealloc;
- (void)merge:(id)a3 logProbCumulator:(id)a4;
- (void)setActiveWordLexiconLogProbability:(double)a3;
- (void)setBlankLogProbability:(double)a3;
- (void)setCharacterCount:(int64_t)a3;
- (void)setCharacterLMState:(CVNLPLanguageModelWithState *)a3;
- (void)setCharacterLanguageModelLogProbability:(double)a3;
- (void)setCursors:(id)a3;
- (void)setHistoryLexiconLogProbability:(double)a3;
- (void)setLastTokenBoundaryLogProbability:(double)a3;
- (void)setNonBlankLogProbability:(double)a3;
- (void)setPseudoSpaceCount:(int64_t)a3;
- (void)setWordLanguageModelLogProbability:(double)a3;
- (void)updateLastTokenWithMaxActivation:(int64_t)a3 totalLogProbability:(double)a4 tokenBoundaryLogProbability:(double)a5;
@end

@implementation CVNLPCTCTextDecodingPath

- (CVNLPCTCTextDecodingPath)initWithLanguageResourceBundle:(id)a3 scoringFunction:(id)a4 initialCharacterLMState:(CVNLPLanguageModelWithState *)a5 characterTokenIDs:(vector<unsigned)int wordTokenIDs:(std:(vector<unsigned)int :(std:(BOOL)a8 :(BOOL)a9 allocator<unsigned int>> *)a7 allocator<unsigned int>> *)a6 optimizingAlignment:hasContext:
{
  id v16 = a3;
  id v17 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CVNLPCTCTextDecodingPath;
  v18 = [(CVNLPTextDecodingPath *)&v22 init];
  v19 = v18;
  if (v18)
  {
    v18->_blankLogProbability = -1022.0;
    v18->_nonBlankLogProbability = -1022.0;
    v18->_historyLexiconLogProbability = 0.0;
    v18->_activeWordLexiconLogProbability = 0.0;
    v18->_normalizedTotalLogProbability = 0.0;
    v18->_hasProblematicMixedScriptWords = 0;
    v18->_hasCalculatedHasProblematicMixedScriptWords = 0;
    v18->_lastCodeUnitType = 0;
    p_tokenString = &v18->_tokenString;
    if (&v19->_tokenString != a6) {
      sub_1B4C2ADD4(p_tokenString, (char *)a6->__begin_, (char *)a6->__end_, a6->__end_ - a6->__begin_);
    }
    if (&v19->_histWordTokenIDs != a7) {
      sub_1B4C2ADD4(&v19->_histWordTokenIDs.__begin_, (char *)a7->__begin_, (char *)a7->__end_, a7->__end_ - a7->__begin_);
    }
    v19->_beginningCurrentWord = 0;
    v19->_optimizingAlignment = a8;
    v19->_scoringFunction = v17;
    v19->_hasContext = a9;
    objc_storeStrong((id *)&v19->_languageResourceBundle, a3);
    v19->_hasExpanded = 0;
    if (a5) {
      v19->_characterLMState = (CVNLPLanguageModelWithState *)CFRetain(a5);
    }
  }

  return v19;
}

- (void)dealloc
{
  characterLMState = self->_characterLMState;
  if (characterLMState)
  {
    CFRelease(characterLMState);
    self->_characterLMState = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CVNLPCTCTextDecodingPath;
  [(CVNLPCTCTextDecodingPath *)&v4 dealloc];
}

- (void)setCharacterLanguageModelLogProbability:(double)a3
{
  self->super._characterLanguageModelLogProbability = a3;
}

- (void)setWordLanguageModelLogProbability:(double)a3
{
  self->super._wordLanguageModelLogProbability = a3;
}

- (void)setCharacterCount:(int64_t)a3
{
  self->super._characterCount = a3;
}

- (void)setPseudoSpaceCount:(int64_t)a3
{
  self->super._pseudoSpaceCount = a3;
}

- (void)setCharacterLMState:(CVNLPLanguageModelWithState *)a3
{
  characterLMState = self->_characterLMState;
  if (characterLMState != a3)
  {
    CFRelease(characterLMState);
    self->_characterLMState = (CVNLPLanguageModelWithState *)CFRetain(a3);
  }
}

- (void)setLastTokenBoundaryLogProbability:(double)a3
{
  end = self->_tokenBoundaryLogProbabilities.__end_;
  if (end != self->_tokenBoundaryLogProbabilities.__begin_) {
    *(end - 1) = a3;
  }
}

- (int64_t)characterCount
{
  return self->super._characterCount;
}

- (int64_t)pseudoSpaceCount
{
  return self->super._pseudoSpaceCount;
}

- (int64_t)tokenCount
{
  return self->_histWordTokenIDs.__end_ - self->_histWordTokenIDs.__begin_;
}

- (double)modelLogProbability
{
  double blankLogProbability = self->_blankLogProbability;
  double nonBlankLogProbability = self->_nonBlankLogProbability;
  double v4 = fmax(blankLogProbability, nonBlankLogProbability);
  double v5 = fmin(blankLogProbability, nonBlankLogProbability);
  if (v5 >= -1021.0)
  {
    long double v6 = exp(v5 - v4);
    return log1p(v6) + v4;
  }
  return v4;
}

- (double)normalizedTotalLogProbability
{
  double result = self->_normalizedTotalLogProbability;
  if (result == 0.0)
  {
    double result = (*((double (**)(void))self->_scoringFunction + 2))();
    self->_normalizedTotalLogProbability = result;
  }
  return result;
}

- (double)lexiconScore
{
  return self->_activeWordLexiconLogProbability + self->_historyLexiconLogProbability;
}

- (BOOL)hasProblematicMixedScriptWords
{
  if (!self->super._characterCount) {
    return 0;
  }
  if (self->_hasCalculatedHasProblematicMixedScriptWords) {
    return self->_hasProblematicMixedScriptWords;
  }
  self->_hasProblematicMixedScriptWords = sub_1B4C47EEC(self->super._string);
  self->_hasCalculatedHasProblematicMixedScriptWords = 1;
  return self->_hasProblematicMixedScriptWords;
}

- (double)lastTokenBoundaryLogProbability
{
  end = self->_tokenBoundaryLogProbabilities.__end_;
  if (end == self->_tokenBoundaryLogProbabilities.__begin_) {
    return 0.0;
  }
  else {
    return *(end - 1);
  }
}

- (double)scoreForTokenIndex:(int64_t)a3
{
  if (a3 <= 0) {
    return self->_cumulativeTokenLogProbabilities.__begin_[a3] - 0.0;
  }
  else {
    return self->_cumulativeTokenLogProbabilities.__begin_[a3] - self->_cumulativeTokenLogProbabilities.__begin_[a3 - 1];
  }
}

- (double)normalizedActivationLogProbability
{
  objc_msgSend_modelLogProbability(self, a2, v2, v3);
  return v8 / (double)(objc_msgSend_characterCount(self, v5, v6, v7) + 1);
}

- (NSString)latestExpandedSymbolIncludingPseudospace
{
  return self->_latestExpandedSymbolIncludingPseudospace;
}

- (NSString)latestExpandedSymbol
{
  uint64_t v3 = self->_latestExpandedSymbolIncludingPseudospace;
  if (objc_msgSend_length(v3, v4, v5, v6) == 1)
  {
    int v9 = objc_msgSend_characterAtIndex_(v3, v7, 0, v8);

    if (v9 == 57427)
    {
      v10 = 0;
      return v10;
    }
  }
  else
  {
  }
  v10 = self->_latestExpandedSymbolIncludingPseudospace;
  return v10;
}

- (BOOL)hasExpanded
{
  return self->_hasExpanded;
}

- (unint64_t)_currentTokenStringLength
{
  end = self->_tokenStringSegmentationPositions.__end_;
  if (end == self->_tokenStringSegmentationPositions.__begin_) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *(end - 1);
  }
  string = self->super._string;
  uint64_t v7 = objc_msgSend_length(string, a2, v2, v3);
  int v9 = objc_msgSend_substringWithRange_(string, v8, v5, v7 - v5);
  unint64_t v12 = (unint64_t)objc_msgSend_lengthOfBytesUsingEncoding_(v9, v10, 2348810496, v11) >> 2;

  return v12;
}

- (void)commitTokenAtTimestep:(int64_t)a3 currentSymbolLogProbability:(double)a4 commitAction:(int64_t)a5 string:(id)a6 stemmingFromPath:(id)a7
{
  id v172 = a6;
  id v15 = a7;
  if (!a5) {
    goto LABEL_146;
  }
  unint64_t v16 = a3 + 1;
  p_tokenMaxActivations = &self->_tokenMaxActivations;
  begin = self->_tokenMaxActivations.__begin_;
  end = self->_tokenMaxActivations.__end_;
  BOOL v20 = end == begin || v16 > *(end - 1);
  if (objc_msgSend__currentTokenStringLength(self, v12, v13, v14)) {
    BOOL v24 = v20;
  }
  else {
    BOOL v24 = 0;
  }
  if (v24)
  {
    id v170 = v15;
    if (a5 != 1)
    {
      if (a5 != 2) {
        goto LABEL_61;
      }
      unint64_t v25 = (unint64_t)objc_msgSend_lengthOfBytesUsingEncoding_(v172, v21, 2348810496, v23) >> 2;
      p_tokenCommitCharacterLengths = &self->_tokenCommitCharacterLengths;
      v28 = self->_tokenCommitCharacterLengths.__end_;
      value = self->_tokenCommitCharacterLengths.__end_cap_.__value_;
      if (v28 < value)
      {
        unint64_t *v28 = v25;
        uint64_t v29 = (uint64_t)(v28 + 1);
LABEL_60:
        p_tokenCommitCharacterLengths->__end_ = (unint64_t *)v29;
LABEL_61:
        uint64_t v72 = objc_msgSend_length(self->super._string, v21, v22, v23, v170);
        uint64_t v76 = v72;
        p_tokenStringSegmentationPositions = &self->_tokenStringSegmentationPositions;
        v79 = self->_tokenStringSegmentationPositions.__end_;
        v78 = self->_tokenStringSegmentationPositions.__end_cap_.__value_;
        if (v79 < v78)
        {
          unint64_t *v79 = v72;
          v80 = v79 + 1;
          goto LABEL_82;
        }
        v81 = p_tokenStringSegmentationPositions->__begin_;
        uint64_t v82 = (char *)v79 - (char *)p_tokenStringSegmentationPositions->__begin_;
        uint64_t v83 = v82 >> 3;
        unint64_t v84 = (v82 >> 3) + 1;
        if (v84 >> 61) {
          sub_1B4BB3244();
        }
        uint64_t v85 = (char *)v78 - (char *)v81;
        if (v85 >> 2 > v84) {
          unint64_t v84 = v85 >> 2;
        }
        if ((unint64_t)v85 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v86 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v86 = v84;
        }
        if (v86)
        {
          if (v86 >> 61) {
            sub_1B4BB2D38();
          }
          v87 = operator new(8 * v86);
          v88 = (unint64_t *)&v87[8 * v83];
          v89 = (unint64_t *)&v87[8 * v86];
          unint64_t *v88 = v76;
          v80 = v88 + 1;
          int64_t v90 = (char *)v79 - (char *)v81;
          if (v79 == v81) {
            goto LABEL_80;
          }
        }
        else
        {
          v87 = 0;
          v88 = (unint64_t *)(8 * v83);
          v89 = 0;
          *(void *)(8 * v83) = v76;
          v80 = (unint64_t *)(8 * v83 + 8);
          int64_t v90 = (char *)v79 - (char *)v81;
          if (v79 == v81)
          {
LABEL_80:
            p_tokenStringSegmentationPositions->__begin_ = v88;
            self->_tokenStringSegmentationPositions.__end_ = v80;
            self->_tokenStringSegmentationPositions.__end_cap_.__value_ = v89;
            if (v81) {
              operator delete(v81);
            }
LABEL_82:
            id v15 = v171;
            self->_tokenStringSegmentationPositions.__end_ = v80;
            v101 = self->_tokenMaxActivations.__end_;
            v100 = self->_tokenMaxActivations.__end_cap_.__value_;
            if (v101 < v100)
            {
              unint64_t *v101 = v16;
              v102 = v101 + 1;
              goto LABEL_103;
            }
            v103 = p_tokenMaxActivations->__begin_;
            uint64_t v104 = (char *)v101 - (char *)p_tokenMaxActivations->__begin_;
            uint64_t v105 = v104 >> 3;
            unint64_t v106 = (v104 >> 3) + 1;
            if (v106 >> 61) {
              sub_1B4BB3244();
            }
            uint64_t v107 = (char *)v100 - (char *)v103;
            if (v107 >> 2 > v106) {
              unint64_t v106 = v107 >> 2;
            }
            if ((unint64_t)v107 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v108 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v108 = v106;
            }
            if (v108)
            {
              if (v108 >> 61) {
                goto LABEL_149;
              }
              v109 = operator new(8 * v108);
              v110 = (unint64_t *)&v109[8 * v105];
              v111 = (unint64_t *)&v109[8 * v108];
              unint64_t *v110 = v16;
              v102 = v110 + 1;
              int64_t v112 = (char *)v101 - (char *)v103;
              if (v101 == v103) {
                goto LABEL_101;
              }
            }
            else
            {
              v109 = 0;
              v110 = (unint64_t *)(8 * v105);
              v111 = 0;
              *(void *)(8 * v105) = v16;
              v102 = (unint64_t *)(8 * v105 + 8);
              int64_t v112 = (char *)v101 - (char *)v103;
              if (v101 == v103)
              {
LABEL_101:
                p_tokenMaxActivations->__begin_ = v110;
                self->_tokenMaxActivations.__end_ = v102;
                self->_tokenMaxActivations.__end_cap_.__value_ = v111;
                if (v103) {
                  operator delete(v103);
                }
LABEL_103:
                self->_tokenMaxActivations.__end_ = v102;
                objc_msgSend_modelLogProbability(self, v73, v74, v75);
                uint64_t v123 = v122;
                p_cumulativeTokenLogProbabilities = &self->_cumulativeTokenLogProbabilities;
                v126 = self->_cumulativeTokenLogProbabilities.__end_;
                v125 = self->_cumulativeTokenLogProbabilities.__end_cap_.__value_;
                if (v126 < v125)
                {
                  *(void *)v126 = v122;
                  v127 = v126 + 1;
LABEL_124:
                  self->_cumulativeTokenLogProbabilities.__end_ = v127;
                  p_tokenBoundaryLogProbabilities = &self->_tokenBoundaryLogProbabilities;
                  v149 = p_tokenBoundaryLogProbabilities->__end_;
                  v148 = p_tokenBoundaryLogProbabilities->__end_cap_.__value_;
                  if (v149 < v148)
                  {
                    double *v149 = a4;
                    p_tokenBoundaryLogProbabilities->__end_ = v149 + 1;
                    goto LABEL_146;
                  }
                  v150 = p_tokenBoundaryLogProbabilities->__begin_;
                  uint64_t v151 = (char *)v149 - (char *)p_tokenBoundaryLogProbabilities->__begin_;
                  uint64_t v152 = v151 >> 3;
                  unint64_t v153 = (v151 >> 3) + 1;
                  if (v153 >> 61) {
                    sub_1B4BB3244();
                  }
                  uint64_t v154 = (char *)v148 - (char *)v150;
                  if (v154 >> 2 > v153) {
                    unint64_t v153 = v154 >> 2;
                  }
                  if ((unint64_t)v154 >= 0x7FFFFFFFFFFFFFF8) {
                    unint64_t v155 = 0x1FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v155 = v153;
                  }
                  if (!v155)
                  {
                    v156 = 0;
                    v157 = (double *)(8 * v152);
                    v158 = 0;
                    *(double *)(8 * v152) = a4;
                    uint64_t v159 = 8 * v152 + 8;
                    int64_t v160 = (char *)v149 - (char *)v150;
                    if (v149 == v150)
                    {
LABEL_143:
                      p_tokenBoundaryLogProbabilities->__begin_ = v157;
                      p_tokenBoundaryLogProbabilities->__end_ = (double *)v159;
                      p_tokenBoundaryLogProbabilities->__end_cap_.__value_ = v158;
                      if (v150) {
                        operator delete(v150);
                      }
                      p_tokenBoundaryLogProbabilities->__end_ = (double *)v159;
                      goto LABEL_146;
                    }
LABEL_137:
                    unint64_t v161 = v160 - 8;
                    if (v161 < 0x58) {
                      goto LABEL_162;
                    }
                    if ((unint64_t)((char *)v149 - v156 - v151) < 0x20) {
                      goto LABEL_162;
                    }
                    uint64_t v162 = (v161 >> 3) + 1;
                    uint64_t v163 = 8 * (v162 & 0x3FFFFFFFFFFFFFFCLL);
                    v164 = &v149[v163 / 0xFFFFFFFFFFFFFFF8];
                    v157 = (double *)((char *)v157 - v163);
                    v165 = &v156[8 * v152 - 16];
                    v166 = v149 - 2;
                    uint64_t v167 = v162 & 0x3FFFFFFFFFFFFFFCLL;
                    do
                    {
                      long long v168 = *(_OWORD *)v166;
                      *(v165 - 1) = *((_OWORD *)v166 - 1);
                      _OWORD *v165 = v168;
                      v165 -= 2;
                      v166 -= 4;
                      v167 -= 4;
                    }
                    while (v167);
                    v149 = v164;
                    if (v162 != (v162 & 0x3FFFFFFFFFFFFFFCLL))
                    {
LABEL_162:
                      do
                      {
                        uint64_t v169 = *((void *)v149-- - 1);
                        *((void *)v157-- - 1) = v169;
                      }
                      while (v149 != v150);
                    }
                    goto LABEL_143;
                  }
                  if (!(v155 >> 61))
                  {
                    v156 = operator new(8 * v155);
                    v157 = (double *)&v156[8 * v152];
                    v158 = (double *)&v156[8 * v155];
                    double *v157 = a4;
                    uint64_t v159 = (uint64_t)(v157 + 1);
                    int64_t v160 = (char *)v149 - (char *)v150;
                    if (v149 == v150) {
                      goto LABEL_143;
                    }
                    goto LABEL_137;
                  }
LABEL_149:
                  sub_1B4BB2D38();
                }
                v128 = p_cumulativeTokenLogProbabilities->__begin_;
                uint64_t v129 = (char *)v126 - (char *)p_cumulativeTokenLogProbabilities->__begin_;
                uint64_t v130 = v129 >> 3;
                unint64_t v131 = (v129 >> 3) + 1;
                if (v131 >> 61) {
                  sub_1B4BB3244();
                }
                uint64_t v132 = (char *)v125 - (char *)v128;
                if (v132 >> 2 > v131) {
                  unint64_t v131 = v132 >> 2;
                }
                if ((unint64_t)v132 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v133 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v133 = v131;
                }
                if (v133)
                {
                  if (v133 >> 61) {
                    sub_1B4BB2D38();
                  }
                  v134 = operator new(8 * v133);
                  v135 = (double *)&v134[8 * v130];
                  v136 = (double *)&v134[8 * v133];
                  *(void *)v135 = v123;
                  v127 = v135 + 1;
                  int64_t v137 = (char *)v126 - (char *)v128;
                  if (v126 == v128) {
                    goto LABEL_122;
                  }
                }
                else
                {
                  v134 = 0;
                  v135 = (double *)(8 * v130);
                  v136 = 0;
                  *(void *)(8 * v130) = v122;
                  v127 = (double *)(8 * v130 + 8);
                  int64_t v137 = (char *)v126 - (char *)v128;
                  if (v126 == v128)
                  {
LABEL_122:
                    p_cumulativeTokenLogProbabilities->__begin_ = v135;
                    self->_cumulativeTokenLogProbabilities.__end_ = v127;
                    self->_cumulativeTokenLogProbabilities.__end_cap_.__value_ = v136;
                    if (v128) {
                      operator delete(v128);
                    }
                    goto LABEL_124;
                  }
                }
                unint64_t v138 = v137 - 8;
                if (v138 < 0x58) {
                  goto LABEL_163;
                }
                if ((unint64_t)((char *)v126 - &v134[v129]) < 0x20) {
                  goto LABEL_163;
                }
                uint64_t v139 = (v138 >> 3) + 1;
                uint64_t v140 = 8 * (v139 & 0x3FFFFFFFFFFFFFFCLL);
                v141 = &v126[v140 / 0xFFFFFFFFFFFFFFF8];
                v135 = (double *)((char *)v135 - v140);
                v142 = &v134[8 * v130 - 16];
                v143 = v126 - 2;
                uint64_t v144 = v139 & 0x3FFFFFFFFFFFFFFCLL;
                do
                {
                  long long v145 = *(_OWORD *)v143;
                  *(v142 - 1) = *((_OWORD *)v143 - 1);
                  _OWORD *v142 = v145;
                  v142 -= 2;
                  v143 -= 4;
                  v144 -= 4;
                }
                while (v144);
                v126 = v141;
                if (v139 != (v139 & 0x3FFFFFFFFFFFFFFCLL))
                {
LABEL_163:
                  do
                  {
                    uint64_t v146 = *((void *)v126-- - 1);
                    *((void *)v135-- - 1) = v146;
                  }
                  while (v126 != v128);
                }
                goto LABEL_122;
              }
            }
            unint64_t v113 = v112 - 8;
            if (v113 < 0x58) {
              goto LABEL_164;
            }
            if ((unint64_t)((char *)v101 - &v109[v104]) < 0x20) {
              goto LABEL_164;
            }
            uint64_t v114 = (v113 >> 3) + 1;
            uint64_t v115 = 8 * (v114 & 0x3FFFFFFFFFFFFFFCLL);
            v116 = &v101[v115 / 0xFFFFFFFFFFFFFFF8];
            v110 = (unint64_t *)((char *)v110 - v115);
            v117 = &v109[8 * v105 - 16];
            v118 = v101 - 2;
            uint64_t v119 = v114 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              long long v120 = *(_OWORD *)v118;
              *(v117 - 1) = *((_OWORD *)v118 - 1);
              _OWORD *v117 = v120;
              v117 -= 2;
              v118 -= 4;
              v119 -= 4;
            }
            while (v119);
            v101 = v116;
            if (v114 != (v114 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_164:
              do
              {
                unint64_t v121 = *--v101;
                *--v110 = v121;
              }
              while (v101 != v103);
            }
            goto LABEL_101;
          }
        }
        unint64_t v91 = v90 - 8;
        if (v91 < 0x58) {
          goto LABEL_165;
        }
        if ((unint64_t)((char *)v79 - v87 - v82) < 0x20) {
          goto LABEL_165;
        }
        uint64_t v92 = (v91 >> 3) + 1;
        uint64_t v93 = 8 * (v92 & 0x3FFFFFFFFFFFFFFCLL);
        v94 = &v79[v93 / 0xFFFFFFFFFFFFFFF8];
        v88 = (unint64_t *)((char *)v88 - v93);
        v95 = &v87[8 * v83 - 16];
        v96 = v79 - 2;
        uint64_t v97 = v92 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v98 = *(_OWORD *)v96;
          *(v95 - 1) = *((_OWORD *)v96 - 1);
          _OWORD *v95 = v98;
          v95 -= 2;
          v96 -= 4;
          v97 -= 4;
        }
        while (v97);
        v79 = v94;
        if (v92 != (v92 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_165:
          do
          {
            unint64_t v99 = *--v79;
            *--v88 = v99;
          }
          while (v79 != v81);
        }
        goto LABEL_80;
      }
      v36 = p_tokenCommitCharacterLengths->__begin_;
      uint64_t v46 = (char *)v28 - (char *)p_tokenCommitCharacterLengths->__begin_;
      uint64_t v47 = v46 >> 3;
      unint64_t v48 = (v46 >> 3) + 1;
      if (v48 >> 61) {
        sub_1B4BB3244();
      }
      uint64_t v49 = (char *)value - (char *)v36;
      if (v49 >> 2 > v48) {
        unint64_t v48 = v49 >> 2;
      }
      if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v50 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v50 = v48;
      }
      if (v50)
      {
        if (v50 >> 61) {
          sub_1B4BB2D38();
        }
        uint64_t v51 = (char *)v28 - (char *)p_tokenCommitCharacterLengths->__begin_;
        v52 = operator new(8 * v50);
        uint64_t v46 = v51;
        v43 = (unint64_t *)&v52[8 * v47];
        v44 = (unint64_t *)&v52[8 * v50];
        unint64_t *v43 = v25;
        uint64_t v29 = (uint64_t)(v43 + 1);
        int64_t v53 = (char *)v28 - (char *)v36;
        if (v28 == v36) {
          goto LABEL_58;
        }
        goto LABEL_52;
      }
      v52 = 0;
      v43 = (unint64_t *)(8 * v47);
      v44 = 0;
      *(void *)(8 * v47) = v25;
      uint64_t v29 = 8 * v47 + 8;
      int64_t v53 = (char *)v28 - (char *)v36;
      if (v28 != v36)
      {
LABEL_52:
        unint64_t v63 = v53 - 8;
        if (v63 < 0x58) {
          goto LABEL_166;
        }
        if ((unint64_t)((char *)v28 - v52 - v46) < 0x20) {
          goto LABEL_166;
        }
        uint64_t v64 = (v63 >> 3) + 1;
        uint64_t v65 = 8 * (v64 & 0x3FFFFFFFFFFFFFFCLL);
        v66 = &v28[v65 / 0xFFFFFFFFFFFFFFF8];
        v43 = (unint64_t *)((char *)v43 - v65);
        v67 = &v52[8 * v47 - 16];
        v68 = v28 - 2;
        uint64_t v69 = v64 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v70 = *(_OWORD *)v68;
          *(v67 - 1) = *((_OWORD *)v68 - 1);
          _OWORD *v67 = v70;
          v67 -= 2;
          v68 -= 4;
          v69 -= 4;
        }
        while (v69);
        v28 = v66;
        if (v64 != (v64 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_166:
          do
          {
            unint64_t v71 = *--v28;
            *--v43 = v71;
          }
          while (v28 != v36);
        }
      }
LABEL_58:
      p_tokenCommitCharacterLengths->__begin_ = v43;
      p_tokenCommitCharacterLengths->__end_ = (unint64_t *)v29;
      p_tokenCommitCharacterLengths->__end_cap_.__value_ = v44;
      if (v36) {
        operator delete(v36);
      }
      goto LABEL_60;
    }
    p_tokenCommitCharacterLengths = &self->_tokenCommitCharacterLengths;
    v35 = self->_tokenCommitCharacterLengths.__end_;
    v34 = self->_tokenCommitCharacterLengths.__end_cap_.__value_;
    if (v35 < v34)
    {
      unint64_t *v35 = 0;
      uint64_t v29 = (uint64_t)(v35 + 1);
      goto LABEL_60;
    }
    v36 = p_tokenCommitCharacterLengths->__begin_;
    uint64_t v37 = (char *)v35 - (char *)p_tokenCommitCharacterLengths->__begin_;
    uint64_t v38 = v37 >> 3;
    unint64_t v39 = (v37 >> 3) + 1;
    if (v39 >> 61) {
      sub_1B4BB3244();
    }
    uint64_t v40 = (char *)v34 - (char *)v36;
    if (v40 >> 2 > v39) {
      unint64_t v39 = v40 >> 2;
    }
    if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v41 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v41 = v39;
    }
    if (v41)
    {
      if (v41 >> 61) {
        sub_1B4BB2D38();
      }
      v42 = operator new(8 * v41);
      v43 = (unint64_t *)&v42[8 * v38];
      v44 = (unint64_t *)&v42[8 * v41];
      unint64_t *v43 = 0;
      uint64_t v29 = (uint64_t)(v43 + 1);
      int64_t v45 = (char *)v35 - (char *)v36;
      if (v35 == v36) {
        goto LABEL_58;
      }
    }
    else
    {
      v42 = 0;
      v43 = (unint64_t *)(8 * v38);
      v44 = 0;
      *(void *)(8 * v38) = 0;
      uint64_t v29 = 8 * v38 + 8;
      int64_t v45 = (char *)v35 - (char *)v36;
      if (v35 == v36) {
        goto LABEL_58;
      }
    }
    unint64_t v54 = v45 - 8;
    if (v54 < 0x58) {
      goto LABEL_167;
    }
    if ((unint64_t)((char *)v35 - &v42[v37]) < 0x20) {
      goto LABEL_167;
    }
    uint64_t v55 = (v54 >> 3) + 1;
    uint64_t v56 = 8 * (v55 & 0x3FFFFFFFFFFFFFFCLL);
    v57 = &v35[v56 / 0xFFFFFFFFFFFFFFF8];
    v43 = (unint64_t *)((char *)v43 - v56);
    v58 = &v42[8 * v38 - 16];
    v59 = v35 - 2;
    uint64_t v60 = v55 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v61 = *(_OWORD *)v59;
      *(v58 - 1) = *((_OWORD *)v59 - 1);
      _OWORD *v58 = v61;
      v58 -= 2;
      v59 -= 4;
      v60 -= 4;
    }
    while (v60);
    v35 = v57;
    if (v55 != (v55 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_167:
      do
      {
        unint64_t v62 = *--v35;
        *--v43 = v62;
      }
      while (v35 != v36);
    }
    goto LABEL_58;
  }
  if (!v20
    || self->_optimizingAlignment
    && ((objc_msgSend_lastTokenBoundaryLogProbability(self, v21, v22, v23), end != begin) ? (BOOL v31 = v30 < a4) : (BOOL v31 = 0),
        v31))
  {
    objc_msgSend_modelLogProbability(self, v21, v22, v23);
    objc_msgSend_updateLastTokenWithMaxActivation_totalLogProbability_tokenBoundaryLogProbability_(self, v32, v16, v33);
  }
LABEL_146:
}

- (id)tokensWithTimestep:(int64_t)a3 isFinalTimestep:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend__currentTokenStringLength(self, a2, a3, a4))
  {
    objc_msgSend_commitTokenAtTimestep_currentSymbolLogProbability_commitAction_string_stemmingFromPath_(self, v7, a3, 2, &stru_1F0D56340, self, 0.0);
  }
  else if (v4)
  {
    end = self->_tokenMaxActivations.__end_;
    if (self->_tokenMaxActivations.__begin_ != end) {
      *(end - 1) = a3 + 1;
    }
  }
  v59 = self;
  p_tokenStringSegmentationPositions = &self->_tokenStringSegmentationPositions;
  unint64_t v12 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v7, self->_tokenStringSegmentationPositions.__end_ - self->_tokenStringSegmentationPositions.__begin_, v8);
  begin = self->_tokenStringSegmentationPositions.__begin_;
  uint64_t v56 = v12;
  if (self->_tokenStringSegmentationPositions.__end_ != begin)
  {
    uint64_t v15 = 0;
    unint64_t v16 = 0;
    unint64_t v55 = 0;
    *(void *)&long long v13 = 134218496;
    long long v54 = v13;
    do
    {
      id v17 = v59;
      uint64_t v18 = v59->_tokenCommitCharacterLengths.__begin_[v16];
      uint64_t v19 = begin[v16] - v15 - v18;
      objc_msgSend_substringWithRange_(v59->super._string, v10, v15, v19, v54);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = v20;
      if (v18)
      {
        BOOL v24 = objc_msgSend_substringWithRange_(v59->super._string, v21, v19 + v15, v18);
        v58 = objc_msgSend_stringByAppendingString_(v23, v25, (uint64_t)v24, v26);

        id v17 = v59;
      }
      else
      {
        BOOL v24 = 0;
        v58 = v20;
      }
      objc_msgSend_scoreForTokenIndex_(v59, v21, v16, v22);
      double v28 = v27;
      unint64_t v31 = (unint64_t)objc_msgSend_lengthOfBytesUsingEncoding_(v58, v29, 2348810496, v30) >> 2;
      double v32 = v28 / (double)v31;
      if (v32 >= 512.0)
      {
        if (qword_1E9D40AE0 != -1) {
          dispatch_once(&qword_1E9D40AE0, &unk_1F0D55F60);
        }
        uint64_t v33 = (id)qword_1E9D40AC0;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v54;
          double v61 = v28 / (double)v31;
          __int16 v62 = 2048;
          double v63 = v28;
          __int16 v64 = 2048;
          unint64_t v65 = v31;
          _os_log_impl(&dword_1B4BAD000, v33, OS_LOG_TYPE_ERROR, "Unexpected tokenNormalizedScore issue? got %.8f from tokenScore = %.2f, characterCount = %ld", buf, 0x20u);
        }

        double v32 = 512.0;
        id v17 = v59;
      }
      v34 = NSNumber;
      long double v35 = exp(v32);
      unint64_t v39 = objc_msgSend_numberWithDouble_(v34, v36, v37, v38, (double)v35);
      uint64_t v40 = NSNumber;
      long double v41 = exp(v17->_tokenBoundaryLogProbabilities.__begin_[v16]);
      int64_t v45 = objc_msgSend_numberWithDouble_(v40, v42, v43, v44, (double)v41);
      unint64_t v46 = v17->_tokenMaxActivations.__begin_[v16];
      uint64_t v47 = [CVNLPTextDecodingToken alloc];
      uint64_t v49 = objc_msgSend_initWithString_score_alignmentScore_activationRange_terminatingCharacter_(v47, v48, (uint64_t)v23, (uint64_t)v39, v45, v55, v46 - v55, v24);
      objc_msgSend_addObject_(v56, v50, (uint64_t)v49, v51);
      uint64_t v15 = p_tokenStringSegmentationPositions->__begin_[v16];
      unint64_t v55 = v59->_tokenMaxActivations.__begin_[v16];

      unint64_t v12 = v56;
      ++v16;
      begin = p_tokenStringSegmentationPositions->__begin_;
    }
    while (v16 < p_tokenStringSegmentationPositions->__end_ - p_tokenStringSegmentationPositions->__begin_);
  }
  v52 = objc_msgSend_arrayWithArray_(MEMORY[0x1E4F1C978], v10, (uint64_t)v12, v11);

  return v52;
}

- (id)description
{
  uint64_t v5 = NSString;
  uint64_t v6 = objc_msgSend_string(self, a2, v2, v3);
  uint64_t v7 = sub_1B4C481E8(v6);
  objc_msgSend_modelLogProbability(self, v8, v9, v10);
  uint64_t v12 = v11;
  objc_msgSend_normalizedTotalLogProbability(self, v13, v14, v15);
  uint64_t v17 = v16;
  objc_msgSend_blankLogProbability(self, v18, v19, v20);
  uint64_t v22 = v21;
  objc_msgSend_nonBlankLogProbability(self, v23, v24, v25);
  uint64_t v29 = objc_msgSend_stringWithFormat_(v5, v26, @"[\"%@\"], modelLogProb=%.8f, logProbTotalNorm=%.8f, logProbBlank=%.8f, logProbNonBlank=%.8f, %lu tokens", v27, v7, v12, v17, v22, v28, self->_tokenStringSegmentationPositions.__end_ - self->_tokenStringSegmentationPositions.__begin_);

  return v29;
}

- (id)debugDescription
{
  uint64_t v5 = NSString;
  uint64_t v6 = objc_msgSend_string(self, a2, v2, v3);
  objc_msgSend_modelLogProbability(self, v7, v8, v9);
  uint64_t v11 = v10;
  objc_msgSend_normalizedTotalLogProbability(self, v12, v13, v14);
  uint64_t v16 = v15;
  objc_msgSend_wordLanguageModelLogProbability(self, v17, v18, v19);
  uint64_t v21 = v20;
  objc_msgSend_historyLexiconLogProbability(self, v22, v23, v24);
  uint64_t v26 = v25;
  objc_msgSend_activeWordLexiconLogProbability(self, v27, v28, v29);
  uint64_t v31 = v30;
  objc_msgSend_characterLanguageModelLogProbability(self, v32, v33, v34);
  uint64_t v38 = objc_msgSend_stringWithFormat_(v5, v35, @"[\"%@\"], logProbTotal=%.8f, logProbNormTotal=%.8f, logProbWordLM=%.8f, logProbHistoryLex=%.8f, logProbActiveLex=%.8f, logProbCharacterLM=%.8f, %lu tokens", v36, v6, v11, v16, v21, v26, v31, v37, self->_tokenStringSegmentationPositions.__end_ - self->_tokenStringSegmentationPositions.__begin_);

  return v38;
}

- (int64_t)compare:(id)a3
{
  objc_msgSend_normalizedTotalLogProbability(a3, a2, (uint64_t)a3, v3);
  double v6 = v5;
  objc_msgSend_normalizedTotalLogProbability(self, v7, v8, v9);
  if (v6 >= v10) {
    int64_t v11 = 0;
  }
  else {
    int64_t v11 = -1;
  }
  if (v6 > v10) {
    return 1;
  }
  else {
    return v11;
  }
}

- (void)merge:(id)a3 logProbCumulator:(id)a4
{
  uint64_t v47 = (char *)a3;
  double v6 = (double (**)(void, double, double))a4;
  self->_double nonBlankLogProbability = v6[2](v6, self->_nonBlankLogProbability, *((double *)v47 + 38));
  self->_double blankLogProbability = v6[2](v6, self->_blankLogProbability, *((double *)v47 + 37));
  if (self->_optimizingAlignment)
  {
    double v10 = v47 + 208;
    uint64_t v12 = *((void *)v47 + 26);
    uint64_t v11 = *((void *)v47 + 27);
    uint64_t v13 = v11 - v12;
    if (v11 != v12)
    {
      p_tokenMaxActivations = &self->_tokenMaxActivations;
      begin = self->_tokenMaxActivations.__begin_;
      end = self->_tokenMaxActivations.__end_;
      objc_msgSend_lastTokenBoundaryLogProbability(v47, v7, v8, v9);
      double v18 = v17;
      objc_msgSend_lastTokenBoundaryLogProbability(self, v19, v20, v21);
      uint64_t v25 = (v13 >> 3) - 1;
      uint64_t v26 = end - begin;
      if (v18 <= v27)
      {
        objc_msgSend_lastTokenBoundaryLogProbability(v47, v22, v23, v24);
        double v31 = v30;
        objc_msgSend_lastTokenBoundaryLogProbability(self, v32, v33, v34);
        uint64_t v28 = p_tokenMaxActivations->__begin_;
        long double v35 = self->_tokenMaxActivations.__end_;
        if (v31 == v36)
        {
          if (v35 == v28)
          {
            BOOL v29 = 0;
          }
          else
          {
            objc_msgSend_scoreForTokenIndex_(v47, v22, v25, v24);
            double v38 = v37;
            objc_msgSend_scoreForTokenIndex_(self, v39, v26 - 1, v40);
            BOOL v29 = v38 > v41;
            uint64_t v28 = p_tokenMaxActivations->__begin_;
            if ((unint64_t *)((char *)self->_tokenMaxActivations.__end_
                                    - (char *)self->_tokenMaxActivations.__begin_) > (unint64_t *)8)
              goto LABEL_11;
          }
        }
        else
        {
          BOOL v29 = 0;
          if ((unint64_t)((char *)v35 - (char *)v28) > 8) {
            goto LABEL_11;
          }
        }
        if (!v29) {
          goto LABEL_18;
        }
      }
      else
      {
        uint64_t v28 = p_tokenMaxActivations->__begin_;
        if ((unint64_t *)((char *)self->_tokenMaxActivations.__end_ - (char *)self->_tokenMaxActivations.__begin_) >= (unint64_t *)9)
        {
          LOBYTE(v29) = 1;
LABEL_11:
          unint64_t v42 = *(void *)(*v10 + 8 * v25);
          if (v28[v26 - 2] > v42 || !v29) {
            goto LABEL_18;
          }
LABEL_17:
          double v43 = *(double *)(*((void *)v47 + 17) + 8 * v25);
          objc_msgSend_lastTokenBoundaryLogProbability(v47, v22, v23, v24);
          objc_msgSend_updateLastTokenWithMaxActivation_totalLogProbability_tokenBoundaryLogProbability_(self, v44, v42, v45, v43, v46);
          goto LABEL_18;
        }
      }
      unint64_t v42 = *(void *)(*v10 + 8 * v25);
      goto LABEL_17;
    }
  }
LABEL_18:
}

- (void)updateLastTokenWithMaxActivation:(int64_t)a3 totalLogProbability:(double)a4 tokenBoundaryLogProbability:(double)a5
{
  end = self->_tokenMaxActivations.__end_;
  int64_t v7 = (char *)end - (char *)self->_tokenMaxActivations.__begin_;
  if (v7)
  {
    *(end - 1) = a3;
    *(double *)((char *)self->_cumulativeTokenLogProbabilities.__begin_ + v7 - 8) = a4;
    objc_msgSend_setLastTokenBoundaryLogProbability_(self, a2, a3, v5, a5);
  }
}

- (id)childPathWithBlankLogProb:(double)a3
{
  double v6 = [CVNLPCTCTextDecodingPath alloc];
  languageResourceBundle = self->_languageResourceBundle;
  id scoringFunction = self->_scoringFunction;
  characterLMState = self->_characterLMState;
  uint64_t v74 = 0;
  uint64_t v75 = 0;
  v73 = 0;
  begin = self->_tokenString.__begin_;
  end = self->_tokenString.__end_;
  int64_t v12 = (char *)end - (char *)begin;
  if (end != begin)
  {
    if (v12 < 0) {
      sub_1B4BB3244();
    }
    uint64_t v13 = (char *)operator new((char *)end - (char *)begin);
    uint64_t v14 = &v13[4 * (v12 >> 2)];
    v73 = v13;
    uint64_t v75 = v14;
    memcpy(v13, begin, v12);
    uint64_t v74 = v14;
  }
  unint64_t v71 = 0;
  uint64_t v72 = 0;
  __p = 0;
  uint64_t v16 = self->_histWordTokenIDs.__begin_;
  uint64_t v15 = self->_histWordTokenIDs.__end_;
  int64_t v17 = (char *)v15 - (char *)v16;
  if (v15 != v16)
  {
    if (v17 < 0) {
      sub_1B4BB3244();
    }
    double v18 = (char *)operator new((char *)v15 - (char *)v16);
    uint64_t v19 = &v18[4 * (v17 >> 2)];
    __p = v18;
    uint64_t v72 = v19;
    memcpy(v18, v16, v17);
    unint64_t v71 = v19;
  }
  hasContext = (CVNLPCTCTextDecodingPath *)objc_msgSend_initWithLanguageResourceBundle_scoringFunction_initialCharacterLMState_characterTokenIDs_wordTokenIDs_optimizingAlignment_hasContext_(v6, v5, (uint64_t)languageResourceBundle, (uint64_t)scoringFunction, characterLMState, &v73, &__p, self->_optimizingAlignment, self->_hasContext);
  if (__p)
  {
    unint64_t v71 = __p;
    operator delete(__p);
  }
  if (v73)
  {
    uint64_t v74 = v73;
    operator delete(v73);
  }
  if (hasContext)
  {
    uint64_t v24 = objc_msgSend_string(self, v20, v21, v22);
    string = hasContext->super._string;
    hasContext->super._string = (NSString *)v24;

    objc_storeStrong((id *)&hasContext->_latestExpandedSymbolIncludingPseudospace, self->_latestExpandedSymbolIncludingPseudospace);
    objc_msgSend_setBlankLogProbability_(hasContext, v26, v27, v28, a3);
    objc_msgSend_setCharacterLanguageModelLogProbability_(hasContext, v29, v30, v31, self->super._characterLanguageModelLogProbability);
    objc_msgSend_setHistoryLexiconLogProbability_(hasContext, v32, v33, v34, self->_historyLexiconLogProbability);
    objc_msgSend_setActiveWordLexiconLogProbability_(hasContext, v35, v36, v37, self->_activeWordLexiconLogProbability);
    objc_msgSend_setWordLanguageModelLogProbability_(hasContext, v38, v39, v40, self->super._wordLanguageModelLogProbability);
    objc_msgSend_lastTokenBoundaryLogProbability(self, v41, v42, v43);
    objc_msgSend_setLastTokenBoundaryLogProbability_(hasContext, v44, v45, v46);
    objc_msgSend_setCharacterCount_(hasContext, v47, self->super._characterCount, v48);
    objc_msgSend_setPseudoSpaceCount_(hasContext, v49, self->super._pseudoSpaceCount, v50);
    long long v54 = objc_msgSend_cursors(self, v51, v52, v53);
    uint64_t v58 = objc_msgSend_count(v54, v55, v56, v57);

    if (v58 >= 1)
    {
      __int16 v62 = objc_msgSend_cursors(self, v59, v60, v61);
      uint64_t v66 = objc_msgSend_copy(v62, v63, v64, v65);
      objc_msgSend_setCursors_(hasContext, v67, (uint64_t)v66, v68);
    }
    hasContext->_beginningCurrentWord = self->_beginningCurrentWord;
    if (hasContext != self)
    {
      sub_1B4C0A420(&hasContext->_cumulativeTokenLogProbabilities.__begin_, (char *)self->_cumulativeTokenLogProbabilities.__begin_, (char *)self->_cumulativeTokenLogProbabilities.__end_, self->_cumulativeTokenLogProbabilities.__end_ - self->_cumulativeTokenLogProbabilities.__begin_);
      sub_1B4C0A420(&hasContext->_tokenBoundaryLogProbabilities.__begin_, (char *)self->_tokenBoundaryLogProbabilities.__begin_, (char *)self->_tokenBoundaryLogProbabilities.__end_, self->_tokenBoundaryLogProbabilities.__end_ - self->_tokenBoundaryLogProbabilities.__begin_);
      sub_1B4C0A420(&hasContext->_tokenStringSegmentationPositions.__begin_, (char *)self->_tokenStringSegmentationPositions.__begin_, (char *)self->_tokenStringSegmentationPositions.__end_, self->_tokenStringSegmentationPositions.__end_ - self->_tokenStringSegmentationPositions.__begin_);
      sub_1B4C0A420(&hasContext->_tokenMaxActivations.__begin_, (char *)self->_tokenMaxActivations.__begin_, (char *)self->_tokenMaxActivations.__end_, self->_tokenMaxActivations.__end_ - self->_tokenMaxActivations.__begin_);
      sub_1B4C0A420(&hasContext->_tokenCommitCharacterLengths.__begin_, (char *)self->_tokenCommitCharacterLengths.__begin_, (char *)self->_tokenCommitCharacterLengths.__end_, self->_tokenCommitCharacterLengths.__end_ - self->_tokenCommitCharacterLengths.__begin_);
    }
    hasContext->_hasProblematicMixedScriptWords = self->_hasProblematicMixedScriptWords;
    hasContext->_hasCalculatedHasProblematicMixedScriptWords = self->_hasCalculatedHasProblematicMixedScriptWords;
    hasContext->_lastCodeUnitType = self->_lastCodeUnitType;
  }
  return hasContext;
}

- (id)pathByExtendingWithString:(id)a3 extendedPathString:(id)a4 blankLogProb:(double)a5 nonBlankLogProb:(double)a6 timestep:(int64_t)a7 commitAction:(int64_t)a8 symbolLogProb:(double)a9
{
  id v138 = a3;
  id v137 = a4;
  uint64_t v16 = [CVNLPCTCTextDecodingPath alloc];
  languageResourceBundle = self->_languageResourceBundle;
  id scoringFunction = self->_scoringFunction;
  characterLMState = self->_characterLMState;
  v143 = 0;
  uint64_t v144 = 0;
  v142 = 0;
  begin = self->_tokenString.__begin_;
  end = self->_tokenString.__end_;
  int64_t v22 = (char *)end - (char *)begin;
  if (end != begin)
  {
    if (v22 < 0) {
      sub_1B4BB3244();
    }
    uint64_t v23 = (char *)operator new((char *)end - (char *)begin);
    uint64_t v24 = &v23[4 * (v22 >> 2)];
    v142 = v23;
    uint64_t v144 = v24;
    memcpy(v23, begin, v22);
    v143 = v24;
  }
  uint64_t v140 = 0;
  v141 = 0;
  __p = 0;
  uint64_t v26 = self->_histWordTokenIDs.__begin_;
  uint64_t v25 = self->_histWordTokenIDs.__end_;
  int64_t v27 = (char *)v25 - (char *)v26;
  if (v25 != v26)
  {
    if (v27 < 0) {
      sub_1B4BB3244();
    }
    uint64_t v28 = (char *)operator new((char *)v25 - (char *)v26);
    BOOL v29 = &v28[4 * (v27 >> 2)];
    __p = v28;
    v141 = v29;
    memcpy(v28, v26, v27);
    uint64_t v140 = v29;
  }
  uint64_t hasContext = objc_msgSend_initWithLanguageResourceBundle_scoringFunction_initialCharacterLMState_characterTokenIDs_wordTokenIDs_optimizingAlignment_hasContext_(v16, v15, (uint64_t)languageResourceBundle, (uint64_t)scoringFunction, characterLMState, &v142, &__p, self->_optimizingAlignment, self->_hasContext);
  if (__p)
  {
    uint64_t v140 = __p;
    operator delete(__p);
  }
  if (v142)
  {
    v143 = v142;
    operator delete(v142);
  }
  if ((CVNLPCTCTextDecodingPath *)hasContext != self)
  {
    sub_1B4C0A420((void *)(hasContext + 136), (char *)self->_cumulativeTokenLogProbabilities.__begin_, (char *)self->_cumulativeTokenLogProbabilities.__end_, self->_cumulativeTokenLogProbabilities.__end_ - self->_cumulativeTokenLogProbabilities.__begin_);
    sub_1B4C0A420((void *)(hasContext + 160), (char *)self->_tokenBoundaryLogProbabilities.__begin_, (char *)self->_tokenBoundaryLogProbabilities.__end_, self->_tokenBoundaryLogProbabilities.__end_ - self->_tokenBoundaryLogProbabilities.__begin_);
    sub_1B4C0A420((void *)(hasContext + 184), (char *)self->_tokenStringSegmentationPositions.__begin_, (char *)self->_tokenStringSegmentationPositions.__end_, self->_tokenStringSegmentationPositions.__end_ - self->_tokenStringSegmentationPositions.__begin_);
    sub_1B4C0A420((void *)(hasContext + 208), (char *)self->_tokenMaxActivations.__begin_, (char *)self->_tokenMaxActivations.__end_, self->_tokenMaxActivations.__end_ - self->_tokenMaxActivations.__begin_);
    sub_1B4C0A420((void *)(hasContext + 232), (char *)self->_tokenCommitCharacterLengths.__begin_, (char *)self->_tokenCommitCharacterLengths.__end_, self->_tokenCommitCharacterLengths.__end_ - self->_tokenCommitCharacterLengths.__begin_);
  }
  id v31 = v138;
  BOOL v37 = objc_msgSend_length(v31, v32, v33, v34) == 1 && objc_msgSend_characterAtIndex_(v31, v35, 0, v36) == 57427;

  objc_storeStrong((id *)(hasContext + 72), a4);
  objc_storeStrong((id *)(hasContext + 272), a3);
  *(unsigned char *)(hasContext + 280) = 1;
  objc_msgSend_setCharacterCount_((void *)hasContext, v38, self->super._characterCount + 1, v39);
  objc_msgSend_setPseudoSpaceCount_((void *)hasContext, v40, self->super._pseudoSpaceCount + v37, v41);
  double v45 = *(double *)(hasContext + 296);
  double v46 = fmax(v45, a5);
  double v47 = fmin(v45, a5);
  if (v47 >= -1021.0)
  {
    long double v48 = exp(v47 - v46);
    double v46 = log1p(v48) + v46;
  }
  *(double *)(hasContext + 296) = v46;
  double v49 = *(double *)(hasContext + 304);
  double v50 = fmax(v49, a6);
  double v51 = fmin(v49, a6);
  if (v51 >= -1021.0)
  {
    long double v52 = exp(v51 - v50);
    double v50 = log1p(v52) + v50;
  }
  *(double *)(hasContext + 304) = v50;
  objc_msgSend_lastTokenBoundaryLogProbability(self, v42, v43, v44);
  objc_msgSend_setLastTokenBoundaryLogProbability_((void *)hasContext, v53, v54, v55);
  objc_msgSend_commitTokenAtTimestep_currentSymbolLogProbability_commitAction_string_stemmingFromPath_((void *)hasContext, v56, a7, a8, v31, self, a9);
  double v63 = objc_msgSend_wordLanguageModel(self->_languageResourceBundle, v57, v58, v59);
  if (v63)
  {
    uint64_t v64 = objc_msgSend_wordLanguageModel(self->_languageResourceBundle, v60, v61, v62);
    int v68 = objc_msgSend_lmSPIType(v64, v65, v66, v67);

    if (v68 == 1)
    {
      uint64_t v69 = objc_opt_class();
      objc_msgSend_applyWordLanguageModelProbabilityToPath_stemmedFromPath_isCommittingToken_(v69, v70, hasContext, (uint64_t)self, a8 != 0);
    }
  }
  id v71 = v31;
  if (objc_msgSend_length(v71, v72, v73, v74) == 1)
  {
    uint64_t v78 = objc_msgSend_characterAtIndex_(v71, v75, 0, v77);
  }
  else if (objc_msgSend_length(v71, v75, v76, v77) == 2)
  {
    uint64_t v78 = objc_msgSend_characterAtIndex_(v71, v79, 0, v80);
    int v83 = objc_msgSend_characterAtIndex_(v71, v81, 1, v82);
    if ((v83 & 0xFFF0) != 0xFE00) {
      uint64_t v78 = (v83 + (v78 << 10) - 56613888);
    }
  }
  else
  {
    uint64_t v78 = 0xFFFFFFFFLL;
  }

  uint64_t v84 = sub_1B4C454F8(v78);
  v88 = objc_msgSend_string(self, v85, v86, v87);
  if (objc_msgSend_length(v88, v89, v90, v91))
  {

    if (v37) {
      goto LABEL_37;
    }
LABEL_36:
    objc_msgSend__updateCharacterLanguageModelLogProbabilityForString_stemmingFromPath_normalizedCodepoint_((void *)hasContext, v92, (uint64_t)v71, (uint64_t)self, v84);
    goto LABEL_37;
  }
  BOOL v93 = self->_hasContext;

  char v94 = !v93 || v37;
  if ((v94 & 1) == 0) {
    goto LABEL_36;
  }
LABEL_37:
  objc_msgSend__updateLexiconLogProbabilityForString_stemmingFromPath_((void *)hasContext, v92, (uint64_t)v71, (uint64_t)self);
  *(_DWORD *)(hasContext + 284) = self->_lastCodeUnitType;
  *(unsigned char *)(hasContext + 281) = self->_hasProblematicMixedScriptWords;
  long long v98 = objc_msgSend_string((void *)hasContext, v95, v96, v97);
  v102 = objc_msgSend_string((void *)hasContext, v99, v100, v101);
  uint64_t v106 = objc_msgSend_length(v102, v103, v104, v105);
  uint64_t v109 = objc_msgSend_characterAtIndex_(v98, v107, v106 - 1, v108);
  sub_1B4C480A0(v109, (unsigned char *)(hasContext + 281), (int *)(hasContext + 284), v110);

  *(unsigned char *)(hasContext + 282) = 1;
  if (v37) {
    goto LABEL_60;
  }
  v111 = (void **)(hasContext + 80);
  unint64_t v113 = *(char **)(hasContext + 88);
  unint64_t v112 = *(void *)(hasContext + 96);
  if ((unint64_t)v113 >= v112)
  {
    uint64_t v115 = (char *)*v111;
    uint64_t v116 = v113 - (unsigned char *)*v111;
    uint64_t v117 = v116 >> 2;
    unint64_t v118 = (v116 >> 2) + 1;
    if (v118 >> 62) {
      sub_1B4BB3244();
    }
    uint64_t v119 = v112 - (void)v115;
    if (v119 >> 1 > v118) {
      unint64_t v118 = v119 >> 1;
    }
    if ((unint64_t)v119 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v120 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v120 = v118;
    }
    if (v120)
    {
      if (v120 >> 62) {
        sub_1B4BB2D38();
      }
      unint64_t v121 = operator new(4 * v120);
      uint64_t v122 = &v121[4 * v117];
      uint64_t v123 = &v121[4 * v120];
      *uint64_t v122 = v84;
      uint64_t v114 = (uint64_t)(v122 + 1);
      int64_t v124 = v113 - v115;
      if (v113 == v115) {
        goto LABEL_57;
      }
    }
    else
    {
      unint64_t v121 = 0;
      uint64_t v122 = (_DWORD *)(4 * v117);
      uint64_t v123 = 0;
      *(_DWORD *)(4 * v117) = v84;
      uint64_t v114 = 4 * v117 + 4;
      int64_t v124 = v113 - v115;
      if (v113 == v115)
      {
LABEL_57:
        unint64_t *v111 = v122;
        *(void *)(hasContext + 88) = v114;
        *(void *)(hasContext + 96) = v123;
        if (v115) {
          operator delete(v115);
        }
        goto LABEL_59;
      }
    }
    unint64_t v125 = v124 - 4;
    if (v125 < 0x2C) {
      goto LABEL_69;
    }
    if ((unint64_t)(v113 - v121 - v116) < 0x20) {
      goto LABEL_69;
    }
    uint64_t v126 = (v125 >> 2) + 1;
    uint64_t v127 = 4 * (v126 & 0x7FFFFFFFFFFFFFF8);
    v128 = &v113[-v127];
    uint64_t v122 = (_DWORD *)((char *)v122 - v127);
    uint64_t v129 = &v121[4 * v117 - 16];
    uint64_t v130 = v113 - 16;
    uint64_t v131 = v126 & 0x7FFFFFFFFFFFFFF8;
    do
    {
      long long v132 = *(_OWORD *)v130;
      *(v129 - 1) = *((_OWORD *)v130 - 1);
      *uint64_t v129 = v132;
      v129 -= 2;
      v130 -= 32;
      v131 -= 8;
    }
    while (v131);
    unint64_t v113 = v128;
    if (v126 != (v126 & 0x7FFFFFFFFFFFFFF8))
    {
LABEL_69:
      do
      {
        int v133 = *((_DWORD *)v113 - 1);
        v113 -= 4;
        *--uint64_t v122 = v133;
      }
      while (v113 != v115);
    }
    goto LABEL_57;
  }
  *(_DWORD *)unint64_t v113 = v84;
  uint64_t v114 = (uint64_t)(v113 + 4);
LABEL_59:
  *(void *)(hasContext + 88) = v114;
LABEL_60:

  return (id)hasContext;
}

- (void)_updateCharacterLanguageModelLogProbabilityForString:(id)a3 stemmingFromPath:(id)a4 normalizedCodepoint:(unsigned int)a5
{
  uint64_t v43 = (__CFString *)a3;
  int64_t v7 = a4;
  uint64_t v11 = objc_msgSend_languageResourceBundle(self, v8, v9, v10);
  uint64_t v15 = objc_msgSend_characterLanguageModel(v11, v12, v13, v14);

  if (v15)
  {
    int v19 = objc_msgSend_lmSPIType(v15, v16, v17, v18);
    double v23 = 0.0;
    if (v19 == 1)
    {
      uint64_t v25 = objc_msgSend_length(v43, v20, v21, v22);
      if ((uint64_t)(v7[11] - v7[10]) >> 2 >= (unint64_t)objc_msgSend_requiredContextLengthForStringLength_(v15, v26, v25, v27))
      {
        objc_msgSend_languageModel(v15, v20, v21, v22);
        LMLanguageModelConditionalProbability();
        double v23 = v28 * 2.30258509;
      }
    }
    else if (v19 == 2)
    {
      float v24 = CVNLPLanguageModelWithStateConditionalProbability((uint64_t)self->_characterLMState, v43);
      double v23 = logf(v24);
    }
    BOOL v29 = objc_msgSend_languageResourceBundle(self, v20, v21, v22);
    uint64_t v33 = objc_msgSend_characterLanguageModel(v29, v30, v31, v32);
    objc_msgSend_lowerBoundLogProbabilityValue(v33, v34, v35, v36);
    double v38 = v37;

    objc_msgSend_characterLanguageModelLogProbability(v7, v39, v40, v41);
    self->super._characterLanguageModelLogProbability = fmin(v42 + fmax(v23, v38), 0.0);
  }
}

- (void)_updateLexiconLogProbabilityForString:(id)a3 stemmingFromPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (CVNLPIsWordSeparatorForLexicon_0(v6))
  {
    objc_msgSend_historyLexiconLogProbability(v7, v8, v9, v10);
    double v12 = v11;
    objc_msgSend_activeWordLexiconLogProbability(v7, v13, v14, v15);
    self->_historyLexiconLogProbability = v16 + v12;
    self->_activeWordLexiconLogProbability = 0.0;
    uint64_t v20 = objc_msgSend_packagedLexiconRootCursors(self->_languageResourceBundle, v17, v18, v19);
    objc_msgSend_setCursors_(self, v21, (uint64_t)v20, v22);
  }
  else
  {
    uint64_t v124 = 0;
    unint64_t v125 = (double *)&v124;
    uint64_t v126 = 0x2020000000;
    uint64_t v127 = 0;
    BOOL v23 = sub_1B4C47C6C(v6);
    BOOL v24 = sub_1B4C47CFC(v6);
    id v25 = v6;
    BOOL v31 = objc_msgSend_length(v25, v26, v27, v28) == 1 && objc_msgSend_characterAtIndex_(v25, v29, 0, v30) == 39;

    uint64_t v120 = 0;
    unint64_t v121 = &v120;
    uint64_t v122 = 0x2020000000;
    char v123 = 0;
    uint64_t v35 = objc_msgSend_cursors(v7, v32, v33, v34);
    uint64_t v39 = objc_msgSend_count(v35, v36, v37, v38);

    if (v39 >= 1)
    {
      uint64_t v43 = objc_msgSend_lexicons(self->_languageResourceBundle, v40, v41, v42);
      uint64_t v47 = objc_msgSend_count(v43, v44, v45, v46);
      long double v48 = log((double)(unint64_t)v47);

      uint64_t v111 = 0;
      unint64_t v112 = &v111;
      uint64_t v113 = 0x4812000000;
      uint64_t v114 = sub_1B4C57470;
      uint64_t v115 = sub_1B4C57494;
      uint64_t v116 = &unk_1B4C9FEA6;
      unint64_t v118 = 0;
      uint64_t v119 = 0;
      __p = 0;
      long double v52 = objc_msgSend_lexicons(self->_languageResourceBundle, v49, v50, v51);
      if (objc_msgSend_inputNormalizationFunction(v52, v53, v54, v55))
      {
        uint64_t v59 = objc_msgSend_lexicons(self->_languageResourceBundle, v56, v57, v58);
        double v63 = (void (*)(id))objc_msgSend_inputNormalizationFunction(v59, v60, v61, v62);
        v63(v25);
        id v64 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v64 = v25;
      }

      int v68 = objc_msgSend_cursors(v7, v65, v66, v67);
      uint64_t v102 = MEMORY[0x1E4F143A8];
      uint64_t v103 = 3221225472;
      uint64_t v104 = sub_1B4C574AC;
      uint64_t v105 = &unk_1E60A3AC0;
      id v69 = v64;
      id v106 = v69;
      uint64_t v107 = &v111;
      uint64_t v108 = &v120;
      uint64_t v109 = &v124;
      long double v110 = v48;
      objc_msgSend_enumerateLexiconCursorsSortedByPriorityWithBlock_(v68, v70, (uint64_t)&v102, v71);

      uint64_t v72 = [CVNLPLexiconCursors alloc];
      uint64_t v75 = objc_msgSend_initWithSortedCursors_(v72, v73, (uint64_t)(v112 + 6), v74, v102, v103, v104, v105);
      objc_msgSend_setCursors_(self, v76, (uint64_t)v75, v77);

      _Block_object_dispose(&v111, 8);
      if (__p)
      {
        unint64_t v118 = __p;
        operator delete(__p);
      }
    }
    int v78 = v23 || v24 || v31;
    if ((v78 & 1) == 0) {
      v125[3] = -2.99573227;
    }
    v79 = objc_msgSend_languageResourceBundle(self, v40, v41, v42);
    int v83 = objc_msgSend_lexicons(v79, v80, v81, v82);
    objc_msgSend_lowerBoundLogProbabilityValue(v83, v84, v85, v86);
    double v88 = v87;

    if (v78 && !*((unsigned char *)v121 + 24))
    {
      objc_msgSend_activeWordLexiconLogProbability(v7, v89, v90, v91);
      if (v100 + -36.0436534 > v88)
      {
        objc_msgSend_activeWordLexiconLogProbability(v7, v93, v94, v95);
        double v88 = v101 + -36.0436534;
      }
    }
    else
    {
      double v92 = v125[3];
      objc_msgSend_activeWordLexiconLogProbability(v7, v89, v90, v91);
      if (v96 + v92 > v88)
      {
        double v97 = v125[3];
        objc_msgSend_activeWordLexiconLogProbability(v7, v93, v94, v95);
        double v88 = v98 + v97;
      }
    }
    self->_activeWordLexiconLogProbability = v88;
    objc_msgSend_historyLexiconLogProbability(v7, v93, v94, v95);
    self->_historyLexiconLogProbability = v99;
    _Block_object_dispose(&v120, 8);
    _Block_object_dispose(&v124, 8);
  }
}

+ (void)applyWordLanguageModelProbabilityToPath:(id)a3 stemmedFromPath:(id)a4 isCommittingToken:(BOOL)a5
{
  BOOL v5 = a5;
  v120[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = a4;
  uint64_t v102 = v7;
  double v12 = objc_msgSend_languageResourceBundle(v7, v9, v10, v11);
  double v101 = objc_msgSend_wordLanguageModel(v12, v13, v14, v15);

  if (v7 != v8) {
    sub_1B4C2ADD4(v7 + 13, (char *)v8[13], (char *)v8[14], (uint64_t)(v8[14] - v8[13]) >> 2);
  }
  if (v101 && v5)
  {
    uint64_t v19 = objc_msgSend_string(v8, v16, v17, v18);
    uint64_t v23 = objc_msgSend_length(v19, v20, v21, v22) - *((_DWORD *)v8 + 32);

    if ((int)v23 < 1)
    {
      objc_msgSend_wordLanguageModelLogProbability(v8, v24, v25, v26);
      objc_msgSend_setWordLanguageModelLogProbability_(v7, v49, v50, v51);
    }
    else
    {
      uint64_t v27 = v8[16];
      uint64_t v28 = objc_msgSend_string(v8, v24, v25, v26);
      uint64_t v30 = objc_msgSend_substringWithRange_(v28, v29, v27, v23);

      v119[0] = 0;
      v119[1] = v119;
      v119[2] = 0x2020000000;
      v119[3] = 0;
      uint64_t v115 = 0;
      uint64_t v116 = &v115;
      uint64_t v117 = 0x2020000000;
      int v118 = 0;
      uint64_t v34 = objc_msgSend__getQueue(CVNLPCTCTextDecodingPath, v31, v32, v33);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1B4C57DD0;
      block[3] = &unk_1E60A3AE8;
      uint64_t v113 = &v115;
      id v35 = v101;
      id v111 = v35;
      id v100 = v30;
      id v112 = v100;
      uint64_t v114 = v119;
      uint64_t v95 = v34;
      dispatch_sync(v34, block);
      int v36 = *((_DWORD *)v116 + 6);
      double v98 = operator new(4uLL);
      *double v98 = v36;
      uint64_t v37 = (char *)operator new(4uLL);
      *(_DWORD *)uint64_t v37 = v36;
      uint64_t v38 = v37 + 4;
      uint64_t v40 = objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], v39, 0, v23);
      v120[0] = v40;
      uint64_t v42 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v41, (uint64_t)v120, 1);

      id v43 = v42;
      uint64_t v45 = v43;
      if (*((_DWORD *)v116 + 6))
      {
        id v99 = v43;
      }
      else
      {
        v109[0] = v43;
        objc_msgSend_wordTokenIDsForString_outTokenRanges_(v35, v44, (uint64_t)v100, (uint64_t)v109);
        id v99 = v109[0];

        operator delete(v37);
        uint64_t v37 = (char *)v109[1];
        uint64_t v38 = (char *)v109[2];
      }
      uint64_t v107 = 0;
      uint64_t v108 = 0;
      double v97 = v37;
      double v96 = v45;
      uint64_t v55 = operator new(4uLL);
      uint64_t v105 = 0;
      id v106 = v55;
      *uint64_t v55 = *v98;
      uint64_t v107 = v55 + 1;
      uint64_t v108 = v55 + 1;
      __p = 0;
      uint64_t v104 = 0;
      uint64_t v57 = v38 - v37;
      if (v38 != v37)
      {
        if (v57 < 0) {
          sub_1B4BB3244();
        }
        __p = operator new(v38 - v37);
        uint64_t v105 = (char *)__p + 4 * (v57 >> 2);
        memcpy(__p, v37, v38 - v37);
        uint64_t v104 = v105;
      }
      objc_msgSend__wordLanguageModelLogProbabilityForString_originalWordRanges_originalWordIDs_wordRanges_wordIDs_(v8, v56, (uint64_t)v100, (uint64_t)v45, &v106, v99, &__p);
      float v62 = v61;
      if (__p)
      {
        uint64_t v104 = __p;
        operator delete(__p);
      }
      if (v106)
      {
        uint64_t v107 = v106;
        operator delete(v106);
      }
      objc_msgSend_wordLanguageModelLogProbability(v8, v58, v59, v60);
      objc_msgSend_setWordLanguageModelLogProbability_(v7, v64, v65, v66, v63 + v62);
      if (v38 != v37)
      {
        uint64_t v67 = v37;
        while (1)
        {
          while (1)
          {
            id v69 = v7 + 13;
            uint64_t v71 = (char *)v7[14];
            unint64_t v70 = v7[15];
            if ((unint64_t)v71 >= v70) {
              break;
            }
            int v68 = *(_DWORD *)v67;
            v67 += 4;
            *(_DWORD *)uint64_t v71 = v68;
            v7[14] = v71 + 4;
            if (v67 == v38) {
              goto LABEL_42;
            }
          }
          uint64_t v72 = (char *)*v69;
          uint64_t v73 = (uint64_t)&v71[-*v69];
          uint64_t v74 = v73 >> 2;
          unint64_t v75 = (v73 >> 2) + 1;
          if (v75 >> 62) {
            sub_1B4BB3244();
          }
          uint64_t v76 = v70 - (void)v72;
          if (v76 >> 1 > v75) {
            unint64_t v75 = v76 >> 1;
          }
          unint64_t v77 = (unint64_t)v76 >= 0x7FFFFFFFFFFFFFFCLL ? 0x3FFFFFFFFFFFFFFFLL : v75;
          if (v77) {
            break;
          }
          int v78 = 0;
          v79 = (_DWORD *)(4 * v74);
          *(_DWORD *)(4 * v74) = *(_DWORD *)v67;
          uint64_t v80 = 4 * v74 + 4;
          int64_t v81 = v71 - v72;
          if (v71 != v72) {
            goto LABEL_33;
          }
LABEL_39:
          *id v69 = v79;
          v69[1] = v80;
          v69[2] = &v78[4 * v77];
          if (v72) {
            operator delete(v72);
          }
          id v7 = v102;
          v69[1] = v80;
          v67 += 4;
          if (v67 == v38) {
            goto LABEL_42;
          }
        }
        if (v77 >> 62) {
          sub_1B4BB2D38();
        }
        int v78 = operator new(4 * v77);
        v79 = &v78[4 * v74];
        _DWORD *v79 = *(_DWORD *)v67;
        uint64_t v80 = (uint64_t)(v79 + 1);
        int64_t v81 = v71 - v72;
        if (v71 == v72) {
          goto LABEL_39;
        }
LABEL_33:
        unint64_t v82 = v81 - 4;
        if (v82 < 0x2C) {
          goto LABEL_52;
        }
        if ((unint64_t)(v71 - v78 - v73) < 0x20) {
          goto LABEL_52;
        }
        uint64_t v83 = (v82 >> 2) + 1;
        uint64_t v84 = 4 * (v83 & 0x7FFFFFFFFFFFFFF8);
        uint64_t v85 = &v71[-v84];
        v79 = (_DWORD *)((char *)v79 - v84);
        uint64_t v86 = &v78[4 * v74 - 16];
        double v87 = v71 - 16;
        uint64_t v88 = v83 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          long long v89 = *(_OWORD *)v87;
          *(v86 - 1) = *((_OWORD *)v87 - 1);
          *uint64_t v86 = v89;
          v86 -= 2;
          v87 -= 32;
          v88 -= 8;
        }
        while (v88);
        uint64_t v71 = v85;
        if (v83 != (v83 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_52:
          do
          {
            int v90 = *((_DWORD *)v71 - 1);
            v71 -= 4;
            *--v79 = v90;
          }
          while (v71 != v72);
        }
        goto LABEL_39;
      }
LABEL_42:

      if (v97) {
        operator delete(v97);
      }
      operator delete(v98);

      _Block_object_dispose(&v115, 8);
      _Block_object_dispose(v119, 8);
    }
    uint64_t v91 = objc_msgSend_string(v8, v52, v53, v54);
    v7[16] = objc_msgSend_length(v91, v92, v93, v94) + 1;
  }
  else
  {
    objc_msgSend_wordLanguageModelLogProbability(v8, v16, v17, v18);
    objc_msgSend_setWordLanguageModelLogProbability_(v7, v46, v47, v48);
    v7[16] = v8[16];
  }
}

- (float)_wordLanguageModelLogProbabilityForString:(id)a3 originalWordRanges:(id)a4 originalWordIDs:(vector<unsigned)int wordRanges:(std:(id)a6 :(vector<unsigned)int allocator<unsigned int>> *)a5 wordIDs:(std::allocator<unsigned int>> *)a7
{
  id v10 = a3;
  id v84 = a4;
  id v13 = a6;
  if (qword_1E9D406B8 != -1) {
    dispatch_once(&qword_1E9D406B8, &unk_1F0D56040);
  }
  uint64_t v14 = objc_msgSend_objectAtIndexedSubscript_(v84, v11, 0, v12, v84);
  uint64_t v90 = objc_msgSend_rangeValue(v14, v15, v16, v17);
  uint64_t v89 = v18;

  uint64_t v103 = 0;
  uint64_t v104 = 0;
  uint64_t v102 = 0;
  begin = self->_histWordTokenIDs.__begin_;
  end = self->_histWordTokenIDs.__end_;
  int64_t v24 = (char *)end - (char *)begin;
  if (end != begin)
  {
    if (v24 < 0) {
      sub_1B4BB3244();
    }
    uint64_t v25 = (char *)operator new((char *)end - (char *)begin);
    uint64_t v26 = &v25[4 * (v24 >> 2)];
    uint64_t v102 = (unsigned int *)v25;
    uint64_t v104 = v26;
    memcpy(v25, begin, v24);
    uint64_t v103 = v26;
  }
  unint64_t v27 = 0;
  float v28 = 0.0;
  id v87 = v13;
  while (v27 < objc_msgSend_count(v13, v19, v20, v21))
  {
    BOOL v31 = objc_msgSend_objectAtIndexedSubscript_(v13, v29, v27, v30);
    uint64_t v35 = objc_msgSend_rangeValue(v31, v32, v33, v34);
    uint64_t v37 = v36;

    uint64_t v42 = objc_msgSend_rangeOfCharacterFromSet_options_range_(v10, v38, qword_1E9D406A8, 2, v35, v37);
    if (v35 != v90 || v37 != v89 || (unsigned int v43 = *a5->__begin_) == 0) {
      unsigned int v43 = a7->__begin_[v27];
    }
    uint64_t v98 = 0;
    id v99 = (double *)&v98;
    uint64_t v100 = 0x2020000000;
    uint64_t v101 = 0;
    queue = objc_msgSend__getQueue(CVNLPCTCTextDecodingPath, v39, v40, v41);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3321888768;
    block[2] = sub_1B4C58504;
    block[3] = &unk_1F0D55F30;
    void block[4] = self;
    block[5] = &v98;
    unsigned int v97 = v43;
    uint64_t v95 = 0;
    double v96 = 0;
    __p = 0;
    uint64_t v44 = v102;
    int64_t v45 = v103 - (char *)v102;
    if (v103 != (char *)v102)
    {
      if (v45 < 0) {
        sub_1B4BB3244();
      }
      __p = operator new(v103 - (char *)v102);
      uint64_t v95 = __p;
      uint64_t v46 = (char *)__p + 4 * (v45 >> 2);
      double v96 = v46;
      memcpy(__p, v44, v45);
      uint64_t v95 = v46;
    }
    unint64_t v91 = v27;
    dispatch_sync(queue, block);
    double v50 = v99[3];
    uint64_t v51 = v103;
    if (v103 < v104)
    {
      *(_DWORD *)uint64_t v103 = v43;
      uint64_t v52 = (uint64_t)(v51 + 4);
      goto LABEL_39;
    }
    uint64_t v53 = v102;
    uint64_t v54 = (v103 - (char *)v102) >> 2;
    unint64_t v55 = v54 + 1;
    if ((unint64_t)(v54 + 1) >> 62) {
      sub_1B4BB3244();
    }
    uint64_t v56 = v104 - (char *)v102;
    if ((v104 - (char *)v102) >> 1 > v55) {
      unint64_t v55 = v56 >> 1;
    }
    if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v57 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v57 = v55;
    }
    if (v57)
    {
      if (v57 >> 62) {
        sub_1B4BB2D38();
      }
      uint64_t v58 = operator new(4 * v57);
      uint64_t v59 = (unsigned int *)&v58[4 * v54];
      unsigned int *v59 = v43;
      uint64_t v52 = (uint64_t)(v59 + 1);
      uint64_t v60 = v51 - (char *)v53;
      if (v51 == (char *)v53) {
        goto LABEL_36;
      }
LABEL_27:
      unint64_t v61 = v60 - 4;
      if (v61 < 0x2C) {
        goto LABEL_58;
      }
      if ((unint64_t)((char *)v53 - v58) < 0x20) {
        goto LABEL_58;
      }
      uint64_t v62 = (v61 >> 2) + 1;
      uint64_t v63 = 4 * (v62 & 0x7FFFFFFFFFFFFFF8);
      id v64 = &v51[-v63];
      uint64_t v59 = (unsigned int *)((char *)v59 - v63);
      uint64_t v65 = &v58[4 * v54 - 16];
      uint64_t v66 = v51 - 16;
      uint64_t v67 = v62 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v68 = *(_OWORD *)v66;
        *(v65 - 1) = *((_OWORD *)v66 - 1);
        *uint64_t v65 = v68;
        v65 -= 2;
        v66 -= 32;
        v67 -= 8;
      }
      while (v67);
      uint64_t v51 = v64;
      if (v62 != (v62 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_58:
        do
        {
          unsigned int v69 = *((_DWORD *)v51 - 1);
          v51 -= 4;
          *--uint64_t v59 = v69;
        }
        while (v51 != (char *)v53);
      }
      goto LABEL_36;
    }
    uint64_t v58 = 0;
    uint64_t v59 = (unsigned int *)(4 * v54);
    *(_DWORD *)(4 * v54) = v43;
    uint64_t v52 = 4 * v54 + 4;
    uint64_t v60 = v51 - (char *)v53;
    if (v51 != (char *)v53) {
      goto LABEL_27;
    }
LABEL_36:
    uint64_t v102 = v59;
    uint64_t v103 = (char *)v52;
    uint64_t v104 = &v58[4 * v57];
    if (v53) {
      operator delete(v53);
    }
    id v13 = v87;
LABEL_39:
    double v70 = v50 * 2.30258509;
    if (v50 * 2.30258509 > 0.0) {
      double v70 = -5.0;
    }
    uint64_t v103 = (char *)v52;
    if (v42 == 0x7FFFFFFFFFFFFFFFLL && v43 == 0) {
      double v72 = -36.044667;
    }
    else {
      double v72 = v70;
    }
    uint64_t v73 = objc_msgSend_languageResourceBundle(self, v47, v48, v49, v70);
    unint64_t v77 = objc_msgSend_wordLanguageModel(v73, v74, v75, v76);
    objc_msgSend_lowerBoundLogProbabilityValue(v77, v78, v79, v80);
    double v82 = v81;

    if (__p)
    {
      uint64_t v95 = __p;
      operator delete(__p);
    }
    float v28 = fmax(v72, v82) + v28;

    _Block_object_dispose(&v98, 8);
    unint64_t v27 = v91 + 1;
  }
  if (v102)
  {
    uint64_t v103 = (char *)v102;
    operator delete(v102);
  }

  return v28;
}

+ (id)_getQueue
{
  if (qword_1E9D406C0 == -1)
  {
    uint64_t v2 = (void *)qword_1E9D406C8;
  }
  else
  {
    dispatch_once(&qword_1E9D406C0, &unk_1F0D56160);
    uint64_t v2 = (void *)qword_1E9D406C8;
  }
  return v2;
}

- (double)blankLogProbability
{
  return self->_blankLogProbability;
}

- (void)setBlankLogProbability:(double)a3
{
  self->_double blankLogProbability = a3;
}

- (double)nonBlankLogProbability
{
  return self->_nonBlankLogProbability;
}

- (void)setNonBlankLogProbability:(double)a3
{
  self->_double nonBlankLogProbability = a3;
}

- (double)historyLexiconLogProbability
{
  return self->_historyLexiconLogProbability;
}

- (void)setHistoryLexiconLogProbability:(double)a3
{
  self->_historyLexiconLogProbability = a3;
}

- (double)activeWordLexiconLogProbability
{
  return self->_activeWordLexiconLogProbability;
}

- (void)setActiveWordLexiconLogProbability:(double)a3
{
  self->_activeWordLexiconLogProbability = a3;
}

- (double)languageResourceLogProbability
{
  return self->_languageResourceLogProbability;
}

- (BOOL)optimizingAlignment
{
  return self->_optimizingAlignment;
}

- (CVNLPLexiconCursors)cursors
{
  return self->_cursors;
}

- (void)setCursors:(id)a3
{
}

- (CVNLPLanguageModelWithState)characterLMState
{
  return self->_characterLMState;
}

- (CVNLPLanguageResourceBundle)languageResourceBundle
{
  return self->_languageResourceBundle;
}

- (id)scoringFunction
{
  return self->_scoringFunction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageResourceBundle, 0);
  objc_storeStrong((id *)&self->_cursors, 0);
  objc_storeStrong((id *)&self->_latestExpandedSymbolIncludingPseudospace, 0);
  begin = self->_tokenCommitCharacterLengths.__begin_;
  if (begin)
  {
    self->_tokenCommitCharacterLengths.__end_ = begin;
    operator delete(begin);
  }
  BOOL v4 = self->_tokenMaxActivations.__begin_;
  if (v4)
  {
    self->_tokenMaxActivations.__end_ = v4;
    operator delete(v4);
  }
  BOOL v5 = self->_tokenStringSegmentationPositions.__begin_;
  if (v5)
  {
    self->_tokenStringSegmentationPositions.__end_ = v5;
    operator delete(v5);
  }
  id v6 = self->_tokenBoundaryLogProbabilities.__begin_;
  if (v6)
  {
    self->_tokenBoundaryLogProbabilities.__end_ = v6;
    operator delete(v6);
  }
  id v7 = self->_cumulativeTokenLogProbabilities.__begin_;
  if (v7)
  {
    self->_cumulativeTokenLogProbabilities.__end_ = v7;
    operator delete(v7);
  }
  uint64_t v8 = self->_histWordTokenIDs.__begin_;
  if (v8)
  {
    self->_histWordTokenIDs.__end_ = v8;
    operator delete(v8);
  }
  uint64_t v9 = self->_tokenString.__begin_;
  if (v9)
  {
    self->_tokenString.__end_ = v9;
    operator delete(v9);
  }
}

- (id).cxx_construct
{
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 15) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 18) = 0;
  *((void *)self + 19) = 0;
  *((void *)self + 17) = 0;
  *((void *)self + 21) = 0;
  *((void *)self + 22) = 0;
  *((void *)self + 20) = 0;
  *((void *)self + 24) = 0;
  *((void *)self + 25) = 0;
  *((void *)self + 23) = 0;
  *((void *)self + 27) = 0;
  *((void *)self + 28) = 0;
  *((void *)self + 26) = 0;
  *((void *)self + 30) = 0;
  *((void *)self + 31) = 0;
  *((void *)self + 29) = 0;
  return self;
}

@end