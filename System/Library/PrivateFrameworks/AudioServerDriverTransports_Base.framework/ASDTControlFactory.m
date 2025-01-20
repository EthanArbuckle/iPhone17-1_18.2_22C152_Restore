@interface ASDTControlFactory
+ (id)controlForConfig:(id)a3 withDevice:(id)a4;
@end

@implementation ASDTControlFactory

+ (id)controlForConfig:(id)a3 withDevice:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (objc_class *)[v5 asdtSubclass];
  if ([(objc_class *)v7 isSubclassOfClass:objc_opt_class()]
    && ([(objc_class *)v7 conformsToProtocol:&unk_26FCB5378] & 1) != 0)
  {
    v8 = (void *)[[v7 alloc] initWithConfig:v5 withDevice:v6];
  }
  else
  {
    v9 = ASDTBaseLogType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[ASDTControlFactory controlForConfig:withDevice:]((uint64_t)v7, v9);
    }

    v8 = 0;
  }

  return v8;
}

+ (void)controlForConfig:(uint64_t)a1 withDevice:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2489BC000, a2, OS_LOG_TYPE_ERROR, "Invalid subclass of ASDControl: %@", (uint8_t *)&v2, 0xCu);
}

@end