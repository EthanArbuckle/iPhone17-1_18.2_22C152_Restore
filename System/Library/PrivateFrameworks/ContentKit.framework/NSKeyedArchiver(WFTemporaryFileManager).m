@interface NSKeyedArchiver(WFTemporaryFileManager)
+ (id)wf_securelyArchivedDataWithRootObject:()WFTemporaryFileManager;
+ (id)wf_securelyArchivedDataWithRootObject:()WFTemporaryFileManager deletionResponsibility:;
@end

@implementation NSKeyedArchiver(WFTemporaryFileManager)

+ (id)wf_securelyArchivedDataWithRootObject:()WFTemporaryFileManager deletionResponsibility:
{
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setDeletionResponsibility:a4];
  v8 = objc_msgSend(a1, "wf_securelyArchivedDataWithRootObject:fileCoder:", v6, v7);

  return v8;
}

+ (id)wf_securelyArchivedDataWithRootObject:()WFTemporaryFileManager
{
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = objc_msgSend(a1, "wf_securelyArchivedDataWithRootObject:fileCoder:", v4, v5);

  return v6;
}

@end