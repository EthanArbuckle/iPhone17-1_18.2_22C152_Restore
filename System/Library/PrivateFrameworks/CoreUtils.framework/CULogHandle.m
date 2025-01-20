@interface CULogHandle
- (CULogHandle)initWithSubsystem:(id)a3 category:(id)a4;
- (CULogHandle)initWithSubsystem:(id)a3 category:(id)a4 logFlags:(unsigned int)a5;
- (CULogHandle)initWithSubsystem:(id)a3 category:(id)a4 logLevel:(int)a5;
- (CULogHandle)initWithSubsystem:(id)a3 category:(id)a4 logLevel:(int)a5 logFlags:(unsigned int)a6;
- (NSString)label;
- (void)dealloc;
- (void)setLabel:(id)a3;
- (void)ulog:(int)a3 message:(id)a4;
- (void)ulogf:(int)a3 format:(id)a4;
- (void)ulogv:(int)a3 format:(id)a4 args:(char *)a5;
@end

@implementation CULogHandle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_categoryName, 0);
}

- (NSString)label
{
  return self->_label;
}

- (void)ulogv:(int)a3 format:(id)a4 args:(char *)a5
{
  uint64_t v8 = (uint64_t)a4;
  v9 = (void *)v8;
  ucatPtr = self->_ucatPtr;
  if (ucatPtr->var0 <= a3)
  {
    v11 = (void *)v8;
    if (ucatPtr->var0 != -1)
    {
LABEL_3:
      uint64_t v8 = LogPrintV((uint64_t)ucatPtr, (uint64_t)"", a3, [v9 UTF8String], (uint64_t)a5);
      v9 = v11;
      goto LABEL_5;
    }
    uint64_t v8 = _LogCategory_Initialize((uint64_t)ucatPtr, a3);
    v9 = v11;
    if (v8)
    {
      ucatPtr = self->_ucatPtr;
      goto LABEL_3;
    }
  }
LABEL_5:
  MEMORY[0x1F41817F8](v8, v9);
}

- (void)ulogf:(int)a3 format:(id)a4
{
  id v6 = a4;
  ucatPtr = self->_ucatPtr;
  if (ucatPtr->var0 <= a3 && (ucatPtr->var0 != -1 || _LogCategory_Initialize((uint64_t)ucatPtr, a3))) {
    LogPrintV((uint64_t)self->_ucatPtr, (uint64_t)"", a3, [v6 UTF8String], (uint64_t)&v8);
  }
}

- (void)ulog:(int)a3 message:(id)a4
{
  uint64_t v6 = (uint64_t)a4;
  v7 = (void *)v6;
  ucatPtr = self->_ucatPtr;
  if (ucatPtr->var0 <= a3)
  {
    v14 = (void *)v6;
    if (ucatPtr->var0 != -1)
    {
LABEL_3:
      uint64_t v9 = [v7 UTF8String];
      uint64_t v6 = LogPrintF((uint64_t)ucatPtr, (uint64_t)", a3, (uint64_t)"%s"", v10, v11, v12, v13, v9);
      v7 = v14;
      goto LABEL_5;
    }
    uint64_t v6 = _LogCategory_Initialize((uint64_t)ucatPtr, a3);
    v7 = v14;
    if (v6)
    {
      ucatPtr = self->_ucatPtr;
      goto LABEL_3;
    }
  }
LABEL_5:
  MEMORY[0x1F41817F8](v6, v7);
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  p_ucatPtr = (uint64_t *)&self->_ucatPtr;
  v7 = [(NSString *)self->_categoryName UTF8String];
  id v8 = v5;
  [v8 UTF8String];

  LogCategoryReplaceF(p_ucatPtr, (uint64_t)"%s-%s", v9, v10, v11, v12, v13, v14, (uint64_t)v7);
}

- (void)dealloc
{
  ucatPtr = self->_ucatPtr;
  self->_ucatPtr = 0;
  LogCategory_Remove(ucatPtr);
  v4.receiver = self;
  v4.super_class = (Class)CULogHandle;
  [(CULogHandle *)&v4 dealloc];
}

- (CULogHandle)initWithSubsystem:(id)a3 category:(id)a4
{
  return [(CULogHandle *)self initWithSubsystem:a3 category:a4 logLevel:10 logFlags:512];
}

- (CULogHandle)initWithSubsystem:(id)a3 category:(id)a4 logFlags:(unsigned int)a5
{
  return [(CULogHandle *)self initWithSubsystem:a3 category:a4 logLevel:10 logFlags:*(void *)&a5];
}

- (CULogHandle)initWithSubsystem:(id)a3 category:(id)a4 logLevel:(int)a5
{
  return [(CULogHandle *)self initWithSubsystem:a3 category:a4 logLevel:*(void *)&a5 logFlags:512];
}

- (CULogHandle)initWithSubsystem:(id)a3 category:(id)a4 logLevel:(int)a5 logFlags:(unsigned int)a6
{
  id v10 = a3;
  id v11 = a4;
  v26.receiver = self;
  v26.super_class = (Class)CULogHandle;
  uint64_t v12 = [(CULogHandle *)&v26 init];
  if (v12)
  {
    unsigned int v25 = 0;
    uint64_t v13 = (const char *)[v10 UTF8String];
    id v14 = v11;
    v15 = (LogCategory *)LogCategoryCreateEx(v13, (const char *)[v14 UTF8String], a5, a6, 0, (int *)&v25);
    v12->_ucatPtr = v15;
    if (!v15) {
      FatalErrorF((uint64_t)"CULogHandle LogCategoryCreateEx failed: %#m", v16, v17, v18, v19, v20, v21, v22, v25);
    }
    objc_storeStrong((id *)&v12->_categoryName, v14);
    v23 = v12;
  }

  return v12;
}

@end