@interface IMDMessagePTask
- (BOOL)needsProccesingFor:(unint64_t)a3;
- (IMDMessagePTask)initWithGUID:(id)a3;
- (IMDMessagePTask)initWithStoreDictionary:(id)a3;
- (NSString)guid;
- (unint64_t)taskFlags;
- (void)compeletedTask:(unint64_t)a3;
- (void)dealloc;
- (void)setTaskFlag:(unint64_t)a3;
@end

@implementation IMDMessagePTask

- (IMDMessagePTask)initWithGUID:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IMDMessagePTask;
  v4 = [(IMDMessagePTask *)&v6 init];
  if (v4)
  {
    v4->_guid = (NSString *)a3;
    v4->_taskFlags = 0;
  }
  return v4;
}

- (IMDMessagePTask)initWithStoreDictionary:(id)a3
{
  v4 = -[IMDMessagePTask initWithGUID:](self, "initWithGUID:", [a3 objectForKeyedSubscript:@"guid"]);
  if (v4) {
    v4->_taskFlags = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"task_flags"), "integerValue");
  }
  return v4;
}

- (void)dealloc
{
  self->_guid = 0;
  v3.receiver = self;
  v3.super_class = (Class)IMDMessagePTask;
  [(IMDMessagePTask *)&v3 dealloc];
}

- (void)setTaskFlag:(unint64_t)a3
{
  self->_taskFlags |= a3;
}

- (BOOL)needsProccesingFor:(unint64_t)a3
{
  return (self->_taskFlags & a3) != 0;
}

- (void)compeletedTask:(unint64_t)a3
{
  self->_taskFlags &= ~a3;
}

- (NSString)guid
{
  return self->_guid;
}

- (unint64_t)taskFlags
{
  return self->_taskFlags;
}

@end