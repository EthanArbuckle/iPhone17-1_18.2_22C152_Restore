@interface DAMailboxSearchQuery
+ (id)mailboxSearchQueryWithSearchString:(id)a3 consumer:(id)a4;
+ (id)mailboxSearchQueryWithSearchString:(id)a3 predicate:(id)a4 consumer:(id)a5;
- (BOOL)allOrNone;
- (BOOL)deepTraversal;
- (BOOL)rebuildResults;
- (DAMailboxSearchQuery)initWithDictionaryRepresentation:(id)a3 consumer:(id)a4;
- (DAMailboxSearchQuery)initWithSearchString:(id)a3 consumer:(id)a4;
- (DAMailboxSearchQuery)initWithSearchString:(id)a3 predicate:(id)a4 consumer:(id)a5;
- (NSDate)priorToDate;
- (NSString)collectionID;
- (id)dictionaryRepresentation;
- (int)MIMESupport;
- (int)bodyType;
- (int64_t)truncationSize;
- (void)setAllOrNone:(BOOL)a3;
- (void)setBodyType:(int)a3;
- (void)setCollectionID:(id)a3;
- (void)setDeepTraversal:(BOOL)a3;
- (void)setMIMESupport:(int)a3;
- (void)setPriorToDate:(id)a3;
- (void)setRebuildResults:(BOOL)a3;
- (void)setTruncationSize:(int64_t)a3;
@end

@implementation DAMailboxSearchQuery

+ (id)mailboxSearchQueryWithSearchString:(id)a3 consumer:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[DAMailboxSearchQuery alloc] initWithSearchString:v6 consumer:v5];

  return v7;
}

+ (id)mailboxSearchQueryWithSearchString:(id)a3 predicate:(id)a4 consumer:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[DAMailboxSearchQuery alloc] initWithSearchString:v9 predicate:v8 consumer:v7];

  return v10;
}

- (DAMailboxSearchQuery)initWithSearchString:(id)a3 consumer:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)DAMailboxSearchQuery;
  v4 = [(DASearchQuery *)&v7 initWithSearchString:a3 consumer:a4];
  id v5 = v4;
  if (v4)
  {
    [(DAMailboxSearchQuery *)v4 setBodyType:4];
    [(DAMailboxSearchQuery *)v5 setTruncationSize:0x10000];
    [(DAMailboxSearchQuery *)v5 setAllOrNone:0];
    [(DAMailboxSearchQuery *)v5 setMIMESupport:2];
    [(DAMailboxSearchQuery *)v5 setDeepTraversal:0];
    [(DAMailboxSearchQuery *)v5 setRebuildResults:1];
  }
  return v5;
}

- (DAMailboxSearchQuery)initWithSearchString:(id)a3 predicate:(id)a4 consumer:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)DAMailboxSearchQuery;
  id v5 = [(DASearchQuery *)&v8 initWithSearchString:a3 predicate:a4 consumer:a5];
  id v6 = v5;
  if (v5)
  {
    [(DAMailboxSearchQuery *)v5 setBodyType:4];
    [(DAMailboxSearchQuery *)v6 setTruncationSize:0x10000];
    [(DAMailboxSearchQuery *)v6 setAllOrNone:0];
    [(DAMailboxSearchQuery *)v6 setMIMESupport:2];
    [(DAMailboxSearchQuery *)v6 setDeepTraversal:0];
    [(DAMailboxSearchQuery *)v6 setRebuildResults:1];
  }
  return v6;
}

