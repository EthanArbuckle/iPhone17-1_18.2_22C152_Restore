@interface WKEditCommand
- (WKEditCommand)initWithWebEditCommandProxy:(void *)a3;
- (id).cxx_construct;
- (void)command;
@end

@implementation WKEditCommand

- (WKEditCommand)initWithWebEditCommandProxy:(void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WKEditCommand;
  v4 = [(WKEditCommand *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v6 = *(WebEditCommandProxy **)a3;
    *(void *)a3 = 0;
    m_ptr = v4->_command.m_ptr;
    v4->_command.m_ptr = v6;
    if (m_ptr) {
      CFRelease(*((CFTypeRef *)m_ptr + 1));
    }
  }
  return v5;
}

- (void)command
{
  return self->_command.m_ptr;
}

- (void).cxx_destruct
{
  m_ptr = self->_command.m_ptr;
  self->_command.m_ptr = 0;
  if (m_ptr) {
    CFRelease(*((CFTypeRef *)m_ptr + 1));
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end