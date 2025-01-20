@interface TKSmartCardSlotScreen
- (BOOL)displayMessage:(id)a3 x:(int64_t)a4 y:(int64_t)a5 duration:(double)a6 clearScreen:(BOOL)a7;
- (int64_t)physicalColumnCount;
- (int64_t)physicalRowCount;
- (int64_t)virtualColumnCount;
- (int64_t)virtualRowCount;
- (void)setPhysicalColumnCount:(int64_t)a3;
- (void)setPhysicalRowCount:(int64_t)a3;
- (void)setVirtualColumnCount:(int64_t)a3;
- (void)setVirtualRowCount:(int64_t)a3;
@end

@implementation TKSmartCardSlotScreen

- (BOOL)displayMessage:(id)a3 x:(int64_t)a4 y:(int64_t)a5 duration:(double)a6 clearScreen:(BOOL)a7
{
  return 0;
}

- (int64_t)physicalColumnCount
{
  return self->_physicalColumnCount;
}

- (void)setPhysicalColumnCount:(int64_t)a3
{
  self->_physicalColumnCount = a3;
}

- (int64_t)physicalRowCount
{
  return self->_physicalRowCount;
}

- (void)setPhysicalRowCount:(int64_t)a3
{
  self->_physicalRowCount = a3;
}

- (int64_t)virtualColumnCount
{
  return self->_virtualColumnCount;
}

- (void)setVirtualColumnCount:(int64_t)a3
{
  self->_virtualColumnCount = a3;
}

- (int64_t)virtualRowCount
{
  return self->_virtualRowCount;
}

- (void)setVirtualRowCount:(int64_t)a3
{
  self->_virtualRowCount = a3;
}

@end