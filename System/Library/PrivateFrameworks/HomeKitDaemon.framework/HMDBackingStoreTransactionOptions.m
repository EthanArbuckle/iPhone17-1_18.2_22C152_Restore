@interface HMDBackingStoreTransactionOptions
+ (BOOL)supportsSecureCoding;
+ (HMDBackingStoreTransactionOptions)cloudRequiresPushOptions;
+ (HMDBackingStoreTransactionOptions)defaultCloudOptions;
+ (HMDBackingStoreTransactionOptions)defaultCloudOptionsForInitialGraphLoad;
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
+ (HMDBackingStoreTransactionOptions)optionsWithSource:(unint64_t)a3 destination:(unint64_t)a4 label:(id)a5 mustReplay:(BOOL)a6 mustPush:(BOOL)a7 mustSaveArchiveAtomically:(BOOL)a8 cdTransactionAuthor:(unint64_t)a9 clientIdentifier:(id)a10;
+ (HMDBackingStoreTransactionOptions)optionsWithSource:(unint64_t)a3 destination:(unint64_t)a4 mustReplay:(BOOL)a5 mustPush:(BOOL)a6;
+ (HMDBackingStoreTransactionOptions)optionsWithSource:(unint64_t)a3 destination:(unint64_t)a4 mustReplay:(BOOL)a5 mustPush:(BOOL)a6 mustSaveArchiveAtomically:(BOOL)a7;
+ (id)defaultXPCOptionsWithCDTransactionAuthor:(unint64_t)a3 clientIdentifier:(id)a4;
+ (id)defaultXPCOptionsWithClientIdentifier:(id)a3;
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
- (HMDBackingStoreTransactionOptions)initWithSource:(unint64_t)a3 destination:(unint64_t)a4 label:(id)a5 mustReplay:(BOOL)a6 mustPush:(BOOL)a7 mustSaveArchiveAtomically:(BOOL)a8 cdTransactionAuthor:(unint64_t)a9 clientIdentifier:(id)a10;
- (NSString)clientIdentifier;
- (NSString)description;
- (NSString)label;
- (id)_description;
- (id)debugString:(BOOL)a3;
- (id)logIdentifier;
- (unint64_t)cdTransactionAuthor;
- (unint64_t)destination;
- (unint64_t)hash;
- (unint64_t)source;
- (void)encodeWithCoder:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation HMDBackingStoreTransactionOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (unint64_t)cdTransactionAuthor
{
  return self->_cdTransactionAuthor;
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
    v9 = [(HMDBackingStoreTransactionOptions *)self label];
    v10 = [v6 label];
    if ([v9 isEqualToString:v10]
      && (int v11 = [(HMDBackingStoreTransactionOptions *)self mustReplay],
          v11 == [v6 mustReplay])
      && (int v12 = [(HMDBackingStoreTransactionOptions *)self mustPush],
          v12 == [v6 mustPush]))
    {
      unint64_t v15 = [(HMDBackingStoreTransactionOptions *)self cdTransactionAuthor];
      BOOL v13 = v15 == [v6 cdTransactionAuthor];
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
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
    v9 = "yes";
  }
  else {
    v9 = "no";
  }
  v10 = [v4 stringWithFormat:@"label: %@\ndestinations: %@\nsource: %@\nmustReplay: %s\nmustPush:%s", v5, v6, v7, v8, v9];

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
  v9 = [v3 stringWithFormat:@"%@/%@/%@/mustReplay=%s/mustPush=%s", v4, v5, v6, v7, v8];

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

- (void)setLabel:(id)a3
{
}

- (HMDBackingStoreTransactionOptions)initWithSource:(unint64_t)a3 destination:(unint64_t)a4
{
  return [(HMDBackingStoreTransactionOptions *)self initWithSource:a3 destination:a4 label:@"<UNSET LABEL>" mustReplay:0 mustPush:0 mustSaveArchiveAtomically:0];
}

- (HMDBackingStoreTransactionOptions)initWithSource:(unint64_t)a3 destination:(unint64_t)a4 label:(id)a5 mustReplay:(BOOL)a6 mustPush:(BOOL)a7
{
  return [(HMDBackingStoreTransactionOptions *)self initWithSource:a3 destination:a4 label:a5 mustReplay:a6 mustPush:a7 mustSaveArchiveAtomically:0];
}

- (HMDBackingStoreTransactionOptions)initWithSource:(unint64_t)a3 destination:(unint64_t)a4 label:(id)a5 mustReplay:(BOOL)a6 mustPush:(BOOL)a7 mustSaveArchiveAtomically:(BOOL)a8
{
  return [(HMDBackingStoreTransactionOptions *)self initWithSource:a3 destination:a4 label:a5 mustReplay:a6 mustPush:a7 mustSaveArchiveAtomically:0 cdTransactionAuthor:3 clientIdentifier:0];
}

- (HMDBackingStoreTransactionOptions)initWithSource:(unint64_t)a3 destination:(unint64_t)a4 label:(id)a5 mustReplay:(BOOL)a6 mustPush:(BOOL)a7 mustSaveArchiveAtomically:(BOOL)a8 cdTransactionAuthor:(unint64_t)a9 clientIdentifier:(id)a10
{
  id v16 = a5;
  id v17 = a10;
  v24.receiver = self;
  v24.super_class = (Class)HMDBackingStoreTransactionOptions;
  v18 = [(HMDBackingStoreTransactionOptions *)&v24 init];
  v19 = v18;
  if (!v18) {
    goto LABEL_4;
  }
  v18->_source = a3;
  v18->_destination = a4;
  objc_storeStrong((id *)&v18->_label, a5);
  v19->_mustReplay = a6;
  v19->_mustPush = a7;
  if (a9)
  {
    v19->_cdTransactionAuthor = a9;
    objc_storeStrong((id *)&v19->_clientIdentifier, a10);
    v20 = v19;
LABEL_4:

    return v19;
  }
  v22 = (void *)_HMFPreconditionFailure();
  return (HMDBackingStoreTransactionOptions *)+[HMDBackingStoreTransactionOptions logCategory];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_69739 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_69739, &__block_literal_global_69740);
  }
  v2 = (void *)logCategory__hmf_once_v2_69741;
  return v2;
}

