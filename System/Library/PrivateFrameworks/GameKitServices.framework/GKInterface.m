@interface GKInterface
+ (id)bsdNameForIndex:(id)a3;
+ (id)interfaceWithInterfaceIndex:(id)a3;
- (NSNumber)index;
- (NSString)bsdName;
- (NSString)type;
- (id)description;
- (unsigned)priority;
- (void)dealloc;
- (void)setBsdName:(id)a3;
- (void)setIndex:(id)a3;
- (void)setPriority:(unsigned int)a3;
- (void)setType:(id)a3;
@end

@implementation GKInterface

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GKInterface;
  [(GKInterface *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = [(NSNumber *)[(GKInterface *)self index] intValue];
  if ([(GKInterface *)self bsdName]) {
    v5 = [[(NSString *)[(GKInterface *)self bsdName] description] UTF8String];
  }
  else {
    v5 = "<nil>";
  }
  if ([(GKInterface *)self type]) {
    v6 = [[(NSString *)[(GKInterface *)self type] description] UTF8String];
  }
  else {
    v6 = "<nil>";
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", @"GKInterface [%p] index [%d] bsdName [%s] type [%s] priority [%d]", self, v4, v5, v6, -[GKInterface priority](self, "priority"));
}

+ (id)interfaceWithInterfaceIndex:(id)a3
{
  uint64_t v4 = objc_alloc_init(GKInterface);
  [(GKInterface *)v4 setIndex:a3];
  [(GKInterface *)v4 setBsdName:+[GKInterface bsdNameForIndex:a3]];
  return v4;
}

+ (id)bsdNameForIndex:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ((int)[a3 intValue] < 1) {
    return @"GKInterfaceBSDNameNone";
  }
  memset(v7, 170, sizeof(v7));
  if (if_indextoname([a3 intValue], v7)) {
    return (id)[NSString stringWithUTF8String:v7];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
      +[GKInterface bsdNameForIndex:v6];
    }
  }
  return 0;
}

- (NSNumber)index
{
  return self->_index;
}

- (void)setIndex:(id)a3
{
}

- (NSString)bsdName
{
  return self->_bsdName;
}

- (void)setBsdName:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (unsigned)priority
{
  return self->_priority;
}

- (void)setPriority:(unsigned int)a3
{
  self->_priority = a3;
}

+ (void)bsdNameForIndex:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  v7 = "+[GKInterface bsdNameForIndex:]";
  __int16 v8 = 1024;
  int v9 = 70;
  __int16 v10 = 1024;
  int v11 = [a2 intValue];
  _os_log_error_impl(&dword_221563000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d failed for interface index %d", (uint8_t *)&v4, 0x22u);
}

@end