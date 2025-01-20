@interface HFAccessoryProfileGroupOptions
- (BOOL)byCategoryType;
- (BOOL)byClass;
- (BOOL)byManufacturer;
- (BOOL)byModel;
- (BOOL)byRoom;
- (void)setByCategoryType:(BOOL)a3;
- (void)setByClass:(BOOL)a3;
- (void)setByManufacturer:(BOOL)a3;
- (void)setByModel:(BOOL)a3;
- (void)setByRoom:(BOOL)a3;
@end

@implementation HFAccessoryProfileGroupOptions

- (BOOL)byCategoryType
{
  return self->_byCategoryType;
}

- (void)setByCategoryType:(BOOL)a3
{
  self->_byCategoryType = a3;
}

- (BOOL)byClass
{
  return self->_byClass;
}

- (void)setByClass:(BOOL)a3
{
  self->_byClass = a3;
}

- (BOOL)byManufacturer
{
  return self->_byManufacturer;
}

- (void)setByManufacturer:(BOOL)a3
{
  self->_byManufacturer = a3;
}

- (BOOL)byModel
{
  return self->_byModel;
}

- (void)setByModel:(BOOL)a3
{
  self->_byModel = a3;
}

- (BOOL)byRoom
{
  return self->_byRoom;
}

- (void)setByRoom:(BOOL)a3
{
  self->_byRoom = a3;
}

@end