@interface _CPLPruneRequestCounter
- (NSDictionary)statusDictionary;
- (NSString)status;
- (NSString)statusKey;
- (NSString)title;
- (_CPLPruneRequestCounter)initWithTitle:(id)a3 statusKey:(id)a4;
- (void)noteRequestForResource:(id)a3 successful:(BOOL)a4 prunedSize:(unint64_t)a5;
@end

@implementation _CPLPruneRequestCounter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusKey, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_lastRequestDate, 0);
  objc_storeStrong((id *)&self->_failedStatsPerResourceType, 0);
  objc_storeStrong((id *)&self->_successStatsPerResourceType, 0);
}

- (NSString)statusKey
{
  return self->_statusKey;
}

- (NSString)title
{
  return self->_title;
}

- (NSDictionary)statusDictionary
{
  if (self->_lastRequestDate)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", +[CPLResource countOfResourceTypes](CPLResource, "countOfResourceTypes"));
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    v10 = __43___CPLPruneRequestCounter_statusDictionary__block_invoke;
    v11 = &unk_1E60A6D00;
    v12 = self;
    id v5 = v4;
    id v13 = v5;
    +[CPLResource enumerateResourceTypesWithBlock:&v8];
    if (self->_successSize)
    {
      v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", v8, v9, v10, v11, v12);
      [v3 setObject:v6 forKeyedSubscript:@"size"];
    }
    if (objc_msgSend(v5, "count", v8, v9, v10, v11, v12)) {
      [v3 setObject:v5 forKeyedSubscript:@"requests"];
    }
  }
  else
  {
    id v3 = 0;
  }
  return (NSDictionary *)v3;
}

- (NSString)status
{
  if (!self->_lastRequestDate) {
    goto LABEL_5;
  }
  v2 = self;
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", +[CPLResource countOfResourceTypes](CPLResource, "countOfResourceTypes") / 3 + 1);
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__0;
  v16[4] = __Block_byref_object_dispose__0;
  id v17 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __33___CPLPruneRequestCounter_status__block_invoke;
  v11[3] = &unk_1E60A6CD8;
  v11[4] = v2;
  id v13 = v16;
  v14 = v15;
  id v4 = v3;
  id v12 = v4;
  +[CPLResource enumerateResourceTypesWithBlock:v11];
  uint64_t v5 = [v4 count];
  if (v5)
  {
    id v6 = [NSString alloc];
    v7 = [MEMORY[0x1E4F28B68] stringFromByteCount:v2->_successSize countStyle:1];
    uint64_t v8 = +[CPLDateFormatter stringFromDateAgo:v2->_lastRequestDate now:0];
    uint64_t v9 = [v4 componentsJoinedByString:@"\n\t"];
    v2 = (_CPLPruneRequestCounter *)[v6 initWithFormat:@"%@, %@\n\t%@", v7, v8, v9];
  }
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v16, 8);

  if (!v5) {
LABEL_5:
  }
    v2 = 0;
  return (NSString *)v2;
}

- (void)noteRequestForResource:(id)a3 successful:(BOOL)a4 prunedSize:(unint64_t)a5
{
  BOOL v6 = a4;
  id v16 = a3;
  [(NSDate *)self->_lastRequestDate timeIntervalSinceNow];
  if (self->_lastRequestDate)
  {
    if (v8 > 0.0 || v8 < -60.0)
    {
      [(NSCountedSet *)self->_successStatsPerResourceType removeAllObjects];
      [(NSCountedSet *)self->_failedStatsPerResourceType removeAllObjects];
      self->_successSize = 0;
    }
  }
  if (v6)
  {
    successStatsPerResourceType = self->_successStatsPerResourceType;
    v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "resourceType"));
    [(NSCountedSet *)successStatsPerResourceType addObject:v11];

    self->_successSize += a5;
  }
  else
  {
    failedStatsPerResourceType = self->_failedStatsPerResourceType;
    id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "resourceType"));
    [(NSCountedSet *)failedStatsPerResourceType addObject:v13];
  }
  v14 = [MEMORY[0x1E4F1C9C8] date];
  lastRequestDate = self->_lastRequestDate;
  self->_lastRequestDate = v14;
}

- (_CPLPruneRequestCounter)initWithTitle:(id)a3 statusKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_CPLPruneRequestCounter;
  double v8 = [(_CPLPruneRequestCounter *)&v18 init];
  if (v8)
  {
    uint64_t v9 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    successStatsPerResourceType = v8->_successStatsPerResourceType;
    v8->_successStatsPerResourceType = v9;

    v11 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    failedStatsPerResourceType = v8->_failedStatsPerResourceType;
    v8->_failedStatsPerResourceType = v11;

    uint64_t v13 = [v6 copy];
    title = v8->_title;
    v8->_title = (NSString *)v13;

    uint64_t v15 = [v7 copy];
    statusKey = v8->_statusKey;
    v8->_statusKey = (NSString *)v15;
  }
  return v8;
}

@end