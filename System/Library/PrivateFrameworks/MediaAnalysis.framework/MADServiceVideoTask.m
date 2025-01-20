@interface MADServiceVideoTask
+ (id)taskForRequest:(id)a3;
- (MADServiceVideoTask)initWithRequest:(id)a3;
- (MADVideoRequest)request;
- (id)finalize;
@end

@implementation MADServiceVideoTask

+ (id)taskForRequest:(id)a3
{
  return 0;
}

- (MADServiceVideoTask)initWithRequest:(id)a3
{
  return 0;
}

- (id)finalize
{
  return 0;
}

- (MADVideoRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
}

@end