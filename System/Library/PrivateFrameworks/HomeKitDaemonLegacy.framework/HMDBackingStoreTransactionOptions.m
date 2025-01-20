@interface HMDBackingStoreTransactionOptions
+ (BOOL)supportsSecureCoding;
+ (HMDBackingStoreTransactionOptions)cloudRequiresPushOptions;
+ (HMDBackingStoreTransactionOptions)defaultCloudOptions;
+ (HMDBackingStoreTransactionOptions)defaultIDSOptions;
+ (HMDBackingStoreTransactionOptions)defaultLegacyCloudOptions;
+ (HMDBackingStoreTransactionOptions)defaultLocalOptions;
+ (HMDBackingStoreTransactionOptions)defaultMetadataCloudOptions;
+ (HMDBackingStoreTransactionOptions)defaultOutOfSyncOptions;
+ (HMDBackingStoreTransactionOptions)defaultPreferencesOptions;
+ (HMDBackingStoreTransactionOptions)defaultResidenceOptions;
+ (HMDBackingStoreTransactionOptions)defaultXPCOptions;
+ (HMDBackingStoreTransactionOptions)localPushBackOptions;
+ (HMDBackingStoreTransactionOptions)optionsWithSource:(unint64_t)a3 destination:(unint64_t)a4 label:(id)a5 mustReplay:(BOOL)a6 mustPush:(BOOL)a7 mustSaveArchiveAtomically:(BOOL)a8;
+ (HMDBackingStoreTransactionOptions)optionsWithSource:(unint64_t)a3 destination:(unint64_t)a4 mustReplay:(BOOL)a5 mustPush:(BOOL)a6;
+ (HMDBackingStoreTransactionOptions)optionsWithSource:(unint64_t)a3 destination:(unint64_t)a4 mustReplay:(BOOL)a5 mustPush:(BOOL)a6 mustSaveArchiveAtomically:(BOOL)a7;
+ (id)logCategory;
+ (id)stringForHMDBackingStoreDestination:(unint64_t)a3;
+ (id)stringForHMDBackingStoreTransactionSource:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)mustPush;
- (BOOL)mustReplay;
- (BOOL)mustSaveArchiveAtomically;
- (HMDBackingStoreTransactionOptions)initWithCoder:(id)a3;
- (HMDBackingStoreTransactionOptions)initWithSource:(unint64_t)a3 destination:(unint64_t)a4;
- (HMDBackingStoreTransactionOptions)initWithSource:(unint64_t)a3 destination:(unint64_t)a4 label:(id)a5 mustReplay:(BOOL)a6 mustPush:(BOOL)a7;
- (HMDBackingStoreTransactionOptions)initWithSource:(unint64_t)a3 destination:(unint64_t)a4 label:(id)a5 mustReplay:(BOOL)a6 mustPush:(BOOL)a7 mustSaveArchiveAtomically:(BOOL)a8;
- (NSString)description;
- (NSString)label;
- (id)_description;
- (id)debugString:(BOOL)a3;
- (id)logIdentifier;
- (unint64_t)destination;
- (unint64_t)hash;
- (unint64_t)source;
- (void)encodeWithCoder:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation HMDBackingStoreTransactionOptions

+ (HMDBackingStoreTransactionOptions)optionsWithSource:(unint64_t)a3 destination:(unint64_t)a4 mustReplay:(BOOL)a5 mustPush:(BOOL)a6 mustSaveArchiveAtomically:(BOOL)a7
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:a3 destination:a4 label:@"<UNSET LABEL>" mustReplay:a5 mustPush:a6 mustSaveArchiveAtomically:a7];
}

+ (HMDBackingStoreTransactionOptions)defaultXPCOptions
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:1 destination:3 mustReplay:0 mustPush:0 mustSaveArchiveAtomically:0];
}

- (void).cxx_destruct
{
}

- (void)setLabel:(id)a3
{
}

+ (HMDBackingStoreTransactionOptions)optionsWithSource:(unint64_t)a3 destination:(unint64_t)a4 label:(id)a5 mustReplay:(BOOL)a6 mustPush:(BOOL)a7 mustSaveArchiveAtomically:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v13 = a5;
  v14 = [[HMDBackingStoreTransactionOptions alloc] initWithSource:a3 destination:a4 label:v13 mustReplay:v10 mustPush:v9 mustSaveArchiveAtomically:v8];

  return v14;
}

