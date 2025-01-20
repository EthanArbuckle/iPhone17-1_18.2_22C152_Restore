@interface DOMMatchJob
- (NSString)name;
- (__CFMessagePort)kickMe;
- (int)jobType;
- (int)msgID;
- (void)dealloc;
- (void)kick;
- (void)setJobType:(int)a3;
- (void)setKickMe:(__CFMessagePort *)a3;
- (void)setMsgID:(int)a3;
- (void)setName:(id)a3;
@end

@implementation DOMMatchJob

- (void)kick
{
  v3 = [(DOMMatchJob *)self kickMe];
  SInt32 v4 = [(DOMMatchJob *)self msgID];
  [(DOMMatchJob *)self setMsgID:(v4 + 1)];
  SInt32 v5 = CFMessagePortSendRequest(v3, v4, 0, 0.0, 0.0, 0, 0);
  if (v5)
  {
    SInt32 v6 = v5;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Problem kicking job: %d", (uint8_t *)v7, 8u);
    }
  }
}

- (void)dealloc
{
  kickMe = self->_kickMe;
  if (kickMe) {
    CFRelease(kickMe);
  }
  v4.receiver = self;
  v4.super_class = (Class)DOMMatchJob;
  [(DOMMatchJob *)&v4 dealloc];
}

- (int)msgID
{
  return self->_msgID;
}

- (void)setMsgID:(int)a3
{
  self->_msgID = a3;
}

- (int)jobType
{
  return self->_jobType;
}

- (void)setJobType:(int)a3
{
  self->_jobType = a3;
}

- (__CFMessagePort)kickMe
{
  return self->_kickMe;
}

- (void)setKickMe:(__CFMessagePort *)a3
{
  self->_kickMe = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end