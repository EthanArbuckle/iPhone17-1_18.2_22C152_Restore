@interface DNCPoolEntry
- (DNCPoolEntry)initWithDNC:(id)a3 cacheKey:(unsigned int)a4;
- (DirNameCache)dnc;
- (NSDate)timestamp;
- (unsigned)cacheKey;
- (void)setCacheKey:(unsigned int)a3;
- (void)setDnc:(id)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation DNCPoolEntry

- (DNCPoolEntry)initWithDNC:(id)a3 cacheKey:(unsigned int)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DNCPoolEntry;
  v8 = [(DNCPoolEntry *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_dnc, a3);
    v9->_cacheKey = a4;
  }

  return v9;
}

- (unsigned)cacheKey
{
  return self->_cacheKey;
}

- (void)setCacheKey:(unsigned int)a3
{
  self->_cacheKey = a3;
}

- (DirNameCache)dnc
{
  return (DirNameCache *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDnc:(id)a3
{
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);

  objc_storeStrong((id *)&self->_dnc, 0);
}

@end