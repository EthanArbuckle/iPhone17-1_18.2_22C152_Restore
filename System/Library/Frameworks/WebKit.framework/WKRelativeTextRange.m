@interface WKRelativeTextRange
- (BOOL)isEmpty;
- (WKRelativeTextPosition)end;
- (WKRelativeTextPosition)start;
- (WKRelativeTextRange)initWithStart:(id)a3 end:(id)a4;
- (id).cxx_construct;
- (id)description;
@end

@implementation WKRelativeTextRange

- (WKRelativeTextRange)initWithStart:(id)a3 end:(id)a4
{
  v21.receiver = self;
  v21.super_class = (Class)WKRelativeTextRange;
  v6 = [(WKRelativeTextRange *)&v21 init];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = a3;
    }
    else {
      id v7 = 0;
    }
    if ([v7 anchors])
    {
      unsigned __int8 v8 = [v7 anchors];
      uint64_t v9 = 0;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v9 = 0;
      unsigned __int8 v8 = 0;
      if (a3 && (isKindOfClass & 1) != 0)
      {
        unsigned __int8 v8 = [a3 anchors];
        uint64_t v9 = [a3 offset];
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v11 = a4;
    }
    else {
      id v11 = 0;
    }
    if ([v11 anchors])
    {
      unsigned __int8 v12 = [v11 anchors];
      uint64_t v13 = 0;
    }
    else
    {
      objc_opt_class();
      char v14 = objc_opt_isKindOfClass();
      if (!a4 || (v14 & 1) == 0) {
        return v6;
      }
      unsigned __int8 v12 = [a4 anchors];
      uint64_t v13 = [a4 offset];
    }
    if (v8) {
      BOOL v15 = v12 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (!v15)
    {
      v16 = [[WKRelativeTextPosition alloc] initWithAnchors:v8 offset:v9];
      m_ptr = v6->_start.m_ptr;
      v6->_start.m_ptr = v16;
      if (m_ptr) {
        CFRelease(m_ptr);
      }
      v18 = [[WKRelativeTextPosition alloc] initWithAnchors:v12 offset:v13];
      v19 = v6->_end.m_ptr;
      v6->_end.m_ptr = v18;
      if (v19) {
        CFRelease(v19);
      }
    }
  }
  return v6;
}

- (WKRelativeTextPosition)start
{
  return (WKRelativeTextPosition *)self->_start.m_ptr;
}

- (WKRelativeTextPosition)end
{
  return (WKRelativeTextPosition *)self->_end.m_ptr;
}

- (BOOL)isEmpty
{
  int v3 = [self->_start.m_ptr anchors];
  if (v3 != [self->_end.m_ptr anchors]) {
    return 0;
  }
  uint64_t v4 = [self->_start.m_ptr offset];
  return v4 == [self->_end.m_ptr offset];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"WKRelativeTextRange(start=%@, end=%@)", self->_start.m_ptr, self->_end.m_ptr];
}

- (void).cxx_destruct
{
  m_ptr = self->_end.m_ptr;
  self->_end.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  uint64_t v4 = self->_start.m_ptr;
  self->_start.m_ptr = 0;
  if (v4)
  {
    CFRelease(v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end