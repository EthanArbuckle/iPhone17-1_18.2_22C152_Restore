@interface _HDRecordCategoryAnalyticsDescription
- (NSArray)queryDescriptors;
- (NSArray)timeScopes;
- (NSString)baseAnalyticKey;
- (_HDRecordCategoryAnalyticsDescription)initWithCategoryType:(int64_t)a3 baseAnalyticKey:(id)a4 timeScopes:(id)a5 queryDescriptors:(id)a6;
- (int64_t)recordCategoryType;
@end

@implementation _HDRecordCategoryAnalyticsDescription

- (_HDRecordCategoryAnalyticsDescription)initWithCategoryType:(int64_t)a3 baseAnalyticKey:(id)a4 timeScopes:(id)a5 queryDescriptors:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)_HDRecordCategoryAnalyticsDescription;
  v13 = [(_HDRecordCategoryAnalyticsDescription *)&v22 init];
  v14 = v13;
  if (v13)
  {
    v13->_recordCategoryType = a3;
    v15 = (NSString *)[v10 copy];
    baseAnalyticKey = v14->_baseAnalyticKey;
    v14->_baseAnalyticKey = v15;

    v17 = (NSArray *)[v11 copy];
    timeScopes = v14->_timeScopes;
    v14->_timeScopes = v17;

    v19 = (NSArray *)[v12 copy];
    queryDescriptors = v14->_queryDescriptors;
    v14->_queryDescriptors = v19;
  }
  return v14;
}

- (int64_t)recordCategoryType
{
  return self->_recordCategoryType;
}

- (NSString)baseAnalyticKey
{
  return self->_baseAnalyticKey;
}

- (NSArray)timeScopes
{
  return self->_timeScopes;
}

- (NSArray)queryDescriptors
{
  return self->_queryDescriptors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryDescriptors, 0);
  objc_storeStrong((id *)&self->_timeScopes, 0);

  objc_storeStrong((id *)&self->_baseAnalyticKey, 0);
}

@end