@interface HSPlaybackControlRequest
- (HSPlaybackControlRequest)initWithInterfaceID:(unsigned int)a3 controlCommand:(int64_t)a4;
- (int64_t)controlCommand;
- (unsigned)interfaceID;
@end

@implementation HSPlaybackControlRequest

- (unsigned)interfaceID
{
  return self->_interfaceID;
}

- (int64_t)controlCommand
{
  return self->_controlCommand;
}

- (HSPlaybackControlRequest)initWithInterfaceID:(unsigned int)a3 controlCommand:(int64_t)a4
{
  if ((unint64_t)a4 > 0x14) {
    v7 = &unk_215346CBE;
  }
  else {
    v7 = *(&off_26423A198 + a4);
  }
  v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s/%u/%s", "ctrl-int", *(void *)&a3, v7);
  v11.receiver = self;
  v11.super_class = (Class)HSPlaybackControlRequest;
  v9 = [(HSRequest *)&v11 initWithAction:v8];

  if (v9)
  {
    v9->_interfaceID = a3;
    v9->_controlCommand = a4;
  }
  return v9;
}

@end