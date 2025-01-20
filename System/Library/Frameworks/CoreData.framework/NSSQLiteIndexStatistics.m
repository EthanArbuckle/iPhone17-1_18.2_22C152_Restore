@interface NSSQLiteIndexStatistics
- (NSSQLiteIndexStatistics)initWithName:(id)a3 storeID:(id)a4;
- (NSSQLiteIndexStatistics)initWithResultDictionary:(id)a3 storeID:(id)a4;
- (NSString)indexName;
- (NSString)storeIdentifier;
- (int64_t)executionCount;
- (int64_t)instructionCount;
- (int64_t)rowCount;
- (void)dealloc;
@end

@implementation NSSQLiteIndexStatistics

- (NSSQLiteIndexStatistics)initWithName:(id)a3 storeID:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NSSQLiteIndexStatistics;
  v6 = [(NSSQLiteIndexStatistics *)&v8 init];
  if (v6)
  {
    v6->_indexName = (NSString *)[a3 copy];
    v6->_storeIdentifier = (NSString *)[a4 copy];
  }
  return v6;
}

- (NSSQLiteIndexStatistics)initWithResultDictionary:(id)a3 storeID:(id)a4
{
  v5 = -[NSSQLiteIndexStatistics initWithName:storeID:](self, "initWithName:storeID:", [a3 objectForKeyedSubscript:@"indexName"], a4);
  if (v5)
  {
    v5->_executionCount = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"executionCount"), "longLongValue");
    v5->_instructionCount = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"instructionCount"), "longLongValue");
    v5->_rowCount = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"rowCount"), "longLongValue");
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSSQLiteIndexStatistics;
  [(NSSQLiteIndexStatistics *)&v3 dealloc];
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (NSString)indexName
{
  return self->_indexName;
}

- (int64_t)executionCount
{
  return self->_executionCount;
}

- (int64_t)instructionCount
{
  return self->_instructionCount;
}

- (int64_t)rowCount
{
  return self->_rowCount;
}

@end