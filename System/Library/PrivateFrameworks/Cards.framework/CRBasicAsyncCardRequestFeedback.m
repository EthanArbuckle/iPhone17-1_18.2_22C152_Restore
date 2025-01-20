@interface CRBasicAsyncCardRequestFeedback
- (CRCard)baseCard;
- (CRCard)requestedCard;
- (void)setBaseCard:(id)a3;
- (void)setRequestedCard:(id)a3;
@end

@implementation CRBasicAsyncCardRequestFeedback

- (CRCard)baseCard
{
  return self->baseCard;
}

- (void)setBaseCard:(id)a3
{
}

- (CRCard)requestedCard
{
  return self->requestedCard;
}

- (void)setRequestedCard:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->requestedCard, 0);
  objc_storeStrong((id *)&self->baseCard, 0);
}

@end