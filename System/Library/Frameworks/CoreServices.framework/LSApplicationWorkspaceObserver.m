@interface LSApplicationWorkspaceObserver
+ (BOOL)actuallyOverridesDMFObserverMethod;
+ (BOOL)supportsSecureCoding;
- (LSApplicationWorkspaceObserver)init;
- (LSApplicationWorkspaceObserver)initWithCoder:(id)a3;
- (NSUUID)uuid;
- (void)applicationIconDidChange:(id)a3;
- (void)applicationInstallsArePrioritized:(id)a3 arePaused:(id)a4;
- (void)applicationInstallsDidCancel:(id)a3;
- (void)applicationInstallsDidChange:(id)a3;
- (void)applicationInstallsDidPause:(id)a3;
- (void)applicationInstallsDidPrioritize:(id)a3;
- (void)applicationInstallsDidResume:(id)a3;
- (void)applicationInstallsDidStart:(id)a3;
- (void)applicationInstallsDidUpdateIcon:(id)a3;
- (void)applicationStateDidChange:(id)a3;
- (void)applicationsDidChangePersonas:(id)a3;
- (void)applicationsDidFailToInstall:(id)a3;
- (void)applicationsDidFailToUninstall:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)applicationsWillInstall:(id)a3;
- (void)applicationsWillUninstall:(id)a3;
- (void)deviceManagementPolicyDidChange:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)networkUsageChanged:(BOOL)a3;
- (void)setUuid:(id)a3;
@end

@implementation LSApplicationWorkspaceObserver

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LSApplicationWorkspaceObserver *)self uuid];
  [v4 encodeObject:v5 forKey:@"uuid"];
}

- (LSApplicationWorkspaceObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)LSApplicationWorkspaceObserver;
  v2 = [(LSApplicationWorkspaceObserver *)&v6 init];
  if (v2)
  {
    v3 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    uuid = v2->_uuid;
    v2->_uuid = v3;
  }
  return v2;
}

- (LSApplicationWorkspaceObserver)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LSApplicationWorkspaceObserver;
  id v5 = [(LSApplicationWorkspaceObserver *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"uuid");
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;
  }
  return v5;
}

- (void)applicationInstallsDidStart:(id)a3
{
  id v3 = a3;
  id v4 = _LSInstallLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationInstallsDidStart:]();
  }
}

- (void)applicationInstallsDidChange:(id)a3
{
  id v3 = a3;
  id v4 = _LSInstallLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationInstallsDidChange:]();
  }
}

- (void)applicationInstallsDidUpdateIcon:(id)a3
{
  id v3 = a3;
  id v4 = _LSInstallLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationInstallsDidUpdateIcon:]();
  }
}

- (void)applicationsDidInstall:(id)a3
{
  id v3 = a3;
  id v4 = _LSInstallLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationsDidInstall:]();
  }
}

- (void)applicationsWillInstall:(id)a3
{
  id v3 = a3;
  id v4 = _LSInstallLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationsWillInstall:]();
  }
}

- (void)applicationsWillUninstall:(id)a3
{
  id v3 = a3;
  id v4 = _LSInstallLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationsWillUninstall:]();
  }
}

- (void)applicationsDidFailToInstall:(id)a3
{
  id v3 = a3;
  id v4 = _LSInstallLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationsDidFailToInstall:]();
  }
}

- (void)applicationsDidFailToUninstall:(id)a3
{
  id v3 = a3;
  id v4 = _LSInstallLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationsDidFailToUninstall:]();
  }
}

- (void)applicationsDidUninstall:(id)a3
{
  id v3 = a3;
  id v4 = _LSInstallLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationsDidUninstall:]();
  }
}

- (void)applicationInstallsArePrioritized:(id)a3 arePaused:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = _LSInstallLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationInstallsArePrioritized:arePaused:](v5);
  }

  v8 = _LSInstallLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationInstallsArePrioritized:arePaused:](v6);
  }
}

- (void)applicationInstallsDidPause:(id)a3
{
  id v3 = a3;
  id v4 = _LSInstallLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationInstallsDidPause:]();
  }
}

- (void)applicationInstallsDidResume:(id)a3
{
  id v3 = a3;
  id v4 = _LSInstallLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationInstallsDidResume:]();
  }
}

- (void)applicationInstallsDidCancel:(id)a3
{
  id v3 = a3;
  id v4 = _LSInstallLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationInstallsDidCancel:]();
  }
}

- (void)applicationInstallsDidPrioritize:(id)a3
{
  id v3 = a3;
  id v4 = _LSInstallLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationInstallsDidPrioritize:]();
  }
}

- (void)applicationStateDidChange:(id)a3
{
  id v3 = a3;
  id v4 = _LSInstallLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationStateDidChange:]();
  }
}

