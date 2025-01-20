@interface BRZombie
+ (void)turnObjectIntoZombie:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)dealloc;
@end

@implementation BRZombie

- (void)dealloc
{
  AssociatedObject = (objc_class *)objc_getAssociatedObject(self, "BRZombieFormerClass");
  objc_setAssociatedObject(self, "BRZombieDescription", 0, (void *)0x301);
  objc_setAssociatedObject(self, "BRZombieFormerClass", 0, 0);

  object_setClass(self, AssociatedObject);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id AssociatedObject = objc_getAssociatedObject(self, "BRZombieDescription");
  id v6 = objc_getAssociatedObject(self, "BRZombieFormerClass");
  v7 = brc_bread_crumbs((uint64_t)"-[BRZombie methodSignatureForSelector:]", 46);
  v8 = brc_default_log(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    int v10 = 136315906;
    ClassName = object_getClassName(v6);
    __int16 v12 = 2080;
    v13 = [NSStringFromSelector(a3) UTF8String];
    __int16 v14 = 2080;
    uint64_t v15 = [AssociatedObject UTF8String];
    __int16 v16 = 2112;
    v17 = v7;
    _os_log_fault_impl(&dword_19ED3F000, v8, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: *** -[%s %s]: message sent to deallocated instance %s%@", (uint8_t *)&v10, 0x2Au);
  }
  return (id)[v6 instanceMethodSignatureForSelector:a3];
}

+ (void)turnObjectIntoZombie:(id)a3
{
  if (a3)
  {
    v4 = objc_opt_class();
    v5 = (void *)[NSString stringWithFormat:@"<%@:%p (old description: %@)>", v4, a3, a3];
    objc_setAssociatedObject(a3, "BRZombieDescription", v5, (void *)0x301);
    objc_setAssociatedObject(a3, "BRZombieFormerClass", v4, 0);
    id v6 = (objc_class *)objc_opt_class();
    object_setClass(a3, v6);
    v7 = brc_bread_crumbs((uint64_t)"+[BRZombie turnObjectIntoZombie:]", 72);
    v8 = brc_default_log(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[BRZombie turnObjectIntoZombie:v8];
    }
  }
}

+ (void)turnObjectIntoZombie:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_19ED3F000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Turned object into a zombie - %@\n%@", (uint8_t *)&v3, 0x16u);
}

@end