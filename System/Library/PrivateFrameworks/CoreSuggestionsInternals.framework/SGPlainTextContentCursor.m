@interface SGPlainTextContentCursor
- (BOOL)backward;
- (BOOL)backwardToString:(id)a3 consume:(BOOL)a4;
- (BOOL)forward;
- (BOOL)forwardToString:(id)a3 consume:(BOOL)a4;
- (SGPlainTextContentCursor)initWithMailMessage:(id)a3;
- (unint64_t)pos;
- (void)backwardWhile:(id)a3;
- (void)dealloc;
- (void)forwardWhile:(id)a3;
- (void)seekToEnd;
- (void)seekToStart;
- (void)setPos:(unint64_t)a3;
@end

@implementation SGPlainTextContentCursor

- (void).cxx_destruct
{
}

- (void)setPos:(unint64_t)a3
{
  self->_pos = a3;
}

- (unint64_t)pos
{
  return self->_pos;
}

- (void)seekToEnd
{
  unint64_t len = self->_len;
  BOOL v3 = len != 0;
  unint64_t v4 = len - 1;
  if (!v3) {
    unint64_t v4 = 0;
  }
  self->_pos = v4;
}

- (void)seekToStart
{
  self->_pos = 0;
}

- (BOOL)backwardToString:(id)a3 consume:(BOOL)a4
{
  if (!a3) {
    return 0;
  }
  BOOL v4 = a4;
  v10.location = 0;
  v10.CFIndex length = 0;
  v11.CFIndex length = self->_pos;
  v11.location = 0;
  int v7 = CFStringFindWithOptions(self->_str, (CFStringRef)a3, v11, 4uLL, &v10);
  BOOL result = v7 != 0;
  if (v7)
  {
    CFIndex length = v10.length;
    if (v4) {
      CFIndex length = 0;
    }
    self->_pos = length + v10.location;
  }
  return result;
}

- (BOOL)forwardToString:(id)a3 consume:(BOOL)a4
{
  if (!a3) {
    return 0;
  }
  BOOL v4 = a4;
  v10.location = 0;
  v10.CFIndex length = 0;
  v11.CFIndex length = self->_len - self->_pos;
  v11.location = self->_pos;
  int v7 = CFStringFindWithOptions(self->_str, (CFStringRef)a3, v11, 0, &v10);
  BOOL result = v7 != 0;
  if (v7)
  {
    CFIndex length = v10.length;
    if (!v4) {
      CFIndex length = 0;
    }
    self->_pos = length + v10.location;
  }
  return result;
}

- (void)backwardWhile:(id)a3
{
  id v18 = a3;
  if (!v18)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SGPlainTextContentCursor.m", 74, @"Invalid parameter not satisfying: %@", @"predicate" object file lineNumber description];
  }
  int64_t pos = self->_pos;
  if (pos)
  {
    do
    {
      quoted = self->_quoted;
      id v7 = v18;
      v8 = quoted;
      if (pos < 0 || (int64_t length = self->_ib.rangeToBuffer.length, length <= pos))
      {
        unsigned __int16 v11 = 0;
      }
      else
      {
        directUniCharBuffer = self->_ib.directUniCharBuffer;
        if (directUniCharBuffer)
        {
          unsigned __int16 v11 = directUniCharBuffer[self->_ib.rangeToBuffer.location + pos];
        }
        else
        {
          directCStringBuffer = self->_ib.directCStringBuffer;
          if (directCStringBuffer)
          {
            unsigned __int16 v11 = directCStringBuffer[self->_ib.rangeToBuffer.location + pos];
          }
          else
          {
            if (self->_ib.bufferedRangeEnd <= pos
              || (int64_t bufferedRangeStart = self->_ib.bufferedRangeStart, bufferedRangeStart > pos))
            {
              int64_t v16 = pos - 4;
              if ((unint64_t)pos < 4) {
                int64_t v16 = 0;
              }
              if (v16 + 64 < length) {
                int64_t length = v16 + 64;
              }
              self->_ib.int64_t bufferedRangeStart = v16;
              self->_ib.bufferedRangeEnd = length;
              v20.location = self->_ib.rangeToBuffer.location + v16;
              v20.int64_t length = length - v16;
              CFStringGetCharacters(self->_ib.theString, v20, self->_ib.buffer);
              int64_t bufferedRangeStart = self->_ib.bufferedRangeStart;
            }
            unsigned __int16 v11 = self->_ib.buffer[pos - bufferedRangeStart];
          }
        }
      }
      int v12 = (*((uint64_t (**)(id, void, BOOL))v18 + 2))(v7, v11, [(NSIndexSet *)v8 containsIndex:pos]);

      if (!v12) {
        break;
      }
      unint64_t v13 = self->_pos;
      int64_t pos = v13 - 1;
      self->_int64_t pos = v13 - 1;
    }
    while (v13 != 1);
  }
}

