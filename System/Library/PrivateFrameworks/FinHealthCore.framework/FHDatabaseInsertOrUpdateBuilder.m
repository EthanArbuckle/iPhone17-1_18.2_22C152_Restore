@interface FHDatabaseInsertOrUpdateBuilder
- (FHDatabaseInsertOrUpdateBuilder)init;
- (NSMutableArray)dynamicFieldValuePairList;
- (void)addDateValueForField:(id)a3 fieldValue:(id)a4;
- (void)addDecimalNumberValueForField:(id)a3 fieldValue:(id)a4;
- (void)addDoubleValueForField:(id)a3 fieldValue:(double)a4;
- (void)addIntegerValueForField:(id)a3 fieldValue:(int64_t)a4;
- (void)addNumberValueForField:(id)a3 fieldValue:(id)a4;
- (void)addStringValueForField:(id)a3 fieldValue:(id)a4;
@end

@implementation FHDatabaseInsertOrUpdateBuilder

- (FHDatabaseInsertOrUpdateBuilder)init
{
  v6.receiver = self;
  v6.super_class = (Class)FHDatabaseInsertOrUpdateBuilder;
  v2 = [(FHDatabaseInsertOrUpdateBuilder *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    dynamicFieldValuePairList = v2->_dynamicFieldValuePairList;
    v2->_dynamicFieldValuePairList = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)addStringValueForField:(id)a3 fieldValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[FHDatabaseInsertFieldValuePair alloc] initWithQuoteWrapOption:v7 fieldValue:v6 quoteWrap:0];

  [(NSMutableArray *)self->_dynamicFieldValuePairList addObject:v8];
}

- (void)addDoubleValueForField:(id)a3 fieldValue:(double)a4
{
  id v6 = a3;
  id v7 = [FHDatabaseInsertFieldValuePair alloc];
  v8 = objc_msgSend(NSString, "stringWithFormat:", @"%f", *(void *)&a4);
  v9 = [(FHDatabaseInsertFieldValuePair *)v7 initWithQuoteWrapOption:v6 fieldValue:v8 quoteWrap:0];

  [(NSMutableArray *)self->_dynamicFieldValuePairList addObject:v9];
}

- (void)addDecimalNumberValueForField:(id)a3 fieldValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [FHDatabaseInsertFieldValuePair alloc];
  v9 = [v6 stringValue];

  v10 = [(FHDatabaseInsertFieldValuePair *)v8 initWithQuoteWrapOption:v7 fieldValue:v9 quoteWrap:0];
  [(NSMutableArray *)self->_dynamicFieldValuePairList addObject:v10];
}

- (void)addNumberValueForField:(id)a3 fieldValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [FHDatabaseInsertFieldValuePair alloc];
  v9 = [v6 stringValue];

  v10 = [(FHDatabaseInsertFieldValuePair *)v8 initWithQuoteWrapOption:v7 fieldValue:v9 quoteWrap:0];
  [(NSMutableArray *)self->_dynamicFieldValuePairList addObject:v10];
}

- (void)addIntegerValueForField:(id)a3 fieldValue:(int64_t)a4
{
  id v6 = a3;
  id v7 = [FHDatabaseInsertFieldValuePair alloc];
  v8 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a4);
  v9 = [(FHDatabaseInsertFieldValuePair *)v7 initWithQuoteWrapOption:v6 fieldValue:v8 quoteWrap:0];

  [(NSMutableArray *)self->_dynamicFieldValuePairList addObject:v9];
}

- (void)addDateValueForField:(id)a3 fieldValue:(id)a4
{
  id v6 = a3;
  [a4 timeIntervalSinceReferenceDate];
  -[FHDatabaseInsertOrUpdateBuilder addDoubleValueForField:fieldValue:](self, "addDoubleValueForField:fieldValue:", v6);
}

- (NSMutableArray)dynamicFieldValuePairList
{
  return self->_dynamicFieldValuePairList;
}

- (void).cxx_destruct
{
}

@end