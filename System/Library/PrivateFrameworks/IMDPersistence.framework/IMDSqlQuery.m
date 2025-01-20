@interface IMDSqlQuery
+ (id)databaseQuery:(id)a3;
- (IMDSqlQuery)initWithTableName:(id)a3;
- (NSString)columns;
- (NSString)tableName;
- (NSString)where;
- (id)createQueryString;
- (int64_t)limit;
- (void)dealloc;
- (void)setColumns:(id)a3;
- (void)setLimit:(int64_t)a3;
- (void)setWhere:(id)a3;
@end

@implementation IMDSqlQuery

- (IMDSqlQuery)initWithTableName:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IMDSqlQuery;
  v4 = [(IMDSqlQuery *)&v6 init];
  if (v4) {
    v4->_tableName = (NSString *)[a3 copy];
  }
  return v4;
}

+ (id)databaseQuery:(id)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTableName:a3];
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMDSqlQuery;
  [(IMDSqlQuery *)&v3 dealloc];
}

- (id)createQueryString
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSString stringWithFormat:@"Failure in %s at %s:%d. %@", "-[IMDSqlQuery createQueryString]", IMFileLocationTrimFileName(), 40, objc_msgSend(NSString, "stringWithFormat:", @"Use one of the subclasses", 0x1AFC87790, 0, "-[IMDSqlQuery createQueryString]", "-[IMDSqlQuery createQueryString]"];
  objc_super v3 = (void (*)(uint64_t))IMGetAssertionFailureHandler();
  if (v3)
  {
    v3(v2);
  }
  else if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v7 = v2;
      _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
    }
  }
  return 0;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (NSString)columns
{
  return self->_columns;
}

- (void)setColumns:(id)a3
{
}

- (NSString)where
{
  return self->_where;
}

- (void)setWhere:(id)a3
{
}

- (int64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(int64_t)a3
{
  self->_limit = a3;
}

@end