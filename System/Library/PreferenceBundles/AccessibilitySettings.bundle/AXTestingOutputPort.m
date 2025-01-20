@interface AXTestingOutputPort
- (NSArray)ttsChannels;
- (NSString)UID;
- (NSString)portName;
- (NSString)portType;
- (void)setPortName:(id)a3;
- (void)setPortType:(id)a3;
- (void)setTtsChannels:(id)a3;
- (void)setUID:(id)a3;
@end

@implementation AXTestingOutputPort

- (NSString)portType
{
  return self->portType;
}

- (void)setPortType:(id)a3
{
}

- (NSString)portName
{
  return self->portName;
}

- (void)setPortName:(id)a3
{
}

- (NSString)UID
{
  return self->UID;
}

- (void)setUID:(id)a3
{
}

- (NSArray)ttsChannels
{
  return self->_ttsChannels;
}

- (void)setTtsChannels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ttsChannels, 0);
  objc_storeStrong((id *)&self->UID, 0);
  objc_storeStrong((id *)&self->portName, 0);

  objc_storeStrong((id *)&self->portType, 0);
}

@end