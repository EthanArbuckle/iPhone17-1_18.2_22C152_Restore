@interface PARAsyncMoreResults
+ (BOOL)supportsSecureCoding;
+ (id)moreResults:(id)a3 label:(id)a4 session:(id)a5 scale:(double)a6 queryId:(unint64_t)a7;
+ (id)moreResults:(id)a3 label:(id)a4 session:(id)a5 scale:(double)a6 queryId:(unint64_t)a7 clientQueryId:(unint64_t)a8;
- (NSURL)moreResultsURL;
- (PARAsyncMoreResults)initWithCoder:(id)a3;
- (double)scale;
- (unint64_t)clientQueryId;
- (unint64_t)queryId;
- (void)encodeWithCoder:(id)a3;
- (void)setScale:(double)a3;
@end

@implementation PARAsyncMoreResults

- (void).cxx_destruct
{
}

- (unint64_t)clientQueryId
{
  return self->_clientQueryId;
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (NSURL)moreResultsURL
{
  return self->_moreResultsURL;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PARAsyncMoreResults;
  id v4 = a3;
  [(SFMoreResults *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_moreResultsURL, @"_moreResultsURL", v5.receiver, v5.super_class);
  [v4 encodeDouble:@"_scale" forKey:self->_scale];
  [v4 encodeInt64:self->_queryId forKey:@"_queryId"];
  [v4 encodeInt64:self->_clientQueryId forKey:@"_clientQueryId"];
}

- (PARAsyncMoreResults)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PARAsyncMoreResults;
  objc_super v5 = [(SFMoreResults *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_moreResultsURL"];
    moreResultsURL = v5->_moreResultsURL;
    v5->_moreResultsURL = (NSURL *)v6;

    [v4 decodeDoubleForKey:@"_scale"];
    v5->_scale = v8;
    v5->_queryId = [v4 decodeInt64ForKey:@"_queryId"];
    v5->_clientQueryId = [v4 decodeInt64ForKey:@"_clientQueryId"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)moreResults:(id)a3 label:(id)a4 session:(id)a5 scale:(double)a6 queryId:(unint64_t)a7 clientQueryId:(unint64_t)a8
{
  id result = (id)[a1 moreResults:a3 label:a4 session:a5 scale:a7 queryId:a6];
  if (result) {
    *((void *)result + 5) = a8;
  }
  return result;
}

+ (id)moreResults:(id)a3 label:(id)a4 session:(id)a5 scale:(double)a6 queryId:(unint64_t)a7
{
  id v10 = a4;
  id v11 = a3;
  v12 = objc_alloc_init(PARAsyncMoreResults);
  [(SFMoreResults *)v12 setLabel:v10];

  uint64_t v13 = [v11 copy];
  moreResultsURL = v12->_moreResultsURL;
  v12->_moreResultsURL = (NSURL *)v13;

  v12->_scale = a6;
  v12->_queryId = a7;

  return v12;
}

@end