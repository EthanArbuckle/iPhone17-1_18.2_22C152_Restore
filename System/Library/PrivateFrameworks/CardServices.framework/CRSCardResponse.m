@interface CRSCardResponse
- (CRCard)card;
- (CRSCardRequest)request;
- (void)setCard:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation CRSCardResponse

- (CRSCardRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (CRCard)card
{
  return self->_card;
}

- (void)setCard:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_card, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end