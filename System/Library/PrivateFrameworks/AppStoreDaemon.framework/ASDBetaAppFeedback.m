@interface ASDBetaAppFeedback
+ (BOOL)supportsSecureCoding;
- (ASDBetaAppFeedback)initWithCoder:(id)a3;
- (ASDBetaAppVersion)appVersion;
- (NSArray)imagesData;
- (NSString)architecture;
- (NSString)bundleID;
- (NSString)carrier;
- (NSString)cellularNetworkType;
- (NSString)comments;
- (NSString)deviceType;
- (NSString)email;
- (NSString)incidentID;
- (NSString)locale;
- (NSString)networkConnectionType;
- (NSString)osVersion;
- (NSString)pairedWatchModel;
- (NSString)pairedWatchOSVersion;
- (NSString)timeZone;
- (unint64_t)appUptime;
- (unint64_t)diskAvailable;
- (unint64_t)diskTotal;
- (unint64_t)timestamp;
- (unsigned)batteryPercentage;
- (unsigned)screenHeight;
- (unsigned)screenWidth;
- (void)encodeWithCoder:(id)a3;
- (void)setAppUptime:(unint64_t)a3;
- (void)setAppVersion:(id)a3;
- (void)setArchitecture:(id)a3;
- (void)setBatteryPercentage:(unsigned int)a3;
- (void)setBundleID:(id)a3;
- (void)setCarrier:(id)a3;
- (void)setCellularNetworkType:(id)a3;
- (void)setComments:(id)a3;
- (void)setDeviceType:(id)a3;
- (void)setDiskAvailable:(unint64_t)a3;
- (void)setDiskTotal:(unint64_t)a3;
- (void)setEmail:(id)a3;
- (void)setImagesData:(id)a3;
- (void)setIncidentID:(id)a3;
- (void)setLocale:(id)a3;
- (void)setNetworkConnectionType:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)setPairedWatchModel:(id)a3;
- (void)setPairedWatchOSVersion:(id)a3;
- (void)setScreenHeight:(unsigned int)a3;
- (void)setScreenWidth:(unsigned int)a3;
- (void)setTimeZone:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation ASDBetaAppFeedback

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  comments = self->_comments;
  id v5 = a3;
  [v5 encodeObject:comments forKey:@"A"];
  [v5 encodeObject:self->_email forKey:@"B"];
  [v5 encodeObject:self->_imagesData forKey:@"C"];
  [v5 encodeObject:self->_incidentID forKey:@"D"];
  [v5 encodeInt64:self->_timestamp forKey:@"E"];
  [v5 encodeObject:self->_bundleID forKey:@"F"];
  [v5 encodeInt64:self->_appUptime forKey:@"H"];
  [v5 encodeObject:self->_appVersion forKey:@"I"];
  [v5 encodeObject:self->_pairedWatchModel forKey:@"J"];
  [v5 encodeObject:self->_pairedWatchOSVersion forKey:@"K"];
  [v5 encodeObject:self->_architecture forKey:@"L"];
  [v5 encodeInt32:self->_batteryPercentage forKey:@"M"];
  [v5 encodeObject:self->_carrier forKey:@"N"];
  [v5 encodeObject:self->_cellularNetworkType forKey:@"O"];
  [v5 encodeObject:self->_deviceType forKey:@"P"];
  [v5 encodeInt64:self->_diskAvailable forKey:@"Q"];
  [v5 encodeInt64:self->_diskTotal forKey:@"R"];
  [v5 encodeObject:self->_locale forKey:@"S"];
  [v5 encodeObject:self->_networkConnectionType forKey:@"T"];
  [v5 encodeObject:self->_osVersion forKey:@"U"];
  [v5 encodeInt32:self->_screenHeight forKey:@"V"];
  [v5 encodeInt32:self->_screenWidth forKey:@"W"];
  [v5 encodeObject:self->_timeZone forKey:@"X"];
}

