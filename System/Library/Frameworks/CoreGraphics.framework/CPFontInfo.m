@interface CPFontInfo
- (BOOL)getDescriptor:(id *)a3;
- (CGRect)readRect;
- (CPFontInfo)initWithFontData:(__CFData *)a3;
- (__CFData)newKernData;
- (float)readFloat;
- (int)kernUnitsPerEm;
- (unsigned)readByte;
- (unsigned)readUnsignedLong;
- (void)dealloc;
- (void)dispose;
- (void)finalize;
@end

@implementation CPFontInfo

- (__CFData)newKernData
{
  unsigned int fontDataLength = self->fontDataLength;
  if (fontDataLength >= 0x59) {
    return CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const UInt8 *)self->dataPtr + 88, fontDataLength - 88, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  }
  else {
    return 0;
  }
}

- (int)kernUnitsPerEm
{
  self->valid = 1;
  self->offset = 84;
  int result = [(CPFontInfo *)self readLong];
  if (!self->valid) {
    return 0;
  }
  return result;
}

- (BOOL)getDescriptor:(id *)a3
{
  if (!a3) {
    return 0;
  }
  if (self->fontDataLength < 0x54) {
    return 0;
  }
  self->valid = 1;
  self->offset = 0;
  [(CPFontInfo *)self readFloat];
  a3->var0 = v6;
  [(CPFontInfo *)self readFloat];
  a3->var1 = v7;
  a3->var2 = [(CPFontInfo *)self readUnsignedLong];
  [(CPFontInfo *)self readRect];
  a3->var3.origin.x = v8;
  a3->var3.origin.y = v9;
  a3->var3.size.width = v10;
  a3->var3.size.height = v11;
  [(CPFontInfo *)self readFloat];
  a3->var4 = v12;
  [(CPFontInfo *)self readFloat];
  a3->var5 = v13;
  [(CPFontInfo *)self readFloat];
  a3->var6 = v14;
  [(CPFontInfo *)self readFloat];
  a3->var7 = v15;
  [(CPFontInfo *)self readFloat];
  a3->var8 = v16;
  [(CPFontInfo *)self readFloat];
  a3->var9 = v17;
  [(CPFontInfo *)self readFloat];
  a3->var10 = v18;
  [(CPFontInfo *)self readFloat];
  a3->var11 = v19;
  [(CPFontInfo *)self readFloat];
  a3->var12 = v20;
  [(CPFontInfo *)self readFloat];
  a3->var13 = v21;
  [(CPFontInfo *)self readFloat];
  a3->var14 = v22;
  [(CPFontInfo *)self readFloat];
  a3->var15 = v23;
  [(CPFontInfo *)self readFloat];
  a3->var16 = v24;
  [(CPFontInfo *)self readFloat];
  a3->var17 = v25;
  return self->valid;
}

- (CGRect)readRect
{
  [(CPFontInfo *)self readFloat];
  double v4 = v3;
  [(CPFontInfo *)self readFloat];
  double v6 = v5;
  [(CPFontInfo *)self readFloat];
  double v8 = v7;
  [(CPFontInfo *)self readFloat];
  double v10 = v9;
  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  result.size.height = v10;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (float)readFloat
{
  LODWORD(result) = [(CPFontInfo *)self readUnsignedLong];
  return result;
}

- (unsigned)readUnsignedLong
{
  int v3 = [(CPFontInfo *)self readByte];
  int v4 = [(CPFontInfo *)self readByte];
  int v5 = [(CPFontInfo *)self readByte];
  return (v3 << 24) | (v4 << 16) | (v5 << 8) | [(CPFontInfo *)self readByte];
}

- (unsigned)readByte
{
  uint64_t offset = self->offset;
  if (offset >= self->fontDataLength)
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
  [(CPFontInfo *)self dispose];
  v3.receiver = self;
  v3.super_class = (Class)CPFontInfo;
  [(CPFontInfo *)&v3 dealloc];
}

- (void)finalize
{
  [(CPFontInfo *)self dispose];
  v3.receiver = self;
  v3.super_class = (Class)CPFontInfo;
  [(CPFontInfo *)&v3 finalize];
}

- (void)dispose
{
  fontData = self->fontData;
  if (fontData)
  {
    CFRelease(fontData);
    self->fontData = 0;
  }
}

- (CPFontInfo)initWithFontData:(__CFData *)a3
{
  unsigned __int8 v4 = [(CPFontInfo *)self init];
  int v5 = v4;
  if (v4)
  {
    if (a3)
    {
      unsigned int Length = CFDataGetLength(a3);
      v5->unsigned int fontDataLength = Length;
      if (Length)
      {
        CFDataRef v7 = (const __CFData *)CFRetain(a3);
        v5->fontData = v7;
        v5->dataPtr = (const char *)CFDataGetBytePtr(v7);
      }
    }
    else
    {
      v4->unsigned int fontDataLength = 0;
    }
    v5->valid = 1;
  }
  return v5;
}

@end