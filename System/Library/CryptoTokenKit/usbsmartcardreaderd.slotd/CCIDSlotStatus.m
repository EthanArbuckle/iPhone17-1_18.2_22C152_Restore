@interface CCIDSlotStatus
- (char)statusPtr;
- (unsigned)bmCommandStatus;
- (unsigned)bmICCStatus;
- (unsigned)bmRFU;
- (unsigned)status;
- (void)setStatus:(unsigned __int8)a3;
@end

@implementation CCIDSlotStatus

- (char)statusPtr
{
  return (char *)&self->_status;
}

- (unsigned)bmICCStatus
{
  return [(CCIDSlotStatus *)self status] & 3;
}

- (unsigned)bmRFU
{
  return [(CCIDSlotStatus *)self status] & 0x3C;
}

- (unsigned)bmCommandStatus
{
  return [(CCIDSlotStatus *)self status] & 0xC0;
}

- (unsigned)status
{
  return self->_status;
}

- (void)setStatus:(unsigned __int8)a3
{
  self->_status = a3;
}

@end