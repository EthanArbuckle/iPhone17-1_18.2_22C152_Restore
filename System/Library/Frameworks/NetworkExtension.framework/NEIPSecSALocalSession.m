@interface NEIPSecSALocalSession
- (BOOL)addLarvalSA:(id)a3;
- (NEIPSecSALocalSession)initWithName:(id)a3 delegate:(id)a4;
- (id)description;
@end

@implementation NEIPSecSALocalSession

- (BOOL)addLarvalSA:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  int v5 = [v4 spi];
  if (v5)
  {
    v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412546;
      v13 = self;
      __int16 v14 = 1024;
      unsigned int v15 = bswap32([v4 spi]);
      _os_log_error_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_ERROR, "%@ SPI is not 0, it is %X", (uint8_t *)&v12, 0x12u);
    }

    v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v12) = 0;
      _os_log_fault_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_FAULT, "SPI is not 0", (uint8_t *)&v12, 2u);
    }
  }
  else
  {
    uint32_t v8 = arc4random();
    if (v4) {
      v4[5] = v8;
    }
    if (self) {
      id Property = objc_getProperty(self, v9, 32, 1);
    }
    else {
      id Property = 0;
    }
    [Property addObject:v4];
  }

  return v5 == 0;
}

- (id)description
{
  id v3 = [NSString alloc];
  if (self) {
    unint64_t uniqueIndex = self->super._uniqueIndex;
  }
  else {
    unint64_t uniqueIndex = 0;
  }
  int v5 = [(NEIPSecSASession *)self name];
  v6 = (void *)[v3 initWithFormat:@"LocalSASession[%llu, %@]", uniqueIndex, v5];

  return v6;
}

- (NEIPSecSALocalSession)initWithName:(id)a3 delegate:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)NEIPSecSALocalSession;
  v4 = [(NEIPSecSASession *)&v10 initWithName:a3 delegate:a4];
  int v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    uint32_t v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_FAULT, "[super initWithName:delegate] failed", v9, 2u);
    }
  }
  return v5;
}

@end