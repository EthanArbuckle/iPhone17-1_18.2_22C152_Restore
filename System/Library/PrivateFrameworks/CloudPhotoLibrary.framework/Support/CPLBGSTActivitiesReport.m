@interface CPLBGSTActivitiesReport
+ (BOOL)supportsSecureCoding;
- (CPLBGSTActivitiesReport)init;
- (CPLBGSTActivitiesReport)initWithCoder:(id)a3;
- (id)_reportForTaskWithIdentifier:(id)a3;
- (id)statusesWithNow:(id)a3;
- (void)didAcquireTaskWithIdentifier:(id)a3;
- (void)didCancelTaskWithIdentifier:(id)a3;
- (void)didDeferTaskWithIdentifier:(id)a3;
- (void)didErrorTaskWithIdentifier:(id)a3;
- (void)didExpireTaskWithIdentifier:(id)a3;
- (void)didFinishTaskWithIdentifier:(id)a3;
- (void)didSubmitTaskWithIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPLBGSTActivitiesReport

- (CPLBGSTActivitiesReport)init
{
  v6.receiver = self;
  v6.super_class = (Class)CPLBGSTActivitiesReport;
  v2 = [(CPLBGSTActivitiesReport *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    reportPerIdentifier = v2->_reportPerIdentifier;
    v2->_reportPerIdentifier = v3;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPLBGSTActivitiesReport)initWithCoder:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    sub_1001C5634((uint64_t)self, (uint64_t)a2);
  }
  v13.receiver = self;
  v13.super_class = (Class)CPLBGSTActivitiesReport;
  objc_super v6 = [(CPLBGSTActivitiesReport *)&v13 init];
  if (!v6) {
    goto LABEL_4;
  }
  uint64_t v7 = objc_opt_class();
  v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(), 0);
  uint64_t v9 = [v5 decodeObjectOfClasses:v8 forKey:@"reports"];
  reportPerIdentifier = v6->_reportPerIdentifier;
  v6->_reportPerIdentifier = (NSMutableDictionary *)v9;

  if (!v6->_reportPerIdentifier) {
    v11 = 0;
  }
  else {
LABEL_4:
  }
    v11 = v6;

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    sub_1001C575C((uint64_t)self, (uint64_t)a2);
  }
  [v5 encodeObject:self->_reportPerIdentifier forKey:@"reports"];
}

- (id)_reportForTaskWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_reportPerIdentifier objectForKeyedSubscript:v4];

  if (!v5)
  {
    objc_super v6 = [[CPLBGSTActivityReport alloc] initWithTaskIdentifier:v4];
    [(NSMutableDictionary *)self->_reportPerIdentifier setObject:v6 forKeyedSubscript:v4];
  }
  uint64_t v7 = [(NSMutableDictionary *)self->_reportPerIdentifier objectForKeyedSubscript:v4];

  return v7;
}

- (void)didSubmitTaskWithIdentifier:(id)a3
{
  id v3 = [(CPLBGSTActivitiesReport *)self _reportForTaskWithIdentifier:a3];
  [v3 didSubmit];
}

- (void)didCancelTaskWithIdentifier:(id)a3
{
  id v3 = [(CPLBGSTActivitiesReport *)self _reportForTaskWithIdentifier:a3];
  [v3 didCancel];
}

- (void)didAcquireTaskWithIdentifier:(id)a3
{
  id v3 = [(CPLBGSTActivitiesReport *)self _reportForTaskWithIdentifier:a3];
  [v3 didAcquire];
}

- (void)didExpireTaskWithIdentifier:(id)a3
{
  id v3 = [(CPLBGSTActivitiesReport *)self _reportForTaskWithIdentifier:a3];
  [v3 didExpire];
}

- (void)didDeferTaskWithIdentifier:(id)a3
{
  id v3 = [(CPLBGSTActivitiesReport *)self _reportForTaskWithIdentifier:a3];
  [v3 didDefer];
}

- (void)didErrorTaskWithIdentifier:(id)a3
{
  id v3 = [(CPLBGSTActivitiesReport *)self _reportForTaskWithIdentifier:a3];
  [v3 didError];
}

- (void)didFinishTaskWithIdentifier:(id)a3
{
  id v3 = [(CPLBGSTActivitiesReport *)self _reportForTaskWithIdentifier:a3];
  [v3 didFinish];
}

- (id)statusesWithNow:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableDictionary count](self->_reportPerIdentifier, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  objc_super v6 = [(NSMutableDictionary *)self->_reportPerIdentifier allKeys];
  uint64_t v7 = [v6 sortedArrayUsingSelector:"compare:"];

  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [(NSMutableDictionary *)self->_reportPerIdentifier objectForKeyedSubscript:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        objc_super v13 = [v12 statusWithNow:v4];

        [v5 addObject:v13];
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  id v14 = [v5 copy];
  return v14;
}

- (void).cxx_destruct
{
}

@end