- (ASDBetaAppFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)ASDBetaAppFeedback;
  id v5 = [(ASDBetaAppFeedback *)&v42 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"A"];
    comments = v5->_comments;
    v5->_comments = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"B"];
    email = v5->_email;
    v5->_email = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"C"];
    imagesData = v5->_imagesData;
    v5->_imagesData = (NSArray *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"D"];
    incidentID = v5->_incidentID;
    v5->_incidentID = (NSString *)v15;

    v5->_timestamp = [v4 decodeInt64ForKey:@"E"];
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"F"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v17;

    v5->_appUptime = [v4 decodeInt64ForKey:@"H"];
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"I"];
    appVersion = v5->_appVersion;
    v5->_appVersion = (ASDBetaAppVersion *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"J"];
    pairedWatchModel = v5->_pairedWatchModel;
    v5->_pairedWatchModel = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"K"];
    pairedWatchOSVersion = v5->_pairedWatchOSVersion;
    v5->_pairedWatchOSVersion = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"L"];
    architecture = v5->_architecture;
    v5->_architecture = (NSString *)v25;

    v5->_batteryPercentage = [v4 decodeInt32ForKey:@"M"];
    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"N"];
    carrier = v5->_carrier;
    v5->_carrier = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"O"];
    cellularNetworkType = v5->_cellularNetworkType;
    v5->_cellularNetworkType = (NSString *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"P"];
    deviceType = v5->_deviceType;
    v5->_deviceType = (NSString *)v31;

    v5->_diskAvailable = [v4 decodeInt64ForKey:@"Q"];
    v5->_diskTotal = [v4 decodeInt64ForKey:@"R"];
    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"S"];
    locale = v5->_locale;
    v5->_locale = (NSString *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"T"];
    networkConnectionType = v5->_networkConnectionType;
    v5->_networkConnectionType = (NSString *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"U"];
    osVersion = v5->_osVersion;
    v5->_osVersion = (NSString *)v37;

    v5->_screenHeight = [v4 decodeInt32ForKey:@"V"];
    v5->_screenWidth = [v4 decodeInt32ForKey:@"W"];
    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"X"];
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSString *)v39;
  }
  return v5;
}

- (NSString)comments
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setComments:(id)a3
{
}

- (NSString)email
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEmail:(id)a3
{
}

- (NSArray)imagesData
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setImagesData:(id)a3
{
}

- (NSString)incidentID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIncidentID:(id)a3
{
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (unint64_t)appUptime
{
  return self->_appUptime;
}

- (void)setAppUptime:(unint64_t)a3
{
  self->_appUptime = a3;
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBundleID:(id)a3
{
}

- (NSString)pairedWatchModel
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPairedWatchModel:(id)a3
{
}

- (NSString)pairedWatchOSVersion
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPairedWatchOSVersion:(id)a3
{
}

- (NSString)architecture
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setArchitecture:(id)a3
{
}

- (unsigned)batteryPercentage
{
  return self->_batteryPercentage;
}

- (void)setBatteryPercentage:(unsigned int)a3
{
  self->_batteryPercentage = a3;
}

- (NSString)carrier
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCarrier:(id)a3
{
}

- (NSString)cellularNetworkType
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCellularNetworkType:(id)a3
{
}

- (NSString)deviceType
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDeviceType:(id)a3
{
}

- (unint64_t)diskAvailable
{
  return self->_diskAvailable;
}

- (void)setDiskAvailable:(unint64_t)a3
{
  self->_diskAvailable = a3;
}

- (unint64_t)diskTotal
{
  return self->_diskTotal;
}

- (void)setDiskTotal:(unint64_t)a3
{
  self->_diskTotal = a3;
}

- (NSString)locale
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setLocale:(id)a3
{
}

- (NSString)networkConnectionType
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setNetworkConnectionType:(id)a3
{
}

- (NSString)osVersion
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setOsVersion:(id)a3
{
}

- (unsigned)screenHeight
{
  return self->_screenHeight;
}

- (void)setScreenHeight:(unsigned int)a3
{
  self->_screenHeight = a3;
}

- (unsigned)screenWidth
{
  return self->_screenWidth;
}

- (void)setScreenWidth:(unsigned int)a3
{
  self->_screenWidth = a3;
}

- (NSString)timeZone
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setTimeZone:(id)a3
{
}

- (ASDBetaAppVersion)appVersion
{
  return (ASDBetaAppVersion *)objc_getProperty(self, a2, 176, 1);
}

- (void)setAppVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_networkConnectionType, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_cellularNetworkType, 0);
  objc_storeStrong((id *)&self->_carrier, 0);
  objc_storeStrong((id *)&self->_architecture, 0);
  objc_storeStrong((id *)&self->_pairedWatchOSVersion, 0);
  objc_storeStrong((id *)&self->_pairedWatchModel, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_incidentID, 0);
  objc_storeStrong((id *)&self->_imagesData, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_comments, 0);
}

@end