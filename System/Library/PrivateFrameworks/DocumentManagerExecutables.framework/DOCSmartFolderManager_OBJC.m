@interface DOCSmartFolderManager_OBJC
+ (id)sharedManager;
- (_TtC26DocumentManagerExecutables21DOCSmartFolderManager)underlyingSmartFolderManager;
- (void)setUnderlyingSmartFolderManager:(id)a3;
@end

@implementation DOCSmartFolderManager_OBJC

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedManager__sharedManager;

  return v2;
}

- (_TtC26DocumentManagerExecutables21DOCSmartFolderManager)underlyingSmartFolderManager
{
  return self->_underlyingSmartFolderManager;
}

- (void)setUnderlyingSmartFolderManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end