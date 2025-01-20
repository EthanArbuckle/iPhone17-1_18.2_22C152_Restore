@interface APClientInfo
+ (APClientInfo)activeClientInfo;
+ (APClientInfoDelegate)delegate;
+ (BOOL)supportsSecureCoding;
+ (void)setActiveClientInfo:(id)a3;
+ (void)setDelegate:(id)a3;
- (APClientInfo)initWithCoder:(id)a3;
- (APLocationInfo)locationInfo;
- (BOOL)isLocationAvailableForAd;
- (NSArray)keyboards;
- (NSNumber)scale;
- (NSString)appVersion;
- (id)description;
- (id)jsonRepresentationWithOptions:(unint64_t)a3;
- (id)nonUICopy;
- (id)redactedDescription;
- (int64_t)interfaceIdiom;
- (int64_t)orientation;
- (int64_t)screenHeight;
- (int64_t)screenWidth;
- (void)encodeWithCoder:(id)a3;
- (void)setAppVersion:(id)a3;
- (void)setInterfaceIdiom:(int64_t)a3;
- (void)setIsLocationAvailableForAd:(BOOL)a3;
- (void)setKeyboards:(id)a3;
- (void)setLocationInfo:(id)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setScale:(id)a3;
- (void)setScreenHeight:(int64_t)a3;
- (void)setScreenWidth:(int64_t)a3;
- (void)updateActiveClientInfo;
@end

@implementation APClientInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_locationInfo, 0);
  objc_storeStrong((id *)&self->_keyboards, 0);
  objc_storeStrong((id *)&self->_scale, 0);
}

+ (APClientInfo)activeClientInfo
{
  id v2 = a1;
  objc_sync_enter(v2);
  id v3 = (id)qword_1EB789AF8;
  v4 = +[APLocationManager sharedInstance];
  v5 = [v4 locationInfo];
  [v3 setLocationInfo:v5];

  v6 = +[APLocationManager sharedInstance];
  objc_msgSend(v3, "setIsLocationAvailableForAd:", objc_msgSend(v6, "locationEnabled"));

  id v7 = (id)qword_1EB789AF8;
  objc_sync_exit(v2);

  return (APClientInfo *)v7;
}

- (void)updateActiveClientInfo
{
  id v2 = [(APClientInfo *)self nonUICopy];
  +[APClientInfo setActiveClientInfo:v2];
}

- (id)nonUICopy
{
  id v3 = objc_alloc_init(APClientInfo);
  [(APClientInfo *)v3 setOrientation:[(APClientInfo *)self orientation]];
  [(APClientInfo *)v3 setInterfaceIdiom:[(APClientInfo *)self interfaceIdiom]];
  [(APClientInfo *)v3 setScreenHeight:[(APClientInfo *)self screenHeight]];
  [(APClientInfo *)v3 setScreenWidth:[(APClientInfo *)self screenWidth]];
  v4 = [(APClientInfo *)self scale];
  [(APClientInfo *)v3 setScale:v4];

  v5 = [(APClientInfo *)self keyboards];
  [(APClientInfo *)v3 setKeyboards:v5];

  v6 = [(APClientInfo *)self locationInfo];
  [(APClientInfo *)v3 setLocationInfo:v6];

  return v3;
}

- (void)setScreenWidth:(int64_t)a3
{
  self->_screenWidth = a3;
}

- (void)setScreenHeight:(int64_t)a3
{
  self->_screenHeight = a3;
}

