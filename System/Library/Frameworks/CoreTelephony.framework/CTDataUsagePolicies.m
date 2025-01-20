@interface CTDataUsagePolicies
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isManaged;
- (BOOL)isRestricted;
- (CTDataUsagePolicies)initWithCoder:(id)a3;
- (NSString)bundleId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)init:(id)a3 withCellularPolicy:(int64_t)a4 andWifiPolicy:(int64_t)a5;
- (id)init:(id)a3 withCellularPolicy:(int64_t)a4 wifiPolicy:(int64_t)a5 isManaged:(BOOL)a6 andIsRestricted:(BOOL)a7;
- (int64_t)cellular;
- (int64_t)wifi;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setCellular:(int64_t)a3;
- (void)setIsManaged:(BOOL)a3;
- (void)setIsRestricted:(BOOL)a3;
- (void)setWifi:(int64_t)a3;
@end

@implementation CTDataUsagePolicies

- (id)init:(id)a3 withCellularPolicy:(int64_t)a4 andWifiPolicy:(int64_t)a5
{
  return [(CTDataUsagePolicies *)self init:a3 withCellularPolicy:a4 wifiPolicy:a5 isManaged:0 andIsRestricted:0];
}

- (id)init:(id)a3 withCellularPolicy:(int64_t)a4 wifiPolicy:(int64_t)a5 isManaged:(BOOL)a6 andIsRestricted:(BOOL)a7
{
  id v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CTDataUsagePolicies;
  v14 = [(CTDataUsagePolicies *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_bundleId, a3);
    v15->_cellular = a4;
    v15->_wifi = a5;
    v15->_isManaged = a6;
    v15->_isRestricted = a7;
  }

  return v15;
}

- (id)description
{
  v3 = NSString;
  v4 = [(CTDataUsagePolicies *)self bundleId];
  int64_t v5 = [(CTDataUsagePolicies *)self cellular];
  if (v5 == 1) {
    v6 = @"Allowed";
  }
  else {
    v6 = @"???";
  }
  if (!v5) {
    v6 = @"Denied";
  }
  v7 = v6;
  int64_t v8 = [(CTDataUsagePolicies *)self wifi];
  if (v8 == 1) {
    v9 = @"Allowed";
  }
  else {
    v9 = @"???";
  }
  if (!v8) {
    v9 = @"Denied";
  }
  v10 = v9;
  if ([(CTDataUsagePolicies *)self isManaged]) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  v12 = v11;
  if ([(CTDataUsagePolicies *)self isRestricted]) {
    id v13 = @"YES";
  }
  else {
    id v13 = @"NO";
  }
  v14 = [v3 stringWithFormat:@"Data Usage Policy: %@ cellular(%@) wifi(%@) isManaged(%@) isRestricted(%@)", v4, v7, v10, v12, v13];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  int64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
    int64_t v7 = [(CTDataUsagePolicies *)self cellular];
    if (v7 == [v6 cellular]
      && (int64_t v8 = -[CTDataUsagePolicies wifi](self, "wifi"), v8 == [v6 wifi])
      && (int v9 = -[CTDataUsagePolicies isManaged](self, "isManaged"), v9 == [v6 isManaged])
      && (int v10 = [(CTDataUsagePolicies *)self isRestricted],
          v10 == [v6 isRestricted]))
    {
      id v13 = [(CTDataUsagePolicies *)self bundleId];
      v14 = [v6 bundleId];
      char v11 = [v13 isEqualToString:v14];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v2 = [(CTDataUsagePolicies *)self bundleId];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  int64_t v5 = [(CTDataUsagePolicies *)self bundleId];
  id v6 = objc_msgSend(v4, "init:withCellularPolicy:wifiPolicy:isManaged:andIsRestricted:", v5, -[CTDataUsagePolicies cellular](self, "cellular"), -[CTDataUsagePolicies wifi](self, "wifi"), -[CTDataUsagePolicies isManaged](self, "isManaged"), -[CTDataUsagePolicies isRestricted](self, "isRestricted"));

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CTDataUsagePolicies *)self bundleId];
  [v4 encodeObject:v5 forKey:@"bundleId"];

  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[CTDataUsagePolicies cellular](self, "cellular"));
  [v4 encodeObject:v6 forKey:@"cellularKey"];

  int64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[CTDataUsagePolicies wifi](self, "wifi"));
  [v4 encodeObject:v7 forKey:@"wifiKey"];

  int64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[CTDataUsagePolicies isManaged](self, "isManaged"));
  [v4 encodeObject:v8 forKey:@"isManagedKey"];

  objc_msgSend(NSNumber, "numberWithBool:", -[CTDataUsagePolicies isRestricted](self, "isRestricted"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v9 forKey:@"isRestrictedKey"];
}

- (CTDataUsagePolicies)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTDataUsagePolicies;
  int64_t v5 = [(CTDataUsagePolicies *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleId"];
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v6;

    int64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cellularKey"];
    v5->_cellular = [v8 integerValue];

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wifiKey"];
    v5->_wifi = [v9 integerValue];

    int v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isManagedKey"];
    v5->_isManaged = [v10 BOOLValue];

    char v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isRestrictedKey"];
    v5->_isRestricted = [v11 BOOLValue];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (int64_t)cellular
{
  return self->_cellular;
}

- (void)setCellular:(int64_t)a3
{
  self->_cellular = a3;
}

- (int64_t)wifi
{
  return self->_wifi;
}

- (void)setWifi:(int64_t)a3
{
  self->_wifi = a3;
}

- (BOOL)isManaged
{
  return self->_isManaged;
}

- (void)setIsManaged:(BOOL)a3
{
  self->_isManaged = a3;
}

- (BOOL)isRestricted
{
  return self->_isRestricted;
}

- (void)setIsRestricted:(BOOL)a3
{
  self->_isRestricted = a3;
}

- (void).cxx_destruct
{
}

@end