- (DAMailboxSearchQuery)initWithDictionaryRepresentation:(id)a3 consumer:(id)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DAMailboxSearchQuery;
  objc_super v7 = [(DASearchQuery *)&v17 initWithDictionaryRepresentation:v6 consumer:a4];
  if (v7)
  {
    objc_super v8 = [v6 objectForKeyedSubscript:@"MessageSearchCollectionID"];
    [(DAMailboxSearchQuery *)v7 setCollectionID:v8];

    id v9 = [v6 objectForKeyedSubscript:@"MessageSearchBodyType"];
    -[DAMailboxSearchQuery setBodyType:](v7, "setBodyType:", [v9 intValue]);

    v10 = [v6 objectForKeyedSubscript:@"MessageSearchTruncationSize"];
    -[DAMailboxSearchQuery setTruncationSize:](v7, "setTruncationSize:", [v10 longLongValue]);

    v11 = [v6 objectForKeyedSubscript:@"MessageSearchAllOrNone"];
    -[DAMailboxSearchQuery setAllOrNone:](v7, "setAllOrNone:", [v11 BOOLValue]);

    v12 = [v6 objectForKeyedSubscript:@"MessageSearchPriorToDate"];
    [(DAMailboxSearchQuery *)v7 setPriorToDate:v12];

    v13 = [v6 objectForKeyedSubscript:@"MessageSearchMIMESupport"];
    -[DAMailboxSearchQuery setMIMESupport:](v7, "setMIMESupport:", [v13 intValue]);

    v14 = [v6 objectForKeyedSubscript:@"MessageSearchDeepTraversal"];
    -[DAMailboxSearchQuery setDeepTraversal:](v7, "setDeepTraversal:", [v14 BOOLValue]);

    v15 = [v6 objectForKeyedSubscript:@"MessageSearchRebuildResults"];
    -[DAMailboxSearchQuery setRebuildResults:](v7, "setRebuildResults:", [v15 BOOLValue]);
  }
  return v7;
}

- (id)dictionaryRepresentation
{
  v14.receiver = self;
  v14.super_class = (Class)DAMailboxSearchQuery;
  v3 = [(DASearchQuery *)&v14 dictionaryRepresentation];
  v4 = [(DAMailboxSearchQuery *)self collectionID];
  [v3 setObject:v4 forKeyedSubscript:@"MessageSearchCollectionID"];

  id v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", -[DAMailboxSearchQuery bodyType](self, "bodyType"));
  [v3 setObject:v5 forKeyedSubscript:@"MessageSearchBodyType"];

  id v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", -[DAMailboxSearchQuery truncationSize](self, "truncationSize"));
  [v3 setObject:v6 forKeyedSubscript:@"MessageSearchTruncationSize"];

  objc_super v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DAMailboxSearchQuery allOrNone](self, "allOrNone"));
  [v3 setObject:v7 forKeyedSubscript:@"MessageSearchAllOrNone"];

  objc_super v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", -[DAMailboxSearchQuery MIMESupport](self, "MIMESupport"));
  [v3 setObject:v8 forKeyedSubscript:@"MessageSearchMIMESupport"];

  id v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DAMailboxSearchQuery deepTraversal](self, "deepTraversal"));
  [v3 setObject:v9 forKeyedSubscript:@"MessageSearchDeepTraversal"];

  v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DAMailboxSearchQuery rebuildResults](self, "rebuildResults"));
  [v3 setObject:v10 forKeyedSubscript:@"MessageSearchRebuildResults"];

  v11 = [(DAMailboxSearchQuery *)self priorToDate];

  if (v11)
  {
    v12 = [(DAMailboxSearchQuery *)self priorToDate];
    [v3 setObject:v12 forKeyedSubscript:@"MessageSearchPriorToDate"];
  }
  return v3;
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
}

- (int)bodyType
{
  return self->_bodyType;
}

- (void)setBodyType:(int)a3
{
  self->_bodyType = a3;
}

- (int64_t)truncationSize
{
  return self->_truncationSize;
}

- (void)setTruncationSize:(int64_t)a3
{
  self->_truncationSize = a3;
}

- (BOOL)allOrNone
{
  return self->_allOrNone;
}

- (void)setAllOrNone:(BOOL)a3
{
  self->_allOrNone = a3;
}

- (NSDate)priorToDate
{
  return self->_priorToDate;
}

- (void)setPriorToDate:(id)a3
{
}

- (int)MIMESupport
{
  return self->_MIMESupport;
}

- (void)setMIMESupport:(int)a3
{
  self->_MIMESupport = a3;
}

- (BOOL)deepTraversal
{
  return self->_deepTraversal;
}

- (void)setDeepTraversal:(BOOL)a3
{
  self->_deepTraversal = a3;
}

- (BOOL)rebuildResults
{
  return self->_rebuildResults;
}

- (void)setRebuildResults:(BOOL)a3
{
  self->_rebuildResults = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorToDate, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
}

@end