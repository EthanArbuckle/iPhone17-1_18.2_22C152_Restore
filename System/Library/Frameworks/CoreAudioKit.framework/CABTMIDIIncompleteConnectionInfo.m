@interface CABTMIDIIncompleteConnectionInfo
- (AMSBTLEPeripheral)peripheral;
- (BOOL)isConnecting;
- (CABTMIDIIncompleteConnectionInfo)initWithPeripheral:(id)a3 isConnecting:(BOOL)a4;
- (unint64_t)timeOutInterval;
- (void)dealloc;
- (void)setConnecting:(BOOL)a3;
- (void)setPeripheral:(id)a3;
- (void)setTimeOutInterval:(unint64_t)a3;
@end

@implementation CABTMIDIIncompleteConnectionInfo

- (CABTMIDIIncompleteConnectionInfo)initWithPeripheral:(id)a3 isConnecting:(BOOL)a4
{
  BOOL v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)CABTMIDIIncompleteConnectionInfo;
  v6 = [(CABTMIDIIncompleteConnectionInfo *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(CABTMIDIIncompleteConnectionInfo *)v6 setConnecting:v4];
    [(CABTMIDIIncompleteConnectionInfo *)v7 setPeripheral:a3];
    [(CABTMIDIIncompleteConnectionInfo *)v7 setTimeOutInterval:10];
    [a3 setChangingState:1];
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CABTMIDIIncompleteConnectionInfo;
  [(CABTMIDIIncompleteConnectionInfo *)&v3 dealloc];
}

- (void)setPeripheral:(id)a3
{
  id v5 = a3;
  peripheral = self->_peripheral;
  if (peripheral) {

  }
  self->_peripheral = (AMSBTLEPeripheral *)a3;
}

- (BOOL)isConnecting
{
  return self->_connecting;
}

- (void)setConnecting:(BOOL)a3
{
  self->_connecting = a3;
}

- (unint64_t)timeOutInterval
{
  return self->_timeOutInterval;
}

- (void)setTimeOutInterval:(unint64_t)a3
{
  self->_timeOutInterval = a3;
}

- (AMSBTLEPeripheral)peripheral
{
  return self->_peripheral;
}

@end