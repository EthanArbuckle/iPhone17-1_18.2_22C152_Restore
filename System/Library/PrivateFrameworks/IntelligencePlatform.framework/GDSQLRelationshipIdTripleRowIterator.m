@interface GDSQLRelationshipIdTripleRowIterator
- (GDSQLRelationshipIdTripleRowIterator)initWithLazyTripleRow:(id)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation GDSQLRelationshipIdTripleRowIterator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iterateRelationshipIdValue, 0);
  objc_storeStrong((id *)&self->_iteratePredicateValue, 0);
  objc_storeStrong((id *)&self->_iterateSubjectValue, 0);

  objc_storeStrong((id *)&self->_lazyTripleRow, 0);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (a3->var0)
  {
    sub_1B2E670B8((uint64_t)self->_lazyTripleRow, a2, (uint64_t)a3, (uint64_t)a4, a5);
  }
  else
  {
    a3->var0 = 1;
    a3->var1 = (id *)&self->_lazyTripleRow;
    a3->var2 = (unint64_t *)self;
  }
  lazyTripleRow = self->_lazyTripleRow;
  if (lazyTripleRow)
  {
    cursor = lazyTripleRow->_cursor;
    if (cursor)
    {
      if (cursor->_done) {
        return 0;
      }
    }
  }
  v8 = objc_msgSend_subject(lazyTripleRow, a2, (uint64_t)a3, (uint64_t)a4, a5);
  if (!objc_msgSend_isEqualToString_(v8, v9, (uint64_t)self->_iterateSubjectValue, v10, v11)) {
    goto LABEL_12;
  }
  v16 = objc_msgSend_predicate(self->_lazyTripleRow, v12, v13, v14, v15);
  if ((objc_msgSend_isEqualToString_(v16, v17, (uint64_t)self->_iteratePredicateValue, v18, v19) & 1) == 0)
  {

LABEL_12:
    return 0;
  }
  v24 = objc_msgSend_relationshipId(self->_lazyTripleRow, v20, v21, v22, v23);
  char isEqualToString = objc_msgSend_isEqualToString_(v24, v25, (uint64_t)self->_iterateRelationshipIdValue, v26, v27);

  return (isEqualToString & 1) != 0;
}

- (GDSQLRelationshipIdTripleRowIterator)initWithLazyTripleRow:(id)a3
{
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)GDSQLRelationshipIdTripleRowIterator;
  v6 = [(GDSQLRelationshipIdTripleRowIterator *)&v27 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_lazyTripleRow, a3);
    uint64_t v12 = objc_msgSend_subject(v5, v8, v9, v10, v11);
    iterateSubjectValue = v7->_iterateSubjectValue;
    v7->_iterateSubjectValue = (NSString *)v12;

    uint64_t v18 = objc_msgSend_predicate(v5, v14, v15, v16, v17);
    iteratePredicateValue = v7->_iteratePredicateValue;
    v7->_iteratePredicateValue = (NSString *)v18;

    uint64_t v24 = objc_msgSend_relationshipId(v5, v20, v21, v22, v23);
    iterateRelationshipIdValue = v7->_iterateRelationshipIdValue;
    v7->_iterateRelationshipIdValue = (NSString *)v24;
  }
  return v7;
}

@end