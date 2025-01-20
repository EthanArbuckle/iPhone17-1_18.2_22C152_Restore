@interface CVNLPDecodingLexicons
- (CVNLPDecodingLexicons)initWithLexicons:(id)a3;
- (CVNLPDecodingLexicons)initWithLexicons:(id)a3 decodingWeight:(id)a4;
- (CVNLPDecodingLexicons)initWithLexicons:(id)a3 decodingWeight:(id)a4 lowerBoundLogProbability:(id)a5;
- (CVNLPDecodingLexicons)initWithLexicons:(id)a3 decodingWeight:(id)a4 lowerBoundLogProbability:(id)a5 inputNormalizationFunction:(void *)a6;
- (id)lexiconsForPriority:(unint64_t)a3;
- (id)packagedLexiconCursorsUsingTextDecodingContext:(id)a3;
- (id)packagedLexiconRootCursors;
- (unint64_t)count;
- (void)enumerateLexiconsSortedByPriorityWithBlock:(id)a3;
- (void)inputNormalizationFunction;
@end

@implementation CVNLPDecodingLexicons

- (CVNLPDecodingLexicons)initWithLexicons:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_defaultDecodingWeight(CVNLPInformationStream, v5, v6, v7);
  v12 = objc_msgSend_defaultLowerBoundLogProbability(CVNLPInformationStream, v9, v10, v11);
  v14 = (CVNLPDecodingLexicons *)objc_msgSend_initWithLexicons_decodingWeight_lowerBoundLogProbability_(self, v13, (uint64_t)v4, (uint64_t)v8, v12);

  return v14;
}

- (CVNLPDecodingLexicons)initWithLexicons:(id)a3 decodingWeight:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_defaultLowerBoundLogProbability(CVNLPInformationStream, v8, v9, v10);
  v13 = (CVNLPDecodingLexicons *)objc_msgSend_initWithLexicons_decodingWeight_lowerBoundLogProbability_(self, v12, (uint64_t)v6, (uint64_t)v7, v11);

  return v13;
}

- (CVNLPDecodingLexicons)initWithLexicons:(id)a3 decodingWeight:(id)a4 lowerBoundLogProbability:(id)a5
{
  return (CVNLPDecodingLexicons *)MEMORY[0x1F4181798](self, sel_initWithLexicons_decodingWeight_lowerBoundLogProbability_inputNormalizationFunction_, a3, a4);
}

- (CVNLPDecodingLexicons)initWithLexicons:(id)a3 decodingWeight:(id)a4 lowerBoundLogProbability:(id)a5 inputNormalizationFunction:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CVNLPDecodingLexicons;
  v16 = [(CVNLPInformationStream *)&v23 initWithDecodingWeight:v11 lowerBoundLogProbability:v12];
  if (v16)
  {
    v17 = objc_msgSend_allObjects(v10, v13, v14, v15);
    uint64_t v20 = objc_msgSend_sortedArrayUsingComparator_(v17, v18, (uint64_t)&unk_1F0D560C0, v19);
    sortedLexicons = v16->_sortedLexicons;
    v16->_sortedLexicons = (NSArray *)v20;

    v16->_inputNormalizationFunction = a6;
  }

  return v16;
}

- (void)enumerateLexiconsSortedByPriorityWithBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, char *))a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_sortedLexicons;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
      char v12 = 0;
      v4[2](v4, v10, &v12);
      if (v12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v13, (uint64_t)v17, 16);
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)lexiconsForPriority:(unint64_t)a3
{
  v5 = objc_msgSend_predicateWithFormat_(MEMORY[0x1E4F28F60], a2, @"priority == %lu", v3, a3);
  uint64_t v8 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v6, (uint64_t)self->_sortedLexicons, v7);
  id v11 = objc_msgSend_filteredSetUsingPredicate_(v8, v9, (uint64_t)v5, v10);

  char v12 = [CVNLPDecodingLexicons alloc];
  long long v16 = objc_msgSend_decodingWeight(self, v13, v14, v15);
  uint64_t v18 = objc_msgSend_initWithLexicons_decodingWeight_(v12, v17, (uint64_t)v11, (uint64_t)v16);

  return v18;
}

- (id)packagedLexiconCursorsUsingTextDecodingContext:(id)a3
{
  id v4 = a3;
  uint64_t v8 = v4;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x4812000000;
  v27 = sub_1B4C7EED0;
  v28 = sub_1B4C7EEF4;
  v29 = &unk_1B4C9FEA6;
  v31 = 0;
  uint64_t v32 = 0;
  __p = 0;
  if (v4)
  {
    objc_msgSend_activeSubstring(v4, v5, v6, v7);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = sub_1B4C7EF0C;
  uint64_t v20 = &unk_1E60A3F28;
  id v9 = v4;
  id v21 = v9;
  v22 = self;
  objc_super v23 = &v24;
  objc_msgSend_enumerateLexiconsSortedByPriorityWithBlock_(self, v10, (uint64_t)&v17, v11);
  char v12 = [CVNLPLexiconCursors alloc];
  uint64_t v15 = objc_msgSend_initWithSortedCursors_(v12, v13, (uint64_t)(v25 + 6), v14, v17, v18, v19, v20);

  _Block_object_dispose(&v24, 8);
  if (__p)
  {
    v31 = __p;
    operator delete(__p);
  }

  return v15;
}

- (id)packagedLexiconRootCursors
{
  return (id)objc_msgSend_packagedLexiconCursorsUsingTextDecodingContext_(self, a2, 0, v2);
}

- (unint64_t)count
{
  return objc_msgSend_count(self->_sortedLexicons, a2, v2, v3);
}

- (void)inputNormalizationFunction
{
  return self->_inputNormalizationFunction;
}

- (void).cxx_destruct
{
}

@end