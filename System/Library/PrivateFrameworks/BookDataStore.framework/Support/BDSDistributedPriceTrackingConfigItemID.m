@interface BDSDistributedPriceTrackingConfigItemID
+ (BOOL)supportsSecureCoding;
- (BDSDistributedPriceTrackingConfigItemID)initWithAdamID:(id)a3 isAudiobook:(BOOL)a4;
- (BDSDistributedPriceTrackingConfigItemID)initWithCoder:(id)a3;
- (BOOL)isAudiobook;
- (NSString)adamID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BDSDistributedPriceTrackingConfigItemID

- (BDSDistributedPriceTrackingConfigItemID)initWithAdamID:(id)a3 isAudiobook:(BOOL)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BDSDistributedPriceTrackingConfigItemID;
  v7 = [(BDSDistributedPriceTrackingConfigItemID *)&v12 init];
  if (v7)
  {
    v8 = (__CFString *)[v6 copy];
    v9 = v8;
    if (v8) {
      v10 = v8;
    }
    else {
      v10 = &stru_10026BED0;
    }
    objc_storeStrong((id *)&v7->_adamID, v10);

    v7->_isAudiobook = a4;
  }

  return v7;
}

- (id)description
{
  if ([(BDSDistributedPriceTrackingConfigItemID *)self isAudiobook]) {
    CFStringRef v3 = @"A";
  }
  else {
    CFStringRef v3 = @"B";
  }
  v4 = [(BDSDistributedPriceTrackingConfigItemID *)self adamID];
  v5 = +[NSString stringWithFormat:@"%@.%@", v3, v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(BDSDistributedPriceTrackingConfigItemID *)self adamID];
  [v5 encodeObject:v4 forKey:@"adamID"];

  objc_msgSend(v5, "encodeBool:forKey:", -[BDSDistributedPriceTrackingConfigItemID isAudiobook](self, "isAudiobook"), @"isAudiobook");
}

- (BDSDistributedPriceTrackingConfigItemID)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"adamID"];
  id v6 = [v4 decodeBoolForKey:@"isAudiobook"];

  v7 = [(BDSDistributedPriceTrackingConfigItemID *)self initWithAdamID:v5 isAudiobook:v6];
  return v7;
}

- (NSString)adamID
{
  return self->_adamID;
}

- (BOOL)isAudiobook
{
  return self->_isAudiobook;
}

- (void).cxx_destruct
{
}

@end