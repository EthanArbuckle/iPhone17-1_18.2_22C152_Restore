@interface _IOSurfaceDebugDescription
- (NSString)name;
- (NSString)pixelFormatString;
- (_IOSurfaceDebugDescription)initWithBasicInfo:(id *)a3 layoutInfo:(id *)a4 name:(id)a5;
- (id)description;
- (unint64_t)allocationSize;
- (unint64_t)dirtySize;
- (unint64_t)height;
- (unint64_t)residentSize;
- (unint64_t)traceID;
- (unint64_t)virtualAddress;
- (unint64_t)width;
- (unsigned)pixelFormat;
- (unsigned)surfaceID;
- (void)dealloc;
@end

@implementation _IOSurfaceDebugDescription

- (_IOSurfaceDebugDescription)initWithBasicInfo:(id *)a3 layoutInfo:(id *)a4 name:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)_IOSurfaceDebugDescription;
  v8 = [(_IOSurfaceDebugDescription *)&v19 init];
  v9 = (_IOSurfaceDebugDescription *)v8;
  if (v8)
  {
    long long v10 = *(_OWORD *)&a3->var10;
    long long v12 = *(_OWORD *)&a3->var0;
    long long v11 = *(_OWORD *)&a3->var3;
    *(_OWORD *)(v8 + 40) = *(_OWORD *)&a3->var7;
    *(_OWORD *)(v8 + 56) = v10;
    *(_OWORD *)(v8 + 8) = v12;
    *(_OWORD *)(v8 + 24) = v11;
    long long v14 = *(_OWORD *)&a3->var18;
    long long v13 = *(_OWORD *)&a3->var20;
    long long v15 = *(_OWORD *)&a3->var16;
    *((void *)v8 + 15) = a3->var22;
    *(_OWORD *)(v8 + 88) = v14;
    *(_OWORD *)(v8 + 104) = v13;
    *(_OWORD *)(v8 + 72) = v15;
    long long v16 = *(_OWORD *)&a4->var4;
    long long v17 = *(_OWORD *)&a4->var0;
    *((_OWORD *)v8 + 9) = *(_OWORD *)&a4->var2;
    *((_OWORD *)v8 + 10) = v16;
    *((_OWORD *)v8 + 8) = v17;
    *((void *)v8 + 22) = [a5 copy];
  }
  return v9;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)_IOSurfaceDebugDescription;
  [(_IOSurfaceDebugDescription *)&v3 dealloc];
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_basicInfo = &self->_basicInfo;
  unint64_t pixelFormat = self->_basicInfo.pixelFormat;
  unint64_t v5 = pixelFormat >> 24;
  if ((pixelFormat & 0x80000000) != 0)
  {
    if (__maskrune(v5, 0x800uLL)) {
      goto LABEL_3;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v5 + 60) & 0x800) != 0)
  {
LABEL_3:
    __str[0] = BYTE3(pixelFormat);
    __str[1] = BYTE2(pixelFormat);
    __str[2] = BYTE1(pixelFormat);
    __str[3] = pixelFormat;
    __str[4] = 0;
    goto LABEL_6;
  }
  snprintf(__str, 5uLL, "%4d", pixelFormat);
LABEL_6:
  v6 = NSString;
  unint64_t traceID = p_basicInfo->traceID;
  unint64_t clientAddress = p_basicInfo->clientAddress;
  unint64_t width = self->_layoutInfo.width;
  unint64_t height = self->_layoutInfo.height;
  uint64_t surfaceID = p_basicInfo->surfaceID;
  uint64_t v12 = [(id)NSLocalizedFileSizeDescription() UTF8String];
  name = (__CFString *)self->_name;
  if (!name) {
    name = &stru_1EFE14268;
  }
  return (id)[v6 stringWithFormat:@"sid: %08x traceID: %016llx virt: %016llx fmt: %s dims: %5d x %5d size: %7s name: %@", surfaceID, traceID, clientAddress, __str, width, height, v12, name];
}

- (unint64_t)virtualAddress
{
  return self->_basicInfo.clientAddress;
}

- (unint64_t)allocationSize
{
  return self->_basicInfo.allocSize;
}

- (unint64_t)dirtySize
{
  return self->_basicInfo.dirtySize;
}

- (unint64_t)residentSize
{
  return self->_basicInfo.residentSize;
}

- (unsigned)surfaceID
{
  return self->_basicInfo.surfaceID;
}

- (unsigned)pixelFormat
{
  return self->_basicInfo.pixelFormat;
}

- (NSString)pixelFormatString
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  unint64_t pixelFormat = self->_basicInfo.pixelFormat;
  unint64_t v3 = pixelFormat >> 24;
  if ((pixelFormat & 0x80000000) != 0)
  {
    if (__maskrune(v3, 0x800uLL)) {
      goto LABEL_3;
    }
LABEL_5:
    snprintf(__str, 5uLL, "%4d", pixelFormat);
    return (NSString *)[NSString stringWithCString:__str encoding:1];
  }
  if ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v3 + 60) & 0x800) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  __str[0] = BYTE3(pixelFormat);
  __str[1] = BYTE2(pixelFormat);
  __str[2] = BYTE1(pixelFormat);
  __str[3] = pixelFormat;
  __str[4] = 0;
  return (NSString *)[NSString stringWithCString:__str encoding:1];
}

- (unint64_t)width
{
  return self->_layoutInfo.width;
}

- (unint64_t)height
{
  return self->_layoutInfo.height;
}

- (unint64_t)traceID
{
  return self->_basicInfo.traceID;
}

- (NSString)name
{
  return self->_name;
}

@end