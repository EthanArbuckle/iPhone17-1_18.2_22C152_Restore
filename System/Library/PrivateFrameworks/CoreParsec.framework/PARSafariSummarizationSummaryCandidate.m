@interface PARSafariSummarizationSummaryCandidate
- (NSString)hashIdentifier;
- (NSString)url;
- (void)setHashIdentifier:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation PARSafariSummarizationSummaryCandidate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_hashIdentifier, 0);
}

- (void)setUrl:(id)a3
{
}

- (NSString)url
{
  return self->_url;
}

- (void)setHashIdentifier:(id)a3
{
}

- (NSString)hashIdentifier
{
  return self->_hashIdentifier;
}

@end