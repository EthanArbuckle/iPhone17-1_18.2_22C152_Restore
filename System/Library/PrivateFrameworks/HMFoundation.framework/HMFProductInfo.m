@interface HMFProductInfo
+ (BOOL)supportsSecureCoding;
+ (id)decodeSoftwareVersionWithCoder:(id)a3;
+ (id)productInfo;
+ (id)shortDescription;
+ (void)encodeSoftwareVersion:(id)a3 withCoder:(id)a4;
- (BOOL)isEqual:(id)a3;
- (HMFProductInfo)init;
- (HMFProductInfo)initWithCoder:(id)a3;
- (HMFProductInfo)initWithPlatform:(int64_t)a3 class:(int64_t)a4 softwareVersion:(id)a5;
- (HMFProductInfo)initWithPlatform:(int64_t)a3 class:(int64_t)a4 softwareVersion:(id)a5 modelIdentifier:(id)a6;
- (HMFProductInfo)initWithPlatform:(int64_t)a3 class:(int64_t)a4 variant:(int64_t)a5 softwareVersion:(id)a6;
- (HMFProductInfo)initWithPlatform:(int64_t)a3 class:(int64_t)a4 variant:(int64_t)a5 softwareVersion:(id)a6 color:(int64_t)a7;
- (HMFProductInfo)initWithPlatform:(int64_t)a3 class:(int64_t)a4 variant:(int64_t)a5 softwareVersion:(id)a6 color:(int64_t)a7 modelIdentifier:(id)a8;
- (HMFSoftwareVersion)softwareVersion;
- (NSString)modelIdentifier;
- (id)attributeDescriptions;
- (id)shortDescription;
- (int64_t)productClass;
- (int64_t)productColor;
- (int64_t)productPlatform;
- (int64_t)productVariant;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMFProductInfo

- (int64_t)productClass
{
  if (self->_productClass >= 0xCuLL) {
    return 0;
  }
  else {
    return self->_productClass;
  }
}

+ (id)productInfo
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__HMFProductInfo_productInfo__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB4EEB80 != -1) {
    dispatch_once(&qword_1EB4EEB80, block);
  }
  v2 = (void *)_MergedGlobals_3_13;
  return v2;
}

- (int64_t)productVariant
{
  return self->_productVariant;
}

- (int64_t)productPlatform
{
  if (self->_productPlatform >= 6uLL) {
    return 0;
  }
  else {
    return self->_productPlatform;
  }
}

void __29__HMFProductInfo_productInfo__block_invoke(uint64_t a1)
{
  id v11 = +[HMFSystemInfo systemInfo];
  id v2 = objc_alloc(*(Class *)(a1 + 32));
  uint64_t v3 = [v11 productPlatform];
  uint64_t v4 = [v11 productClass];
  uint64_t v5 = [v11 productVariant];
  v6 = [v11 softwareVersion];
  uint64_t v7 = [v11 productColor];
  v8 = [v11 modelIdentifier];
  uint64_t v9 = [v2 initWithPlatform:v3 class:v4 variant:v5 softwareVersion:v6 color:v7 modelIdentifier:v8];
  v10 = (void *)_MergedGlobals_3_13;
  _MergedGlobals_3_13 = v9;
}

- (HMFProductInfo)initWithPlatform:(int64_t)a3 class:(int64_t)a4 variant:(int64_t)a5 softwareVersion:(id)a6 color:(int64_t)a7 modelIdentifier:(id)a8
{
  id v15 = a6;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)HMFProductInfo;
  v17 = [(HMFProductInfo *)&v20 init];
  v18 = v17;
  if (v17)
  {
    v17->_productPlatform = a3;
    v17->_productClass = a4;
    v17->_productVariant = a5;
    objc_storeStrong((id *)&v17->_softwareVersion, a6);
    v18->_productColor = a7;
    objc_storeStrong((id *)&v18->_modelIdentifier, a8);
  }

  return v18;
}

- (HMFProductInfo)init
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (HMFProductInfo)initWithPlatform:(int64_t)a3 class:(int64_t)a4 softwareVersion:(id)a5
{
  return [(HMFProductInfo *)self initWithPlatform:a3 class:a4 variant:0 softwareVersion:a5 color:0 modelIdentifier:0];
}

- (HMFProductInfo)initWithPlatform:(int64_t)a3 class:(int64_t)a4 variant:(int64_t)a5 softwareVersion:(id)a6
{
  return [(HMFProductInfo *)self initWithPlatform:a3 class:a4 variant:a5 softwareVersion:a6 color:0 modelIdentifier:0];
}

- (HMFProductInfo)initWithPlatform:(int64_t)a3 class:(int64_t)a4 variant:(int64_t)a5 softwareVersion:(id)a6 color:(int64_t)a7
{
  return [(HMFProductInfo *)self initWithPlatform:a3 class:a4 variant:a5 softwareVersion:a6 color:a7 modelIdentifier:0];
}

- (HMFProductInfo)initWithPlatform:(int64_t)a3 class:(int64_t)a4 softwareVersion:(id)a5 modelIdentifier:(id)a6
{
  return [(HMFProductInfo *)self initWithPlatform:a3 class:a4 variant:0 softwareVersion:a5 color:0 modelIdentifier:a6];
}

+ (id)shortDescription
{
  id v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)shortDescription
{
  id v2 = objc_opt_class();
  return (id)[v2 shortDescription];
}

