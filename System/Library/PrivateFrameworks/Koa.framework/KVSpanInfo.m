@interface KVSpanInfo
+ (id)spanInfoFromEncodedString:(id)a3 error:(id *)a4;
- (BOOL)isAliasMatch;
- (BOOL)isApproximateMatch;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSpanInfo:(id)a3;
- (BOOL)isPartialMatch;
- (KVSpanInfo)initWithSpanInfo:(id)a3;
- (SEMSpanInfo)spanInfo;
- (_NSRange)spanRange;
- (float)matchScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)getAliasTypesArray;
- (unint64_t)hash;
- (unsigned)editDistance;
- (unsigned)matchedAliasCount;
- (unsigned)matchedStopWordCount;
- (unsigned)matchedTokenCount;
- (unsigned)maxAliasCount;
- (unsigned)maxStopWordCount;
- (unsigned)maxTokenCount;
@end

@implementation KVSpanInfo

- (void).cxx_destruct
{
}

- (SEMSpanInfo)spanInfo
{
  return self->_spanInfo;
}

- (id)getAliasTypesArray
{
  v7 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3, v4, v5);
  char matched = objc_msgSend_aliasMatchOptions(self->_spanInfo, v8, v9, v10, v11, v12);
  if (matched)
  {
    v18 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v13, 1, v14, v15, v16);
    objc_msgSend_addObject_(v7, v19, (uint64_t)v18, v20, v21, v22);
  }
  if ((matched & 2) != 0)
  {
    v23 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v13, 2, v14, v15, v16);
    objc_msgSend_addObject_(v7, v24, (uint64_t)v23, v25, v26, v27);
  }
  if ((matched & 4) != 0)
  {
    v28 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v13, 4, v14, v15, v16);
    objc_msgSend_addObject_(v7, v29, (uint64_t)v28, v30, v31, v32);
  }
  if ((matched & 8) != 0)
  {
    v33 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v13, 8, v14, v15, v16);
    objc_msgSend_addObject_(v7, v34, (uint64_t)v33, v35, v36, v37);
  }
  return v7;
}

- (BOOL)isAliasMatch
{
  return ((uint64_t (*)(SEMSpanInfo *, char *))MEMORY[0x1F4181798])(self->_spanInfo, sel_isAliasMatch);
}

- (BOOL)isApproximateMatch
{
  return ((uint64_t (*)(SEMSpanInfo *, char *))MEMORY[0x1F4181798])(self->_spanInfo, sel_isApproximateMatch);
}

- (BOOL)isPartialMatch
{
  return ((uint64_t (*)(SEMSpanInfo *, char *))MEMORY[0x1F4181798])(self->_spanInfo, sel_isPartialMatch);
}

- (unint64_t)hash
{
  return objc_msgSend_hash(self->_spanInfo, a2, v2, v3, v4, v5);
}

- (id)description
{
  return (id)objc_msgSend_description(self->_spanInfo, a2, v2, v3, v4, v5);
}

- (BOOL)isEqualToSpanInfo:(id)a3
{
  id v5 = a3;
  uint64_t v11 = v5;
  spanInfo = self->_spanInfo;
  v13 = spanInfo;
  if (!spanInfo)
  {
    uint64_t v3 = objc_msgSend_spanInfo(v5, v6, v7, v8, v9, v10);
    if (!v3)
    {
      char isEqual = 1;
LABEL_7:

      goto LABEL_8;
    }
    v13 = self->_spanInfo;
  }
  uint64_t v14 = objc_msgSend_spanInfo(v11, v6, v7, v8, v9, v10);
  char isEqual = objc_msgSend_isEqual_(v13, v15, (uint64_t)v14, v16, v17, v18);

  if (!spanInfo) {
    goto LABEL_7;
  }
LABEL_8:

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (KVSpanInfo *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char isEqualToSpanInfo = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToSpanInfo = objc_msgSend_isEqualToSpanInfo_(self, v6, (uint64_t)v5, v7, v8, v9);
  }
  else
  {
    char isEqualToSpanInfo = 0;
  }

  return isEqualToSpanInfo;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  uint64_t v10 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8, v9);
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_spanInfo, v11, (uint64_t)a3, v12, v13, v14);
  uint64_t v16 = (void *)v10[1];
  v10[1] = v15;

  return v10;
}

- (unsigned)editDistance
{
  return objc_msgSend_editDistance(self->_spanInfo, a2, v2, v3, v4, v5);
}

- (unsigned)matchedAliasCount
{
  return objc_msgSend_matchedAliasCount(self->_spanInfo, a2, v2, v3, v4, v5);
}

- (unsigned)maxAliasCount
{
  return objc_msgSend_maxAliasCount(self->_spanInfo, a2, v2, v3, v4, v5);
}

- (unsigned)matchedStopWordCount
{
  return objc_msgSend_matchedStopWordCount(self->_spanInfo, a2, v2, v3, v4, v5);
}

- (unsigned)maxStopWordCount
{
  return objc_msgSend_maxStopWordCount(self->_spanInfo, a2, v2, v3, v4, v5);
}

- (unsigned)matchedTokenCount
{
  return objc_msgSend_matchedTokenCount(self->_spanInfo, a2, v2, v3, v4, v5);
}

- (unsigned)maxTokenCount
{
  return objc_msgSend_maxTokenCount(self->_spanInfo, a2, v2, v3, v4, v5);
}

- (float)matchScore
{
  objc_msgSend_matchScore(self->_spanInfo, a2, v2, v3, v4, v5);
  return result;
}

- (_NSRange)spanRange
{
  NSUInteger v6 = objc_msgSend_spanRange(self->_spanInfo, a2, v2, v3, v4, v5);
  result.length = v7;
  result.location = v6;
  return result;
}

- (KVSpanInfo)initWithSpanInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KVSpanInfo;
  NSUInteger v6 = [(KVSpanInfo *)&v9 init];
  NSUInteger v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_spanInfo, a3);
  }

  return v7;
}

+ (id)spanInfoFromEncodedString:(id)a3 error:(id *)a4
{
  NSUInteger v6 = objc_msgSend_spanInfoFromEncodedString_error_(KVEncodedSpanInfo, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
  return v6;
}

@end