@interface ASDAppClusterMapping
+ (BOOL)supportsSecureCoding;
- (ASDAppClusterMapping)initWithCoder:(id)a3;
- (NSNumber)clusterID;
- (NSNumber)clusterVersion;
- (NSNumber)itemID;
- (NSNumber)launchesWeight;
- (NSNumber)usageWeight;
- (NSString)bundleID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setClusterID:(id)a3;
- (void)setClusterVersion:(id)a3;
- (void)setItemID:(id)a3;
- (void)setLaunchesWeight:(id)a3;
- (void)setUsageWeight:(id)a3;
@end

@implementation ASDAppClusterMapping

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[ASDAppClusterMapping allocWithZone:](ASDAppClusterMapping, "allocWithZone:") init];
  v6 = (void *)[(NSString *)self->_bundleID copyWithZone:a3];
  [(ASDAppClusterMapping *)v5 setBundleID:v6];

  v7 = (void *)[(NSNumber *)self->_clusterID copyWithZone:a3];
  [(ASDAppClusterMapping *)v5 setClusterID:v7];

  v8 = (void *)[(NSNumber *)self->_clusterVersion copyWithZone:a3];
  [(ASDAppClusterMapping *)v5 setClusterVersion:v8];

  v9 = (void *)[(NSNumber *)self->_itemID copyWithZone:a3];
  [(ASDAppClusterMapping *)v5 setItemID:v9];

  v10 = (void *)[(NSNumber *)self->_launchesWeight copyWithZone:a3];
  [(ASDAppClusterMapping *)v5 setLaunchesWeight:v10];

  v11 = (void *)[(NSNumber *)self->_usageWeight copyWithZone:a3];
  [(ASDAppClusterMapping *)v5 setUsageWeight:v11];

  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"{ bundleID: %@ clusterID: %@ clusterVersion: %@ itemID: %@ launches weight: %@ usage weight: %@ }", self->_bundleID, self->_clusterID, self->_clusterVersion, self->_itemID, self->_launchesWeight, self->_usageWeight];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASDAppClusterMapping *)self bundleID];
  [v4 encodeObject:v5 forKey:@"bundleID"];

  v6 = [(ASDAppClusterMapping *)self clusterID];
  [v4 encodeObject:v6 forKey:@"clusterID"];

  v7 = [(ASDAppClusterMapping *)self clusterVersion];
  [v4 encodeObject:v7 forKey:@"clusterVersion"];

  v8 = [(ASDAppClusterMapping *)self itemID];
  [v4 encodeObject:v8 forKey:@"itemID"];

  v9 = [(ASDAppClusterMapping *)self launchesWeight];
  [v4 encodeObject:v9 forKey:@"launchesWeight"];

  id v10 = [(ASDAppClusterMapping *)self usageWeight];
  [v4 encodeObject:v10 forKey:@"usageWeight"];
}

- (ASDAppClusterMapping)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ASDAppClusterMapping;
  v5 = [(ASDAppClusterMapping *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clusterID"];
    clusterID = v5->_clusterID;
    v5->_clusterID = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clusterVersion"];
    clusterVersion = v5->_clusterVersion;
    v5->_clusterVersion = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemID"];
    itemID = v5->_itemID;
    v5->_itemID = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"launchesWeight"];
    launchesWeight = v5->_launchesWeight;
    v5->_launchesWeight = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"usageWeight"];
    usageWeight = v5->_usageWeight;
    v5->_usageWeight = (NSNumber *)v16;
  }
  return v5;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSNumber)clusterID
{
  return self->_clusterID;
}

- (void)setClusterID:(id)a3
{
}

- (NSNumber)clusterVersion
{
  return self->_clusterVersion;
}

- (void)setClusterVersion:(id)a3
{
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
}

- (NSNumber)launchesWeight
{
  return self->_launchesWeight;
}

- (void)setLaunchesWeight:(id)a3
{
}

- (NSNumber)usageWeight
{
  return self->_usageWeight;
}

- (void)setUsageWeight:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageWeight, 0);
  objc_storeStrong((id *)&self->_launchesWeight, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_clusterVersion, 0);
  objc_storeStrong((id *)&self->_clusterID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end