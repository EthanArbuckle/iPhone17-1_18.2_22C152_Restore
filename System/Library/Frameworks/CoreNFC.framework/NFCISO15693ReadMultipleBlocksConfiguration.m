@interface NFCISO15693ReadMultipleBlocksConfiguration
- (NFCISO15693ReadMultipleBlocksConfiguration)initWithRange:(NSRange)range chunkSize:(NSUInteger)chunkSize;
- (NFCISO15693ReadMultipleBlocksConfiguration)initWithRange:(NSRange)range chunkSize:(NSUInteger)chunkSize maximumRetries:(NSUInteger)maximumRetries retryInterval:(NSTimeInterval)retryInterval;
- (NSRange)range;
- (NSUInteger)chunkSize;
- (id)asNSDataArrayWithUID:(id)a3 error:(id *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)flags;
- (void)setChunkSize:(NSUInteger)chunkSize;
- (void)setFlags:(unsigned __int8)a3;
- (void)setRange:(NSRange)range;
@end

@implementation NFCISO15693ReadMultipleBlocksConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NFCISO15693ReadMultipleBlocksConfiguration;
  id v4 = [(NFCTagCommandConfiguration *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRange:", self->_range.location, self->_range.length);
    [v5 setChunkSize:self->_chunkSize];
  }
  return v5;
}

- (NFCISO15693ReadMultipleBlocksConfiguration)initWithRange:(NSRange)range chunkSize:(NSUInteger)chunkSize maximumRetries:(NSUInteger)maximumRetries retryInterval:(NSTimeInterval)retryInterval
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  v16.receiver = self;
  v16.super_class = (Class)NFCISO15693ReadMultipleBlocksConfiguration;
  v11 = [(NFCISO15693ReadMultipleBlocksConfiguration *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_range.NSUInteger location = location;
    v11->_range.NSUInteger length = length;
    v11->_chunkSize = chunkSize;
    v15.receiver = v11;
    v15.super_class = (Class)NFCISO15693ReadMultipleBlocksConfiguration;
    [(NFCTagCommandConfiguration *)&v15 setMaximumRetries:maximumRetries];
    v14.receiver = v12;
    v14.super_class = (Class)NFCISO15693ReadMultipleBlocksConfiguration;
    [(NFCTagCommandConfiguration *)&v14 setRetryInterval:retryInterval];
    v12->_flags = 34;
  }
  return v12;
}

- (NFCISO15693ReadMultipleBlocksConfiguration)initWithRange:(NSRange)range chunkSize:(NSUInteger)chunkSize
{
  return -[NFCISO15693ReadMultipleBlocksConfiguration initWithRange:chunkSize:maximumRetries:retryInterval:](self, "initWithRange:chunkSize:maximumRetries:retryInterval:", range.location, range.length, chunkSize, 0, 0.0);
}

- (id)asNSDataArrayWithUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self->_chunkSize
    && (p_range = &self->_range, (NSUInteger v8 = self->_range.length) != 0)
    && p_range->location <= 0xFF
    && p_range->location + v8 < 0x101)
  {
    v9 = objc_opt_new();
    NSUInteger length = self->_range.length;
    if (length)
    {
      NSUInteger location = p_range->location;
      do
      {
        v12 = objc_opt_new();
        unsigned __int8 flags = self->_flags;
        [v12 appendBytes:&flags length:1];
        unsigned __int8 flags = 35;
        [v12 appendBytes:&flags length:1];
        [v12 appendData:v6];
        unsigned __int8 flags = location;
        [v12 appendBytes:&flags length:1];
        unint64_t chunkSize = self->_chunkSize;
        if (length >= chunkSize) {
          unint64_t v14 = self->_chunkSize;
        }
        else {
          LOBYTE(v14) = length;
        }
        unsigned __int8 flags = v14 - 1;
        [v12 appendBytes:&flags length:1];
        [v9 addObject:v12];

        BOOL v15 = length > chunkSize;
        if (length <= chunkSize) {
          char v16 = 0;
        }
        else {
          char v16 = chunkSize;
        }
        LOBYTE(location) = location + v16;
        if (length >= chunkSize) {
          length -= chunkSize;
        }
        else {
          NSUInteger length = 0;
        }
      }
      while (v15);
    }
  }
  else if (a4)
  {
    +[NFCError errorWithCode:300];
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSRange)range
{
  p_range = &self->_range;
  NSUInteger location = self->_range.location;
  NSUInteger length = p_range->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(NSRange)range
{
  self->_range = range;
}

- (NSUInteger)chunkSize
{
  return self->_chunkSize;
}

- (void)setChunkSize:(NSUInteger)chunkSize
{
  self->_unint64_t chunkSize = chunkSize;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned __int8)a3
{
  self->_unsigned __int8 flags = a3;
}

@end