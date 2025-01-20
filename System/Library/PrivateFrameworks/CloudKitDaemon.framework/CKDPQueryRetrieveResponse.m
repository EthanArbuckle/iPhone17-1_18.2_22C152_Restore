@interface CKDPQueryRetrieveResponse
+ (Class)queryResultsType;
- (BOOL)hasContinuationMarker;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)continuationMarker;
- (NSMutableArray)queryResults;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)queryResultsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)queryResultsCount;
- (void)addQueryResults:(id)a3;
- (void)clearQueryResults;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContinuationMarker:(id)a3;
- (void)setQueryResults:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPQueryRetrieveResponse

- (void)clearQueryResults
{
  objc_msgSend_removeAllObjects(self->_queryResults, a2, v2);
}

- (void)addQueryResults:(id)a3
{
  v4 = (const char *)a3;
  queryResults = self->_queryResults;
  v8 = (char *)v4;
  if (!queryResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_queryResults;
    self->_queryResults = v6;

    v4 = v8;
    queryResults = self->_queryResults;
  }
  objc_msgSend_addObject_(queryResults, v4, (uint64_t)v4);
}

- (unint64_t)queryResultsCount
{
  return objc_msgSend_count(self->_queryResults, a2, v2);
}

- (id)queryResultsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_queryResults, a2, a3);
}

+ (Class)queryResultsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasContinuationMarker
{
  return self->_continuationMarker != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPQueryRetrieveResponse;
  v4 = [(CKDPQueryRetrieveResponse *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if (objc_msgSend_count(self->_queryResults, v5, v6))
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v11 = objc_msgSend_count(self->_queryResults, v9, v10);
    v13 = objc_msgSend_initWithCapacity_(v8, v12, v11);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v14 = self->_queryResults;
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v27, v31, 16);
    if (v16)
    {
      uint64_t v19 = v16;
      uint64_t v20 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(v14);
          }
          v22 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v27 + 1) + 8 * i), v17, v18, (void)v27);
          objc_msgSend_addObject_(v13, v23, (uint64_t)v22);
        }
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v27, v31, 16);
      }
      while (v19);
    }

    objc_msgSend_setObject_forKey_(v4, v24, (uint64_t)v13, @"queryResults");
  }
  continuationMarker = self->_continuationMarker;
  if (continuationMarker) {
    objc_msgSend_setObject_forKey_(v4, v7, (uint64_t)continuationMarker, @"continuationMarker");
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4F4FC20(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_queryResults;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v12, v16, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v12, v16, 16);
    }
    while (v8);
  }

  if (self->_continuationMarker) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v16 = a3;
  if (objc_msgSend_queryResultsCount(self, v4, v5))
  {
    objc_msgSend_clearQueryResults(v16, v6, v7);
    uint64_t ResultsCount = objc_msgSend_queryResultsCount(self, v8, v9);
    if (ResultsCount)
    {
      uint64_t v11 = ResultsCount;
      for (uint64_t i = 0; i != v11; ++i)
      {
        long long v13 = objc_msgSend_queryResultsAtIndex_(self, v6, i);
        objc_msgSend_addQueryResults_(v16, v14, (uint64_t)v13);
      }
    }
  }
  continuationMarker = self->_continuationMarker;
  if (continuationMarker) {
    objc_msgSend_setContinuationMarker_(v16, v6, (uint64_t)continuationMarker);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v11 = self->_queryResults;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v24, v28, 16);
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v25;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v11);
        }
        uint64_t v18 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v24 + 1) + 8 * v17), v14, (uint64_t)a3, (void)v24);
        objc_msgSend_addQueryResults_(v10, v19, (uint64_t)v18);

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v24, v28, 16);
    }
    while (v15);
  }

  uint64_t v21 = objc_msgSend_copyWithZone_(self->_continuationMarker, v20, (uint64_t)a3);
  v22 = (void *)v10[1];
  v10[1] = v21;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((queryResults = self->_queryResults, uint64_t v9 = v4[2], !((unint64_t)queryResults | v9))
     || objc_msgSend_isEqual_(queryResults, v7, v9)))
  {
    continuationMarker = self->_continuationMarker;
    uint64_t v11 = v4[1];
    if ((unint64_t)continuationMarker | v11) {
      char isEqual = objc_msgSend_isEqual_(continuationMarker, v7, v11);
    }
    else {
      char isEqual = 1;
    }
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_queryResults, a2, v2);
  return objc_msgSend_hash(self->_continuationMarker, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v14, v18, 16);
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend_addQueryResults_(self, v8, *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v14, v18, 16);
    }
    while (v9);
  }

  uint64_t v13 = *((void *)v4 + 1);
  if (v13) {
    objc_msgSend_setContinuationMarker_(self, v12, v13);
  }
}

- (NSMutableArray)queryResults
{
  return self->_queryResults;
}

- (void)setQueryResults:(id)a3
{
}

- (NSData)continuationMarker
{
  return self->_continuationMarker;
}

- (void)setContinuationMarker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryResults, 0);
  objc_storeStrong((id *)&self->_continuationMarker, 0);
}

@end