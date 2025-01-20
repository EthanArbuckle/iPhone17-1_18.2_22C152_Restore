@interface SSHBHIDSSHBTurtleInputPacket
- (float)mesaTemperatureProcessed;
- (id)description;
- (id)descriptionDictionary;
- (int)gapValue;
- (signed)forceValue;
- (signed)mesaTemperature;
- (unint64_t)timestamp;
- (unsigned)capValue;
- (unsigned)cookie;
- (unsigned)cookie_type;
- (unsigned)frameNumber;
- (unsigned)mesaFd;
- (unsigned)mesaFdStuck;
- (unsigned)reportID;
- (void)setCapValue:(unsigned __int16)a3;
- (void)setCookie:(unsigned __int16)a3;
- (void)setCookie_type:(unsigned __int8)a3;
- (void)setForceValue:(signed __int16)a3;
- (void)setFrameNumber:(unsigned __int8)a3;
- (void)setGapValue:(int)a3;
- (void)setMesaFd:(unsigned __int8)a3;
- (void)setMesaFdStuck:(unsigned __int8)a3;
- (void)setMesaTemperature:(signed __int16)a3;
- (void)setMesaTemperatureProcessed:(float)a3;
- (void)setReportID:(unsigned __int8)a3;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation SSHBHIDSSHBTurtleInputPacket

- (id)description
{
  v3 = +[NSMutableString string];
  v4 = [(SSHBHIDSSHBTurtleInputPacket *)self descriptionDictionary];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v10 = [v4 objectForKeyedSubscript:v9];
        [v3 appendFormat:@"%@=%@\n", v9, v10];
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  [v3 deleteCharactersInRange:([v3 length] - 1, 1)];

  return v3;
}

- (id)descriptionDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = +[NSNumber numberWithUnsignedChar:[(SSHBHIDSSHBTurtleInputPacket *)self reportID]];
  [v3 setObject:v4 forKeyedSubscript:@"reportID"];

  id v5 = +[NSNumber numberWithUnsignedChar:[(SSHBHIDSSHBTurtleInputPacket *)self frameNumber]];
  [v3 setObject:v5 forKeyedSubscript:@"frameNumber"];

  id v6 = +[NSNumber numberWithUnsignedLongLong:[(SSHBHIDSSHBTurtleInputPacket *)self timestamp]];
  [v3 setObject:v6 forKeyedSubscript:@"timestamp"];

  uint64_t v7 = +[NSNumber numberWithUnsignedChar:[(SSHBHIDSSHBTurtleInputPacket *)self cookie_type]];
  [v3 setObject:v7 forKeyedSubscript:@"cookie_type"];

  v8 = +[NSNumber numberWithUnsignedShort:[(SSHBHIDSSHBTurtleInputPacket *)self cookie]];
  [v3 setObject:v8 forKeyedSubscript:@"cookie"];

  uint64_t v9 = self;
  v10 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v9 capValue]);
  [v3 setObject:v10 forKeyedSubscript:@"capValue"];

  v11 = +[NSNumber numberWithInt:[(SSHBHIDSSHBTurtleInputPacket *)self gapValue]];
  [v3 setObject:v11 forKeyedSubscript:@"gapValue"];

  long long v12 = +[NSNumber numberWithShort:[(SSHBHIDSSHBTurtleInputPacket *)self forceValue]];
  [v3 setObject:v12 forKeyedSubscript:@"forceValue"];

  long long v13 = +[NSNumber numberWithShort:[(SSHBHIDSSHBTurtleInputPacket *)self mesaTemperature]];
  [v3 setObject:v13 forKeyedSubscript:@"mesaTemperature"];

  long long v14 = +[NSNumber numberWithUnsignedChar:[(SSHBHIDSSHBTurtleInputPacket *)self mesaFd]];
  [v3 setObject:v14 forKeyedSubscript:@"mesaFd"];

  long long v15 = +[NSNumber numberWithUnsignedChar:[(SSHBHIDSSHBTurtleInputPacket *)self mesaFdStuck]];
  [v3 setObject:v15 forKeyedSubscript:@"mesaFdStuck"];

  [(SSHBHIDSSHBTurtleInputPacket *)self mesaTemperatureProcessed];
  v16 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [v3 setObject:v16 forKeyedSubscript:@"mesaTemperatureProcessed"];

  return v3;
}

- (unsigned)capValue
{
  return self->_capValue;
}

- (void)setCapValue:(unsigned __int16)a3
{
  self->_capValue = a3;
}

- (int)gapValue
{
  return self->_gapValue;
}

- (void)setGapValue:(int)a3
{
  self->_gapValue = a3;
}

- (signed)forceValue
{
  return self->_forceValue;
}

- (void)setForceValue:(signed __int16)a3
{
  self->_forceValue = a3;
}

- (unsigned)reportID
{
  return self->_reportID;
}

- (void)setReportID:(unsigned __int8)a3
{
  self->_reportID = a3;
}

- (unsigned)frameNumber
{
  return self->_frameNumber;
}

- (void)setFrameNumber:(unsigned __int8)a3
{
  self->_frameNumber = a3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (unsigned)cookie_type
{
  return self->_cookie_type;
}

- (void)setCookie_type:(unsigned __int8)a3
{
  self->_cookie_type = a3;
}

- (unsigned)cookie
{
  return self->_cookie;
}

- (void)setCookie:(unsigned __int16)a3
{
  self->_cookie = a3;
}

- (signed)mesaTemperature
{
  return self->_mesaTemperature;
}

- (void)setMesaTemperature:(signed __int16)a3
{
  self->_mesaTemperature = a3;
}

- (unsigned)mesaFd
{
  return self->_mesaFd;
}

- (void)setMesaFd:(unsigned __int8)a3
{
  self->_mesaFd = a3;
}

- (unsigned)mesaFdStuck
{
  return self->_mesaFdStuck;
}

- (void)setMesaFdStuck:(unsigned __int8)a3
{
  self->_mesaFdStuck = a3;
}

- (float)mesaTemperatureProcessed
{
  return self->_mesaTemperatureProcessed;
}

- (void)setMesaTemperatureProcessed:(float)a3
{
  self->_mesaTemperatureProcessed = a3;
}

@end