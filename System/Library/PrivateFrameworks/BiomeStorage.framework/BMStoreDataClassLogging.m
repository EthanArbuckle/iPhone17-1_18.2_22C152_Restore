@interface BMStoreDataClassLogging
+ (void)logClassNamed:(id)a3;
@end

@implementation BMStoreDataClassLogging

+ (void)logClassNamed:(id)a3
{
  v3 = (NSString *)a3;
  if (_os_feature_enabled_impl())
  {
    v4 = NSClassFromString(v3);
    if (![(NSString *)v3 hasPrefix:@"BM"]) {
      goto LABEL_6;
    }
    ImageName = class_getImageName(v4);
    if (!ImageName) {
      goto LABEL_6;
    }
    v6 = [NSString stringWithUTF8String:ImageName];
    v7 = [v6 lastPathComponent];

    if ([v7 isEqual:@"BiomeStreams"])
    {
LABEL_8:

      goto LABEL_9;
    }
    char v8 = [v7 hasPrefix:@"BiomeLibrary"];

    if ((v8 & 1) == 0)
    {
LABEL_6:
      v7 = __biome_log_for_category();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        +[BMStoreDataClassLogging logClassNamed:]((uint64_t)v3, v7);
      }
      goto LABEL_8;
    }
  }
LABEL_9:
}

+ (void)logClassNamed:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1AD076000, a2, OS_LOG_TYPE_FAULT, "Decoding event of class \"%@\"", (uint8_t *)&v2, 0xCu);
}

@end