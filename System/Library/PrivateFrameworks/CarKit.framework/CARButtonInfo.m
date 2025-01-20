@interface CARButtonInfo
- (CARButtonInfo)initWithButtonType:(unint64_t)a3 buttonLocation:(unint64_t)a4 buttonPressDuration:(unint64_t)a5;
- (unint64_t)buttonLocation;
- (unint64_t)buttonPressDuration;
- (unint64_t)buttonType;
@end

@implementation CARButtonInfo

- (CARButtonInfo)initWithButtonType:(unint64_t)a3 buttonLocation:(unint64_t)a4 buttonPressDuration:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CARButtonInfo;
  result = [(CARButtonInfo *)&v9 init];
  if (result)
  {
    result->_buttonType = a3;
    result->_buttonLocation = a4;
    result->_buttonPressDuration = a5;
  }
  return result;
}

- (unint64_t)buttonType
{
  return self->_buttonType;
}

- (unint64_t)buttonLocation
{
  return self->_buttonLocation;
}

- (unint64_t)buttonPressDuration
{
  return self->_buttonPressDuration;
}

@end