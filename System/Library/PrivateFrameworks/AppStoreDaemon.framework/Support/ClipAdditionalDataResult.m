@interface ClipAdditionalDataResult
- (ClipAdditionalDataResult)initWithResult:(id)a3;
- (id)description;
@end

@implementation ClipAdditionalDataResult

- (ClipAdditionalDataResult)initWithResult:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ClipAdditionalDataResult;
  v5 = [(ClipAdditionalDataResult *)&v10 initWithResult:v4];
  if (v5)
  {
    v6 = [v4 object];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (ClipAdditionalData *)sub_10023B4A0([ClipAdditionalData alloc], v6);
      additionalData = v5->_additionalData;
      v5->_additionalData = v7;
    }
  }

  return v5;
}

- (id)description
{
  return [(ClipAdditionalData *)self->_additionalData description];
}

- (void).cxx_destruct
{
}

@end