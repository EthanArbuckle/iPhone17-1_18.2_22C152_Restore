@interface CDPWebAccessStateCache
+ (id)sharedInstance;
- (BOOL)isValid;
- (CDPWebAccessStateCache)init;
- (unint64_t)webAccessStatus;
- (void)setIsValid:(BOOL)a3;
- (void)setWebAccessStatus:(unint64_t)a3;
@end

@implementation CDPWebAccessStateCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_8);
  }
  v2 = (void *)sharedInstance_cache;
  return v2;
}

uint64_t __40__CDPWebAccessStateCache_sharedInstance__block_invoke()
{
  sharedInstance_cache = objc_alloc_init(CDPWebAccessStateCache);
  return MEMORY[0x270F9A758]();
}

- (CDPWebAccessStateCache)init
{
  v4.receiver = self;
  v4.super_class = (Class)CDPWebAccessStateCache;
  v2 = [(CDPWebAccessStateCache *)&v4 init];
  [(CDPWebAccessStateCache *)v2 setWebAccessStatus:0];
  return v2;
}

- (unint64_t)webAccessStatus
{
  return self->_webAccessStatus;
}

- (void)setWebAccessStatus:(unint64_t)a3
{
  self->_webAccessStatus = a3;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

@end