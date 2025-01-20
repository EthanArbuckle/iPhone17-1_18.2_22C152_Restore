@interface CCDonateRequestQueueNode
- (CCDonateRequest)request;
- (CCDonateRequestQueueNode)next;
- (void)setNext:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation CCDonateRequestQueueNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_next, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (CCDonateRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (CCDonateRequestQueueNode)next
{
  return self->_next;
}

- (void)setNext:(id)a3
{
}

@end