- (id)attributeDescriptions
{
  v28[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [HMFAttributeDescription alloc];
  unint64_t v4 = [(HMFProductInfo *)self productPlatform] - 1;
  if (v4 > 4) {
    uint64_t v5 = @"Unknown";
  }
  else {
    uint64_t v5 = off_1E5958508[v4];
  }
  uint64_t v26 = [(HMFAttributeDescription *)v3 initWithName:@"Platform" value:v5];
  v28[0] = v26;
  v6 = [HMFAttributeDescription alloc];
  unint64_t v7 = [(HMFProductInfo *)self productClass] - 1;
  if (v7 > 0xA) {
    v8 = @"Unknown";
  }
  else {
    v8 = off_1E5958530[v7];
  }
  uint64_t v9 = [(HMFAttributeDescription *)v6 initWithName:@"Product Class", v8, v26, v28[0] value];
  v28[1] = v9;
  v10 = [HMFAttributeDescription alloc];
  unint64_t v11 = [(HMFProductInfo *)self productVariant] - 1;
  if (v11 > 2) {
    v12 = @"Customer";
  }
  else {
    v12 = off_1E5958588[v11];
  }
  v13 = [(HMFAttributeDescription *)v10 initWithName:@"Product Variant" value:v12];
  v28[2] = v13;
  v14 = [HMFAttributeDescription alloc];
  id v15 = [(HMFProductInfo *)self softwareVersion];
  id v16 = [v15 versionString];
  v17 = [(HMFAttributeDescription *)v14 initWithName:@"Software Version" value:v16];
  v28[3] = v17;
  v18 = [HMFAttributeDescription alloc];
  v19 = HMFProductColorToString([(HMFProductInfo *)self productColor]);
  objc_super v20 = [(HMFAttributeDescription *)v18 initWithName:@"Product Color" value:v19];
  v28[4] = v20;
  v21 = [HMFAttributeDescription alloc];
  v22 = [(HMFProductInfo *)self modelIdentifier];
  v23 = [(HMFAttributeDescription *)v21 initWithName:@"Model Identifier" value:v22];
  v28[5] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:6];

  return v24;
}

- (unint64_t)hash
{
  id v2 = [(HMFProductInfo *)self softwareVersion];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (HMFProductInfo *)a3;
  if (v4 == self)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_9;
    }
    uint64_t v5 = [(HMFProductInfo *)self softwareVersion];
    v6 = [(HMFProductInfo *)v4 softwareVersion];
    int v7 = [v5 isEqual:v6];

    if (!v7) {
      goto LABEL_9;
    }
    int64_t v8 = [(HMFProductInfo *)self productPlatform];
    if (v8 == [(HMFProductInfo *)v4 productPlatform]
      && (int64_t v9 = [(HMFProductInfo *)self productClass],
          v9 == [(HMFProductInfo *)v4 productClass])
      && (int64_t v10 = [(HMFProductInfo *)self productVariant],
          v10 == [(HMFProductInfo *)v4 productVariant])
      && (int64_t v11 = [(HMFProductInfo *)self productColor],
          v11 == [(HMFProductInfo *)v4 productColor]))
    {
      v12 = [(HMFProductInfo *)self modelIdentifier];
      v13 = [(HMFProductInfo *)v4 modelIdentifier];
      char v14 = [v12 isEqualToString:v13];
    }
    else
    {
LABEL_9:
      char v14 = 0;
    }
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)decodeSoftwareVersionWithCoder:(id)a3
{
  id v3 = a3;
  if ([v3 containsValueForKey:@"HMF.softwareVersion"])
  {
    unint64_t v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HMF.softwareVersion"];
  }
  else
  {
    uint64_t v5 = [v3 decodeIntegerForKey:@"HMF.majorVersion"];
    uint64_t v6 = [v3 decodeIntegerForKey:@"HMF.minorVersion"];
    uint64_t v7 = [v3 decodeIntegerForKey:@"HMF.patchVersion"];

    v9[0] = v5;
    v9[1] = v6;
    v9[2] = v7;
    unint64_t v4 = +[HMFSoftwareVersion versionFromOperatingSystemVersion:v9];
  }
  return v4;
}

+ (void)encodeSoftwareVersion:(id)a3 withCoder:(id)a4
{
  id v7 = a4;
  id v5 = a3;
  [v7 encodeObject:v5 forKey:@"HMF.softwareVersion"];
  objc_msgSend(v7, "encodeInteger:forKey:", objc_msgSend(v5, "majorVersion"), @"HMF.majorVersion");
  objc_msgSend(v7, "encodeInteger:forKey:", objc_msgSend(v5, "minorVersion"), @"HMF.minorVersion");
  uint64_t v6 = [v5 updateVersion];

  [v7 encodeInteger:v6 forKey:@"HMF.patchVersion"];
}

- (HMFProductInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"HMF.platform"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"HMF.class"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"HMF.variant"];
  int64_t v8 = +[HMFProductInfo decodeSoftwareVersionWithCoder:v4];
  uint64_t v9 = [v4 decodeIntegerForKey:@"HMF.color"];
  int64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMF.modelIdentifier"];

  int64_t v11 = [(HMFProductInfo *)self initWithPlatform:v5 class:v6 variant:v7 softwareVersion:v8 color:v9 modelIdentifier:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMFProductInfo productPlatform](self, "productPlatform"), @"HMF.platform");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMFProductInfo productClass](self, "productClass"), @"HMF.class");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMFProductInfo productVariant](self, "productVariant"), @"HMF.variant");
  uint64_t v5 = [(HMFProductInfo *)self softwareVersion];
  +[HMFProductInfo encodeSoftwareVersion:v5 withCoder:v4];

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMFProductInfo productColor](self, "productColor"), @"HMF.color");
  id v6 = [(HMFProductInfo *)self modelIdentifier];
  [v4 encodeObject:v6 forKey:@"HMF.modelIdentifier"];
}

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (HMFSoftwareVersion)softwareVersion
{
  return self->_softwareVersion;
}

- (int64_t)productColor
{
  return self->_productColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
}

@end