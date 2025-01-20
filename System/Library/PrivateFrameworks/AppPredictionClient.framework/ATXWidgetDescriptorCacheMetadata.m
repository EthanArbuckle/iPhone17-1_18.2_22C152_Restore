@interface ATXWidgetDescriptorCacheMetadata
+ (BOOL)supportsSecureCoding;
- (ATXWidgetDescriptorCacheMetadata)initWithCoder:(id)a3;
- (ATXWidgetDescriptorCacheMetadata)initWithInstallDate:(id)a3 containerBundleId:(id)a4 hasHomeScreenWidgetFamiliesOnly:(BOOL)a5 hasAccessoryWidgetFamiliesOnly:(BOOL)a6;
- (BOOL)hasAccessoryWidgetFamiliesOnly;
- (BOOL)hasHomeScreenWidgetFamiliesOnly;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXWidgetDescriptorCacheMetadata:(id)a3;
- (NSDate)installDate;
- (NSString)containerBundleId;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXWidgetDescriptorCacheMetadata

- (ATXWidgetDescriptorCacheMetadata)initWithInstallDate:(id)a3 containerBundleId:(id)a4 hasHomeScreenWidgetFamiliesOnly:(BOOL)a5 hasAccessoryWidgetFamiliesOnly:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ATXWidgetDescriptorCacheMetadata;
  v13 = [(ATXWidgetDescriptorCacheMetadata *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_installDate, a3);
    uint64_t v15 = [v12 copy];
    containerBundleId = v14->_containerBundleId;
    v14->_containerBundleId = (NSString *)v15;

    v14->_hasHomeScreenWidgetFamiliesOnly = a5;
    v14->_hasAccessoryWidgetFamiliesOnly = a6;
    v17 = v14;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  installDate = self->_installDate;
  id v5 = a3;
  [v5 encodeObject:installDate forKey:@"installDate"];
  [v5 encodeObject:self->_containerBundleId forKey:@"containerBundleId"];
  [v5 encodeBool:self->_hasHomeScreenWidgetFamiliesOnly forKey:@"hasHomeScreenWidgetFamiliesOnly"];
  [v5 encodeBool:self->_hasAccessoryWidgetFamiliesOnly forKey:@"hasAccessoryWidgetFamiliesOnly"];
}

- (ATXWidgetDescriptorCacheMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installDate"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerBundleId"];
    self = -[ATXWidgetDescriptorCacheMetadata initWithInstallDate:containerBundleId:hasHomeScreenWidgetFamiliesOnly:hasAccessoryWidgetFamiliesOnly:](self, "initWithInstallDate:containerBundleId:hasHomeScreenWidgetFamiliesOnly:hasAccessoryWidgetFamiliesOnly:", v5, v6, [v4 decodeBoolForKey:@"hasHomeScreenWidgetFamiliesOnly"], objc_msgSend(v4, "decodeBoolForKey:", @"hasAccessoryWidgetFamiliesOnly"));

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXWidgetDescriptorCacheMetadata *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXWidgetDescriptorCacheMetadata *)self isEqualToATXWidgetDescriptorCacheMetadata:v5];

  return v6;
}

- (BOOL)isEqualToATXWidgetDescriptorCacheMetadata:(id)a3
{
  id v4 = (id *)a3;
  [(NSDate *)self->_installDate timeIntervalSinceReferenceDate];
  double v6 = v5;
  v7 = [v4 installDate];
  [v7 timeIntervalSinceReferenceDate];
  if (vabdd_f64(v6, v8) >= 1.0) {
    goto LABEL_8;
  }
  containerBundleId = self->_containerBundleId;
  v10 = (NSString *)v4[3];
  if (containerBundleId == v10)
  {
  }
  else
  {
    id v11 = v10;
    id v12 = containerBundleId;
    char v13 = [(NSString *)v12 isEqual:v11];

    if ((v13 & 1) == 0) {
      goto LABEL_8;
    }
  }
  if (self->_hasAccessoryWidgetFamiliesOnly != *((unsigned __int8 *)v4 + 9))
  {
LABEL_8:
    BOOL v14 = 0;
    goto LABEL_9;
  }
  BOOL v14 = self->_hasHomeScreenWidgetFamiliesOnly == *((unsigned __int8 *)v4 + 8);
LABEL_9:

  return v14;
}

- (NSDate)installDate
{
  return self->_installDate;
}

- (NSString)containerBundleId
{
  return self->_containerBundleId;
}

- (BOOL)hasHomeScreenWidgetFamiliesOnly
{
  return self->_hasHomeScreenWidgetFamiliesOnly;
}

- (BOOL)hasAccessoryWidgetFamiliesOnly
{
  return self->_hasAccessoryWidgetFamiliesOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerBundleId, 0);

  objc_storeStrong((id *)&self->_installDate, 0);
}

@end