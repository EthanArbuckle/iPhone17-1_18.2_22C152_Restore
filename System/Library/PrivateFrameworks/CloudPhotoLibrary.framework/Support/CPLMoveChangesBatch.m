@interface CPLMoveChangesBatch
- (CPLMoveChangesBatch)initWithCapacity:(unint64_t)a3;
- (NSArray)changes;
- (NSArray)destinationRecordIDs;
- (id)changeWithSourceRecordID:(id)a3;
- (id)description;
- (id)redactedDescription;
- (void)addChange:(id)a3;
@end

@implementation CPLMoveChangesBatch

- (CPLMoveChangesBatch)initWithCapacity:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CPLMoveChangesBatch;
  v4 = [(CPLMoveChangesBatch *)&v10 init];
  if (v4)
  {
    v5 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:a3];
    changes = v4->_changes;
    v4->_changes = v5;

    v7 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:a3];
    changePerSourceRecordID = v4->_changePerSourceRecordID;
    v4->_changePerSourceRecordID = v7;
  }
  return v4;
}

- (NSArray)changes
{
  id v2 = [(NSMutableArray *)self->_changes copy];
  return (NSArray *)v2;
}

- (NSArray)destinationRecordIDs
{
  id v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_changes, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_changes;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "destinationRecord", (void)v12);
        objc_super v10 = [v9 recordID];
        [v3 addObject:v10];
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)addChange:(id)a3
{
  changes = self->_changes;
  id v5 = a3;
  [(NSMutableArray *)changes addObject:v5];
  changePerSourceRecordID = self->_changePerSourceRecordID;
  id v7 = [v5 sourceRecordID];
  [(NSMutableDictionary *)changePerSourceRecordID setObject:v5 forKeyedSubscript:v7];
}

- (id)changeWithSourceRecordID:(id)a3
{
  return [(NSMutableDictionary *)self->_changePerSourceRecordID objectForKeyedSubscript:a3];
}

- (id)description
{
  return [(NSMutableArray *)self->_changes description];
}

- (id)redactedDescription
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"<%@ %lu move changes>", objc_opt_class(), -[NSMutableArray count](self->_changes, "count")];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changePerSourceRecordID, 0);
  objc_storeStrong((id *)&self->_changes, 0);
}

@end