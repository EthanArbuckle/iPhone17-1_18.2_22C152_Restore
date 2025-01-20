@interface PAREngagedResult
+ (BOOL)supportsSecureCoding;
- (NSData)encodedNormalizedTopic;
- (NSDate)engagementTime;
- (NSString)searchString;
- (NSString)title;
- (PAREngagedResult)init;
- (PAREngagedResult)initWithCoder:(id)a3;
- (double)freshnessScore;
- (double)score;
- (int)type;
- (void)encodeWithCoder:(id)a3;
- (void)setEncodedNormalizedTopic:(id)a3;
- (void)setEngagementTime:(id)a3;
- (void)setFreshnessScore:(double)a3;
- (void)setScore:(double)a3;
- (void)setSearchString:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int)a3;
@end

@implementation PAREngagedResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagementTime, 0);
  objc_storeStrong((id *)&self->_encodedNormalizedTopic, 0);
  objc_storeStrong((id *)&self->_searchString, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setFreshnessScore:(double)a3
{
  self->_freshnessScore = a3;
}

- (double)freshnessScore
{
  return self->_freshnessScore;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setEngagementTime:(id)a3
{
}

- (NSDate)engagementTime
{
  return self->_engagementTime;
}

- (void)setEncodedNormalizedTopic:(id)a3
{
}

- (NSData)encodedNormalizedTopic
{
  return self->_encodedNormalizedTopic;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setSearchString:(id)a3
{
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PAREngagedResult *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  v6 = [(PAREngagedResult *)self searchString];
  [v4 encodeObject:v6 forKey:@"searchString"];

  v7 = [(PAREngagedResult *)self engagementTime];
  [v4 encodeObject:v7 forKey:@"engagementTime"];

  objc_msgSend(v4, "encodeInt32:forKey:", -[PAREngagedResult type](self, "type"), @"type");
  [(PAREngagedResult *)self freshnessScore];
  objc_msgSend(v4, "encodeDouble:forKey:", @"freshnessScore");
  [(PAREngagedResult *)self score];
  objc_msgSend(v4, "encodeDouble:forKey:", @"score");
  id v8 = [(PAREngagedResult *)self encodedNormalizedTopic];
  [v4 encodeObject:v8 forKey:@"encodedNormalizedTopic"];
}

- (PAREngagedResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PAREngagedResult;
  v5 = [(PAREngagedResult *)&v11 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    [(PAREngagedResult *)v5 setTitle:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchString"];
    [(PAREngagedResult *)v5 setSearchString:v7];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"engagementTime"];
    [(PAREngagedResult *)v5 setEngagementTime:v8];

    -[PAREngagedResult setType:](v5, "setType:", [v4 decodeInt32ForKey:@"type"]);
    [v4 decodeDoubleForKey:@"freshnessScore"];
    -[PAREngagedResult setFreshnessScore:](v5, "setFreshnessScore:");
    [v4 decodeDoubleForKey:@"score"];
    -[PAREngagedResult setScore:](v5, "setScore:");
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encodedNormalizedTopic"];
    [(PAREngagedResult *)v5 setEncodedNormalizedTopic:v9];
  }
  return v5;
}

- (PAREngagedResult)init
{
  v3.receiver = self;
  v3.super_class = (Class)PAREngagedResult;
  return [(PAREngagedResult *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end