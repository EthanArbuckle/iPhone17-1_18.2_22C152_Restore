@interface GDSQLEntityIterator
- (GDSQLEntityIterator)initWithColumns:(unint64_t)a3 statement:(id)a4;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation GDSQLEntityIterator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerIterator, 0);

  objc_storeStrong((id *)&self->_lazyTripleRow, 0);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (!a3->var0)
  {
    a3->var0 = 1;
    a3->var1 = (id *)&self->_innerIterator;
    a3->var2 = (unint64_t *)self;
  }
  innerIterator = self->_innerIterator;
  if (innerIterator)
  {
    if (innerIterator->_iterateSubjectValue)
    {
      while (1)
      {
        lazyTripleRow = innerIterator->_lazyTripleRow;
        if (lazyTripleRow)
        {
          cursor = lazyTripleRow->_cursor;
          if (cursor)
          {
            if (cursor->_done) {
              break;
            }
          }
        }
        v9 = objc_msgSend_subject(lazyTripleRow, a2, (uint64_t)a3, (uint64_t)a4, a5);
        int isEqualToString = objc_msgSend_isEqualToString_(v9, v10, (uint64_t)innerIterator->_iterateSubjectValue, v11, v12);

        if (!isEqualToString) {
          break;
        }
        sub_1B2E670B8((uint64_t)innerIterator->_lazyTripleRow, a2, (uint64_t)a3, (uint64_t)a4, a5);
      }
    }
    else
    {
      sub_1B2E670B8((uint64_t)innerIterator->_lazyTripleRow, a2, (uint64_t)a3, (uint64_t)a4, a5);
    }
    v14 = innerIterator->_lazyTripleRow;
    if (!v14 || (v15 = v14->_cursor) == 0 || !v15->_done)
    {
      uint64_t v16 = objc_msgSend_subject(v14, a2, (uint64_t)a3, (uint64_t)a4, a5);
      iterateSubjectValue = innerIterator->_iterateSubjectValue;
      innerIterator->_iterateSubjectValue = (NSString *)v16;
    }
  }
  v18 = self->_lazyTripleRow;
  return !v18 || (v19 = v18->_cursor) == 0 || !v19->_done;
}

- (GDSQLEntityIterator)initWithColumns:(unint64_t)a3 statement:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GDSQLEntityIterator;
  v7 = [(GDSQLEntityIterator *)&v14 init];
  if (v7)
  {
    v8 = sub_1B2E67904([GDLazyGraphTripleRowCursor alloc], v4, v6);
    v9 = sub_1B2E67624((id *)[GDLazyGraphTripleRow alloc], v8, 0);
    lazyTripleRow = v7->_lazyTripleRow;
    v7->_lazyTripleRow = (GDLazyGraphTripleRow *)v9;

    uint64_t v11 = (GDSQLTripleRowIterator *)sub_1B2E679C0([GDSQLTripleRowIterator alloc], v7->_lazyTripleRow);
    innerIterator = v7->_innerIterator;
    v7->_innerIterator = v11;
  }
  return v7;
}

@end