@interface MFQuotedPrintableEncoder
+ (unint64_t)requiredSizeToEncodeHeaderBytes:(const char *)a3 length:(unint64_t)a4;
- (BOOL)forHeader;
- (BOOL)forTextPart;
- (int64_t)appendData:(id)a3;
- (void)done;
- (void)setForHeader:(BOOL)a3;
- (void)setForTextPart:(BOOL)a3;
@end

@implementation MFQuotedPrintableEncoder

- (int64_t)appendData:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v25 = v4;
  v5 = (unsigned char *)[v4 bytes];
  int64_t v6 = [v4 length];
  memset(__b, 170, sizeof(__b));
  if (v6 <= 0) {
    goto LABEL_53;
  }
  unint64_t v7 = 0;
  v8 = &v5[v6];
  do
  {
    self->_lastWasNewLine = 0;
    BOOL forTextPart = self->_forTextPart;
    if (self->_forTextPart && (unint64_t lastHorizontalWhitespace = self->_lastHorizontalWhitespace) != 0 && *v5 == 10)
    {
      v11 = &__b[v7];
      unsigned char *v11 = 61;
      v11[1] = kEncodeHexTable[lastHorizontalWhitespace >> 4];
      v7 += 3;
      v11[2] = kEncodeHexTable[lastHorizontalWhitespace & 0xF];
      self->_line += 3;
      self->_unint64_t lastHorizontalWhitespace = 0;
      --v5;
    }
    else if (self->_forHeader || (unint64_t v12 = self->_matchedFrom, kFromSpace[v12] != *v5))
    {
      if (self->_forTextPart && self->_lastHorizontalWhitespace)
      {
        __b[v7++] = self->_lastHorizontalWhitespace;
        ++self->_line;
        self->_unint64_t lastHorizontalWhitespace = 0;
      }
      size_t matchedFrom = self->_matchedFrom;
      if (matchedFrom)
      {
        memcpy(&__b[v7], "From ", matchedFrom);
        unint64_t v16 = self->_matchedFrom;
        v7 += v16;
        self->_line += v16;
        self->_size_t matchedFrom = 0;
      }
      id v4 = v25;
      int v17 = *v5;
      if (v17 != 61
        && (v17 - 127) >= 0xFFFFFFA2
        && (!self->_forHeader
         || (v17 - 40) > 0x37
         || ((1 << (v17 - 40)) & 0x80000001800003) == 0))
      {
        goto LABEL_34;
      }
      if (!self->_forTextPart) {
        goto LABEL_30;
      }
      if (v17 == 9)
      {
        self->_unint64_t lastHorizontalWhitespace = 9;
        unint64_t v19 = (self->_line & 0xFFFFFFFFFFFFFFF8) + 8;
        goto LABEL_37;
      }
      if (v17 == 32)
      {
        self->_unint64_t lastHorizontalWhitespace = 32;
        goto LABEL_38;
      }
      if (v17 != 10)
      {
LABEL_30:
        if (self->_forHeader && (v17 == 32 || v17 == 10))
        {
          LOBYTE(v17) = 95;
LABEL_34:
          __b[v7++] = v17;
          unint64_t v19 = self->_line + 1;
        }
        else
        {
          v20 = &__b[v7];
          unsigned char *v20 = 61;
          v20[1] = kEncodeHexTable[(unint64_t)*v5 >> 4];
          v7 += 3;
          v20[2] = kEncodeHexTable[*v5 & 0xF];
          unint64_t v19 = self->_line + 3;
        }
LABEL_37:
        self->_line = v19;
        goto LABEL_38;
      }
      v18 = &__b[v7];
      unsigned char *v18 = 13;
      v7 += 2;
      v18[1] = *v5;
      self->_line = 0;
      self->_lastWasNewLine = 1;
    }
    else
    {
      unint64_t v13 = v12 + 1;
      self->_size_t matchedFrom = v13;
      if (forTextPart && self->_lastHorizontalWhitespace)
      {
        __b[v7] = self->_lastHorizontalWhitespace;
        ++self->_line;
        ++v7;
        self->_unint64_t lastHorizontalWhitespace = 0;
        unint64_t v13 = self->_matchedFrom;
      }
      if (v13 == 5)
      {
        self->_size_t matchedFrom = 0;
        if (self->_forTextPart)
        {
          self->_unint64_t lastHorizontalWhitespace = 32;
          size_t v14 = 6;
        }
        else
        {
          size_t v14 = 7;
        }
        memcpy(&__b[v7], "=46rom ", v14);
        v7 += v14;
        self->_line += v14;
        id v4 = v25;
      }
    }
LABEL_38:
    if (!self->_forHeader && self->_line >= 0x4C && !self->_lastWasNewLine)
    {
      unint64_t v21 = v7 + 1;
      __b[v7] = 61;
      if (self->_forTextPart)
      {
        __b[v21] = 13;
        unint64_t v21 = v7 + 2;
      }
      __b[v21] = 10;
      unint64_t v7 = v21 + 1;
      self->_line = 0;
      self->_lastWasNewLine = 0;
    }
    if (v7 >= 0x3F1D)
    {
      v22 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:__b length:v7 freeWhenDone:0];
      v27.receiver = self;
      v27.super_class = (Class)MFQuotedPrintableEncoder;
      [(MFBaseFilterDataConsumer *)&v27 appendData:v22];

      unint64_t v7 = 0;
    }
    ++v5;
  }
  while (v5 < v8);
  if (v7)
  {
    v23 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:__b length:v7 freeWhenDone:0];
    v26.receiver = self;
    v26.super_class = (Class)MFQuotedPrintableEncoder;
    [(MFBaseFilterDataConsumer *)&v26 appendData:v23];
  }
