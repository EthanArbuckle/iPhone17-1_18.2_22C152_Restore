@interface DASearchQuery
+ (id)searchQueryWithSearchString:(id)a3 consumer:(id)a4;
- (BOOL)isQueryRunning;
- (DASearchQuery)initWithDictionaryRepresentation:(id)a3 consumer:(id)a4;
- (DASearchQuery)initWithSearchString:(id)a3 consumer:(id)a4;
- (DASearchQuery)initWithSearchString:(id)a3 predicate:(id)a4 consumer:(id)a5;
- (DASearchQueryConsumer)consumer;
- (NSPredicate)searchPredicate;
- (NSString)searchID;
- (NSString)searchString;
- (_NSRange)range;
- (id)description;
- (id)dictionaryRepresentation;
- (int)timeLimit;
- (unint64_t)state;
- (unsigned)maxResults;
- (void)sendFinishedToConsumerWithError:(id)a3;
- (void)sendResultsToConsumer:(id)a3;
- (void)setConsumer:(id)a3;
- (void)setMaxResults:(unsigned int)a3;
- (void)setRange:(_NSRange)a3;
- (void)setSearchID:(id)a3;
- (void)setSearchPredicate:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setTimeLimit:(int)a3;
@end

@implementation DASearchQuery

+ (id)searchQueryWithSearchString:(id)a3 consumer:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[DASearchQuery alloc] initWithSearchString:v6 consumer:v5];

  return v7;
}

- (DASearchQuery)initWithSearchString:(id)a3 consumer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DASearchQuery;
  v8 = [(DASearchQuery *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(DASearchQuery *)v8 setSearchString:v6];
    [(DASearchQuery *)v9 setState:0];
    -[DASearchQuery setRange:](v9, "setRange:", 0, 25);
    [(DASearchQuery *)v9 setTimeLimit:0];
    [(DASearchQuery *)v9 setSearchID:&stru_1F13E6568];
    [(DASearchQuery *)v9 setConsumer:v7];
  }

  return v9;
}

- (DASearchQuery)initWithSearchString:(id)a3 predicate:(id)a4 consumer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)DASearchQuery;
  objc_super v11 = [(DASearchQuery *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(DASearchQuery *)v11 setSearchString:v8];
    [(DASearchQuery *)v12 setSearchPredicate:v9];
    [(DASearchQuery *)v12 setState:0];
    -[DASearchQuery setRange:](v12, "setRange:", 0, 25);
    [(DASearchQuery *)v12 setTimeLimit:0];
    [(DASearchQuery *)v12 setSearchID:&stru_1F13E6568];
    [(DASearchQuery *)v12 setConsumer:v10];
  }

  return v12;
}

- (id)description
{
  v3 = DALoggingwithCategory(0);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

  id v5 = NSString;
  if (v4)
  {
    id v6 = [(DASearchQuery *)self searchString];
    uint64_t v7 = [(DASearchQuery *)self range];
    [(DASearchQuery *)self range];
    id v9 = [v5 stringWithFormat:@"<DASearchQuery %p>: \"%@\" range: {%ld, %ld}, timeLimit: %d", self, v6, v7, v8, -[DASearchQuery timeLimit](self, "timeLimit")];
  }
  else
  {
    uint64_t v10 = [(DASearchQuery *)self range];
    [(DASearchQuery *)self range];
    id v9 = [v5 stringWithFormat:@"<DASearchQuery %p>: range: {%ld, %ld}, timeLimit: %d", self, v10, v11, -[DASearchQuery timeLimit](self, "timeLimit")];
  }
  return v9;
}

- (DASearchQuery)initWithDictionaryRepresentation:(id)a3 consumer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DASearchQuery;
  uint64_t v8 = [(DASearchQuery *)&v15 init];
  if (v8)
  {
    id v9 = [v6 objectForKeyedSubscript:@"SearchString"];
    [(DASearchQuery *)v8 setSearchString:v9];

    uint64_t v10 = [v6 objectForKeyedSubscript:@"RangeLoc"];
    uint64_t v11 = [v10 unsignedIntValue];
    v12 = [v6 objectForKeyedSubscript:@"RangeLength"];
    -[DASearchQuery setRange:](v8, "setRange:", v11, [v12 unsignedIntValue]);

    v13 = [v6 objectForKeyedSubscript:@"TimeLimit"];
    -[DASearchQuery setTimeLimit:](v8, "setTimeLimit:", [v13 intValue]);

    [(DASearchQuery *)v8 setConsumer:v7];
  }

  return v8;
}

- (BOOL)isQueryRunning
{
  return [(DASearchQuery *)self state] == 1;
}

- (void)sendResultsToConsumer:(id)a3
{
  id v5 = a3;
  if ([(DASearchQuery *)self state] != 2)
  {
    BOOL v4 = [(DASearchQuery *)self consumer];
    [v4 searchQuery:self returnedResults:v5];
  }
}

- (void)sendFinishedToConsumerWithError:(id)a3
{
  id v5 = a3;
  if ([(DASearchQuery *)self state] != 2)
  {
    BOOL v4 = [(DASearchQuery *)self consumer];
    [v4 searchQuery:self finishedWithError:v5];
  }
}

- (id)dictionaryRepresentation
{
  v3 = objc_opt_new();
  BOOL v4 = [(DASearchQuery *)self searchString];
  [v3 setObject:v4 forKeyedSubscript:@"SearchString"];

  id v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[DASearchQuery range](self, "range"));
  [v3 setObject:v5 forKeyedSubscript:@"RangeLoc"];

  id v6 = (void *)MEMORY[0x1E4F28ED0];
  [(DASearchQuery *)self range];
  uint64_t v8 = [v6 numberWithUnsignedInteger:v7];
  [v3 setObject:v8 forKeyedSubscript:@"RangeLength"];

  id v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", -[DASearchQuery timeLimit](self, "timeLimit"));
  [v3 setObject:v9 forKeyedSubscript:@"TimeLimit"];

  return v3;
}

- (unsigned)maxResults
{
  [(DASearchQuery *)self range];
  return v2;
}

- (void)setMaxResults:(unsigned int)a3
{
  self->_range.length = a3;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
}

- (NSPredicate)searchPredicate
{
  return self->_searchPredicate;
}

- (void)setSearchPredicate:(id)a3
{
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (int)timeLimit
{
  return self->_timeLimit;
}

- (void)setTimeLimit:(int)a3
{
  self->_timeLimit = a3;
}

- (DASearchQueryConsumer)consumer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_consumer);
  return (DASearchQueryConsumer *)WeakRetained;
}

- (void)setConsumer:(id)a3
{
}

- (NSString)searchID
{
  return self->_searchID;
}

- (void)setSearchID:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchID, 0);
  objc_destroyWeak((id *)&self->_consumer);
  objc_storeStrong((id *)&self->_searchPredicate, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

@end