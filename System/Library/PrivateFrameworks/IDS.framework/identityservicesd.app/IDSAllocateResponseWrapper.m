@interface IDSAllocateResponseWrapper
- (IDSAllocateResponseWrapper)initWithResponse:(id)a3 cleanupTime:(unint64_t)a4;
@end

@implementation IDSAllocateResponseWrapper

- (IDSAllocateResponseWrapper)initWithResponse:(id)a3 cleanupTime:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IDSAllocateResponseWrapper;
  v8 = [(IDSAllocateResponseWrapper *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_response, a3);
    v9->_cleanupTime = a4;
  }

  return v9;
}

- (void).cxx_destruct
{
}

@end