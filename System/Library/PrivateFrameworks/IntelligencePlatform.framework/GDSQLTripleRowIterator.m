@interface GDSQLTripleRowIterator
- (GDSQLTripleRowIterator)initWithColumns:(unint64_t)a3 statement:(id)a4 subjectOverride:(id)a5;
- (id)relationshipIdIterator;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation GDSQLTripleRowIterator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iterateSubjectValue, 0);

  objc_storeStrong((id *)&self->_lazyTripleRow, 0);
}

- (id)relationshipIdIterator
{
  lazyTripleRow = self->_lazyTripleRow;
  if (lazyTripleRow)
  {
    subject = lazyTripleRow->_subject;
    if (subject || (subject = lazyTripleRow->_subjectOverride) != 0)
    {
      v8 = subject;
    }
    else
    {
      sub_1B2E669A8((uint64_t)lazyTripleRow->_cursor, 0, v2, v3, v4);
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v9 = lazyTripleRow->_subject;
    lazyTripleRow->_subject = v8;

    v10 = [GDEntityIdentifier alloc];
    v14 = objc_msgSend_initWithString_(v10, v11, (uint64_t)lazyTripleRow->_subject, v12, v13);
    uint64_t v19 = objc_msgSend_stringValue(v14, v15, v16, v17, v18);
    v20 = lazyTripleRow->_subject;
    lazyTripleRow->_subject = (NSString *)v19;

    predicate = lazyTripleRow->_predicate;
    if (predicate)
    {
      v25 = predicate;
    }
    else
    {
      sub_1B2E669A8((uint64_t)lazyTripleRow->_cursor, (const char *)1, v21, v22, v23);
      v25 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v26 = lazyTripleRow->_predicate;
    lazyTripleRow->_predicate = v25;

    relationshipId = lazyTripleRow->_relationshipId;
    if (relationshipId)
    {
      v31 = relationshipId;
    }
    else
    {
      sub_1B2E669A8((uint64_t)lazyTripleRow->_cursor, (const char *)2, v27, v28, v29);
      v31 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v32 = lazyTripleRow->_relationshipId;
    lazyTripleRow->_relationshipId = v31;

    relationshipPredicate = lazyTripleRow->_relationshipPredicate;
    if (relationshipPredicate)
    {
      v37 = relationshipPredicate;
    }
    else
    {
      sub_1B2E669A8((uint64_t)lazyTripleRow->_cursor, (const char *)3, v33, v34, v35);
      v37 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v38 = lazyTripleRow->_relationshipPredicate;
    lazyTripleRow->_relationshipPredicate = v37;

    object = lazyTripleRow->_object;
    if (object)
    {
      v43 = object;
    }
    else
    {
      sub_1B2E669A8((uint64_t)lazyTripleRow->_cursor, (const char *)4, v39, v40, v41);
      v43 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v44 = lazyTripleRow->_object;
    lazyTripleRow->_object = v43;

    sources = lazyTripleRow->_sources;
    if (sources)
    {
      v49 = sources;
    }
    else
    {
      sub_1B2E669A8((uint64_t)lazyTripleRow->_cursor, (const char *)5, v45, v46, v47);
      v49 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v50 = lazyTripleRow->_sources;
    lazyTripleRow->_sources = v49;

    confidence = lazyTripleRow->_confidence;
    if (confidence)
    {
      v55 = confidence;
    }
    else
    {
      sub_1B2E66874((uint64_t)lazyTripleRow->_cursor, (const char *)6, v51, v52, v53);
      v55 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    v56 = lazyTripleRow->_confidence;
    lazyTripleRow->_confidence = v55;

    sourceDuplicates = lazyTripleRow->_sourceDuplicates;
    if (sourceDuplicates)
    {
      v61 = sourceDuplicates;
    }
    else
    {
      sub_1B2E669A8((uint64_t)lazyTripleRow->_cursor, (const char *)7, v57, v58, v59);
      v61 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v62 = lazyTripleRow->_sourceDuplicates;
    lazyTripleRow->_sourceDuplicates = v61;

    timestamp = lazyTripleRow->_timestamp;
    if (timestamp)
    {
      v67 = timestamp;
    }
    else
    {
      sub_1B2E66874((uint64_t)lazyTripleRow->_cursor, (const char *)8, v63, v64, v65);
      v67 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    v68 = lazyTripleRow->_timestamp;
    lazyTripleRow->_timestamp = v67;
  }
  v69 = [GDLazyGraphTripleRow alloc];
  v70 = self->_lazyTripleRow;
  if (v70)
  {
    cursor = v70->_cursor;
    subjectOverride = v70->_subjectOverride;
  }
  else
  {
    cursor = 0;
    subjectOverride = 0;
  }
  v73 = cursor;
  v74 = sub_1B2E67624((id *)&v69->super.isa, v73, subjectOverride);

  self->_internalIteratorStarted = 1;
  v75 = [GDSQLRelationshipIdTripleRowIterator alloc];
  v79 = objc_msgSend_initWithLazyTripleRow_(v75, v76, (uint64_t)v74, v77, v78);

  return v79;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  p_lazyTripleRow = &self->_lazyTripleRow;
  if (!a3->var0)
  {
    a3->var1 = (id *)p_lazyTripleRow;
    a3->var2 = (unint64_t *)self;
    a3->var0 = 1;
    if (self->_iterateSubjectValue) {
      goto LABEL_17;
    }
    lazyTripleRow = *p_lazyTripleRow;
LABEL_13:
    sub_1B2E670B8((uint64_t)lazyTripleRow, a2, (uint64_t)a3, (uint64_t)a4, a5);
    goto LABEL_17;
  }
  lazyTripleRow = self->_lazyTripleRow;
  if (!self->_internalIteratorStarted) {
    goto LABEL_13;
  }
  v8 = objc_msgSend_subject(lazyTripleRow, a2, (uint64_t)a3, (uint64_t)a4, a5);
  uint64_t v13 = objc_msgSend_predicate(*p_lazyTripleRow, v9, v10, v11, v12);
  uint64_t v18 = objc_msgSend_relationshipId(*p_lazyTripleRow, v14, v15, v16, v17);
  sub_1B2E6720C((uint64_t)*p_lazyTripleRow);
  while (1)
  {
    uint64_t v23 = *p_lazyTripleRow;
    if (*p_lazyTripleRow)
    {
      cursor = v23->_cursor;
      if (cursor)
      {
        if (cursor->_done) {
          break;
        }
      }
    }
    v25 = objc_msgSend_subject(v23, v19, v20, v21, v22);
    if (!objc_msgSend_isEqualToString_(v25, v26, (uint64_t)v8, v27, v28)) {
      goto LABEL_15;
    }
    uint64_t v33 = objc_msgSend_predicate(*p_lazyTripleRow, v29, v30, v31, v32);
    if ((objc_msgSend_isEqualToString_(v33, v34, (uint64_t)v13, v35, v36) & 1) == 0)
    {

LABEL_15:
      break;
    }
    uint64_t v41 = objc_msgSend_relationshipId(*p_lazyTripleRow, v37, v38, v39, v40);
    int isEqualToString = objc_msgSend_isEqualToString_(v41, v42, (uint64_t)v18, v43, v44);

    if (!isEqualToString) {
      break;
    }
    sub_1B2E670B8((uint64_t)*p_lazyTripleRow, v46, v47, v48, v49);
  }
  self->_internalIteratorStarted = 0;

LABEL_17:
  v50 = *p_lazyTripleRow;
  if (*p_lazyTripleRow)
  {
    uint64_t v51 = v50->_cursor;
    if (v51)
    {
      if (v51->_done) {
        return 0;
      }
    }
  }
  iterateSubjectValue = self->_iterateSubjectValue;
  if (!iterateSubjectValue) {
    return 1;
  }
  v54 = objc_msgSend_subject(v50, a2, (uint64_t)a3, (uint64_t)a4, a5);
  unsigned int v58 = objc_msgSend_isEqualToString_(iterateSubjectValue, v55, (uint64_t)v54, v56, v57);

  return v58;
}

- (GDSQLTripleRowIterator)initWithColumns:(unint64_t)a3 statement:(id)a4 subjectOverride:(id)a5
{
  int v6 = a3;
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = sub_1B2E67904([GDLazyGraphTripleRowCursor alloc], v6, v9);

  uint64_t v11 = sub_1B2E67624((id *)[GDLazyGraphTripleRow alloc], v10, v8);
  uint64_t v12 = (GDSQLTripleRowIterator *)sub_1B2E679C0(self, v11);

  return v12;
}

@end