@interface HMFMutableHTTPResponse
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBody:(id)a3;
- (void)setHeaderValue:(id)a3 forHeaderKey:(id)a4;
@end

@implementation HMFMutableHTTPResponse

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HMFHTTPResponse allocWithZone:a3];
  v5 = [(HMFHTTPResponse *)self request];
  v6 = [(HMFHTTPResponse *)self internal];
  v7 = (void *)[v6 copy];
  v8 = [(HMFHTTPResponse *)v4 initWithRequest:v5 internalResponse:v7];

  return v8;
}

- (void)setBody:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFHTTPResponse *)self internal];
  [v5 setBody:v4];
}

- (void)setHeaderValue:(id)a3 forHeaderKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMFHTTPResponse *)self internal];
  [v8 setHeaderValue:v7 forHeaderKey:v6];
}

@end