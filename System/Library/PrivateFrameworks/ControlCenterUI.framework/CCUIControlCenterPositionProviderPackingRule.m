@interface CCUIControlCenterPositionProviderPackingRule
- (CCUIControlCenterPositionProviderPackingRule)initWithPackFrom:(unint64_t)a3 packingOrder:(unint64_t)a4 sizeLimit:(CCUILayoutSize)a5;
- (CCUILayoutSize)sizeLimit;
- (unint64_t)packFrom;
- (unint64_t)packingOrder;
@end

@implementation CCUIControlCenterPositionProviderPackingRule

- (CCUIControlCenterPositionProviderPackingRule)initWithPackFrom:(unint64_t)a3 packingOrder:(unint64_t)a4 sizeLimit:(CCUILayoutSize)a5
{
  unint64_t height = a5.height;
  unint64_t width = a5.width;
  v10.receiver = self;
  v10.super_class = (Class)CCUIControlCenterPositionProviderPackingRule;
  result = [(CCUIControlCenterPositionProviderPackingRule *)&v10 init];
  if (result)
  {
    result->_packFrom = a3;
    result->_packingOrder = a4;
    result->_sizeLimit.unint64_t width = width;
    result->_sizeLimit.unint64_t height = height;
  }
  return result;
}

- (unint64_t)packFrom
{
  return self->_packFrom;
}

- (unint64_t)packingOrder
{
  return self->_packingOrder;
}

- (CCUILayoutSize)sizeLimit
{
  unint64_t height = self->_sizeLimit.height;
  unint64_t width = self->_sizeLimit.width;
  result.unint64_t height = height;
  result.unint64_t width = width;
  return result;
}

@end