@interface MPSeekCommandEvent
- (MPSeekCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5;
- (MPSeekCommandEventType)type;
- (unsigned)mediaRemoteCommandType;
@end

@implementation MPSeekCommandEvent

- (MPSeekCommandEventType)type
{
  return self->_type;
}

- (unsigned)mediaRemoteCommandType
{
  return self->_commandType;
}

- (MPSeekCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)MPSeekCommandEvent;
  result = [(MPRemoteCommandEvent *)&v7 initWithCommand:a3 mediaRemoteType:*(void *)&a4 options:a5];
  if (result)
  {
    result->_commandType = a4;
    result->_type = (a4 & 0xFFFFFFFD) != 8;
  }
  return result;
}

@end