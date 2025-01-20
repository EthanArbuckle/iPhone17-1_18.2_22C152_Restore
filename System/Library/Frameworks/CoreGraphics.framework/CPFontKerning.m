@interface CPFontKerning
- (CPFontKerning)initWithCGFont:(CGFont *)a3;
- (CPFontKerning)initWithKernData:(__CFData *)a3;
- (__CFDictionary)createKernTable;
- (signed)readShort;
- (unsigned)readByte;
- (unsigned)readUnsignedLong;
- (unsigned)readUnsignedShort;
- (void)dealloc;
- (void)dispose;
- (void)doKerningPair;
- (void)doOTSubtable;
- (void)doSubtableFormat0;
- (void)doTTSubtable;
- (void)doTable;
- (void)finalize;
@end

@implementation CPFontKerning

- (__CFDictionary)createKernTable
{
  unsigned int kernTableLength = self->kernTableLength;
  if (kernTableLength)
  {
    self->kernDictionary = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kernTableLength / 6uLL, 0, 0);
    self->offset = 0;
    [(CPFontKerning *)self doTable];
    result = self->kernDictionary;
    if (self->valid) {
      return result;
    }
    CFRelease(result);
  }
  return 0;
}

- (void)doTable
{
  if (!self->kernTableLength) {
    goto LABEL_9;
  }
  unsigned int offset = self->offset;
  if ([(CPFontKerning *)self readUnsignedShort])
  {
    self->unsigned int offset = offset;
    if ([(CPFontKerning *)self readUnsignedLong] == 0x10000)
    {
      unsigned int v4 = [(CPFontKerning *)self readUnsignedLong];
      if (v4)
      {
        unsigned int v5 = v4;
        do
        {
          if (!self->valid) {
            break;
          }
          [(CPFontKerning *)self doTTSubtable];
          --v5;
        }
        while (v5);
      }
      return;
    }
LABEL_9:
    self->valid = 0;
    return;
  }
  int v6 = [(CPFontKerning *)self readUnsignedShort];
  if (v6)
  {
    int v7 = v6;
    do
    {
      if (!self->valid) {
        break;
      }
      [(CPFontKerning *)self doOTSubtable];
      --v7;
    }
    while ((_WORD)v7);
  }
}

- (void)doOTSubtable
{
  unsigned int offset = self->offset;
  self->unsigned int offset = offset + 2;
  int v4 = [(CPFontKerning *)self readUnsignedShort];
  unsigned int v5 = [(CPFontKerning *)self readUnsignedShort];
  if ((v5 & 7) == 1)
  {
    self->override = (v5 & 8) != 0;
    if (v5 >> 8 == 2)
    {
      [(CPFontKerning *)self doSubtableFormat2];
    }
    else if (!(v5 >> 8))
    {
      [(CPFontKerning *)self doSubtableFormat0];
    }
  }
  if (self->offset > offset + v4) {
    self->valid = 0;
  }
  self->unsigned int offset = offset + v4;
}

- (void)doTTSubtable
{
  unsigned int offset = self->offset;
  unsigned int v4 = [(CPFontKerning *)self readUnsignedLong];
  unsigned __int16 v5 = [(CPFontKerning *)self readUnsignedShort];
  self->offset += 2;
  if ((v5 & 0xE000) == 0)
  {
    switch((char)v5)
    {
      case 0:
        [(CPFontKerning *)self doSubtableFormat0];
        break;
      case 1:
        [(CPFontKerning *)self doSubtableFormat1];
        break;
      case 2:
        [(CPFontKerning *)self doSubtableFormat2];
        break;
      case 3:
        [(CPFontKerning *)self doSubtableFormat3];
        break;
      default:
        break;
    }
  }
  if (self->offset > v4 + offset) {
    self->valid = 0;
  }
  self->unsigned int offset = v4 + offset;
}

