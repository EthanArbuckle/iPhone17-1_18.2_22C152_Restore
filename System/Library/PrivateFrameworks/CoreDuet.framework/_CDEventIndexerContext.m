@interface _CDEventIndexerContext
- (_CDEventIndexerContext)init;
- (id)description;
- (uint64_t)isBookmarkValid;
- (uint64_t)isBookmarkValidInRecoverableThreshold;
@end

@implementation _CDEventIndexerContext

- (_CDEventIndexerContext)init
{
  v8.receiver = self;
  v8.super_class = (Class)_CDEventIndexerContext;
  v2 = [(_CDEventIndexerContext *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    indexDate = v2->_indexDate;
    v2->_indexDate = (NSDate *)v3;

    uint64_t v5 = os_transaction_create();
    transaction = v2->_transaction;
    v2->_transaction = (OS_os_transaction *)v5;
  }
  return v2;
}

- (uint64_t)isBookmarkValid
{
  uint64_t v1 = a1;
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2) {
      uint64_t v2 = *(void *)(v2 + 32);
    }
    if (*(void *)(a1 + 16) == v2)
    {
      id v3 = *(id *)(a1 + 8);
      v4 = v3;
      if (v3) {
        uint64_t v5 = (void *)*((void *)v3 + 3);
      }
      else {
        uint64_t v5 = 0;
      }
      id v6 = v5;
      id v7 = *(id *)(v1 + 40);
      if ([v6 compare:v7] == 1)
      {
        uint64_t v1 = 0;
      }
      else
      {
        objc_super v8 = *(void **)(v1 + 8);
        if (v8) {
          v9 = (void *)v8[2];
        }
        else {
          v9 = 0;
        }
        uint64_t v10 = *(void *)(v1 + 40);
        id v11 = v9;
        v12 = v8;
        uint64_t v1 = [v11 compare:v10] != 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (uint64_t)isBookmarkValidInRecoverableThreshold
{
  uint64_t v1 = a1;
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2) {
      uint64_t v2 = *(void *)(v2 + 32);
    }
    if (*(void *)(a1 + 16) == v2)
    {
      id v3 = *(id *)(a1 + 8);
      v4 = v3;
      if (v3) {
        uint64_t v5 = (void *)*((void *)v3 + 3);
      }
      else {
        uint64_t v5 = 0;
      }
      id v6 = v5;
      id v7 = *(id *)(v1 + 40);
      [v6 timeIntervalSinceDate:v7];
      if (v8 >= 86400.0)
      {
        uint64_t v1 = 0;
      }
      else
      {
        v9 = *(void **)(v1 + 8);
        if (v9) {
          uint64_t v10 = (void *)v9[2];
        }
        else {
          uint64_t v10 = 0;
        }
        uint64_t v11 = *(void *)(v1 + 40);
        id v12 = v10;
        v13 = v9;
        [v12 timeIntervalSinceDate:v11];
        uint64_t v1 = v14 < 86400.0;
      }
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (id)description
{
  if (-[_CDEventIndexerContext isBookmarkValid]((uint64_t)self))
  {
    id v3 = @"valid";
  }
  else
  {
    v4 = [MEMORY[0x1E4F1CA48] arrayWithObject:@"invalid"];
    if (self)
    {
      uint64_t v5 = self->_bookmark;
      id v6 = v5;
      if (v5) {
        latestTombstoneDate = v5->_latestTombstoneDate;
      }
      else {
        latestTombstoneDate = 0;
      }
      double v8 = latestTombstoneDate;
      indexDate = self->_indexDate;
    }
    else
    {
      double v8 = 0;
      id v6 = 0;
      indexDate = 0;
    }
    [(NSDate *)v8 timeIntervalSinceDate:indexDate];
    double v11 = v10;

    if (v11 > 0.0)
    {
      id v12 = NSString;
      v13 = [NSNumber numberWithDouble:v11];
      double v14 = [v12 stringWithFormat:@"(latest tombstone date is past index date by %@ seconds)", v13];
      [v4 addObject:v14];
    }
    if (self)
    {
      v15 = self->_bookmark;
      v16 = v15;
      if (v15) {
        latestCreationDate = v15->_latestCreationDate;
      }
      else {
        latestCreationDate = 0;
      }
      v18 = latestCreationDate;
      v19 = self->_indexDate;
    }
    else
    {
      v18 = 0;
      v16 = 0;
      v19 = 0;
    }
    [(NSDate *)v18 timeIntervalSinceDate:v19];
    double v21 = v20;

    if (v21 > 0.0)
    {
      v22 = NSString;
      v23 = [NSNumber numberWithDouble:v21];
      v24 = [v22 stringWithFormat:@"(latest creation date is past index date by %@ seconds)", v23];
      [v4 addObject:v24];
    }
    id v3 = [v4 componentsJoinedByString:@" "];
  }
  v25 = NSString;
  uint64_t v26 = objc_opt_class();
  if (self)
  {
    v27 = self->_indexDate;
    bookmark = self->_bookmark;
  }
  else
  {
    v27 = 0;
    bookmark = 0;
  }
  v29 = [v25 stringWithFormat:@"<%@ %p> indexDate: %@, bookmark: %@, validity: %@", v26, self, v27, bookmark, v3];

  return v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_indexDate, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
}

@end