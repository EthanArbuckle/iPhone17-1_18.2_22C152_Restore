@interface LACKeyBagProvider
+ (LACKeyBagProvider)sharedInstance;
- (LACKeyBagProvider)init;
- (id)keybagForUserId:(unsigned int)a3;
@end

@implementation LACKeyBagProvider

- (LACKeyBagProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)LACKeyBagProvider;
  v2 = [(LACKeyBagProvider *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    userKeybags = v2->_userKeybags;
    v2->_userKeybags = v3;
  }
  return v2;
}

+ (LACKeyBagProvider)sharedInstance
{
  if (sharedInstance_onceToken_8 != -1) {
    dispatch_once(&sharedInstance_onceToken_8, &__block_literal_global_14);
  }
  v2 = (void *)sharedInstance_sharedInstance_7;
  return (LACKeyBagProvider *)v2;
}

uint64_t __35__LACKeyBagProvider_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_7 = objc_alloc_init(LACKeyBagProvider);
  return MEMORY[0x270F9A758]();
}

- (id)keybagForUserId:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  userKeybags = self->_userKeybags;
  objc_super v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  v7 = [(NSMutableDictionary *)userKeybags objectForKeyedSubscript:v6];

  if (!v7)
  {
    v7 = [[LACKeyBagMKBAdapter alloc] initWithUserId:v3];
    v8 = self->_userKeybags;
    v9 = [NSNumber numberWithUnsignedInt:v3];
    [(NSMutableDictionary *)v8 setObject:v7 forKeyedSubscript:v9];
  }
  return v7;
}

- (void).cxx_destruct
{
}

@end