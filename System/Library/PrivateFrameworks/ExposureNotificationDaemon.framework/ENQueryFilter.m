@interface ENQueryFilter
- (BOOL)shouldIgnoreRPI:(const void *)a3;
- (ENQueryFilter)init;
- (ENQueryFilter)initWithBufferSize:(unint64_t)a3 hashCount:(unint64_t)a4;
- (unint64_t)bufferSize;
- (unint64_t)hashCount;
- (void)addPossibleRPI:(const void *)a3;
- (void)dealloc;
@end

@implementation ENQueryFilter

- (ENQueryFilter)init
{
  return [(ENQueryFilter *)self initWithBufferSize:0x100000 hashCount:3];
}

- (ENQueryFilter)initWithBufferSize:(unint64_t)a3 hashCount:(unint64_t)a4
{
  v7 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v8 = [v7 isSensitiveLoggingAllowed];

  if (v8
    && gLogCategory_ENQueryFilter <= 50
    && (gLogCategory_ENQueryFilter != -1 || _LogCategory_Initialize()))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    unint64_t v18 = a3;
    v17 = unint64_t v19 = a4;
    LogPrintF_safe();
  }
  v20.receiver = self;
  v20.super_class = (Class)ENQueryFilter;
  v10 = [(ENQueryFilter *)&v20 init];
  v11 = v10;
  if (!v10) {
    goto LABEL_12;
  }
  v10->_bufferSize = a3;
  v12 = (char *)malloc_type_calloc(a3, 1uLL, 0x2F186909uLL);
  v11->_filterBuffer = v12;
  if (!v12)
  {
    if (gLogCategory__ENQueryFilter > 90
      || gLogCategory__ENQueryFilter == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_22;
    }
LABEL_18:
    LogPrintF_safe();
LABEL_22:
    v15 = 0;
    goto LABEL_23;
  }
  v11->_hashCount = a4;
  v13 = (unint64_t *)malloc_type_malloc(8 * a4, 0x100004000313F17uLL);
  v11->_hashSalts = v13;
  if (!v13)
  {
    if (gLogCategory__ENQueryFilter > 90
      || gLogCategory__ENQueryFilter == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_22;
    }
    goto LABEL_18;
  }
  if (v11->_hashCount)
  {
    unint64_t v14 = 0;
    do
      v11->_hashSalts[v14++] = arc4random();
    while (v14 < v11->_hashCount);
  }
LABEL_12:
  v15 = v11;
LABEL_23:

  return v15;
}

- (void)dealloc
{
  free(self->_filterBuffer);
  free(self->_hashSalts);
  v3.receiver = self;
  v3.super_class = (Class)ENQueryFilter;
  [(ENQueryFilter *)&v3 dealloc];
}

- (void)addPossibleRPI:(const void *)a3
{
  if (self->_hashCount)
  {
    unint64_t v3 = 0;
    do
    {
      unint64_t v4 = (*(void *)a3 ^ *((void *)a3 + 1) ^ self->_hashSalts[v3]) % (8 * self->_bufferSize);
      self->_filterBuffer[v4 >> 3] |= 1 << (v4 & 7);
      ++v3;
    }
    while (v3 < self->_hashCount);
  }
}

- (BOOL)shouldIgnoreRPI:(const void *)a3
{
  unint64_t hashCount = self->_hashCount;
  if (!hashCount) {
    return 0;
  }
  hashSalts = self->_hashSalts;
  unint64_t v5 = 8 * self->_bufferSize;
  filterBuffer = self->_filterBuffer;
  uint64_t v7 = *(void *)a3 ^ *((void *)a3 + 1);
  if (((filterBuffer[((v7 ^ *hashSalts) % v5) >> 3] >> (((v7 ^ *hashSalts) % v5) & 7)) & 1) == 0) {
    return 1;
  }
  uint64_t v8 = 1;
  do
  {
    unint64_t v9 = v8;
    if (hashCount == v8) {
      break;
    }
    uint64_t v10 = ((v7 ^ hashSalts[v8++]) % v5) & 7;
  }
  while (((filterBuffer[((v7 ^ hashSalts[v9]) % v5) >> 3] >> v10) & 1) != 0);
  return v9 < hashCount;
}

- (unint64_t)bufferSize
{
  return self->_bufferSize;
}

- (unint64_t)hashCount
{
  return self->_hashCount;
}

@end