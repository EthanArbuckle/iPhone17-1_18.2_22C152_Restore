@interface BRInterface
+ (id)interface;
+ (id)interfaces;
- (BOOL)disableStates:(id)a3 clearAsset:(BOOL)a4 error:(id *)a5;
- (BOOL)enableStates:(id)a3 error:(id *)a4;
- (BOOL)isReady;
- (BOOL)playState:(unint64_t)a3 forSpeed:(unint64_t)a4 error:(id *)a5;
- (BOOL)setConfigs:(id)a3 withAssets:(id)a4 forStates:(id)a5 error:(id *)a6;
- (BOOL)setGlobalConfigs:(id)a3 error:(id *)a4;
- (BRInterface)init;
- (OS_dispatch_queue)queue;
- (id)description;
- (id)propertyList;
- (unint64_t)maxAssetSlots;
- (unint64_t)unusedAssetSlots;
- (void)dealloc;
- (void)init;
- (void)timestampWithLabel:(id)a3;
@end

@implementation BRInterface

- (BRInterface)init
{
  v6.receiver = self;
  v6.super_class = (Class)BRInterface;
  v2 = [(BRInterface *)&v6 init];
  if (v2)
  {
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create(0, 0);
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v2->_timestampDict = v3;
    if (!v3)
    {
      v5 = _BRLog_log_3;
      if (!_BRLog_log_3)
      {
        v5 = os_log_create("com.apple.ButtonResolver", "default");
        _BRLog_log_3 = (uint64_t)v5;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[BRInterface init](v5);
      }

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BRInterface;
  [(BRInterface *)&v3 dealloc];
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)BRInterface;
  objc_super v3 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithString:", -[BRInterface description](&v7, sel_description));
  BOOL v4 = [(BRInterface *)self isReady];
  v5 = "N";
  if (v4) {
    v5 = "Y";
  }
  objc_msgSend(v3, "appendFormat:", @"IsReady: %s;\n", v5);
  objc_msgSend(v3, "appendFormat:", @"MaxSlots: %lu;\n", -[BRInterface maxAssetSlots](self, "maxAssetSlots"));
  objc_msgSend(v3, "appendFormat:", @"UnusedSlots: %lu;\n",
    [(BRInterface *)self unusedAssetSlots]);
  [v3 appendFormat:@"RecentActionTimestamps: %@;\n", self->_timestampDict];
  return v3;
}

- (id)propertyList
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  BOOL v4 = NSString;
  BOOL v5 = [(BRInterface *)self isReady];
  objc_super v6 = "N";
  if (v5) {
    objc_super v6 = "Y";
  }
  [v3 setObject:objc_msgSend(v4, "stringWithFormat:", @"%s;", v6), @"IsReady" forKey];
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BRInterface maxAssetSlots](self, "maxAssetSlots")), @"MaxSlots");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BRInterface unusedAssetSlots](self, "unusedAssetSlots")), @"UnusedSlots");
  [v3 setObject:self->_timestampDict forKey:@"RecentActionTimestamps"];
  return v3;
}

- (void)timestampWithLabel:(id)a3
{
  if (a3)
  {
    BOOL v5 = NSNumber;
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    uint64_t v6 = objc_msgSend(v5, "numberWithDouble:");
    timestampDict = self->_timestampDict;
    [(NSMutableDictionary *)timestampDict setObject:v6 forKeyedSubscript:a3];
  }
}

+ (id)interface
{
  return 0;
}

+ (id)interfaces
{
  v2 = (void *)[MEMORY[0x263EFF9C0] set];
  id v3 = +[BRInterfaceLegacy interface];
  id v4 = +[BRInterfaceKeyboard interface];
  id v5 = +[BRInterfaceAOP interface];
  if (v5)
  {
    id v6 = v5;
    [v3 setTapOnly:1];
    [v2 addObject:v6];
  }
  [v2 addObject:v3];
  [v2 addObject:v4];
  return v2;
}

- (BOOL)setGlobalConfigs:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  return 1;
}

- (BOOL)setConfigs:(id)a3 withAssets:(id)a4 forStates:(id)a5 error:(id *)a6
{
  if (a6) {
    *a6 = 0;
  }
  return 1;
}

- (BOOL)enableStates:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  return 1;
}

- (BOOL)disableStates:(id)a3 clearAsset:(BOOL)a4 error:(id *)a5
{
  if (a5) {
    *a5 = 0;
  }
  return 1;
}

- (BOOL)playState:(unint64_t)a3 forSpeed:(unint64_t)a4 error:(id *)a5
{
  if (a5) {
    *a5 = 0;
  }
  return 1;
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unint64_t)maxAssetSlots
{
  return self->_maxAssetSlots;
}

- (unint64_t)unusedAssetSlots
{
  return self->_unusedAssetSlots;
}

- (void)init
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[BRInterface init]";
  _os_log_error_impl(&dword_221782000, log, OS_LOG_TYPE_ERROR, "%s failed!", (uint8_t *)&v1, 0xCu);
}

@end