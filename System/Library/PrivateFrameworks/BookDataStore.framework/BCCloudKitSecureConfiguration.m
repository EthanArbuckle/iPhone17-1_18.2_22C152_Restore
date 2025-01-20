@interface BCCloudKitSecureConfiguration
+ (id)configuration;
- (BOOL)requiresDeviceToDeviceEncryption;
- (BOOL)shouldArchiveData:(id)a3;
- (BOOL)shouldPerformDatabaseSubscriptionForServiceMode:(BOOL)a3;
- (NSArray)appZones;
- (NSArray)serviceZones;
- (NSString)appBundleIdentifier;
- (NSString)containerIdentifier;
- (NSString)dbArchiveExtension;
- (NSString)dbArchiveFilename;
- (NSString)dbArchiveFolderName;
- (NSString)dbSubscriptionID;
- (NSString)queueIdentifier;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setAppZones:(id)a3;
- (void)setContainerIdentifier:(id)a3;
- (void)setDbArchiveExtension:(id)a3;
- (void)setDbArchiveFilename:(id)a3;
- (void)setDbArchiveFolderName:(id)a3;
- (void)setDbSubscriptionID:(id)a3;
- (void)setQueueIdentifier:(id)a3;
- (void)setRequiresDeviceToDeviceEncryption:(BOOL)a3;
- (void)setServiceZones:(id)a3;
@end

@implementation BCCloudKitSecureConfiguration

+ (id)configuration
{
  v77[1] = *MEMORY[0x263EF8340];
  v2 = objc_alloc_init(BCCloudKitSecureConfiguration);
  objc_msgSend_setQueueIdentifier_(v2, v3, @"com.apple.iBooks.SecureCloudKitController", v4, v5, v6, v7, v8);
  objc_msgSend_setContainerIdentifier_(v2, v9, @"com.apple.iBooks.secureData", v10, v11, v12, v13, v14);
  v77[0] = @"SecureUserDataZone";
  v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v15, (uint64_t)v77, 1, v16, v17, v18, v19);
  objc_msgSend_setAppZones_(v2, v21, (uint64_t)v20, v22, v23, v24, v25, v26);

  v76 = @"SecureUserDataZone";
  v32 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v27, (uint64_t)&v76, 1, v28, v29, v30, v31);
  objc_msgSend_setServiceZones_(v2, v33, (uint64_t)v32, v34, v35, v36, v37, v38);

  objc_msgSend_setDbArchiveFolderName_(v2, v39, @"BCCloudKit-iBooksSecure", v40, v41, v42, v43, v44);
  objc_msgSend_setDbArchiveExtension_(v2, v45, @"bcck", v46, v47, v48, v49, v50);
  objc_msgSend_setDbArchiveFilename_(v2, v51, @"BCPrivateDatabaseSecure", v52, v53, v54, v55, v56);
  objc_msgSend_setDbSubscriptionID_(v2, v57, @"com.apple.iBooks.BCCloudKitSecure", v58, v59, v60, v61, v62);
  objc_msgSend_setAppBundleIdentifier_(v2, v63, @"com.apple.iBooks", v64, v65, v66, v67, v68);
  objc_msgSend_setRequiresDeviceToDeviceEncryption_(v2, v69, 1, v70, v71, v72, v73, v74);
  return v2;
}

- (BOOL)shouldArchiveData:(id)a3
{
  return 1;
}

- (BOOL)shouldPerformDatabaseSubscriptionForServiceMode:(BOOL)a3
{
  return !a3;
}

- (NSString)queueIdentifier
{
  return self->_queueIdentifier;
}

- (void)setQueueIdentifier:(id)a3
{
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
}

- (NSArray)appZones
{
  return self->_appZones;
}

- (void)setAppZones:(id)a3
{
}

- (NSArray)serviceZones
{
  return self->_serviceZones;
}

- (void)setServiceZones:(id)a3
{
}

- (NSString)dbArchiveFolderName
{
  return self->_dbArchiveFolderName;
}

- (void)setDbArchiveFolderName:(id)a3
{
}

- (NSString)dbArchiveExtension
{
  return self->_dbArchiveExtension;
}

- (void)setDbArchiveExtension:(id)a3
{
}

- (NSString)dbArchiveFilename
{
  return self->_dbArchiveFilename;
}

- (void)setDbArchiveFilename:(id)a3
{
}

- (NSString)dbSubscriptionID
{
  return self->_dbSubscriptionID;
}

- (void)setDbSubscriptionID:(id)a3
{
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
}

- (BOOL)requiresDeviceToDeviceEncryption
{
  return self->_requiresDeviceToDeviceEncryption;
}

- (void)setRequiresDeviceToDeviceEncryption:(BOOL)a3
{
  self->_requiresDeviceToDeviceEncryption = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_dbSubscriptionID, 0);
  objc_storeStrong((id *)&self->_dbArchiveFilename, 0);
  objc_storeStrong((id *)&self->_dbArchiveExtension, 0);
  objc_storeStrong((id *)&self->_dbArchiveFolderName, 0);
  objc_storeStrong((id *)&self->_serviceZones, 0);
  objc_storeStrong((id *)&self->_appZones, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_queueIdentifier, 0);
}

@end