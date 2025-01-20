@interface CSUVocabulary
- (CSUVocabulary)initWithName:(id)a3 labelFilePath:(id)a4 internalCount:(unint64_t)a5 visibleCount:(unint64_t)a6 startIndex:(unint64_t)a7;
- (NSArray)labels;
- (NSString)name;
- (id).cxx_construct;
- (unint64_t)count;
- (unint64_t)internalCount;
- (unint64_t)startIndex;
- (void)_enumerateAllLabelsInVocabularyUsingBlock:(id)a3;
- (void)_enumerateVisibleLabelsAndIndicesInVocabularyUsingBlock:(id)a3;
- (void)_enumerateVisibleLabelsInVocabularyUsingBlock:(id)a3;
@end

@implementation CSUVocabulary

- (CSUVocabulary)initWithName:(id)a3 labelFilePath:(id)a4 internalCount:(unint64_t)a5 visibleCount:(unint64_t)a6 startIndex:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CSUVocabulary;
  v15 = [(CSUVocabulary *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    v16->_count = a6;
    v16->_internalCount = a5;
    v16->_startIndex = a7;
    labels = v16->_labels;
    v16->_labels = 0;

    objc_storeStrong((id *)&v16->_labelFilePath, a4);
    sub_24C690B4C((uint64_t)&v16->_visibleLabels, a6);
    v18 = v16;
  }

  return v16;
}

- (NSArray)labels
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  labels = self->_labels;
  if (labels)
  {
LABEL_17:
    v27 = labels;
    goto LABEL_18;
  }
  v6 = (void *)MEMORY[0x263EFF8C0];
  v7 = objc_msgSend_fileURLWithPath_(NSURL, a2, (uint64_t)self->_labelFilePath, v2, v3);
  objc_msgSend_arrayWithContentsOfURL_error_(v6, v8, (uint64_t)v7, 0, v9);
  v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v11 = self->_labels;
  self->_labels = v10;

  v15 = self->_labels;
  if (v15)
  {
    uint64_t v41 = 0;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v16 = v15;
    uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v36, (uint64_t)v42, 16);
    if (v22)
    {
      uint64_t v23 = *(void *)v37;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v37 != v23) {
            objc_enumerationMutation(v16);
          }
          id v40 = *(id *)(*((void *)&v36 + 1) + 8 * v24);
          if (objc_msgSend_length(v40, v18, v19, v20, v21)
            && (objc_msgSend_hasPrefix_(v40, v18, @"CVML_UNKNOWN", v20, v21) & 1) == 0)
          {
            end = self->_visibleLabels.__end_;
            if (end < self->_visibleLabels.__end_cap_.__value_)
            {
              void *end = v40;
              end[1] = v41;
              v25 = end + 2;
            }
            else
            {
              v25 = sub_24C692708(&self->_visibleLabels.__begin_, &v40, &v41);
            }
            self->_visibleLabels.__end_ = v25;
          }
          ++v41;
          ++v24;
        }
        while (v22 != v24);
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v18, (uint64_t)&v36, (uint64_t)v42, 16);
      }
      while (v22);
    }

    labels = self->_labels;
    goto LABEL_17;
  }
  v29 = objc_msgSend_stringWithFormat_(NSString, v12, @"Failed to load labels for vocabulary %@ from file at %@", v13, v14, self->_name, self->_labelFilePath);
  v32 = objc_msgSend_errorWithCode_message_(CSUError, v30, 2, (uint64_t)v29, v31);
  objc_msgSend_logInternalError_(CSUError, v33, (uint64_t)v32, v34, v35);

  v27 = 0;
LABEL_18:
  return v27;
}

- (void)_enumerateAllLabelsInVocabularyUsingBlock:(id)a3
{
  v4 = (void (**)(id, void, char *))a3;
  char v25 = 0;
  uint64_t v9 = objc_msgSend_labels(self, v5, v6, v7, v8);

  if (v9)
  {
    uint64_t v14 = objc_msgSend_labels(self, v10, v11, v12, v13);
    uint64_t v19 = objc_msgSend_count(v14, v15, v16, v17, v18);

    if (v19)
    {
      uint64_t v20 = 0;
      begin = self->_visibleLabels.__begin_;
      uint64_t v22 = v19 - 1;
      do
      {
        while (v20 == begin[1])
        {
          v4[2](v4, *begin, &v25);
          begin += 2;
          if (v25) {
            BOOL v24 = 1;
          }
          else {
            BOOL v24 = v22 == v20;
          }
          ++v20;
          if (v24) {
            goto LABEL_14;
          }
        }
        v4[2](v4, 0, &v25);
        if (v25) {
          BOOL v23 = 1;
        }
        else {
          BOOL v23 = v22 == v20;
        }
        ++v20;
      }
      while (!v23);
    }
  }
LABEL_14:
}

- (void)_enumerateVisibleLabelsInVocabularyUsingBlock:(id)a3
{
  v4 = (void (**)(id, void, char *))a3;
  char v14 = 0;
  uint64_t v9 = objc_msgSend_labels(self, v5, v6, v7, v8);

  if (v9)
  {
    begin = (char *)self->_visibleLabels.__begin_;
    end = (char *)self->_visibleLabels.__end_;
    if (begin != end)
    {
      uint64_t v12 = begin + 16;
      do
      {
        v4[2](v4, *((void *)v12 - 2), &v14);
        if (v14) {
          BOOL v13 = 1;
        }
        else {
          BOOL v13 = v12 == end;
        }
        v12 += 16;
      }
      while (!v13);
    }
  }
}

- (void)_enumerateVisibleLabelsAndIndicesInVocabularyUsingBlock:(id)a3
{
  id v4 = a3;
  char v13 = 0;
  uint64_t v9 = objc_msgSend_labels(self, v5, v6, v7, v8);

  if (v9)
  {
    begin = self->_visibleLabels.__begin_;
    end = self->_visibleLabels.__end_;
    if (begin != end)
    {
      do
      {
        (*((void (**)(id, void, void, char *))v4 + 2))(v4, *begin, begin[1], &v13);
        begin += 2;
        if (v13) {
          BOOL v12 = 1;
        }
        else {
          BOOL v12 = begin == end;
        }
      }
      while (!v12);
    }
  }
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)count
{
  return self->_count;
}

- (unint64_t)internalCount
{
  return self->_internalCount;
}

- (unint64_t)startIndex
{
  return self->_startIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  begin = (char *)self->_visibleLabels.__begin_;
  if (begin)
  {
    end = (char *)self->_visibleLabels.__end_;
    v5 = self->_visibleLabels.__begin_;
    if (end != begin)
    {
      do
      {
        uint64_t v6 = (void *)*((void *)end - 2);
        end -= 16;
      }
      while (end != begin);
      v5 = self->_visibleLabels.__begin_;
    }
    self->_visibleLabels.__end_ = begin;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_labelFilePath, 0);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  return self;
}

@end