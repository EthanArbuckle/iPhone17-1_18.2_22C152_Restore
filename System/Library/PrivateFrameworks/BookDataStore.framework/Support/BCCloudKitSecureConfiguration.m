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
  v2 = objc_alloc_init(BCCloudKitSecureConfiguration);
  [(BCCloudKitSecureConfiguration *)v2 setQueueIdentifier:@"com.apple.iBooks.SecureCloudKitController"];
  [(BCCloudKitSecureConfiguration *)v2 setContainerIdentifier:@"com.apple.iBooks.secureData"];
  CFStringRef v7 = @"SecureUserDataZone";
  v3 = +[NSArray arrayWithObjects:&v7 count:1];
  [(BCCloudKitSecureConfiguration *)v2 setAppZones:v3];

  CFStringRef v6 = @"SecureUserDataZone";
  v4 = +[NSArray arrayWithObjects:&v6 count:1];
  [(BCCloudKitSecureConfiguration *)v2 setServiceZones:v4];

  [(BCCloudKitSecureConfiguration *)v2 setDbArchiveFolderName:@"BCCloudKit-BookDataStoreServiceSecure"];
  [(BCCloudKitSecureConfiguration *)v2 setDbArchiveExtension:@"bcck"];
  [(BCCloudKitSecureConfiguration *)v2 setDbArchiveFilename:@"BCPrivateDatabaseSecure"];
  [(BCCloudKitSecureConfiguration *)v2 setDbSubscriptionID:@"com.apple.iBooks.BCCloudKitSecure"];
  [(BCCloudKitSecureConfiguration *)v2 setAppBundleIdentifier:@"com.apple.iBooks"];
  [(BCCloudKitSecureConfiguration *)v2 setRequiresDeviceToDeviceEncryption:1];
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