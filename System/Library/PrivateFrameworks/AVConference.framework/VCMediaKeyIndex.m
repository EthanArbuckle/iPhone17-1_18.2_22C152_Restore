@interface VCMediaKeyIndex
+ (id)makeInvalidKey;
+ (id)newMKIWithBytes:(char *)a3 bufferSize:(unsigned int)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStartingWithPrefix:(id)a3;
- (VCMediaKeyIndex)initWithBytes:(char *)a3 bufferSize:(unsigned int)a4;
- (VCMediaKeyIndex)initWithBytes:(char *)a3 bufferSize:(unsigned int)a4 uniquePrefixLength:(unint64_t)a5;
- (VCMediaKeyIndex)initWithNSUUID:(id)a3;
- (VCMediaKeyIndex)initWithNSUUID:(id)a3 uniquePrefixLength:(unint64_t)a4;
- (VCMediaKeyIndex)initWithUUID:(unsigned __int8)a3[16];
- (const)MKI;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)uniquePrefixLength;
- (unsigned)activeSize;
- (void)dealloc;
- (void)fullKeyBytes:(unsigned __int8)a3[16];
- (void)setActiveSize:(unsigned int)a3;
- (void)setUniquePrefixLength:(unint64_t)a3;
@end

@implementation VCMediaKeyIndex

- (VCMediaKeyIndex)initWithBytes:(char *)a3 bufferSize:(unsigned int)a4 uniquePrefixLength:(unint64_t)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)VCMediaKeyIndex;
  v8 = [(VCMediaKeyIndex *)&v13 init];
  v9 = v8;
  if (v8)
  {
    if (a3)
    {
      if (a4 - 17 >= 0xFFFFFFF0 && a4 >= a5)
      {
        *(void *)v8->_MKI = 0;
        v8->_activeSize = a4;
        v8->_uniquePrefixLength = a5;
        *(void *)&v8->_MKI[8] = 0;
        memcpy(v8->_MKI, a3, a4);
        return v9;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v15 = v10;
          __int16 v16 = 2080;
          v17 = "-[VCMediaKeyIndex initWithBytes:bufferSize:uniquePrefixLength:]";
          __int16 v18 = 1024;
          int v19 = 39;
          __int16 v20 = 1024;
          unsigned int v21 = a4;
          __int16 v22 = 2048;
          unint64_t v23 = a5;
          _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid size of input data bufferSize=%d, uniquePrefixLength=%llu", buf, 0x2Cu);
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaKeyIndex initWithBytes:bufferSize:uniquePrefixLength:]();
      }
    }

    return 0;
  }
  return v9;
}

- (VCMediaKeyIndex)initWithBytes:(char *)a3 bufferSize:(unsigned int)a4
{
  return [(VCMediaKeyIndex *)self initWithBytes:a3 bufferSize:*(void *)&a4 uniquePrefixLength:0];
}

- (VCMediaKeyIndex)initWithUUID:(unsigned __int8)a3[16]
{
  return [(VCMediaKeyIndex *)self initWithBytes:a3 bufferSize:16];
}

- (VCMediaKeyIndex)initWithNSUUID:(id)a3 uniquePrefixLength:(unint64_t)a4
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v7[0] = 0xAAAAAAAAAAAAAAAALL;
  v7[1] = 0xAAAAAAAAAAAAAAAALL;
  [a3 getUUIDBytes:v7];
  return [(VCMediaKeyIndex *)self initWithBytes:v7 bufferSize:16 uniquePrefixLength:a4];
}

- (VCMediaKeyIndex)initWithNSUUID:(id)a3
{
  return [(VCMediaKeyIndex *)self initWithNSUUID:a3 uniquePrefixLength:0];
}

- (void)dealloc
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2.receiver = self;
  v2.super_class = (Class)VCMediaKeyIndex;
  [(VCMediaKeyIndex *)&v2 dealloc];
}

+ (id)newMKIWithBytes:(char *)a3 bufferSize:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v6 = [VCMediaKeyIndex alloc];

  return [(VCMediaKeyIndex *)v6 initWithBytes:a3 bufferSize:v4];
}

- (unsigned)activeSize
{
  objc_sync_enter(self);
  unsigned int activeSize = self->_activeSize;
  objc_sync_exit(self);
  return activeSize;
}

- (void)setActiveSize:(unsigned int)a3
{
  objc_sync_enter(self);
  self->_unsigned int activeSize = a3;

  objc_sync_exit(self);
}

- (const)MKI
{
  return (const char *)self->_MKI;
}

- (id)description
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:self->_MKI];
  objc_sync_enter(self);
  uint64_t v4 = (void *)[NSString stringWithFormat:@"%@(%d):%zu", objc_msgSend(v3, "UUIDString"), self->_activeSize, self->_uniquePrefixLength];
  objc_sync_exit(self);

  return v4;
}

- (void)fullKeyBytes:(unsigned __int8)a3[16]
{
  objc_sync_enter(self);
  *(_OWORD *)a3 = *(_OWORD *)self->_MKI;

  objc_sync_exit(self);
}

+ (id)makeInvalidKey
{
  objc_super v2 = [[VCMediaKeyIndex alloc] initWithBytes:&invalidMKI bufferSize:16];

  return v2;
}

- (unint64_t)hash
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  if ([a3 isMemberOfClass:objc_opt_class()])
  {
    return VCMediaKeyIndex_isEqual((uint64_t)self, (uint64_t)a3);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaKeyIndex isEqual:]();
      }
    }
    return 0;
  }
}

- (BOOL)isStartingWithPrefix:(id)a3
{
  if ([a3 isMemberOfClass:objc_opt_class()])
  {
    return VCMediaKeyIndex_isStartingWithPrefix((uint64_t)self, (uint64_t)a3);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaKeyIndex isStartingWithPrefix:]();
      }
    }
    return 0;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_sync_enter(self);
  v5 = [+[VCMediaKeyIndex allocWithZone:a3] initWithUUID:self->_MKI];
  [(VCMediaKeyIndex *)v5 setActiveSize:self->_activeSize];
  [(VCMediaKeyIndex *)v5 setUniquePrefixLength:self->_uniquePrefixLength];
  objc_sync_exit(self);
  return v5;
}

- (unint64_t)uniquePrefixLength
{
  return self->_uniquePrefixLength;
}

- (void)setUniquePrefixLength:(unint64_t)a3
{
  self->_uniquePrefixLength = a3;
}

- (void)initWithBytes:bufferSize:uniquePrefixLength:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid parameters 'buffer' passed to the method", v2, v3, v4, v5, v6);
}

- (void)isEqual:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d keyToCompare is not of VCMediaKeyIndex class", v2, v3, v4, v5, v6);
}

- (void)isStartingWithPrefix:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d prefix is not of VCMediaKeyIndex class", v2, v3, v4, v5, v6);
}

@end