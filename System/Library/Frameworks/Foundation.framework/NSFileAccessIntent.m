@interface NSFileAccessIntent
+ (NSFileAccessIntent)readingIntentWithURL:(NSURL *)url options:(NSFileCoordinatorReadingOptions)options;
+ (NSFileAccessIntent)writingIntentWithURL:(NSURL *)url options:(NSFileCoordinatorWritingOptions)options;
- (BOOL)isRead;
- (NSURL)URL;
- (id)description;
- (unint64_t)readingOptions;
- (unint64_t)writingOptions;
- (void)dealloc;
- (void)setURL:(id)a3;
@end

@implementation NSFileAccessIntent

+ (NSFileAccessIntent)writingIntentWithURL:(NSURL *)url options:(NSFileCoordinatorWritingOptions)options
{
  objc_opt_class();
  uint64_t v6 = objc_opt_new();
  *(void *)(v6 + 8) = url;
  *(void *)(v6 + 16) = options;
  *(unsigned char *)(v6 + 24) = 0;

  return (NSFileAccessIntent *)(id)v6;
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)writingOptions
{
  return self->_options;
}

- (BOOL)isRead
{
  return self->_isRead;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSFileAccessIntent;
  [(NSFileAccessIntent *)&v3 dealloc];
}

+ (NSFileAccessIntent)readingIntentWithURL:(NSURL *)url options:(NSFileCoordinatorReadingOptions)options
{
  objc_opt_class();
  uint64_t v6 = objc_opt_new();
  *(void *)(v6 + 8) = url;
  *(void *)(v6 + 16) = options;
  *(unsigned char *)(v6 + 24) = 1;

  return (NSFileAccessIntent *)(id)v6;
}

- (unint64_t)readingOptions
{
  return self->_options;
}

- (id)description
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSFileAccessIntent;
  id v3 = [(NSFileAccessIntent *)&v6 description];
  if (self->_isRead) {
    uint64_t v4 = @"Reading";
  }
  else {
    uint64_t v4 = @"Writing";
  }
  return +[NSString stringWithFormat:@"%@ %@ %@ with options: 0x%lx", v3, v4, self->_url, self->_options];
}

- (void)setURL:(id)a3
{
}

@end