- (void)forwardWhile:(id)a3
{
  id v17 = a3;
  if (!v17)
  {
    int64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SGPlainTextContentCursor.m", 68, @"Invalid parameter not satisfying: %@", @"predicate" object file lineNumber description];
  }
  for (i = self->_pos; i < self->_len; self->_int64_t pos = i)
  {
    quoted = self->_quoted;
    id v7 = v17;
    v8 = quoted;
    if (i < 0 || (int64_t length = self->_ib.rangeToBuffer.length, length <= i))
    {
      unsigned __int16 v11 = 0;
    }
    else
    {
      directUniCharBuffer = self->_ib.directUniCharBuffer;
      if (directUniCharBuffer)
      {
        unsigned __int16 v11 = directUniCharBuffer[self->_ib.rangeToBuffer.location + i];
      }
      else
      {
        directCStringBuffer = self->_ib.directCStringBuffer;
        if (directCStringBuffer)
        {
          unsigned __int16 v11 = directCStringBuffer[self->_ib.rangeToBuffer.location + i];
        }
        else
        {
          if (self->_ib.bufferedRangeEnd <= i
            || (int64_t bufferedRangeStart = self->_ib.bufferedRangeStart, bufferedRangeStart > i))
          {
            int64_t v15 = i - 4;
            if ((unint64_t)i < 4) {
              int64_t v15 = 0;
            }
            if (v15 + 64 < length) {
              int64_t length = v15 + 64;
            }
            self->_ib.int64_t bufferedRangeStart = v15;
            self->_ib.bufferedRangeEnd = length;
            v19.location = self->_ib.rangeToBuffer.location + v15;
            v19.int64_t length = length - v15;
            CFStringGetCharacters(self->_ib.theString, v19, self->_ib.buffer);
            int64_t bufferedRangeStart = self->_ib.bufferedRangeStart;
          }
          unsigned __int16 v11 = self->_ib.buffer[i - bufferedRangeStart];
        }
      }
    }
    int v12 = (*((uint64_t (**)(id, void, BOOL))v17 + 2))(v7, v11, [(NSIndexSet *)v8 containsIndex:i]);

    if (!v12) {
      break;
    }
    int64_t i = self->_pos + 1;
  }
}

- (BOOL)backward
{
  unint64_t pos = self->_pos;
  if (pos) {
    self->_unint64_t pos = pos - 1;
  }
  return pos != 0;
}

- (BOOL)forward
{
  unint64_t pos = self->_pos;
  unint64_t len = self->_len;
  if (pos < len) {
    self->_unint64_t pos = pos + 1;
  }
  return pos < len;
}

- (void)dealloc
{
  str = self->_str;
  if (str) {
    CFRelease(str);
  }
  v4.receiver = self;
  v4.super_class = (Class)SGPlainTextContentCursor;
  [(SGPlainTextContentCursor *)&v4 dealloc];
}

- (SGPlainTextContentCursor)initWithMailMessage:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SGPlainTextContentCursor.m", 27, @"Invalid parameter not satisfying: %@", @"message" object file lineNumber description];
  }
  v6 = [v5 textContent];

  if (!v6)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SGPlainTextContentCursor.m", 28, @"Invalid parameter not satisfying: %@", @"message.textContent" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)SGPlainTextContentCursor;
  id v7 = [(SGPlainTextContentCursor *)&v19 init];
  v8 = v7;
  if (v7)
  {
    v7->_unint64_t pos = 0;
    uint64_t v9 = [v5 quotedRegions];
    quoted = v8->_quoted;
    v8->_quoted = (NSIndexSet *)v9;

    CFStringRef v11 = [v5 textContent];
    v8->_CFStringRef str = (__CFString *)v11;
    CFIndex Length = CFStringGetLength(v11);
    v8->_unint64_t len = Length;
    CFStringRef str = v8->_str;
    v8->_ib.theString = (__CFString *)str;
    v8->_ib.rangeToBuffer.location = 0;
    v8->_ib.rangeToBuffer.int64_t length = Length;
    CharactersPtr = CFStringGetCharactersPtr(str);
    CStringPtr = 0;
    v8->_ib.directUniCharBuffer = (unsigned __int16 *)CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr(str, 0x600u);
    }
    v8->_ib.directCStringBuffer = (char *)CStringPtr;
    v8->_ib.int64_t bufferedRangeStart = 0;
    v8->_ib.bufferedRangeEnd = 0;
  }

  return v8;
}

@end