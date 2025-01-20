@interface ConfigChangeLogs
+ (id)configChangeLogFiles;
+ (id)configChangeLogFilesIncludingAllKeys:(BOOL)a3 orSpecificKeys:(id)a4;
+ (int)writeConfigChangeLog:(_BaseStation *)a3;
@end

@implementation ConfigChangeLogs

+ (id)configChangeLogFiles
{
  return (id)MEMORY[0x270F9A6D0](ConfigChangeLogs, sel_configChangeLogFilesIncludingAllKeys_orSpecificKeys_, 0);
}

+ (id)configChangeLogFilesIncludingAllKeys:(BOOL)a3 orSpecificKeys:(id)a4
{
  return (id)objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, a3, a4);
}

+ (int)writeConfigChangeLog:(_BaseStation *)a3
{
  if (a3) {
    return 0;
  }
  else {
    return -6705;
  }
}

@end