@interface OrgApacheLuceneUtilConstants
+ (void)initialize;
@end

@implementation OrgApacheLuceneUtilConstants

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id PropertyWithNSString = JavaLangSystem_getPropertyWithNSString_(@"java.vm.vendor");
    JreStrongAssign(&OrgApacheLuceneUtilConstants_JVM_VENDOR_, PropertyWithNSString);
    id v3 = JavaLangSystem_getPropertyWithNSString_(@"java.vm.version");
    JreStrongAssign(&OrgApacheLuceneUtilConstants_JVM_VERSION_, v3);
    id v4 = JavaLangSystem_getPropertyWithNSString_(@"java.vm.name");
    JreStrongAssign(&OrgApacheLuceneUtilConstants_JVM_NAME_, v4);
    id v5 = JavaLangSystem_getPropertyWithNSString_(@"java.specification.version");
    JreStrongAssign((id *)&OrgApacheLuceneUtilConstants_JVM_SPEC_VERSION_, v5);
    id v6 = JavaLangSystem_getPropertyWithNSString_(@"java.version");
    JreStrongAssign(&OrgApacheLuceneUtilConstants_JAVA_VERSION_, v6);
    id v7 = JavaLangSystem_getPropertyWithNSString_(@"os.name");
    JreStrongAssign((id *)&OrgApacheLuceneUtilConstants_OS_NAME_, v7);
    if (!OrgApacheLuceneUtilConstants_OS_NAME_) {
      goto LABEL_25;
    }
    OrgApacheLuceneUtilConstants_LINUX_ = [(id)OrgApacheLuceneUtilConstants_OS_NAME_ hasPrefix:@"Linux"];
    OrgApacheLuceneUtilConstants_WINDOWS_ = [(id)OrgApacheLuceneUtilConstants_OS_NAME_ hasPrefix:@"Windows"];
    OrgApacheLuceneUtilConstants_SUN_OS_ = [(id)OrgApacheLuceneUtilConstants_OS_NAME_ hasPrefix:@"SunOS"];
    OrgApacheLuceneUtilConstants_MAC_OS_X_ = [(id)OrgApacheLuceneUtilConstants_OS_NAME_ hasPrefix:@"Mac OS X"];
    OrgApacheLuceneUtilConstants_FREE_BSD_ = [(id)OrgApacheLuceneUtilConstants_OS_NAME_ hasPrefix:@"FreeBSD"];
    id v8 = JavaLangSystem_getPropertyWithNSString_(@"os.arch");
    JreStrongAssign((id *)&OrgApacheLuceneUtilConstants_OS_ARCH_, v8);
    id v9 = JavaLangSystem_getPropertyWithNSString_(@"os.version");
    JreStrongAssign(&OrgApacheLuceneUtilConstants_OS_VERSION_, v9);
    id v10 = JavaLangSystem_getPropertyWithNSString_(@"java.vendor");
    JreStrongAssign(&OrgApacheLuceneUtilConstants_JAVA_VENDOR_, v10);
    v11 = new_JavaUtilStringTokenizer_initWithNSString_withNSString_((void *)OrgApacheLuceneUtilConstants_JVM_SPEC_VERSION_, @".");
    id v12 = [(JavaUtilStringTokenizer *)v11 nextToken];
    dword_10055FCB8 = JavaLangInteger_parseIntWithNSString_(v12, v13, v14, v15, v16, v17, v18, v19);
    unsigned int v20 = [(JavaUtilStringTokenizer *)v11 hasMoreTokens];
    if (v20)
    {
      id v21 = [(JavaUtilStringTokenizer *)v11 nextToken];
      unsigned int v20 = JavaLangInteger_parseIntWithNSString_(v21, v22, v23, v24, v25, v26, v27, v28);
    }
    dword_10055FCBC = v20;
    id v29 = JavaLangSystem_getPropertyWithNSString_(@"sun.arch.data.model");
    if (v29) {
      unsigned __int8 v30 = [v29 contains:@"64"];
    }
    else {
      unsigned __int8 v30 = OrgApacheLuceneUtilConstants_OS_ARCH_
    }
         && ([(id)OrgApacheLuceneUtilConstants_OS_ARCH_ contains:@"64"] & 1) != 0;
    OrgApacheLuceneUtilConstants_JRE_IS_64BIT_ = v30;
    if (dword_10055FCB8 <= 1)
    {
      BOOL v32 = dword_10055FCB8 == 1;
      BOOL v31 = dword_10055FCBC > 7 && dword_10055FCB8 == 1;
      if (dword_10055FCBC <= 8) {
        BOOL v32 = 0;
      }
    }
    else
    {
      BOOL v31 = 1;
      BOOL v32 = 1;
    }
    OrgApacheLuceneUtilConstants_JRE_IS_MINIMUM_JAVA8_ = v31;
    OrgApacheLuceneUtilConstants_JRE_IS_MINIMUM_JAVA9_ = v32;
    if ((atomic_load_explicit(OrgApacheLuceneUtilVersion__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if (!OrgApacheLuceneUtilVersion_LATEST_) {
LABEL_25:
    }
      JreThrowNullPointerException();
    JreStrongAssign(&OrgApacheLuceneUtilConstants_LUCENE_MAIN_VERSION_, [(id)OrgApacheLuceneUtilVersion_LATEST_ description]);
    if ((atomic_load_explicit(OrgApacheLuceneUtilVersion__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    JreStrongAssign(&OrgApacheLuceneUtilConstants_LUCENE_VERSION_, [(id)OrgApacheLuceneUtilVersion_LATEST_ description]);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneUtilConstants__initialized);
  }
}

@end