void __48__HMDBackingStoreTransactionOptions_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v2_69741;
  logCategory__hmf_once_v2_69741 = v0;
}

+ (id)stringForHMDBackingStoreDestination:(unint64_t)a3
{
  id v4 = [MEMORY[0x263F089D8] string];
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
    unint64_t v3 = off_264A1BF00[a3];
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

+ (HMDBackingStoreTransactionOptions)defaultCloudOptionsForInitialGraphLoad
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:2 destination:0 label:@"HM.BSTO.replayInitialGraphLoad" mustReplay:0 mustPush:0 mustSaveArchiveAtomically:1];
}

+ (id)defaultXPCOptionsWithCDTransactionAuthor:(unint64_t)a3 clientIdentifier:(id)a4
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:1 destination:3 label:@"<UNSET LABEL>" mustReplay:0 mustPush:0 mustSaveArchiveAtomically:0 cdTransactionAuthor:a3 clientIdentifier:a4];
}

+ (id)defaultXPCOptionsWithClientIdentifier:(id)a3
{
  return +[HMDBackingStoreTransactionOptions defaultXPCOptionsWithCDTransactionAuthor:3 clientIdentifier:a3];
}

+ (HMDBackingStoreTransactionOptions)defaultXPCOptions
{
  return (HMDBackingStoreTransactionOptions *)+[HMDBackingStoreTransactionOptions defaultXPCOptionsWithCDTransactionAuthor:3 clientIdentifier:0];
}

+ (HMDBackingStoreTransactionOptions)defaultLocalOptions
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:0 destination:0 mustReplay:0 mustPush:0];
}

+ (HMDBackingStoreTransactionOptions)optionsWithSource:(unint64_t)a3 destination:(unint64_t)a4 mustReplay:(BOOL)a5 mustPush:(BOOL)a6
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:a3 destination:a4 mustReplay:a5 mustPush:a6 mustSaveArchiveAtomically:0];
}

+ (HMDBackingStoreTransactionOptions)optionsWithSource:(unint64_t)a3 destination:(unint64_t)a4 mustReplay:(BOOL)a5 mustPush:(BOOL)a6 mustSaveArchiveAtomically:(BOOL)a7
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:a3 destination:a4 label:@"<UNSET LABEL>" mustReplay:a5 mustPush:a6 mustSaveArchiveAtomically:a7];
}

+ (HMDBackingStoreTransactionOptions)optionsWithSource:(unint64_t)a3 destination:(unint64_t)a4 label:(id)a5 mustReplay:(BOOL)a6 mustPush:(BOOL)a7 mustSaveArchiveAtomically:(BOOL)a8
{
  return +[HMDBackingStoreTransactionOptions optionsWithSource:a3 destination:a4 label:a5 mustReplay:a6 mustPush:a7 mustSaveArchiveAtomically:a8 cdTransactionAuthor:3 clientIdentifier:0];
}

+ (HMDBackingStoreTransactionOptions)optionsWithSource:(unint64_t)a3 destination:(unint64_t)a4 label:(id)a5 mustReplay:(BOOL)a6 mustPush:(BOOL)a7 mustSaveArchiveAtomically:(BOOL)a8 cdTransactionAuthor:(unint64_t)a9 clientIdentifier:(id)a10
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  BOOL v12 = a6;
  id v16 = a10;
  id v17 = a5;
  v18 = [[HMDBackingStoreTransactionOptions alloc] initWithSource:a3 destination:a4 label:v17 mustReplay:v12 mustPush:v11 mustSaveArchiveAtomically:v10 cdTransactionAuthor:a9 clientIdentifier:v16];

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end