- (void)doSubtableFormat0
{
  int v3 = [(CPFontKerning *)self readUnsignedShort];
  self->offset += 6;
  if (v3)
  {
    int v4 = v3;
    do
    {
      if (!self->valid) {
        break;
      }
      [(CPFontKerning *)self doKerningPair];
      --v4;
    }
    while ((_WORD)v4);
  }
}

- (void)doKerningPair
{
  unsigned int v3 = [(CPFontKerning *)self readUnsignedShort];
  unsigned int v4 = [(CPFontKerning *)self readUnsignedShort];
  unsigned int v5 = [(CPFontKerning *)self readUnsignedShort];
  if (self->valid)
  {
    unsigned int v6 = v5;
    int v7 = (const void *)(v4 | ((unint64_t)v3 << 16));
    if (CFDictionaryContainsKey(self->kernDictionary, v7))
    {
      if (!self->override) {
        LOWORD(v6) = v6 + (unsigned __int16)CFDictionaryGetValue(self->kernDictionary, v7);
      }
      kernDictionary = self->kernDictionary;
      CFDictionaryReplaceValue(kernDictionary, v7, (const void *)(unsigned __int16)v6);
    }
    else
    {
      v9 = self->kernDictionary;
      CFDictionaryAddValue(v9, v7, (const void *)v6);
    }
  }
}

- (unsigned)readUnsignedLong
{
  int v3 = [(CPFontKerning *)self readByte];
  int v4 = [(CPFontKerning *)self readByte];
  int v5 = [(CPFontKerning *)self readByte];
  return (v3 << 24) | (v4 << 16) | (v5 << 8) | [(CPFontKerning *)self readByte];
}

- (signed)readShort
{
  return [(CPFontKerning *)self readUnsignedShort];
}

- (unsigned)readUnsignedShort
{
  __int16 v3 = [(CPFontKerning *)self readByte];
  return [(CPFontKerning *)self readByte] | (v3 << 8);
}

- (unsigned)readByte
{
  uint64_t offset = self->offset;
  if (offset >= self->kernTableLength)
  {
    unsigned __int8 v4 = 0;
    self->valid = 0;
  }
  else
  {
    dataPtr = self->dataPtr;
    self->uint64_t offset = offset + 1;
    return dataPtr[offset];
  }
  return v4;
}

- (void)dealloc
{
  [(CPFontKerning *)self dispose];
  v3.receiver = self;
  v3.super_class = (Class)CPFontKerning;
  [(CPFontKerning *)&v3 dealloc];
}

- (void)finalize
{
  [(CPFontKerning *)self dispose];
  v3.receiver = self;
  v3.super_class = (Class)CPFontKerning;
  [(CPFontKerning *)&v3 finalize];
}

- (void)dispose
{
  kernTable = self->kernTable;
  if (kernTable)
  {
    CFRelease(kernTable);
    self->kernTable = 0;
  }
}

- (CPFontKerning)initWithCGFont:(CGFont *)a3
{
  if (a3)
  {
    unsigned __int8 v4 = (const void *)(*(uint64_t (**)(void, uint64_t))(*((void *)a3 + 2) + 424))(*((void *)a3 + 14), 1801810542);
    int v5 = [(CPFontKerning *)self initWithKernData:v4];
    if (v4) {
      CFRelease(v4);
    }
    return v5;
  }
  else
  {
    return -[CPFontKerning initWithKernData:](self, "initWithKernData:");
  }
}

- (CPFontKerning)initWithKernData:(__CFData *)a3
{
  unsigned __int8 v4 = [(CPFontKerning *)self init];
  int v5 = v4;
  if (v4)
  {
    if (a3)
    {
      unsigned int Length = CFDataGetLength(a3);
      v5->unsigned int kernTableLength = Length;
      if (Length)
      {
        CFDataRef v7 = (const __CFData *)CFRetain(a3);
        v5->kernTable = v7;
        v5->dataPtr = (const char *)CFDataGetBytePtr(v7);
      }
    }
    else
    {
      v4->unsigned int kernTableLength = 0;
    }
    *(_WORD *)&v5->override = 256;
  }
  return v5;
}

@end