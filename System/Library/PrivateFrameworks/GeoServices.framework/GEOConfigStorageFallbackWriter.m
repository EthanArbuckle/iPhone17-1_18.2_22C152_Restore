@interface GEOConfigStorageFallbackWriter
- (GEOConfigStorageFallbackWriter)initWithStorage:(id)a3 writer:(id)a4;
- (void)setConfigValue:(id)a3 forKey:(id)a4 options:(unint64_t)a5 synchronous:(BOOL)a6;
@end

@implementation GEOConfigStorageFallbackWriter

- (GEOConfigStorageFallbackWriter)initWithStorage:(id)a3 writer:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GEOConfigStorageFallbackWriter;
  v8 = [(GEOConfigStorageFallbackReader *)&v11 initWithStorage:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_writer, a4);
  }

  return v9;
}

- (void)setConfigValue:(id)a3 forKey:(id)a4 options:(unint64_t)a5 synchronous:(BOOL)a6
{
}

- (void).cxx_destruct
{
}

@end