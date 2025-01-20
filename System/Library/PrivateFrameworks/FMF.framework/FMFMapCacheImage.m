@interface FMFMapCacheImage
+ (BOOL)supportsSecureCoding;
- (FMFMapCacheImage)initWithCoder:(id)a3;
- (FMFMapCacheImage)initWithPath:(id)a3;
- (NSDate)timestamp;
- (NSString)path;
- (id)description;
- (int64_t)count;
- (void)boostPriority;
- (void)encodeWithCoder:(id)a3;
- (void)setCount:(int64_t)a3;
- (void)setPath:(id)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation FMFMapCacheImage

- (FMFMapCacheImage)initWithPath:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FMFMapCacheImage;
  v6 = [(FMFMapCacheImage *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_path, a3);
    uint64_t v8 = [MEMORY[0x263EFF910] date];
    timestamp = v7->_timestamp;
    v7->_timestamp = (NSDate *)v8;

    v7->_count = 1;
  }

  return v7;
}

- (FMFMapCacheImage)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FMFMapCacheImage;
  id v5 = [(FMFMapCacheImage *)&v13 init];
  if (!v5) {
    goto LABEL_8;
  }
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"path"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"count"];
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    uint64_t v11 = v8;
    [(FMFMapCacheImage *)v5 setPath:v6];
    [(FMFMapCacheImage *)v5 setTimestamp:v7];
    [(FMFMapCacheImage *)v5 setCount:v11];

LABEL_8:
    v10 = v5;
    goto LABEL_9;
  }

  v10 = 0;
LABEL_9:

  return v10;
}

- (void)boostPriority
{
  [(FMFMapCacheImage *)self setCount:[(FMFMapCacheImage *)self count] + 1];
  id v3 = [MEMORY[0x263EFF910] date];
  [(FMFMapCacheImage *)self setTimestamp:v3];
}

- (void)encodeWithCoder:(id)a3
{
  path = self->_path;
  id v5 = a3;
  [v5 encodeObject:path forKey:@"path"];
  [v5 encodeObject:self->_timestamp forKey:@"timestamp"];
  [v5 encodeInteger:self->_count forKey:@"count"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = NSString;
  int64_t v4 = [(FMFMapCacheImage *)self count];
  id v5 = [(FMFMapCacheImage *)self timestamp];
  v6 = [(FMFMapCacheImage *)self path];
  v7 = [v3 stringWithFormat:@"FMFMapCacheImage(0x%lX, count: %ld, timestamp: %@, path:%@)", self, v4, v5, v6];

  return v7;
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

@end