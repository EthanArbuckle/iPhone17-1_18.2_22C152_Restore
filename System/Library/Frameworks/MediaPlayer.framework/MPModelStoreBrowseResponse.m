@interface MPModelStoreBrowseResponse
- (BOOL)hasAdditionalContentItems;
- (MPChangeDetails)changeDetails;
- (MPModelStoreBrowseResponseParser)parser;
- (void)setChangeDetails:(id)a3;
- (void)setParser:(id)a3;
@end

@implementation MPModelStoreBrowseResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parser, 0);

  objc_storeStrong((id *)&self->_changeDetails, 0);
}

- (void)setParser:(id)a3
{
}

- (MPModelStoreBrowseResponseParser)parser
{
  return self->_parser;
}

- (void)setChangeDetails:(id)a3
{
}

- (MPChangeDetails)changeDetails
{
  return self->_changeDetails;
}

- (BOOL)hasAdditionalContentItems
{
  v2 = [(MPModelStoreBrowseResponseParser *)self->_parser allAdditionalContentIdentifiersNeedingLookup];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

@end