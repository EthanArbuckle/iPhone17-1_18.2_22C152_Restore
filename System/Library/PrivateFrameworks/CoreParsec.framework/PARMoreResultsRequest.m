@interface PARMoreResultsRequest
+ (BOOL)supportsSecureCoding;
- (NSURL)moreResultsURL;
- (PARMoreResultsRequest)initWithCoder:(id)a3;
- (unsigned)nwActivityLabel;
- (void)encodeWithCoder:(id)a3;
- (void)setMoreResultsURL:(id)a3;
@end

@implementation PARMoreResultsRequest

- (void).cxx_destruct
{
}

- (void)setMoreResultsURL:(id)a3
{
}

- (NSURL)moreResultsURL
{
  return self->_moreResultsURL;
}

- (unsigned)nwActivityLabel
{
  return 7;
}

- (PARMoreResultsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PARMoreResultsRequest;
  v5 = [(PARRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"moreResults"];
    moreResultsURL = v5->_moreResultsURL;
    v5->_moreResultsURL = (NSURL *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PARMoreResultsRequest;
  id v4 = a3;
  [(PARRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_moreResultsURL, @"moreResults", v5.receiver, v5.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end