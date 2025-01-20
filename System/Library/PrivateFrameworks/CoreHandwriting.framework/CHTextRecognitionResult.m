@interface CHTextRecognitionResult
- (BOOL)isTextReplacement;
- (CHTextRecognitionResult)initWithString:(id)a3 score:(double)a4 wordRanges:(id)a5 wordIDs:(id)a6 wordRecognitionScores:(id)a7 wordCombinedScores:(id)a8 wordStrokeSets:(id)a9 wordLexicalEntries:(id)a10 wordPatternEntries:(id)a11 rareWordIndexes:(id)a12 inappropriateWordIndexes:(id)a13 isTextReplacement:(BOOL)a14;
- (NSArray)wordCombinedScores;
- (NSArray)wordIDs;
- (NSArray)wordLexicalEntries;
- (NSArray)wordPatternEntries;
- (NSArray)wordRanges;
- (NSArray)wordRecognitionScores;
- (NSArray)wordStrokeSets;
- (NSIndexSet)inappropriateWordIndexes;
- (NSIndexSet)rareWordIndexes;
- (NSString)string;
- (id)mecabraCandidate;
@end

@implementation CHTextRecognitionResult

- (CHTextRecognitionResult)initWithString:(id)a3 score:(double)a4 wordRanges:(id)a5 wordIDs:(id)a6 wordRecognitionScores:(id)a7 wordCombinedScores:(id)a8 wordStrokeSets:(id)a9 wordLexicalEntries:(id)a10 wordPatternEntries:(id)a11 rareWordIndexes:(id)a12 inappropriateWordIndexes:(id)a13 isTextReplacement:(BOOL)a14
{
  v42 = (NSString *)a3;
  id v41 = a5;
  id v40 = a6;
  id v39 = a7;
  id v38 = a8;
  id v37 = a9;
  id v36 = a10;
  id v35 = a11;
  id v34 = a12;
  id v33 = a13;
  v43.receiver = self;
  v43.super_class = (Class)CHTextRecognitionResult;
  v21 = [(CHRecognitionResult *)&v43 initWithScore:a4];
  p_isa = (id *)&v21->super.super.isa;
  v28 = v21;
  if (v21)
  {
    string = v21->_string;
    if (string != v42)
    {
      v21->_string = 0;
    }
    uint64_t v30 = objc_msgSend_copy(v42, v22, v23, v24, v25, v26);
    v31 = v28->_string;
    v28->_string = (NSString *)v30;

    objc_storeStrong(p_isa + 4, a5);
    objc_storeStrong(p_isa + 5, a6);
    objc_storeStrong(p_isa + 6, a7);
    objc_storeStrong(p_isa + 7, a8);
    objc_storeStrong(p_isa + 8, a9);
    objc_storeStrong(p_isa + 9, a10);
    objc_storeStrong(p_isa + 10, a11);
    objc_storeStrong(p_isa + 11, a12);
    objc_storeStrong(p_isa + 12, a13);
    v28->_isTextReplacement = a14;
  }

  return v28;
}

- (id)mecabraCandidate
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  v7 = objc_msgSend_wordIDs(self, a2, v2, v3, v4, v5);
  uint64_t v13 = objc_msgSend_count(v7, v8, v9, v10, v11, v12);

  if (v13
    && (objc_msgSend_wordRanges(self, v14, v15, v16, v17, v18),
        v19 = objc_claimAutoreleasedReturnValue(),
        uint64_t v25 = objc_msgSend_count(v19, v20, v21, v22, v23, v24),
        v19,
        v13 == v25))
  {
    v77 = &v75;
    MEMORY[0x1F4188790](v26);
    v28 = (char *)&v75 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v34 = objc_msgSend_wordIDs(self, v29, v30, v31, v32, v33);
    uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v83, (uint64_t)v88, 16, v36);
    if (v42)
    {
      uint64_t v43 = 0;
      uint64_t v44 = *(void *)v84;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v84 != v44) {
            objc_enumerationMutation(v34);
          }
          *(_DWORD *)&v28[4 * v43 + 4 * i] = objc_msgSend_unsignedIntValue(*(void **)(*((void *)&v83 + 1) + 8 * i), v37, v38, v39, v40, v41);
        }
        uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v83, (uint64_t)v88, 16, v41);
        v43 += i;
      }
      while (v42);
    }

    MEMORY[0x1F4188790](v46);
    v78 = (char *)&v75 - v47;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    v53 = objc_msgSend_wordRanges(self, v48, v49, v50, v51, v52);
    v76 = self;
    uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v54, (uint64_t)&v79, (uint64_t)v87, 16, v55);
    if (v61)
    {
      uint64_t v62 = 0;
      uint64_t v63 = *(void *)v80;
      v64 = v78 + 8;
      do
      {
        uint64_t v65 = 0;
        v66 = (const char **)&v64[16 * v62];
        do
        {
          if (*(void *)v80 != v63) {
            objc_enumerationMutation(v53);
          }
          *(v66 - 1) = (const char *)objc_msgSend_rangeValue(*(void **)(*((void *)&v79 + 1) + 8 * v65), v56, v57, v58, v59, v60);
          *v66 = v56;
          ++v65;
          v66 += 2;
        }
        while (v61 != v65);
        uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v56, (uint64_t)&v79, (uint64_t)v87, 16, v60);
        v62 += v65;
      }
      while (v61);
    }

    v72 = objc_msgSend_string(v76, v67, v68, v69, v70, v71);
    v73 = MecabraCreateHandwritingCandidate();
  }
  else
  {
    v73 = 0;
  }
  return v73;
}

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)wordRanges
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)wordIDs
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)wordRecognitionScores
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)wordCombinedScores
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (NSArray)wordStrokeSets
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (NSArray)wordLexicalEntries
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (NSArray)wordPatternEntries
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (NSIndexSet)rareWordIndexes
{
  return (NSIndexSet *)objc_getProperty(self, a2, 88, 1);
}

- (NSIndexSet)inappropriateWordIndexes
{
  return (NSIndexSet *)objc_getProperty(self, a2, 96, 1);
}

- (BOOL)isTextReplacement
{
  return self->_isTextReplacement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inappropriateWordIndexes, 0);
  objc_storeStrong((id *)&self->_rareWordIndexes, 0);
  objc_storeStrong((id *)&self->_wordPatternEntries, 0);
  objc_storeStrong((id *)&self->_wordLexicalEntries, 0);
  objc_storeStrong((id *)&self->_wordStrokeSets, 0);
  objc_storeStrong((id *)&self->_wordCombinedScores, 0);
  objc_storeStrong((id *)&self->_wordRecognitionScores, 0);
  objc_storeStrong((id *)&self->_wordIDs, 0);
  objc_storeStrong((id *)&self->_wordRanges, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end