- (HMDBackingStoreTransactionOptions)initWithSource:(unint64_t)a3 destination:(unint64_t)a4 label:(id)a5 mustReplay:(BOOL)a6 mustPush:(BOOL)a7 mustSaveArchiveAtomically:(BOOL)a8
{
  id v14 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMDBackingStoreTransactionOptions;
  v15 = [(HMDBackingStoreTransactionOptions *)&v19 init];
  v16 = v15;
  if (v15)
  {
    v15->_source = a3;
    v15->_destination = a4;
    objc_storeStrong((id *)&v15->_label, a5);
    v16->_mustReplay = a6;
    v16->_mustPush = a7;
    v17 = v16;
  }

  return v16;
}

- (BOOL)mustSaveArchiveAtomically
{
  return self->_mustSaveArchiveAtomically;
}

- (BOOL)mustPush
{
  return self->_mustPush;
}

- (BOOL)mustReplay
{
  return self->_mustReplay;
}

- (NSString)label
{
  return self->_label;
}

- (unint64_t)source
{
  return self->_source;
}

- (unint64_t)destination
{
  return self->_destination;
}

- (id)logIdentifier
{
  return @"BackingStore";
}

- (unint64_t)hash
{
  v2 = [(HMDBackingStoreTransactionOptions *)self label];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6
    && (unint64_t v7 = -[HMDBackingStoreTransactionOptions source](self, "source"), v7 == [v6 source])
    && (unint64_t v8 = -[HMDBackingStoreTransactionOptions destination](self, "destination"), v8 == [v6 destination]))
  {
    BOOL v9 = [(HMDBackingStoreTransactionOptions *)self label];
    BOOL v10 = [v6 label];
    if ([v9 isEqualToString:v10]
      && (int v11 = [(HMDBackingStoreTransactionOptions *)self mustReplay],
          v11 == [v6 mustReplay]))
    {
      BOOL v14 = [(HMDBackingStoreTransactionOptions *)self mustPush];
      int v12 = v14 ^ [v6 mustPush] ^ 1;
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (id)debugString:(BOOL)a3
{
  id v4 = NSString;
  v5 = [(HMDBackingStoreTransactionOptions *)self label];
  id v6 = +[HMDBackingStoreTransactionOptions stringForHMDBackingStoreDestination:[(HMDBackingStoreTransactionOptions *)self destination]];
  unint64_t v7 = +[HMDBackingStoreTransactionOptions stringForHMDBackingStoreTransactionSource:[(HMDBackingStoreTransactionOptions *)self source]];
  if ([(HMDBackingStoreTransactionOptions *)self mustReplay]) {
    unint64_t v8 = "yes";
  }
  else {
    unint64_t v8 = "no";
  }
  if ([(HMDBackingStoreTransactionOptions *)self mustPush]) {
    BOOL v9 = "yes";
  }
  else {
    BOOL v9 = "no";
  }
  BOOL v10 = [v4 stringWithFormat:@"label: %@\ndestinations: %@\nsource: %@\nmustReplay: %s\nmustPush:%s", v5, v6, v7, v8, v9];

  return v10;
}

- (NSString)description
{
  v2 = NSString;
  unint64_t v3 = [(HMDBackingStoreTransactionOptions *)self _description];
  id v4 = [v2 stringWithFormat:@"<options: %@>", v3];

  return (NSString *)v4;
}

- (id)_description
{
  unint64_t v3 = NSString;
  id v4 = [(HMDBackingStoreTransactionOptions *)self label];
  v5 = +[HMDBackingStoreTransactionOptions stringForHMDBackingStoreTransactionSource:[(HMDBackingStoreTransactionOptions *)self source]];
  id v6 = +[HMDBackingStoreTransactionOptions stringForHMDBackingStoreDestination:[(HMDBackingStoreTransactionOptions *)self destination]];
  if ([(HMDBackingStoreTransactionOptions *)self mustReplay]) {
    unint64_t v7 = "yes";
  }
  else {
    unint64_t v7 = "no";
  }
  if ([(HMDBackingStoreTransactionOptions *)self mustPush]) {
    unint64_t v8 = "yes";
  }
  else {
    unint64_t v8 = "no";
  }
  BOOL v9 = [v3 stringWithFormat:@"%@/%@/%@/mustReplay=%s/mustPush=%s", v4, v5, v6, v7, v8];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[HMDBackingStoreTransactionOptions source](self, "source"), @"HM.source");
  objc_msgSend(v5, "encodeInteger:forKey:", -[HMDBackingStoreTransactionOptions destination](self, "destination"), @"HM.destination");
  id v4 = [(HMDBackingStoreTransactionOptions *)self label];
  [v5 encodeObject:v4 forKey:@"HM.label"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[HMDBackingStoreTransactionOptions mustReplay](self, "mustReplay"), @"HM.mustReplay");
  objc_msgSend(v5, "encodeBool:forKey:", -[HMDBackingStoreTransactionOptions mustPush](self, "mustPush"), @"HM.mustPush");
}

- (HMDBackingStoreTransactionOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = -[HMDBackingStoreTransactionOptions initWithSource:destination:](self, "initWithSource:destination:", [v4 decodeIntegerForKey:@"HM.source"], objc_msgSend(v4, "decodeIntegerForKey:", @"HM.destination"));
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.label"];
    label = v5->_label;
    v5->_label = (NSString *)v6;

    v5->_mustReplay = [v4 decodeIntegerForKey:@"HM.mustReplay"] != 0;
    v5->_mustPush = [v4 decodeBoolForKey:@"HM.mustPush"];
    unint64_t v8 = v5;
  }

  return v5;
}

