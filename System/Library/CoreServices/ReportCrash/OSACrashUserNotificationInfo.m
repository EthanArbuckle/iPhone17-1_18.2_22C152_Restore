@interface OSACrashUserNotificationInfo
- (BOOL)allowRelaunch;
- (BOOL)isBeta;
- (BOOL)isCSKillFromAppStore;
- (BOOL)isUserMissingLibrary;
- (BOOL)urgentSubmission;
- (NSString)bundleVersion;
- (NSString)faultingImage;
- (NSString)pluginName;
- (NSString)procName;
- (NSString)procPath;
- (NSString)reportPath;
- (NSString)visibleName;
- (NSURL)bundleURL;
- (void)setAllowRelaunch:(BOOL)a3;
- (void)setBundleURL:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setFaultingImage:(id)a3;
- (void)setIsBeta:(BOOL)a3;
- (void)setIsCSKillFromAppStore:(BOOL)a3;
- (void)setIsUserMissingLibrary:(BOOL)a3;
- (void)setPluginName:(id)a3;
- (void)setProcName:(id)a3;
- (void)setProcPath:(id)a3;
- (void)setReportPath:(id)a3;
- (void)setUrgentSubmission:(BOOL)a3;
- (void)setVisibleName:(id)a3;
@end

@implementation OSACrashUserNotificationInfo

- (NSString)visibleName
{
  return self->_visibleName;
}

- (void)setVisibleName:(id)a3
{
}

- (NSString)procName
{
  return self->_procName;
}

- (void)setProcName:(id)a3
{
}

- (NSString)procPath
{
  return self->_procPath;
}

- (void)setProcPath:(id)a3
{
}

- (NSString)pluginName
{
  return self->_pluginName;
}

- (void)setPluginName:(id)a3
{
}

- (NSString)reportPath
{
  return self->_reportPath;
}

- (void)setReportPath:(id)a3
{
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
}

- (NSString)faultingImage
{
  return self->_faultingImage;
}

- (void)setFaultingImage:(id)a3
{
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (void)setBundleURL:(id)a3
{
}

- (BOOL)isUserMissingLibrary
{
  return self->_isUserMissingLibrary;
}

- (void)setIsUserMissingLibrary:(BOOL)a3
{
  self->_isUserMissingLibrary = a3;
}

- (BOOL)isCSKillFromAppStore
{
  return self->_isCSKillFromAppStore;
}

- (void)setIsCSKillFromAppStore:(BOOL)a3
{
  self->_isCSKillFromAppStore = a3;
}

- (BOOL)isBeta
{
  return self->_isBeta;
}

- (void)setIsBeta:(BOOL)a3
{
  self->_isBeta = a3;
}

- (BOOL)urgentSubmission
{
  return self->_urgentSubmission;
}

- (void)setUrgentSubmission:(BOOL)a3
{
  self->_urgentSubmission = a3;
}

- (BOOL)allowRelaunch
{
  return self->_allowRelaunch;
}

- (void)setAllowRelaunch:(BOOL)a3
{
  self->_allowRelaunch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_faultingImage, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_reportPath, 0);
  objc_storeStrong((id *)&self->_pluginName, 0);
  objc_storeStrong((id *)&self->_procPath, 0);
  objc_storeStrong((id *)&self->_procName, 0);

  objc_storeStrong((id *)&self->_visibleName, 0);
}

@end