- (void)applicationIconDidChange:(id)a3
{
  id v3 = a3;
  id v4 = _LSInstallLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationIconDidChange:]();
  }
}

- (void)networkUsageChanged:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = _LSInstallLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver networkUsageChanged:](v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)deviceManagementPolicyDidChange:(id)a3
{
  id v3 = a3;
  id v4 = _LSInstallLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver deviceManagementPolicyDidChange:]();
  }
}

+ (BOOL)actuallyOverridesDMFObserverMethod
{
  if ((id)objc_opt_class() == a1) {
    return 0;
  }
  id v3 = (objc_class *)objc_opt_class();
  IMP MethodImplementation = class_getMethodImplementation(v3, sel_deviceManagementPolicyDidChange_);
  return MethodImplementation != class_getMethodImplementation((Class)a1, sel_deviceManagementPolicyDidChange_);
}

- (void)applicationsDidChangePersonas:(id)a3
{
  id v3 = a3;
  id v4 = _LSInstallLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationsDidChangePersonas:]();
  }
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)applicationInstallsDidStart:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_182959000, v0, v1, "LSApplicationWorkspaceObserver applicationInstallsDidStart %@", v2, v3, v4, v5, v6);
}

- (void)applicationInstallsDidChange:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_182959000, v0, v1, "LSApplicationWorkspaceObserver applicationInstallsDidChange %@", v2, v3, v4, v5, v6);
}

- (void)applicationInstallsDidUpdateIcon:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_182959000, v0, v1, "LSApplicationWorkspaceObserver applicationInstallsDidUpdateIcon %@", v2, v3, v4, v5, v6);
}

- (void)applicationsDidInstall:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_182959000, v0, v1, "LSApplicationWorkspaceObserver applicationsDidInstall %@", v2, v3, v4, v5, v6);
}

- (void)applicationsWillInstall:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_182959000, v0, v1, "LSApplicationWorkspaceObserver applicationsWillInstall %@", v2, v3, v4, v5, v6);
}

- (void)applicationsWillUninstall:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_182959000, v0, v1, "LSApplicationWorkspaceObserver applicationsWillUninstall %@", v2, v3, v4, v5, v6);
}

- (void)applicationsDidFailToInstall:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_182959000, v0, v1, "LSApplicationWorkspaceObserver applicationsDidFailToInstall %@", v2, v3, v4, v5, v6);
}

- (void)applicationsDidFailToUninstall:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_182959000, v0, v1, "LSApplicationWorkspaceObserver applicationsDidFailToUninstall %@", v2, v3, v4, v5, v6);
}

- (void)applicationsDidUninstall:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_182959000, v0, v1, "LSApplicationWorkspaceObserver applicationsDidUninstall %@", v2, v3, v4, v5, v6);
}

- (void)applicationInstallsArePrioritized:(void *)a1 arePaused:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_3_1(&dword_182959000, v1, v2, "Currently %d paused installs: %@", v3, v4, v5, v6, v7);
}

- (void)applicationInstallsArePrioritized:(void *)a1 arePaused:.cold.2(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_3_1(&dword_182959000, v1, v2, "Currently %d prioritized installs: %@", v3, v4, v5, v6, v7);
}

- (void)applicationInstallsDidPause:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_182959000, v0, v1, "LSApplicationWorkspaceObserver applicationInstallsDidPause %@", v2, v3, v4, v5, v6);
}

- (void)applicationInstallsDidResume:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_182959000, v0, v1, "LSApplicationWorkspaceObserver applicationInstallsDidResume %@", v2, v3, v4, v5, v6);
}

- (void)applicationInstallsDidCancel:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_182959000, v0, v1, "LSApplicationWorkspaceObserver applicationInstallsDidCancel %@", v2, v3, v4, v5, v6);
}

- (void)applicationInstallsDidPrioritize:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_182959000, v0, v1, "LSApplicationWorkspaceObserver applicationInstallsDidPrioritize %@", v2, v3, v4, v5, v6);
}

- (void)applicationStateDidChange:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_182959000, v0, v1, "LSApplicationWorkspaceObserver applicationStateDidChange %@", v2, v3, v4, v5, v6);
}

- (void)applicationIconDidChange:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_182959000, v0, v1, "LSApplicationWorkspaceObserver applicationIconDidChange %@", v2, v3, v4, v5, v6);
}

- (void)networkUsageChanged:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)deviceManagementPolicyDidChange:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_182959000, v0, v1, "LSApplicationWorkspaceObserver deviceManagementPolicyDidChange %@", v2, v3, v4, v5, v6);
}

- (void)applicationsDidChangePersonas:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_182959000, v0, v1, "LSApplicationWorkspaceObserver applicationsDidChangePersonas %@", v2, v3, v4, v5, v6);
}

@end