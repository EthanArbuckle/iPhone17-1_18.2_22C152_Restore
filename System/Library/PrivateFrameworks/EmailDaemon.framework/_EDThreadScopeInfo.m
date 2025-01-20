@interface _EDThreadScopeInfo
- (BOOL)needsUpdate;
- (NSDate)lastViewedDate;
- (_EDThreadScopeInfo)initWithDatabaseID:(int64_t)a3 needsUpdate:(BOOL)a4 lastViewedDate:(id)a5;
- (id)description;
- (int64_t)databaseID;
- (void)setLastViewedDate:(id)a3;
- (void)setNeedsUpdate:(BOOL)a3;
@end

@implementation _EDThreadScopeInfo

- (int64_t)databaseID
{
  return self->_databaseID;
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setLastViewedDate:(id)a3
{
}

- (_EDThreadScopeInfo)initWithDatabaseID:(int64_t)a3 needsUpdate:(BOOL)a4 lastViewedDate:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_EDThreadScopeInfo;
  v10 = [(_EDThreadScopeInfo *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_databaseID = a3;
    v10->_needsUpdate = a4;
    objc_storeStrong((id *)&v10->_lastViewedDate, a5);
  }

  return v11;
}

- (id)description
{
  id v3 = [NSString alloc];
  int64_t v4 = [(_EDThreadScopeInfo *)self databaseID];
  if ([(_EDThreadScopeInfo *)self needsUpdate]) {
    v5 = @", needs update";
  }
  else {
    v5 = &stru_1F3583658;
  }
  v6 = [(_EDThreadScopeInfo *)self lastViewedDate];
  v7 = (void *)[v3 initWithFormat:@"%lld%@, last viewed: %@", v4, v5, v6];

  return v7;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (NSDate)lastViewedDate
{
  return self->_lastViewedDate;
}

- (void).cxx_destruct
{
}

@end