LABEL_53:

  return v6;
}

- (void)done
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  memset(__b, 170, sizeof(__b));
  unint64_t matchedFrom = self->_matchedFrom;
  if (matchedFrom)
  {
    if (matchedFrom == 5)
    {
      qmemcpy(__b, "=46ro", 5);
    }
    else
    {
      __memmove_chk();
      unint64_t matchedFrom = self->_matchedFrom;
    }
    self->_line += matchedFrom;
  }
  if (self->_forTextPart)
  {
    unint64_t lastHorizontalWhitespace = self->_lastHorizontalWhitespace;
    if (self->_lastHorizontalWhitespace)
    {
      v5 = (char *)__b + matchedFrom;
      char *v5 = 61;
      v5[1] = kEncodeHexTable[lastHorizontalWhitespace >> 4];
      matchedFrom += 3;
      unint64_t line = self->_line;
      v5[2] = kEncodeHexTable[lastHorizontalWhitespace & 0xF];
      self->_unint64_t line = line + 3;
      self->_unint64_t lastHorizontalWhitespace = 0;
    }
  }
  if (self->_line)
  {
    if (!self->_forHeader)
    {
      unint64_t v7 = matchedFrom + 1;
      *((unsigned char *)__b + matchedFrom) = 61;
      if (self->_forTextPart)
      {
        *((unsigned char *)__b + v7) = 13;
        unint64_t v7 = matchedFrom + 2;
      }
      unint64_t matchedFrom = v7 + 1;
      *((unsigned char *)__b + v7) = 10;
    }
    self->_unint64_t line = 0;
  }
  if (matchedFrom)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:__b length:matchedFrom freeWhenDone:0];
    v9.receiver = self;
    v9.super_class = (Class)MFQuotedPrintableEncoder;
    [(MFBaseFilterDataConsumer *)&v9 appendData:v8];
  }
}

+ (unint64_t)requiredSizeToEncodeHeaderBytes:(const char *)a3 length:(unint64_t)a4
{
  if ((uint64_t)a4 < 1) {
    return 0;
  }
  unint64_t result = 0;
  v5 = &a3[a4];
  do
  {
    int v7 = *(unsigned __int8 *)a3++;
    int v6 = v7;
    if ((v7 - 32) < 0x5F && v6 != 61 || v6 == 10) {
      ++result;
    }
    else {
      result += 3;
    }
  }
  while (a3 < v5);
  return result;
}

- (BOOL)forTextPart
{
  return self->_forTextPart;
}

- (void)setForTextPart:(BOOL)a3
{
  self->_BOOL forTextPart = a3;
}

- (BOOL)forHeader
{
  return self->_forHeader;
}

- (void)setForHeader:(BOOL)a3
{
  self->_forHeader = a3;
}

@end