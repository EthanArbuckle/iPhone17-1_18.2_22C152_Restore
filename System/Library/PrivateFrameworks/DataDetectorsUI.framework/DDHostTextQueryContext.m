@interface DDHostTextQueryContext
- (NSString)identifier;
- (NSString)queryString;
- (NSString)title;
- (NSString)userAgent;
- (int64_t)queryID;
- (void)setIdentifier:(id)a3;
- (void)setQueryID:(int64_t)a3;
- (void)setQueryString:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation DDHostTextQueryContext

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
}

- (int64_t)queryID
{
  return self->_queryID;
}

- (void)setQueryID:(int64_t)a3
{
  self->_queryID = a3;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void)setQueryString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end