- (HMDBackingStoreTransactionOptions)initWithSource:(unint64_t)a3 destination:(unint64_t)a4
{
  return [(HMDBackingStoreTransactionOptions *)self initWithSource:a3 destination:a4 label:@"<UNSET LABEL>" mustReplay:0 mustPush:0 mustSaveArchiveAtomically:0];
}

- (HMDBackingStoreTransactionOptions)initWithSource:(unint64_t)a3 destination:(unint64_t)a4 label:(id)a5 mustReplay:(BOOL)a6 mustPush:(BOOL)a7
{
  return [(HMDBackingStoreTransactionOptions *)self initWithSource:a3 destination:a4 label:a5 mustReplay:a6 mustPush:a7 mustSaveArchiveAtomically:0];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_45693 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_45693, &__block_literal_global_45694);
  }
  v2 = (void *)logCategory__hmf_once_v2_45695;
  return v2;
}

uint64_t __48__HMDBackingStoreTransactionOptions_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_45695;
  logCategory__hmf_once_v2_45695 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)stringForHMDBackingStoreDestination:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F28E78] string];
  id v5 = v4;
  if (a3)
  {
    [v4 appendString:@"V3"];
    a3 &= ~1uLL;
  }
  if ((a3 & 2) != 0)
  {
    if ([v5 length]) {
      uint64_t v6 = "/";
    }
    else {
      uint64_t v6 = "";
    }
    objc_msgSend(v5, "appendFormat:", @"%sV4", v6);
    a3 &= ~2uLL;
  }
  if (a3)
  {
    if ([v5 length]) {
      unint64_t v7 = "/";
    }
    else {
      unint64_t v7 = "";
    }
    objc_msgSend(v5, "appendFormat:", @"%s<UNKNOWN 0x%lx>", v7, a3);
  }
  if ([v5 length]) {
    unint64_t v8 = v5;
  }
  else {
    unint64_t v8 = @"<NoCloud>";
  }

  return v8;
}

+ (id)stringForHMDBackingStoreTransactionSource:(unint64_t)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<UNKNOWN %lu>", a3);
    unint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v3 = off_1E6A0AA10[a3];
  }
  return v3;
}

+ (HMDBackingStoreTransactionOptions)defaultOutOfSyncOptions
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:1 destination:2 mustReplay:0 mustPush:1];
}

+ (HMDBackingStoreTransactionOptions)defaultPreferencesOptions
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:1 destination:2 mustReplay:1 mustPush:1];
}

+ (HMDBackingStoreTransactionOptions)defaultResidenceOptions
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:1 destination:3 mustReplay:1 mustPush:0];
}

+ (HMDBackingStoreTransactionOptions)defaultMetadataCloudOptions
{
  v2 = [[HMDBackingStoreTransactionOptions alloc] initWithSource:4 destination:3 label:@"MetadataUpdate" mustReplay:0 mustPush:0];
  return v2;
}

+ (HMDBackingStoreTransactionOptions)defaultLegacyCloudOptions
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:3 destination:2 mustReplay:0 mustPush:0];
}

+ (HMDBackingStoreTransactionOptions)defaultIDSOptions
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:2 destination:0 mustReplay:0 mustPush:0];
}

+ (HMDBackingStoreTransactionOptions)localPushBackOptions
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:0 destination:3 mustReplay:1 mustPush:1];
}

+ (HMDBackingStoreTransactionOptions)cloudRequiresPushOptions
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:2 destination:3 mustReplay:0 mustPush:0 mustSaveArchiveAtomically:1];
}

+ (HMDBackingStoreTransactionOptions)defaultCloudOptions
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:2 destination:0 mustReplay:0 mustPush:0 mustSaveArchiveAtomically:1];
}

+ (HMDBackingStoreTransactionOptions)defaultLocalOptions
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:0 destination:0 mustReplay:0 mustPush:0];
}

+ (HMDBackingStoreTransactionOptions)optionsWithSource:(unint64_t)a3 destination:(unint64_t)a4 mustReplay:(BOOL)a5 mustPush:(BOOL)a6
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:a3 destination:a4 mustReplay:a5 mustPush:a6 mustSaveArchiveAtomically:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end