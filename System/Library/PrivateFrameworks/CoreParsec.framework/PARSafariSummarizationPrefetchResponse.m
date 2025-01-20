@interface PARSafariSummarizationPrefetchResponse
+ (id)responseFromReply:(id)a3;
- (NSArray)hashBucketDetails;
- (PARSafariSummarizationPrefetchResponse)initWithReply:(id)a3 factory:(id)a4 data:(id)a5;
- (void)setHashBucketDetails:(id)a3;
@end

@implementation PARSafariSummarizationPrefetchResponse

- (PARSafariSummarizationPrefetchResponse)initWithReply:(id)a3 factory:(id)a4 data:(id)a5
{
  return (PARSafariSummarizationPrefetchResponse *)sub_19C800660((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, a5, (uint64_t (*)(id, uint64_t, uint64_t, uint64_t))PARSafariSummarizationPrefetchResponse.init(reply:factory:data:));
}

- (void).cxx_destruct
{
}

- (void)setHashBucketDetails:(id)a3
{
}

- (NSArray)hashBucketDetails
{
  return self->_hashBucketDetails;
}

+ (id)responseFromReply:(id)a3
{
  id v3 = a3;
  v4 = [PARSafariSummarizationPrefetchResponse alloc];
  v5 = objc_alloc_init(PARDefaultFactory);
  v6 = [v3 data];
  v7 = [(PARSafariSummarizationPrefetchResponse *)v4 initWithReply:v3 factory:v5 data:v6];

  return v7;
}

@end