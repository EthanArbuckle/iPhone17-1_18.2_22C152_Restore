@interface EDWebContentParserResults
- (NSArray)remoteContentLinks;
- (NSArray)richLinkResults;
- (NSDictionary)dataDetectionResults;
- (NSString)oneTimeCode;
- (void)setDataDetectionResults:(id)a3;
- (void)setOneTimeCode:(id)a3;
- (void)setRemoteContentLinks:(id)a3;
- (void)setRichLinkResults:(id)a3;
@end

@implementation EDWebContentParserResults

- (NSArray)remoteContentLinks
{
  return self->_remoteContentLinks;
}

- (void)setRemoteContentLinks:(id)a3
{
}

- (NSDictionary)dataDetectionResults
{
  return self->_dataDetectionResults;
}

- (void)setDataDetectionResults:(id)a3
{
}

- (NSArray)richLinkResults
{
  return self->_richLinkResults;
}

- (void)setRichLinkResults:(id)a3
{
}

- (NSString)oneTimeCode
{
  return self->_oneTimeCode;
}

- (void)setOneTimeCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oneTimeCode, 0);
  objc_storeStrong((id *)&self->_richLinkResults, 0);
  objc_storeStrong((id *)&self->_dataDetectionResults, 0);

  objc_storeStrong((id *)&self->_remoteContentLinks, 0);
}

@end