- (void)setScale:(id)a3
{
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (void)setLocationInfo:(id)a3
{
}

- (void)setKeyboards:(id)a3
{
}

- (void)setInterfaceIdiom:(int64_t)a3
{
  self->_interfaceIdiom = a3;
}

- (int64_t)screenWidth
{
  return self->_screenWidth;
}

- (int64_t)screenHeight
{
  return self->_screenHeight;
}

- (NSNumber)scale
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (APLocationInfo)locationInfo
{
  return (APLocationInfo *)objc_getProperty(self, a2, 64, 1);
}

- (int64_t)interfaceIdiom
{
  return self->_interfaceIdiom;
}

+ (void)setActiveClientInfo:(id)a3
{
  id v6 = a3;
  id v5 = a1;
  objc_sync_enter(v5);
  objc_storeStrong((id *)&qword_1EB789AF8, a3);
  if (qword_1EB789930) {
    [(id)qword_1EB789930 activeClientInfoUpdated:v6];
  }
  objc_sync_exit(v5);
}

- (id)jsonRepresentationWithOptions:(unint64_t)a3
{
  v19[7] = *MEMORY[0x1E4F143B8];
  v18[0] = @"orientation";
  v4 = (void *)0x1E4F28000;
  v17 = objc_msgSend(NSNumber, "numberWithInteger:", -[APClientInfo orientation](self, "orientation"));
  v19[0] = v17;
  v18[1] = @"interfaceIdiom";
  v16 = objc_msgSend(NSNumber, "numberWithInteger:", -[APClientInfo interfaceIdiom](self, "interfaceIdiom"));
  v19[1] = v16;
  v18[2] = @"screenHeight";
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[APClientInfo screenHeight](self, "screenHeight"));
  v19[2] = v5;
  v18[3] = @"screenWidth";
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[APClientInfo screenWidth](self, "screenWidth"));
  v19[3] = v6;
  v18[4] = @"scale";
  id v7 = [(APClientInfo *)self scale];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v19[4] = v8;
  v18[5] = @"keyboards";
  v9 = [(APClientInfo *)self keyboards];
  v10 = v9;
  if (!v9)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v19[5] = v10;
  v18[6] = @"locationInfo";
  v11 = [(APClientInfo *)self locationInfo];
  if (v11)
  {
    v4 = [(APClientInfo *)self locationInfo];
    [v4 jsonRepresentationWithOptions:a3];
  }
  else
  {
    [MEMORY[0x1E4F1CA98] null];
  v12 = };
  v19[6] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:7];
  if (v11)
  {

    v12 = v4;
  }

  if (!v9) {
  if (!v7)
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_msgSend(v7, "encodeInt:forKey:", -[APClientInfo orientation](self, "orientation"), @"orientation");
  objc_msgSend(v7, "encodeInt:forKey:", -[APClientInfo interfaceIdiom](self, "interfaceIdiom"), @"interfaceIdiom");
  objc_msgSend(v7, "encodeInteger:forKey:", -[APClientInfo screenHeight](self, "screenHeight"), @"screenHeight");
  objc_msgSend(v7, "encodeInteger:forKey:", -[APClientInfo screenWidth](self, "screenWidth"), @"screenWidth");
  v4 = [(APClientInfo *)self scale];
  [v7 encodeObject:v4 forKey:@"scale"];

  id v5 = [(APClientInfo *)self keyboards];
  [v7 encodeObject:v5 forKey:@"keyboards"];

  id v6 = [(APClientInfo *)self locationInfo];
  [v7 encodeObject:v6 forKey:@"locationInfo"];

  objc_msgSend(v7, "encodeBool:forKey:", -[APClientInfo isLocationAvailableForAd](self, "isLocationAvailableForAd"), @"locationAvailableForAd");
}

- (APClientInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(APClientInfo *)self init];
  if (v5)
  {
    v5->_orientation = (int)[v4 decodeIntForKey:@"orientation"];
    v5->_interfaceIdiom = (int)[v4 decodeIntForKey:@"interfaceIdiom"];
    v5->_screenHeight = [v4 decodeIntegerForKey:@"screenHeight"];
    v5->_screenWidth = [v4 decodeIntegerForKey:@"screenWidth"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scale"];
    scale = v5->_scale;
    v5->_scale = (NSNumber *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"keyboards"];
    keyboards = v5->_keyboards;
    v5->_keyboards = (NSArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locationInfo"];
    locationInfo = v5->_locationInfo;
    v5->_locationInfo = (APLocationInfo *)v13;

    v5->_isLocationAvailableForAd = [v4 decodeBoolForKey:@"locationAvailableForAd"];
  }

  return v5;
}

+ (APClientInfoDelegate)delegate
{
  return (APClientInfoDelegate *)(id)qword_1EB789930;
}

+ (void)setDelegate:(id)a3
{
}

- (id)description
{
  id v3 = NSString;
  int64_t v4 = [(APClientInfo *)self orientation];
  int64_t v5 = [(APClientInfo *)self interfaceIdiom];
  int64_t v6 = [(APClientInfo *)self screenHeight];
  int64_t v7 = [(APClientInfo *)self screenWidth];
  v8 = [(APClientInfo *)self scale];
  uint64_t v9 = [(APClientInfo *)self keyboards];
  v10 = [(APClientInfo *)self locationInfo];
  uint64_t v11 = [(APClientInfo *)self appVersion];
  v12 = [v3 stringWithFormat:@"APClientInfo: \norientation: %ld\ninterfaceIdiom: %ld\nscreenHeight: %ld\nscreenWidth: %ld\nscale: %@\nkeyboards: %@\nlocationInfo: %@\nappVersion: %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (id)redactedDescription
{
  id v3 = NSString;
  int64_t v4 = [(APClientInfo *)self orientation];
  int64_t v5 = [(APClientInfo *)self interfaceIdiom];
  int64_t v6 = [(APClientInfo *)self screenHeight];
  int64_t v7 = [(APClientInfo *)self screenWidth];
  v8 = [(APClientInfo *)self scale];
  uint64_t v9 = [(APClientInfo *)self keyboards];
  v10 = [(APClientInfo *)self appVersion];
  uint64_t v11 = [v3 stringWithFormat:@"APClientInfo: \norientation: %ld\ninterfaceIdiom: %ld\nscreenHeight: %ld\nscreenWidth: %ld\nscale: %@\nkeyboards: %@\nlocationInfo: <redacted>\nappVersion: %@", v4, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (NSArray)keyboards
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)isLocationAvailableForAd
{
  return self->_isLocationAvailableForAd;
}

- (void)setIsLocationAvailableForAd:(BOOL)a3
{
  self->_isLocationAvailableForAd = a3;
}

- (NSString)appVersion
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAppVersion:(id)a3
{
}

@end