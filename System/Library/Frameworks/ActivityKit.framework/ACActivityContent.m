@interface ACActivityContent
- (ACActivityContent)initWithContentData:(id)a3 staleDate:(id)a4 relevanceScore:(double)a5;
- (NSData)contentData;
- (NSDate)staleDate;
- (double)relevanceScore;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setContentData:(id)a3;
- (void)setRelevanceScore:(double)a3;
- (void)setStaleDate:(id)a3;
@end

@implementation ACActivityContent

- (ACActivityContent)initWithContentData:(id)a3 staleDate:(id)a4 relevanceScore:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ACActivityContent;
  v11 = [(ACActivityContent *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_contentData, a3);
    objc_storeStrong((id *)&v12->_staleDate, a4);
    v12->_relevanceScore = a5;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [ACActivityContent alloc];
  v5 = [(ACActivityContent *)self contentData];
  v6 = [(ACActivityContent *)self staleDate];
  [(ACActivityContent *)self relevanceScore];
  v7 = -[ACActivityContent initWithContentData:staleDate:relevanceScore:](v4, "initWithContentData:staleDate:relevanceScore:", v5, v6);

  return v7;
}

- (NSData)contentData
{
  return self->_contentData;
}

- (void)setContentData:(id)a3
{
}

- (NSDate)staleDate
{
  return self->_staleDate;
}

- (void)setStaleDate:(id)a3
{
}

- (double)relevanceScore
{
  return self->_relevanceScore;
}

- (void)setRelevanceScore:(double)a3
{
  self->_relevanceScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staleDate, 0);

  objc_storeStrong((id *)&self->_contentData, 0);
}

@end