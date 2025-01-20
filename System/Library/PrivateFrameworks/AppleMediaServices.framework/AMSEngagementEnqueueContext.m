@interface AMSEngagementEnqueueContext
- (AMSEngagementEnqueueContext)init;
- (AMSEngagementEnqueueRequest)request;
- (NSDate)start;
- (unint64_t)signpostID;
- (void)setRequest:(id)a3;
- (void)setSignpostID:(unint64_t)a3;
- (void)setStart:(id)a3;
@end

@implementation AMSEngagementEnqueueContext

- (AMSEngagementEnqueueRequest)request
{
  return self->_request;
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (AMSEngagementEnqueueContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)AMSEngagementEnqueueContext;
  v2 = [(AMSEngagementEnqueueContext *)&v5 init];
  v3 = v2;
  if (v2) {
    [(AMSEngagementEnqueueContext *)v2 setSignpostID:0];
  }
  return v3;
}

- (void)setSignpostID:(unint64_t)a3
{
  self->_signpostID = a3;
}

- (NSDate)start
{
  return self->_start;
}

- (void)setStart:(id)a3
{
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_start, 0);
}

@end