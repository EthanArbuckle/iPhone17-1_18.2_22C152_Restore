@interface _AKScheduledRequest
+ (id)scheduledRequestWithCalculation:(id)a3 forRequest:(id)a4 info:(id)a5;
- (AKDispatchableRequest)request;
- (AKDispatchingCalculation)calculation;
- (NSDictionary)info;
- (void)setCalculation:(id)a3;
- (void)setInfo:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation _AKScheduledRequest

+ (id)scheduledRequestWithCalculation:(id)a3 forRequest:(id)a4 info:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (id *)objc_alloc_init((Class)a1);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong(v12 + 1, a3);
    objc_storeStrong(v13 + 2, a4);
    objc_storeStrong(v13 + 3, a5);
  }

  return v13;
}

- (AKDispatchingCalculation)calculation
{
  return self->_calculation;
}

- (void)setCalculation:(id)a3
{
}

- (AKDispatchableRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NSDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong((id *)&self->_calculation, 0);
}

@end