@interface LNActionMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isDiscoverable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSessionStartingAction;
- (BOOL)openAppWhenRun;
- (BOOL)requiresMDMChecks;
- (BOOL)visibleForUse:(int64_t)a3;
- (LNActionConfiguration)actionConfiguration;
- (LNActionDeprecationMetadata)deprecationMetadata;
- (LNActionDescriptionMetadata)descriptionMetadata;
- (LNActionMetadata)actionMetadataWithAttributionBundleIdentifier:(id)a3 icon:(id)a4;
- (LNActionMetadata)actionMetadataWithParameters:(id)a3;
- (LNActionMetadata)actionMetadataWithSystemProtocolMetadata:(id)a3;
- (LNActionMetadata)initWithCoder:(id)a3;
- (LNActionMetadata)initWithCoder_Sydro:(id)a3;
- (LNActionMetadata)initWithIdentifier:(id)a3 effectiveBundleIdentifier:(id)a4 title:(id)a5 description:(id)a6 presentationStyle:(int64_t)a7 outputType:(id)a8 parameters:(id)a9 systemProtocols:(id)a10 actionConfiguration:(id)a11 typeSpecificMetadata:(id)a12;
- (LNActionMetadata)initWithIdentifier:(id)a3 effectiveBundleIdentifier:(id)a4 title:(id)a5 description:(id)a6 presentationStyle:(int64_t)a7 outputType:(id)a8 parameters:(id)a9 systemProtocols:(id)a10 actionConfiguration:(id)a11 typeSpecificMetadata:(id)a12 iconSystemImageName:(id)a13 shortcutsMetadata:(id)a14;
- (LNActionMetadata)initWithIdentifier:(id)a3 effectiveBundleIdentifier:(id)a4 title:(id)a5 description:(id)a6 presentationStyle:(int64_t)a7 outputType:(id)a8 parameters:(id)a9 systemProtocols:(id)a10 actionConfiguration:(id)a11 typeSpecificMetadata:(id)a12 shortcutsMetadata:(id)a13;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifier:(id)a5 title:(id)a6 description:(id)a7 presentationStyle:(int64_t)a8 outputType:(id)a9 parameters:(id)a10 systemProtocols:(id)a11 actionConfiguration:(id)a12 typeSpecificMetadata:(id)a13;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifier:(id)a5 title:(id)a6 description:(id)a7 presentationStyle:(int64_t)a8 outputType:(id)a9 parameters:(id)a10 systemProtocols:(id)a11 actionConfiguration:(id)a12 typeSpecificMetadata:(id)a13 customIntentClassName:(id)a14;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifier:(id)a5 title:(id)a6 description:(id)a7 presentationStyle:(int64_t)a8 outputType:(id)a9 parameters:(id)a10 systemProtocols:(id)a11 actionConfiguration:(id)a12 typeSpecificMetadata:(id)a13 iconSystemImageName:(id)a14 shortcutsMetadata:(id)a15;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifier:(id)a5 title:(id)a6 description:(id)a7 presentationStyle:(int64_t)a8 outputType:(id)a9 parameters:(id)a10 systemProtocols:(id)a11 actionConfiguration:(id)a12 typeSpecificMetadata:(id)a13 iconSystemImageName:(id)a14 shortcutsMetadata:(id)a15 customIntentClassName:(id)a16;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifier:(id)a5 title:(id)a6 description:(id)a7 presentationStyle:(int64_t)a8 outputType:(id)a9 parameters:(id)a10 systemProtocols:(id)a11 sessionStartingAction:(BOOL)a12 actionConfiguration:(id)a13 typeSpecificMetadata:(id)a14 customIntentClassName:(id)a15;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifier:(id)a5 title:(id)a6 description:(id)a7 presentationStyle:(int64_t)a8 outputType:(id)a9 parameters:(id)a10 systemProtocols:(id)a11 sessionStartingAction:(BOOL)a12 actionConfiguration:(id)a13 typeSpecificMetadata:(id)a14 iconSystemImageName:(id)a15 shortcutsMetadata:(id)a16 customIntentClassName:(id)a17;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifiers:(id)a5 bundleMetadataVersion:(int64_t)a6 title:(id)a7 description:(id)a8 presentationStyle:(int64_t)a9 outputType:(id)a10 parameters:(id)a11 systemProtocols:(id)a12 actionConfiguration:(id)a13 typeSpecificMetadata:(id)a14 iconSystemImageName:(id)a15 shortcutsMetadata:(id)a16 customIntentClassName:(id)a17;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifiers:(id)a5 bundleMetadataVersion:(int64_t)a6 title:(id)a7 description:(id)a8 presentationStyle:(int64_t)a9 outputType:(id)a10 parameters:(id)a11 systemProtocols:(id)a12 sessionStartingAction:(BOOL)a13 actionConfiguration:(id)a14 typeSpecificMetadata:(id)a15 iconSystemImageName:(id)a16 shortcutsMetadata:(id)a17 customIntentClassName:(id)a18;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifiers:(id)a5 bundleMetadataVersion:(int64_t)a6 title:(id)a7 description:(id)a8 presentationStyle:(int64_t)a9 outputType:(id)a10 parameters:(id)a11 systemProtocols:(id)a12 sessionStartingAction:(BOOL)a13 actionConfiguration:(id)a14 typeSpecificMetadata:(id)a15 iconSystemImageName:(id)a16 shortcutsMetadata:(id)a17 customIntentClassName:(id)a18 requiresMDMChecks:(BOOL)a19;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifiers:(id)a5 title:(id)a6 description:(id)a7 presentationStyle:(int64_t)a8 outputType:(id)a9 parameters:(id)a10 systemProtocols:(id)a11 actionConfiguration:(id)a12 typeSpecificMetadata:(id)a13 customIntentClassName:(id)a14;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifiers:(id)a5 title:(id)a6 description:(id)a7 presentationStyle:(int64_t)a8 outputType:(id)a9 parameters:(id)a10 systemProtocols:(id)a11 sessionStartingAction:(BOOL)a12 actionConfiguration:(id)a13 typeSpecificMetadata:(id)a14 customIntentClassName:(id)a15;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifiers:(id)a5 title:(id)a6 description:(id)a7 presentationStyle:(int64_t)a8 outputType:(id)a9 parameters:(id)a10 systemProtocols:(id)a11 sessionStartingAction:(BOOL)a12 actionConfiguration:(id)a13 typeSpecificMetadata:(id)a14 iconSystemImageName:(id)a15 shortcutsMetadata:(id)a16 customIntentClassName:(id)a17;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 description:(id)a9 presentationStyle:(int64_t)a10 outputType:(id)a11 parameters:(id)a12 systemProtocols:(id)a13 actionConfiguration:(id)a14 typeSpecificMetadata:(id)a15 iconSystemImageName:(id)a16 shortcutsMetadata:(id)a17 customIntentClassName:(id)a18;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 deprecationMetadata:(id)a10 openAppWhenRun:(BOOL)a11 authenticationPolicy:(int64_t)a12 outputType:(id)a13 outputFlags:(unint64_t)a14 parameters:(id)a15 systemProtocolMetadata:(id)a16 actionConfiguration:(id)a17 typeSpecificMetadata:(id)a18 customIntentClassName:(id)a19 availabilityAnnotations:(id)a20 shortcutsMetadata:(id)a21;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 deprecationMetadata:(id)a10 openAppWhenRun:(BOOL)a11 authenticationPolicy:(int64_t)a12 outputType:(id)a13 outputFlags:(unint64_t)a14 parameters:(id)a15 systemProtocolMetadata:(id)a16 actionConfiguration:(id)a17 typeSpecificMetadata:(id)a18 customIntentClassName:(id)a19 availabilityAnnotations:(id)a20 shortcutsMetadata:(id)a21 requiredCapabilities:(id)a22;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 deprecationMetadata:(id)a10 openAppWhenRun:(BOOL)a11 authenticationPolicy:(int64_t)a12 outputType:(id)a13 outputFlags:(unint64_t)a14 parameters:(id)a15 systemProtocolMetadata:(id)a16 actionConfiguration:(id)a17 typeSpecificMetadata:(id)a18 customIntentClassName:(id)a19 availabilityAnnotations:(id)a20 shortcutsMetadata:(id)a21 requiredCapabilities:(id)a22 attributionBundleIdentifier:(id)a23 sideEffect:(id)a24 assistantDefinedSchemas:(id)a25 assistantDefinedSchemaTraits:(id)a26 visibilityMetadata:(id)a27;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 deprecationMetadata:(id)a10 openAppWhenRun:(BOOL)a11 authenticationPolicy:(int64_t)a12 outputType:(id)a13 outputFlags:(unint64_t)a14 parameters:(id)a15 systemProtocolMetadata:(id)a16 actionConfiguration:(id)a17 typeSpecificMetadata:(id)a18 customIntentClassName:(id)a19 availabilityAnnotations:(id)a20 shortcutsMetadata:(id)a21 requiredCapabilities:(id)a22 attributionBundleIdentifier:(id)a23 sideEffect:(id)a24 assistantDefinedSchemas:(id)a25 assistantDefinedSchemaTraits:(id)a26 visibilityMetadata:(id)a27 fullyQualifiedTypeName:(id)a28;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 deprecationMetadata:(id)a10 openAppWhenRun:(BOOL)a11 discoverable:(BOOL)a12 authenticationPolicy:(int64_t)a13 outputType:(id)a14 outputFlags:(unint64_t)a15 parameters:(id)a16 systemProtocolMetadata:(id)a17 actionConfiguration:(id)a18 typeSpecificMetadata:(id)a19 customIntentClassName:(id)a20 availabilityAnnotations:(id)a21 shortcutsMetadata:(id)a22 requiredCapabilities:(id)a23;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 deprecationMetadata:(id)a10 openAppWhenRun:(BOOL)a11 discoverable:(BOOL)a12 authenticationPolicy:(int64_t)a13 outputType:(id)a14 outputFlags:(unint64_t)a15 parameters:(id)a16 systemProtocolMetadata:(id)a17 actionConfiguration:(id)a18 typeSpecificMetadata:(id)a19 customIntentClassName:(id)a20 availabilityAnnotations:(id)a21 shortcutsMetadata:(id)a22 requiredCapabilities:(id)a23 attributionBundleIdentifier:(id)a24;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 deprecationMetadata:(id)a10 openAppWhenRun:(BOOL)a11 discoverable:(BOOL)a12 authenticationPolicy:(int64_t)a13 outputType:(id)a14 outputFlags:(unint64_t)a15 parameters:(id)a16 systemProtocolMetadata:(id)a17 actionConfiguration:(id)a18 typeSpecificMetadata:(id)a19 customIntentClassName:(id)a20 availabilityAnnotations:(id)a21 shortcutsMetadata:(id)a22 requiredCapabilities:(id)a23 attributionBundleIdentifier:(id)a24 sideEffect:(id)a25;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 deprecationMetadata:(id)a10 openAppWhenRun:(BOOL)a11 discoverable:(BOOL)a12 authenticationPolicy:(int64_t)a13 outputType:(id)a14 outputFlags:(unint64_t)a15 parameters:(id)a16 systemProtocolMetadata:(id)a17 actionConfiguration:(id)a18 typeSpecificMetadata:(id)a19 customIntentClassName:(id)a20 availabilityAnnotations:(id)a21 shortcutsMetadata:(id)a22 requiredCapabilities:(id)a23 attributionBundleIdentifier:(id)a24 sideEffect:(id)a25 assistantDefinedSchemas:(id)a26;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 deprecationMetadata:(id)a10 openAppWhenRun:(BOOL)a11 discoverable:(BOOL)a12 authenticationPolicy:(int64_t)a13 outputType:(id)a14 outputFlags:(unint64_t)a15 parameters:(id)a16 systemProtocolMetadata:(id)a17 actionConfiguration:(id)a18 typeSpecificMetadata:(id)a19 customIntentClassName:(id)a20 availabilityAnnotations:(id)a21 shortcutsMetadata:(id)a22 requiredCapabilities:(id)a23 attributionBundleIdentifier:(id)a24 sideEffect:(id)a25 assistantDefinedSchemas:(id)a26 assistantDefinedSchemaTraits:(id)a27;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 deprecationMetadata:(id)a10 openAppWhenRun:(BOOL)a11 explicitAuthenticationPolicy:(id)a12 outputType:(id)a13 outputFlags:(unint64_t)a14 parameters:(id)a15 systemProtocolMetadata:(id)a16 actionConfiguration:(id)a17 typeSpecificMetadata:(id)a18 customIntentClassName:(id)a19 availabilityAnnotations:(id)a20 shortcutsMetadata:(id)a21 requiredCapabilities:(id)a22 attributionBundleIdentifier:(id)a23 sideEffect:(id)a24 assistantDefinedSchemas:(id)a25 assistantDefinedSchemaTraits:(id)a26 visibilityMetadata:(id)a27 fullyQualifiedTypeName:(id)a28;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 openAppWhenRun:(BOOL)a10 authenticationPolicy:(int64_t)a11 outputType:(id)a12 outputFlags:(unint64_t)a13 parameters:(id)a14 systemProtocolMetadata:(id)a15 actionConfiguration:(id)a16 typeSpecificMetadata:(id)a17 customIntentClassName:(id)a18 availabilityAnnotations:(id)a19 shortcutsMetadata:(id)a20;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 openAppWhenRun:(BOOL)a10 authenticationPolicy:(int64_t)a11 outputType:(id)a12 outputFlags:(unint64_t)a13 parameters:(id)a14 systemProtocols:(id)a15 actionConfiguration:(id)a16 typeSpecificMetadata:(id)a17 customIntentClassName:(id)a18 availabilityAnnotations:(id)a19 shortcutsMetadata:(id)a20;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 openAppWhenRun:(BOOL)a10 authenticationPolicy:(int64_t)a11 outputType:(id)a12 outputFlags:(unint64_t)a13 parameters:(id)a14 systemProtocols:(id)a15 actionConfiguration:(id)a16 typeSpecificMetadata:(id)a17 customIntentClassName:(id)a18 shortcutsMetadata:(id)a19;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 presentationStyle:(int64_t)a10 authenticationPolicy:(int64_t)a11 outputType:(id)a12 outputFlags:(unint64_t)a13 parameters:(id)a14 systemProtocols:(id)a15 actionConfiguration:(id)a16 typeSpecificMetadata:(id)a17 iconSystemImageName:(id)a18 customIntentClassName:(id)a19 shortcutsMetadata:(id)a20;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 presentationStyle:(int64_t)a10 authenticationPolicy:(int64_t)a11 outputType:(id)a12 parameters:(id)a13 systemProtocols:(id)a14 actionConfiguration:(id)a15 typeSpecificMetadata:(id)a16 iconSystemImageName:(id)a17 customIntentClassName:(id)a18 shortcutsMetadata:(id)a19;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 title:(id)a5 description:(id)a6 presentationStyle:(int64_t)a7 outputType:(id)a8 parameters:(id)a9 systemProtocols:(id)a10 actionConfiguration:(id)a11 typeSpecificMetadata:(id)a12 customIntentClassName:(id)a13;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 title:(id)a5 descriptionMetadata:(id)a6 openAppWhenRun:(BOOL)a7 authenticationPolicy:(int64_t)a8 outputType:(id)a9 outputFlags:(unint64_t)a10 parameters:(id)a11 systemProtocols:(id)a12 actionConfiguration:(id)a13 typeSpecificMetadata:(id)a14 customIntentClassName:(id)a15;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 title:(id)a5 descriptionMetadata:(id)a6 presentationStyle:(int64_t)a7 authenticationPolicy:(int64_t)a8 outputType:(id)a9 outputFlags:(unint64_t)a10 parameters:(id)a11 systemProtocols:(id)a12 actionConfiguration:(id)a13 typeSpecificMetadata:(id)a14 customIntentClassName:(id)a15;
- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 title:(id)a5 descriptionMetadata:(id)a6 presentationStyle:(int64_t)a7 authenticationPolicy:(int64_t)a8 outputType:(id)a9 parameters:(id)a10 systemProtocols:(id)a11 actionConfiguration:(id)a12 typeSpecificMetadata:(id)a13 customIntentClassName:(id)a14;
- (LNActionMetadata)initWithIdentifier:(id)a3 title:(id)a4 description:(id)a5 presentationStyle:(int64_t)a6 outputType:(id)a7 parameters:(id)a8 systemProtocols:(id)a9 actionConfiguration:(id)a10;
- (LNActionSideEffect)sideEffect;
- (LNStaticDeferredLocalizedString)actionDescription;
- (LNStaticDeferredLocalizedString)title;
- (LNValueType)outputType;
- (LNVisibilityMetadata)visibilityMetadata;
- (NSArray)assistantDefinedSchemaTraits;
- (NSArray)assistantDefinedSchemas;
- (NSArray)parameters;
- (NSArray)requiredCapabilities;
- (NSArray)systemProtocols;
- (NSDictionary)availabilityAnnotations;
- (NSDictionary)mangledTypeNameByBundleIdentifier;
- (NSDictionary)shortcutsMetadata;
- (NSDictionary)systemProtocolMetadata;
- (NSDictionary)typeSpecificMetadata;
- (NSNumber)explicitAuthenticationPolicy;
- (NSOrderedSet)effectiveBundleIdentifiers;
- (NSString)attributionBundleIdentifier;
- (NSString)customIntentClassName;
- (NSString)description;
- (NSString)effectiveBundleIdentifier;
- (NSString)fullyQualifiedTypeName;
- (NSString)iconSystemImageName;
- (NSString)identifier;
- (NSString)mangledTypeName;
- (NSString)nullableEffectiveBundleIdentifier;
- (id)actionMetadataDescriptionMetadata:(id)a3;
- (id)authenticationPolicyAllowingImplicit:(BOOL)a3;
- (id)copyWithDescriptiveMetadataFromAction:(id)a3 usingLibraryKey:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyWithoutMangledTypeNameWithAvailability:(id)a3;
- (id)mangledTypeNameForBundleIdentifier:(id)a3;
- (id)metadataByAddingEffectiveBundleIdentifiers:(id)a3 mangledTypeNameByBundleIdentifier:(id)a4;
- (id)nameIndexedParameters;
- (id)schemaStringForStaticDeferredLocalizedString:(id)a3 usingLibraryKey:(id)a4;
- (int64_t)authenticationPolicy;
- (int64_t)bundleMetadataVersion;
- (int64_t)presentationStyle;
- (unint64_t)hash;
- (unint64_t)outputFlags;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNActionMetadata

- (LNActionMetadata)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v88 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  uint64_t v86 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"mangledTypeName"];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  uint64_t v85 = [v3 decodeObjectOfClasses:v6 forKey:@"effectiveBundleIdentifiers"];

  uint64_t v84 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  uint64_t v83 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"descriptionMetadata"];
  uint64_t v82 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"deprecationMetadata"];
  uint64_t v81 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"outputType"];
  uint64_t v78 = [v3 decodeIntegerForKey:@"outputFlags"];
  uint64_t v76 = [v3 decodeIntegerForKey:@"openAppWhenRun"];
  v80 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"explicitAuthenticationPolicy"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v90 = [v3 decodeObjectOfClasses:v9 forKey:@"parameters"];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, v16, v17, objc_opt_class(), 0);
  v89 = [v3 decodeObjectOfClasses:v18 forKey:@"systemProtocolMetadata"];

  v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v20 = objc_opt_class();
  v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  uint64_t v87 = [v3 decodeObjectOfClasses:v21 forKey:@"mangledTypeNameByBundleIdentifier"];

  v22 = 0;
  if (!v88)
  {
    v64 = self;
    v63 = 0;
    v27 = (void *)v85;
    v23 = (void *)v86;
    v25 = (void *)v83;
    v24 = (void *)v84;
    v26 = (void *)v82;
LABEL_15:
    v28 = (void *)v81;
    v29 = (void *)v87;
    goto LABEL_12;
  }
  v23 = (void *)v86;
  v25 = (void *)v83;
  v24 = (void *)v84;
  v26 = (void *)v82;
  if (!v86)
  {
    v64 = self;
    v63 = (void *)v88;
    v27 = (void *)v85;
    goto LABEL_15;
  }
  v27 = (void *)v85;
  v28 = (void *)v81;
  if (v90 && v89 && v85)
  {
    v29 = (void *)v87;
    if (v87)
    {
      v75 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"customIntentClassName"];
      v74 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"actionConfiguration"];
      v30 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v31 = objc_opt_class();
      uint64_t v32 = objc_opt_class();
      uint64_t v33 = objc_opt_class();
      uint64_t v34 = objc_opt_class();
      v35 = objc_msgSend(v30, "setWithObjects:", v31, v32, v33, v34, objc_opt_class(), 0);
      v73 = [v3 decodeObjectOfClasses:v35 forKey:@"typeSpecificMetadata"];

      uint64_t v69 = [v3 decodeIntegerForKey:@"bundleMetadataVersion"];
      v36 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v37 = objc_opt_class();
      uint64_t v38 = objc_opt_class();
      uint64_t v39 = objc_opt_class();
      uint64_t v40 = objc_opt_class();
      uint64_t v41 = objc_opt_class();
      uint64_t v42 = objc_opt_class();
      v43 = objc_msgSend(v36, "setWithObjects:", v37, v38, v39, v40, v41, v42, objc_opt_class(), 0);
      v72 = [v3 decodeObjectOfClasses:v43 forKey:@"shortcutsMetadata"];

      v44 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v45 = objc_opt_class();
      uint64_t v46 = objc_opt_class();
      v47 = objc_msgSend(v44, "setWithObjects:", v45, v46, objc_opt_class(), 0);
      v71 = [v3 decodeObjectOfClasses:v47 forKey:@"availabilityAnnotations"];

      v48 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v49 = objc_opt_class();
      v50 = objc_msgSend(v48, "setWithObjects:", v49, objc_opt_class(), 0);
      v70 = [v3 decodeObjectOfClasses:v50 forKey:@"requiredCapabilities"];

      v51 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"attributionBundleIdentifier"];
      uint64_t v52 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"sideEffect"];
      v53 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v54 = objc_opt_class();
      v55 = objc_msgSend(v53, "setWithObjects:", v54, objc_opt_class(), 0);
      v56 = [v3 decodeObjectOfClasses:v55 forKey:@"assistantDefinedSchemas"];

      v57 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v58 = objc_opt_class();
      v59 = objc_msgSend(v57, "setWithObjects:", v58, objc_opt_class(), 0);
      v60 = [v3 decodeObjectOfClasses:v59 forKey:@"assistantDefinedSchemaTraits"];

      v61 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"visibilityMetadata"];
      if (!v61) {
        v61 = -[LNVisibilityMetadata initWithIsDiscoverable:assistantOnly:]([LNVisibilityMetadata alloc], "initWithIsDiscoverable:assistantOnly:", [v3 decodeBoolForKey:@"isDiscoverable"], 0);
      }
      BOOL v62 = v76 != 0;
      v77 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"fullyQualifiedTypeName"];
      v68 = (void *)v52;
      uint64_t v67 = v52;
      v28 = (void *)v81;
      LOBYTE(v66) = v62;
      v26 = (void *)v82;
      v25 = (void *)v83;
      v63 = (void *)v88;
      v64 = objc_retain(-[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:explicitAuthenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:assistantDefinedSchemas:assistantDefinedSchemaTraits:visibilityMetadata:fullyQualifiedTypeName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:explicitAuthenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:assistantDefinedSchemas:assistantDefinedSchemaTraits:visibilityMetadata:fullyQualifiedTypeName:", v88, v86, v87, v85, v69, v84, v83, v82, v66, v80, v81, v78,
                v90,
                v89,
                v74,
                v73,
                v75,
                v71,
                v72,
                v70,
                v51,
                v67,
                v56,
                v60,
                v61,
                v77));

      v24 = (void *)v84;
      v27 = (void *)v85;

      v23 = (void *)v86;
      v29 = (void *)v87;
      v22 = v64;
    }
    else
    {
      v64 = self;
      v63 = (void *)v88;
    }
  }
  else
  {
    v64 = self;
    v29 = (void *)v87;
    v63 = (void *)v88;
  }
LABEL_12:

  return v22;
}

id __545__LNActionMetadata_initWithIdentifier_mangledTypeName_mangledTypeNameByBundleIdentifier_effectiveBundleIdentifiers_bundleMetadataVersion_title_descriptionMetadata_deprecationMetadata_openAppWhenRun_explicitAuthenticationPolicy_outputType_outputFlags_parameters_systemProtocolMetadata_actionConfiguration_typeSpecificMetadata_customIntentClassName_availabilityAnnotations_shortcutsMetadata_requiredCapabilities_attributionBundleIdentifier_sideEffect_assistantDefinedSchemas_assistantDefinedSchemaTraits_visibilityMetadata_fullyQualifiedTypeName___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[LNSystemProtocol protocolOrNilWithIdentifier:a2];
}

- (LNActionMetadata)actionMetadataWithParameters:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"LNActionMetadata.m", 43, @"Invalid parameter not satisfying: %@", @"parameters" object file lineNumber description];
  }
  v6 = (void *)[(LNActionMetadata *)self copy];
  uint64_t v7 = [v5 copy];
  uint64_t v8 = (void *)v6[17];
  v6[17] = v7;

  return (LNActionMetadata *)v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v28 = a3;
  v4 = [(LNActionMetadata *)self identifier];
  [v28 encodeObject:v4 forKey:@"identifier"];

  id v5 = [(LNActionMetadata *)self mangledTypeName];
  [v28 encodeObject:v5 forKey:@"mangledTypeName"];

  v6 = [(LNActionMetadata *)self effectiveBundleIdentifiers];
  [v28 encodeObject:v6 forKey:@"effectiveBundleIdentifiers"];

  uint64_t v7 = [(LNActionMetadata *)self title];
  [v28 encodeObject:v7 forKey:@"title"];

  uint64_t v8 = [(LNActionMetadata *)self descriptionMetadata];
  [v28 encodeObject:v8 forKey:@"descriptionMetadata"];

  v9 = [(LNActionMetadata *)self deprecationMetadata];
  [v28 encodeObject:v9 forKey:@"deprecationMetadata"];

  v10 = [(LNActionMetadata *)self parameters];
  [v28 encodeObject:v10 forKey:@"parameters"];

  uint64_t v11 = [(LNActionMetadata *)self outputType];
  [v28 encodeObject:v11 forKey:@"outputType"];

  objc_msgSend(v28, "encodeInteger:forKey:", -[LNActionMetadata outputFlags](self, "outputFlags"), @"outputFlags");
  objc_msgSend(v28, "encodeInteger:forKey:", -[LNActionMetadata openAppWhenRun](self, "openAppWhenRun"), @"openAppWhenRun");
  uint64_t v12 = [(LNActionMetadata *)self explicitAuthenticationPolicy];
  [v28 encodeObject:v12 forKey:@"explicitAuthenticationPolicy"];

  uint64_t v13 = [(LNActionMetadata *)self systemProtocolMetadata];
  [v28 encodeObject:v13 forKey:@"systemProtocolMetadata"];

  uint64_t v14 = [(LNActionMetadata *)self actionConfiguration];
  [v28 encodeObject:v14 forKey:@"actionConfiguration"];

  uint64_t v15 = [(LNActionMetadata *)self typeSpecificMetadata];
  [v28 encodeObject:v15 forKey:@"typeSpecificMetadata"];

  uint64_t v16 = [(LNActionMetadata *)self customIntentClassName];
  [v28 encodeObject:v16 forKey:@"customIntentClassName"];

  objc_msgSend(v28, "encodeInteger:forKey:", -[LNActionMetadata bundleMetadataVersion](self, "bundleMetadataVersion"), @"bundleMetadataVersion");
  uint64_t v17 = [(LNActionMetadata *)self mangledTypeNameByBundleIdentifier];
  [v28 encodeObject:v17 forKey:@"mangledTypeNameByBundleIdentifier"];

  v18 = [(LNActionMetadata *)self availabilityAnnotations];
  [v28 encodeObject:v18 forKey:@"availabilityAnnotations"];

  v19 = [(LNActionMetadata *)self shortcutsMetadata];
  [v28 encodeObject:v19 forKey:@"shortcutsMetadata"];

  uint64_t v20 = [(LNActionMetadata *)self requiredCapabilities];
  [v28 encodeObject:v20 forKey:@"requiredCapabilities"];

  v21 = [(LNActionMetadata *)self attributionBundleIdentifier];
  [v28 encodeObject:v21 forKey:@"attributionBundleIdentifier"];

  v22 = [(LNActionMetadata *)self sideEffect];
  [v28 encodeObject:v22 forKey:@"sideEffect"];

  v23 = [(LNActionMetadata *)self assistantDefinedSchemas];
  [v28 encodeObject:v23 forKey:@"assistantDefinedSchemas"];

  v24 = [(LNActionMetadata *)self assistantDefinedSchemaTraits];
  [v28 encodeObject:v24 forKey:@"assistantDefinedSchemaTraits"];

  v25 = [(LNActionMetadata *)self visibilityMetadata];
  [v28 encodeObject:v25 forKey:@"visibilityMetadata"];

  v26 = [(LNActionMetadata *)self fullyQualifiedTypeName];
  [v28 encodeObject:v26 forKey:@"fullyQualifiedTypeName"];

  v27 = [(LNActionMetadata *)self systemProtocols];
  [v28 encodeObject:v27 forKey:@"systemProtocols"];

  objc_msgSend(v28, "encodeInteger:forKey:", -[LNActionMetadata authenticationPolicy](self, "authenticationPolicy"), @"authenticationPolicy");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v22 = [LNActionMetadata alloc];
  uint64_t v33 = [(LNActionMetadata *)self identifier];
  uint64_t v32 = [(LNActionMetadata *)self mangledTypeName];
  v21 = [(LNActionMetadata *)self mangledTypeNameByBundleIdentifier];
  uint64_t v20 = [(LNActionMetadata *)self effectiveBundleIdentifiers];
  int64_t v19 = [(LNActionMetadata *)self bundleMetadataVersion];
  v18 = [(LNActionMetadata *)self title];
  uint64_t v31 = [(LNActionMetadata *)self descriptionMetadata];
  v30 = [(LNActionMetadata *)self deprecationMetadata];
  BOOL v17 = [(LNActionMetadata *)self openAppWhenRun];
  v29 = [(LNActionMetadata *)self explicitAuthenticationPolicy];
  id v28 = [(LNActionMetadata *)self outputType];
  unint64_t v16 = [(LNActionMetadata *)self outputFlags];
  v27 = [(LNActionMetadata *)self parameters];
  v26 = [(LNActionMetadata *)self systemProtocolMetadata];
  v25 = [(LNActionMetadata *)self actionConfiguration];
  v24 = [(LNActionMetadata *)self typeSpecificMetadata];
  uint64_t v15 = [(LNActionMetadata *)self customIntentClassName];
  uint64_t v14 = [(LNActionMetadata *)self availabilityAnnotations];
  uint64_t v13 = [(LNActionMetadata *)self shortcutsMetadata];
  v4 = [(LNActionMetadata *)self requiredCapabilities];
  id v5 = [(LNActionMetadata *)self attributionBundleIdentifier];
  v6 = [(LNActionMetadata *)self sideEffect];
  uint64_t v7 = [(LNActionMetadata *)self assistantDefinedSchemas];
  uint64_t v8 = [(LNActionMetadata *)self assistantDefinedSchemaTraits];
  v9 = [(LNActionMetadata *)self visibilityMetadata];
  v10 = [(LNActionMetadata *)self fullyQualifiedTypeName];
  LOBYTE(v12) = v17;
  v23 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:explicitAuthenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:assistantDefinedSchemas:assistantDefinedSchemaTraits:visibilityMetadata:fullyQualifiedTypeName:](v22, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:explicitAuthenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:assistantDefinedSchemas:assistantDefinedSchemaTraits:visibilityMetadata:fullyQualifiedTypeName:", v33, v32, v21, v20, v19, v18, v31, v30, v12, v29, v28, v16, v27,
          v26,
          v25,
          v24,
          v15,
          v14,
          v13,
          v4,
          v5,
          v6,
          v7,
          v8,
          v9,
          v10);

  return v23;
}

- (NSOrderedSet)effectiveBundleIdentifiers
{
  return self->_effectiveBundleIdentifiers;
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (NSDictionary)availabilityAnnotations
{
  return self->_availabilityAnnotations;
}

- (NSArray)requiredCapabilities
{
  return self->_requiredCapabilities;
}

- (LNActionDeprecationMetadata)deprecationMetadata
{
  return self->_deprecationMetadata;
}

- (LNActionConfiguration)actionConfiguration
{
  return self->_actionConfiguration;
}

- (LNActionDescriptionMetadata)descriptionMetadata
{
  return self->_descriptionMetadata;
}

- (NSString)attributionBundleIdentifier
{
  return self->_attributionBundleIdentifier;
}

- (LNStaticDeferredLocalizedString)title
{
  return self->_title;
}

- (id)mangledTypeNameForBundleIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"LNActionMetadata.m", 35, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
  }
  v6 = [(LNActionMetadata *)self mangledTypeNameByBundleIdentifier];
  uint64_t v7 = [v6 objectForKeyedSubscript:v5];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [(LNActionMetadata *)self mangledTypeName];
  }
  v10 = v9;

  return v10;
}

- (NSDictionary)mangledTypeNameByBundleIdentifier
{
  return self->_mangledTypeNameByBundleIdentifier;
}

- (NSDictionary)typeSpecificMetadata
{
  return self->_typeSpecificMetadata;
}

- (NSDictionary)systemProtocolMetadata
{
  return self->_systemProtocolMetadata;
}

- (NSNumber)explicitAuthenticationPolicy
{
  return self->_explicitAuthenticationPolicy;
}

- (LNVisibilityMetadata)visibilityMetadata
{
  return self->_visibilityMetadata;
}

- (LNActionSideEffect)sideEffect
{
  return self->_sideEffect;
}

- (NSDictionary)shortcutsMetadata
{
  return self->_shortcutsMetadata;
}

- (NSString)mangledTypeName
{
  return self->_mangledTypeName;
}

- (NSString)fullyQualifiedTypeName
{
  return self->_fullyQualifiedTypeName;
}

- (NSString)customIntentClassName
{
  return self->_customIntentClassName;
}

- (int64_t)bundleMetadataVersion
{
  return self->_bundleMetadataVersion;
}

- (NSArray)assistantDefinedSchemas
{
  return self->_assistantDefinedSchemas;
}

- (NSArray)assistantDefinedSchemaTraits
{
  return self->_assistantDefinedSchemaTraits;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)outputFlags
{
  return self->_outputFlags;
}

- (NSArray)systemProtocols
{
  return self->_systemProtocols;
}

- (BOOL)openAppWhenRun
{
  return self->_openAppWhenRun;
}

- (LNValueType)outputType
{
  return self->_outputType;
}

- (id)authenticationPolicyAllowingImplicit:(BOOL)a3
{
  explicitAuthenticationPolicy = self->_explicitAuthenticationPolicy;
  if (a3 && !explicitAuthenticationPolicy)
  {
    v4 = [NSNumber numberWithInt:0];
  }
  else
  {
    v4 = explicitAuthenticationPolicy;
  }
  return v4;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 deprecationMetadata:(id)a10 openAppWhenRun:(BOOL)a11 explicitAuthenticationPolicy:(id)a12 outputType:(id)a13 outputFlags:(unint64_t)a14 parameters:(id)a15 systemProtocolMetadata:(id)a16 actionConfiguration:(id)a17 typeSpecificMetadata:(id)a18 customIntentClassName:(id)a19 availabilityAnnotations:(id)a20 shortcutsMetadata:(id)a21 requiredCapabilities:(id)a22 attributionBundleIdentifier:(id)a23 sideEffect:(id)a24 assistantDefinedSchemas:(id)a25 assistantDefinedSchemaTraits:(id)a26 visibilityMetadata:(id)a27 fullyQualifiedTypeName:(id)a28
{
  id v111 = a3;
  id v32 = a4;
  id v33 = a5;
  id v34 = a6;
  id obj = a8;
  id v105 = a8;
  id v87 = a9;
  id v104 = a9;
  id v89 = a10;
  id v103 = a10;
  id v90 = a12;
  id v102 = a12;
  id v91 = a13;
  id v101 = a13;
  id v35 = a15;
  id v110 = a16;
  id v92 = a17;
  id v100 = a17;
  id v36 = a18;
  id v109 = a19;
  id v108 = a20;
  id v107 = a21;
  id v37 = a22;
  id v98 = a23;
  id v99 = a24;
  id v97 = a25;
  id v96 = a26;
  id v38 = a27;
  id v95 = a28;
  if (!v111)
  {
    uint64_t v83 = [MEMORY[0x1E4F28B00] currentHandler];
    [v83 handleFailureInMethod:a2, self, @"LNActionMetadata.m", 100, @"Invalid parameter not satisfying: %@", @"identifier", a9, a8, a10, a12, a13, a17 object file lineNumber description];
  }
  uint64_t v39 = v37;
  if (!v32)
  {
    uint64_t v84 = [MEMORY[0x1E4F28B00] currentHandler];
    [v84 handleFailureInMethod:a2, self, @"LNActionMetadata.m", 101, @"Invalid parameter not satisfying: %@", @"mangledTypeName" object file lineNumber description];
  }
  uint64_t v40 = v33;
  uint64_t v41 = v110;
  uint64_t v42 = v35;
  if (!v35)
  {
    uint64_t v85 = [MEMORY[0x1E4F28B00] currentHandler];
    [v85 handleFailureInMethod:a2, self, @"LNActionMetadata.m", 102, @"Invalid parameter not satisfying: %@", @"parameters" object file lineNumber description];
  }
  v43 = v36;
  if (!v38)
  {
    uint64_t v86 = [MEMORY[0x1E4F28B00] currentHandler];
    [v86 handleFailureInMethod:a2, self, @"LNActionMetadata.m", 103, @"Invalid parameter not satisfying: %@", @"visibilityMetadata" object file lineNumber description];
  }
  v112.receiver = self;
  v112.super_class = (Class)LNActionMetadata;
  v44 = [(LNActionMetadata *)&v112 init];
  uint64_t v45 = v32;
  if (v44)
  {
    uint64_t v46 = [v111 copy];
    identifier = v44->_identifier;
    v44->_identifier = (NSString *)v46;

    uint64_t v48 = [v32 copy];
    mangledTypeName = v44->_mangledTypeName;
    v44->_mangledTypeName = (NSString *)v48;

    uint64_t v50 = [v34 copy];
    effectiveBundleIdentifiers = v44->_effectiveBundleIdentifiers;
    v44->_effectiveBundleIdentifiers = (NSOrderedSet *)v50;

    objc_storeStrong((id *)&v44->_title, obj);
    objc_storeStrong((id *)&v44->_descriptionMetadata, v87);
    objc_storeStrong((id *)&v44->_deprecationMetadata, v89);
    uint64_t v52 = [v42 copy];
    parameters = v44->_parameters;
    v44->_parameters = (NSArray *)v52;

    v44->_openAppWhenRun = a11;
    uint64_t v41 = v110;
    v44->_discoverable = [v38 isDiscoverable];
    objc_storeStrong((id *)&v44->_explicitAuthenticationPolicy, v90);
    objc_storeStrong((id *)&v44->_outputType, v91);
    v44->_outputFlags = a14;
    uint64_t v54 = [v110 copy];
    systemProtocolMetadata = v44->_systemProtocolMetadata;
    v44->_systemProtocolMetadata = (NSDictionary *)v54;

    objc_storeStrong((id *)&v44->_actionConfiguration, v92);
    uint64_t v56 = [v43 copy];
    typeSpecificMetadata = v44->_typeSpecificMetadata;
    v44->_typeSpecificMetadata = (NSDictionary *)v56;

    uint64_t v58 = [v109 copy];
    customIntentClassName = v44->_customIntentClassName;
    v44->_customIntentClassName = (NSString *)v58;

    v44->_bundleMetadataVersion = a7;
    uint64_t v60 = [v40 copy];
    mangledTypeNameByBundleIdentifier = v44->_mangledTypeNameByBundleIdentifier;
    v44->_mangledTypeNameByBundleIdentifier = (NSDictionary *)v60;

    uint64_t v62 = [v108 copy];
    availabilityAnnotations = v44->_availabilityAnnotations;
    v44->_availabilityAnnotations = (NSDictionary *)v62;

    uint64_t v64 = [v107 copy];
    shortcutsMetadata = v44->_shortcutsMetadata;
    v44->_shortcutsMetadata = (NSDictionary *)v64;

    uint64_t v66 = [v39 copy];
    requiredCapabilities = v44->_requiredCapabilities;
    v44->_requiredCapabilities = (NSArray *)v66;

    uint64_t v68 = [v98 copy];
    attributionBundleIdentifier = v44->_attributionBundleIdentifier;
    v44->_attributionBundleIdentifier = (NSString *)v68;

    v70 = [v110 allKeys];
    uint64_t v71 = objc_msgSend(v70, "if_compactMap:", &__block_literal_global_6809);
    systemProtocols = v44->_systemProtocols;
    v44->_systemProtocols = (NSArray *)v71;

    uint64_t v45 = v32;
    objc_storeStrong((id *)&v44->_sideEffect, a24);
    uint64_t v73 = [v97 copy];
    assistantDefinedSchemas = v44->_assistantDefinedSchemas;
    v44->_assistantDefinedSchemas = (NSArray *)v73;

    uint64_t v75 = [v96 copy];
    assistantDefinedSchemaTraits = v44->_assistantDefinedSchemaTraits;
    v44->_assistantDefinedSchemaTraits = (NSArray *)v75;

    uint64_t v77 = [v38 copy];
    visibilityMetadata = v44->_visibilityMetadata;
    v44->_visibilityMetadata = (LNVisibilityMetadata *)v77;

    uint64_t v79 = [v95 copy];
    fullyQualifiedTypeName = v44->_fullyQualifiedTypeName;
    v44->_fullyQualifiedTypeName = (NSString *)v79;

    uint64_t v81 = v44;
  }

  return v44;
}

- (int64_t)authenticationPolicy
{
  v2 = [(LNActionMetadata *)self authenticationPolicyAllowingImplicit:1];
  int64_t v3 = [v2 integerValue];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityMetadata, 0);
  objc_storeStrong((id *)&self->_nullableEffectiveBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_explicitAuthenticationPolicy, 0);
  objc_storeStrong((id *)&self->_fullyQualifiedTypeName, 0);
  objc_storeStrong((id *)&self->_assistantDefinedSchemaTraits, 0);
  objc_storeStrong((id *)&self->_assistantDefinedSchemas, 0);
  objc_storeStrong((id *)&self->_sideEffect, 0);
  objc_storeStrong((id *)&self->_attributionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_requiredCapabilities, 0);
  objc_storeStrong((id *)&self->_shortcutsMetadata, 0);
  objc_storeStrong((id *)&self->_typeSpecificMetadata, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_mangledTypeNameByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_availabilityAnnotations, 0);
  objc_storeStrong((id *)&self->_customIntentClassName, 0);
  objc_storeStrong((id *)&self->_actionConfiguration, 0);
  objc_storeStrong((id *)&self->_systemProtocols, 0);
  objc_storeStrong((id *)&self->_systemProtocolMetadata, 0);
  objc_storeStrong((id *)&self->_outputType, 0);
  objc_storeStrong((id *)&self->_deprecationMetadata, 0);
  objc_storeStrong((id *)&self->_descriptionMetadata, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_effectiveBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_mangledTypeName, 0);
}

- (NSString)nullableEffectiveBundleIdentifier
{
  return self->_nullableEffectiveBundleIdentifier;
}

- (id)schemaStringForStaticDeferredLocalizedString:(id)a3 usingLibraryKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [LNStaticDeferredLocalizedString alloc];
  uint64_t v8 = NSString;
  id v9 = [v6 key];

  v10 = [v8 stringWithFormat:@"[%@] %@", v5, v9];

  uint64_t v11 = [MEMORY[0x1E4F1CB10] URLWithString:@"file:///System/Library/Frameworks/AppIntents.framework/"];
  uint64_t v12 = [(LNStaticDeferredLocalizedString *)v7 initWithKey:v10 table:@"AssistantSchemas" bundleURL:v11];

  return v12;
}

- (id)nameIndexedParameters
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(LNActionMetadata *)self parameters];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__LNActionMetadata_nameIndexedParameters__block_invoke;
  v7[3] = &unk_1E590DE38;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return v5;
}

void __41__LNActionMetadata_nameIndexedParameters__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 name];

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    id v5 = [v6 name];
    [v4 setObject:v6 forKeyedSubscript:v5];
  }
}

- (LNActionMetadata)actionMetadataWithSystemProtocolMetadata:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(LNActionMetadata *)self copy];
  uint64_t v6 = [v4 copy];
  uint64_t v7 = (void *)v5[10];
  v5[10] = v6;

  id v8 = [v4 allKeys];

  uint64_t v9 = objc_msgSend(v8, "if_compactMap:", &__block_literal_global_146);
  v10 = (void *)v5[11];
  v5[11] = v9;

  return (LNActionMetadata *)v5;
}

id __61__LNActionMetadata_actionMetadataWithSystemProtocolMetadata___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[LNSystemProtocol protocolOrNilWithIdentifier:a2];
}

- (id)copyWithDescriptiveMetadataFromAction:(id)a3 usingLibraryKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[(LNActionMetadata *)self copy];
  uint64_t v54 = v6;
  uint64_t v9 = [v6 title];
  uint64_t v10 = [(LNActionMetadata *)self schemaStringForStaticDeferredLocalizedString:v9 usingLibraryKey:v7];
  uint64_t v11 = (void *)v8[5];
  v8[5] = v10;

  v53 = [LNActionDescriptionMetadata alloc];
  uint64_t v56 = [v6 descriptionMetadata];
  v55 = [v56 descriptionText];
  v59 = v7;
  uint64_t v12 = [(LNActionMetadata *)self schemaStringForStaticDeferredLocalizedString:v55 usingLibraryKey:v7];
  uint64_t v13 = [(LNActionMetadata *)self descriptionMetadata];
  uint64_t v14 = [v13 categoryName];
  uint64_t v15 = [(LNActionMetadata *)self descriptionMetadata];
  unint64_t v16 = [v15 searchKeywords];
  BOOL v17 = [(LNActionMetadata *)self descriptionMetadata];
  v18 = [v17 resultValueName];
  uint64_t v58 = self;
  int64_t v19 = [(LNActionMetadata *)self descriptionMetadata];
  uint64_t v20 = [v19 icon];
  uint64_t v21 = [(LNActionDescriptionMetadata *)v53 initWithDescriptionText:v12 categoryName:v14 searchKeywords:v16 resultValueName:v18 icon:v20];
  v22 = (void *)v8[6];
  v8[6] = v21;

  uint64_t v23 = [v54 actionConfiguration];
  if (!v23)
  {
    v27 = 0;
    v26 = v8;
LABEL_7:

    goto LABEL_8;
  }
  v24 = (void *)v23;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v26 = v8;
  if (!v8[12] && (isKindOfClass & 1) != 0)
  {
    v27 = [v54 actionConfiguration];
    id v28 = [v27 summaryString];
    v29 = [v28 formatString];
    uint64_t v30 = [v29 length];

    if (v30)
    {
      uint64_t v31 = [LNStaticDeferredLocalizedString alloc];
      id v32 = [v27 summaryString];
      id v33 = [v32 formatString];
      v57 = [(LNStaticDeferredLocalizedString *)v31 initWithKey:v33 table:0 bundleURL:0];

      id v34 = [(LNActionMetadata *)v58 schemaStringForStaticDeferredLocalizedString:v57 usingLibraryKey:v59];
      id v35 = [LNActionSummaryString alloc];
      id v36 = [v34 key];
      id v37 = [v27 summaryString];
      id v38 = [v37 parameterIdentifiers];
      uint64_t v39 = [(LNActionSummaryString *)v35 initWithFormatString:v36 parameterIdentifiers:v38];

      uint64_t v40 = [LNActionSummary alloc];
      uint64_t v41 = [v34 bundleURL];
      uint64_t v42 = [v34 table];
      v43 = [v27 otherParameterIdentifiers];
      uint64_t v44 = [(LNActionSummary *)v40 initWithSummaryString:v39 bundleURL:v41 table:v42 otherParameterIdentifiers:v43];
      uint64_t v45 = (void *)v26[12];
      v26[12] = v44;
    }
    goto LABEL_7;
  }
LABEL_8:
  uint64_t v46 = [v54 nameIndexedParameters];
  v47 = [(LNActionMetadata *)v58 parameters];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __74__LNActionMetadata_copyWithDescriptiveMetadataFromAction_usingLibraryKey___block_invoke;
  v60[3] = &unk_1E590DE10;
  id v61 = v46;
  id v62 = v59;
  id v48 = v59;
  id v49 = v46;
  uint64_t v50 = objc_msgSend(v47, "if_map:", v60);
  v51 = (void *)v26[17];
  v26[17] = v50;

  return v26;
}

id __74__LNActionMetadata_copyWithDescriptiveMetadataFromAction_usingLibraryKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 name];
  id v6 = [v3 objectForKey:v5];

  if (v6)
  {
    uint64_t v7 = [v4 actionParameterMetadataWithDescriptiveMetadataFromParameter:v6 usingLibraryKey:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v7 = [v4 copy];
  }
  id v8 = (void *)v7;

  return v8;
}

- (id)metadataByAddingEffectiveBundleIdentifiers:(id)a3 mangledTypeNameByBundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"LNActionMetadata.m", 442, @"Invalid parameter not satisfying: %@", @"effectiveBundleIdentifiers" object file lineNumber description];
  }
  uint64_t v9 = (void *)[(LNActionMetadata *)self copy];
  uint64_t v10 = [v9 effectiveBundleIdentifiers];
  uint64_t v11 = [v7 array];
  uint64_t v12 = objc_msgSend(v10, "if_orderedSetByAddingObjectsFromArray:", v11);
  uint64_t v13 = (void *)v9[4];
  v9[4] = v12;

  uint64_t v14 = [v9 mangledTypeNameByBundleIdentifier];
  uint64_t v15 = objc_msgSend(v14, "if_dictionaryByAddingEntriesFromDictionary:", v8);
  unint64_t v16 = (void *)v9[16];
  v9[16] = v15;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNActionMetadata *)a3;
  id v5 = v4;
  if (self != v4)
  {
    id v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_162:

      goto LABEL_163;
    }
    id v7 = [(LNActionMetadata *)self identifier];
    id v8 = [(LNActionMetadata *)v6 identifier];
    id v9 = v7;
    id v10 = v8;
    uint64_t v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      uint64_t v13 = v10;
      id v14 = v9;
      if (!v9 || !v10) {
        goto LABEL_160;
      }
      int v15 = [v9 isEqualToString:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_161:

        goto LABEL_162;
      }
    }
    unint64_t v16 = [(LNActionMetadata *)self title];
    BOOL v17 = [(LNActionMetadata *)v6 title];
    id v14 = v16;
    id v18 = v17;
    uint64_t v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      int64_t v19 = v18;
      id v20 = v14;
      if (!v14 || !v18) {
        goto LABEL_159;
      }
      int v21 = [v14 isEqual:v18];

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_160:

        goto LABEL_161;
      }
    }
    v22 = [(LNActionMetadata *)self descriptionMetadata];
    uint64_t v23 = [(LNActionMetadata *)v6 descriptionMetadata];
    id v20 = v22;
    id v24 = v23;
    int64_t v19 = v24;
    id v162 = v20;
    if (v20 == v24)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v25 = v24;
      if (!v20 || !v24) {
        goto LABEL_158;
      }
      LODWORD(v12) = [v20 isEqual:v24];

      if (!v12) {
        goto LABEL_159;
      }
    }
    v161 = v19;
    v26 = [(LNActionMetadata *)self deprecationMetadata];
    v27 = [(LNActionMetadata *)v6 deprecationMetadata];
    id v28 = v26;
    id v29 = v27;
    id v30 = v29;
    id v160 = v28;
    if (v28 != v29)
    {
      LOBYTE(v12) = 0;
      uint64_t v31 = v29;
      if (v28)
      {
        int64_t v19 = v161;
        if (v29)
        {
          id v32 = v29;
          int v33 = [v28 isEqual:v29];
          id v159 = v32;

          if (!v33) {
            goto LABEL_35;
          }
LABEL_30:
          id v34 = [(LNActionMetadata *)self parameters];
          id v35 = [(LNActionMetadata *)v6 parameters];

          if (v34 != v35)
          {
            uint64_t v12 = [(LNActionMetadata *)self parameters];
            if (!v12)
            {
LABEL_36:
              id v20 = v160;
              int64_t v19 = v161;
              v25 = v159;
LABEL_158:

              id v20 = v162;
LABEL_159:

              goto LABEL_160;
            }
            id v36 = [(LNActionMetadata *)v6 parameters];

            if (!v36) {
              goto LABEL_35;
            }
            id v37 = (void *)MEMORY[0x1E4F1CAD0];
            v157 = [(LNActionMetadata *)self parameters];
            id v38 = [v37 setWithArray:v157];
            uint64_t v39 = (void *)MEMORY[0x1E4F1CAD0];
            uint64_t v40 = [(LNActionMetadata *)v6 parameters];
            uint64_t v41 = [v39 setWithArray:v40];
            int v155 = [v38 isEqualToSet:v41];

            if (!v155) {
              goto LABEL_35;
            }
          }
          BOOL v42 = [(LNActionMetadata *)self openAppWhenRun];
          if (v42 != [(LNActionMetadata *)v6 openAppWhenRun])
          {
LABEL_35:
            LOBYTE(v12) = 0;
            goto LABEL_36;
          }
          v43 = [(LNActionMetadata *)self visibilityMetadata];
          uint64_t v44 = [(LNActionMetadata *)v6 visibilityMetadata];
          id v28 = v43;
          id v45 = v44;
          id v156 = v28;
          v158 = v45;
          if (v28 != v45)
          {
            LOBYTE(v12) = 0;
            if (v28)
            {
              uint64_t v46 = v45;
              int64_t v19 = v161;
              if (v45)
              {
                int v47 = [v28 isEqual:v45];

                if (!v47)
                {
                  LOBYTE(v12) = 0;
                  int64_t v19 = v161;
                  uint64_t v31 = v158;
                  id v30 = v159;
                  goto LABEL_157;
                }
LABEL_44:
                id v48 = [(LNActionMetadata *)self explicitAuthenticationPolicy];
                id v49 = [(LNActionMetadata *)v6 explicitAuthenticationPolicy];
                id v50 = v48;
                id v51 = v49;
                v153 = v51;
                id v154 = v50;
                if (v50 == v51)
                {
                }
                else
                {
                  LOBYTE(v12) = 0;
                  if (!v50)
                  {
                    uint64_t v52 = v51;
                    int64_t v19 = v161;
                    goto LABEL_154;
                  }
                  uint64_t v52 = v51;
                  int64_t v19 = v161;
                  if (!v51)
                  {
LABEL_154:

                    goto LABEL_155;
                  }
                  int v53 = [v50 isEqual:v51];

                  if (!v53)
                  {
                    LOBYTE(v12) = 0;
                    int64_t v19 = v161;
LABEL_155:
                    uint64_t v46 = v153;
                    id v28 = v154;
                    goto LABEL_156;
                  }
                }
                uint64_t v54 = [(LNActionMetadata *)self outputType];
                v55 = [(LNActionMetadata *)v6 outputType];
                id v50 = v54;
                id v56 = v55;
                id v151 = v50;
                v152 = v56;
                if (v50 != v56)
                {
                  LOBYTE(v12) = 0;
                  if (v50)
                  {
                    v57 = v56;
                    int64_t v19 = v161;
                    if (v56)
                    {
                      int v58 = [v50 isEqual:v56];

                      if (!v58)
                      {
                        LOBYTE(v12) = 0;
                        int64_t v19 = v161;
                        uint64_t v52 = v152;
                        goto LABEL_154;
                      }
LABEL_57:
                      v59 = [(LNActionMetadata *)self systemProtocolMetadata];
                      uint64_t v60 = [(LNActionMetadata *)v6 systemProtocolMetadata];
                      id v61 = v59;
                      id v62 = v60;
                      v149 = v62;
                      v150 = v61;
                      if (v61 != v62)
                      {
                        LOBYTE(v12) = 0;
                        if (v61)
                        {
                          v63 = v62;
                          id v64 = v61;
                          int64_t v19 = v161;
                          if (v62)
                          {
                            int v65 = [v150 isEqualToDictionary:v62];

                            if (!v65)
                            {
                              LOBYTE(v12) = 0;
                              int64_t v19 = v161;
LABEL_152:
                              v57 = v149;
                              id v50 = v150;
                              goto LABEL_153;
                            }
LABEL_64:
                            uint64_t v66 = [(LNActionMetadata *)self actionConfiguration];
                            uint64_t v67 = [(LNActionMetadata *)v6 actionConfiguration];
                            id v64 = v66;
                            id v68 = v67;
                            v148 = v68;
                            if (v64 != v68)
                            {
                              LOBYTE(v12) = 0;
                              if (v64)
                              {
                                uint64_t v69 = v68;
                                v147 = v64;
                                int64_t v19 = v161;
                                if (v68)
                                {
                                  int v70 = [v64 isEqual:v68];

                                  if (!v70)
                                  {
                                    LOBYTE(v12) = 0;
                                    int64_t v19 = v161;
LABEL_150:
                                    v63 = v148;
                                    goto LABEL_151;
                                  }
LABEL_71:
                                  id v145 = v64;
                                  uint64_t v71 = [(LNActionMetadata *)self typeSpecificMetadata];
                                  v72 = [(LNActionMetadata *)v6 typeSpecificMetadata];
                                  id v73 = v71;
                                  id v74 = v72;
                                  v146 = v74;
                                  v147 = v73;
                                  if (v73 != v74)
                                  {
                                    LOBYTE(v12) = 0;
                                    if (v73)
                                    {
                                      uint64_t v75 = v74;
                                      if (v74)
                                      {
                                        int v76 = [v73 isEqualToDictionary:v74];

                                        if (!v76)
                                        {
                                          LOBYTE(v12) = 0;
LABEL_148:
                                          int64_t v19 = v161;
                                          id v64 = v145;
                                          uint64_t v69 = v146;
                                          goto LABEL_149;
                                        }
LABEL_78:
                                        uint64_t v77 = [(LNActionMetadata *)self customIntentClassName];
                                        uint64_t v78 = [(LNActionMetadata *)v6 customIntentClassName];
                                        id v73 = v77;
                                        id v144 = v78;
                                        if (v73 == v144)
                                        {
                                        }
                                        else
                                        {
                                          LOBYTE(v12) = 0;
                                          if (!v73)
                                          {
                                            v143 = 0;

LABEL_145:
                                            goto LABEL_146;
                                          }
                                          id v142 = v144;
                                          v143 = v73;
                                          if (!v144)
                                          {
LABEL_144:

                                            goto LABEL_145;
                                          }
                                          int v79 = [v73 isEqualToString:v144];

                                          if (!v79) {
                                            goto LABEL_91;
                                          }
                                        }
                                        int64_t v80 = [(LNActionMetadata *)self bundleMetadataVersion];
                                        if (v80 != [(LNActionMetadata *)v6 bundleMetadataVersion])
                                        {
LABEL_91:
                                          LOBYTE(v12) = 0;
LABEL_146:
                                          uint64_t v75 = v144;
                                          goto LABEL_147;
                                        }
                                        uint64_t v81 = [(LNActionMetadata *)self availabilityAnnotations];
                                        uint64_t v82 = [(LNActionMetadata *)v6 availabilityAnnotations];
                                        id v83 = v81;
                                        id v142 = v82;
                                        v143 = v83;
                                        if (v83 == v142)
                                        {
                                        }
                                        else
                                        {
                                          LOBYTE(v12) = 0;
                                          if (!v83)
                                          {
                                            v140 = 0;

LABEL_143:
                                            goto LABEL_144;
                                          }
                                          id v139 = v142;
                                          v140 = v83;
                                          if (!v142) {
                                            goto LABEL_142;
                                          }
                                          int v141 = [v83 isEqualToDictionary:v142];

                                          if (!v141)
                                          {
                                            LOBYTE(v12) = 0;
                                            goto LABEL_144;
                                          }
                                        }
                                        uint64_t v84 = [(LNActionMetadata *)self shortcutsMetadata];
                                        uint64_t v85 = [(LNActionMetadata *)v6 shortcutsMetadata];
                                        id v86 = v84;
                                        id v139 = v85;
                                        v140 = v86;
                                        if (v86 == v139)
                                        {
                                        }
                                        else
                                        {
                                          LOBYTE(v12) = 0;
                                          if (!v86)
                                          {
                                            v136 = 0;

LABEL_141:
                                            goto LABEL_142;
                                          }
                                          id v134 = v139;
                                          v136 = v86;
                                          if (!v139)
                                          {
LABEL_140:

                                            goto LABEL_141;
                                          }
                                          int v137 = [v86 isEqualToDictionary:v139];

                                          if (!v137)
                                          {
LABEL_110:
                                            LOBYTE(v12) = 0;
                                            goto LABEL_142;
                                          }
                                        }
                                        id v87 = [(LNActionMetadata *)self requiredCapabilities];
                                        uint64_t v88 = [(LNActionMetadata *)v6 requiredCapabilities];

                                        if (v87 == v88)
                                        {
LABEL_105:
                                          v94 = [(LNActionMetadata *)self attributionBundleIdentifier];
                                          id v95 = [(LNActionMetadata *)v6 attributionBundleIdentifier];
                                          id v96 = v94;
                                          id v134 = v95;
                                          v136 = v96;
                                          if (v96 == v134)
                                          {
                                          }
                                          else
                                          {
                                            LOBYTE(v12) = 0;
                                            if (!v96)
                                            {
                                              v132 = 0;

LABEL_139:
                                              goto LABEL_140;
                                            }
                                            id v130 = v134;
                                            v132 = v96;
                                            if (!v134) {
                                              goto LABEL_138;
                                            }
                                            int v133 = [v96 isEqualToString:v134];

                                            if (!v133)
                                            {
                                              LOBYTE(v12) = 0;
                                              goto LABEL_140;
                                            }
                                          }
                                          id v97 = [(LNActionMetadata *)self sideEffect];
                                          id v98 = [(LNActionMetadata *)v6 sideEffect];
                                          id v99 = v97;
                                          id v130 = v98;
                                          v132 = v99;
                                          if (v99 != v130)
                                          {
                                            LOBYTE(v12) = 0;
                                            if (v99)
                                            {
                                              id v100 = v130;
                                              v126 = v132;
                                              if (v130)
                                              {
                                                int v127 = [v132 isEqual:v130];

                                                if (!v127)
                                                {
LABEL_132:
                                                  LOBYTE(v12) = 0;
                                                  goto LABEL_138;
                                                }
                                                goto LABEL_120;
                                              }
                                            }
                                            else
                                            {
                                              id v100 = v130;
                                              v126 = 0;
                                            }
LABEL_137:

                                            goto LABEL_138;
                                          }

LABEL_120:
                                          id v101 = [(LNActionMetadata *)self assistantDefinedSchemas];
                                          id v102 = [(LNActionMetadata *)self assistantDefinedSchemas];

                                          if (v101 != v102)
                                          {
                                            uint64_t v12 = [(LNActionMetadata *)self assistantDefinedSchemas];
                                            if (!v12) {
                                              goto LABEL_138;
                                            }
                                            id v103 = [(LNActionMetadata *)self assistantDefinedSchemas];

                                            if (!v103) {
                                              goto LABEL_132;
                                            }
                                            id v104 = (void *)MEMORY[0x1E4F1CAD0];
                                            v128 = [(LNActionMetadata *)self assistantDefinedSchemas];
                                            id v105 = [v104 setWithArray:v128];
                                            v106 = (void *)MEMORY[0x1E4F1CAD0];
                                            v122 = [(LNActionMetadata *)self assistantDefinedSchemas];
                                            id v107 = [v106 setWithArray:v122];
                                            int v124 = [v105 isEqualToSet:v107];

                                            if (!v124) {
                                              goto LABEL_132;
                                            }
                                          }
                                          id v108 = [(LNActionMetadata *)self assistantDefinedSchemaTraits];
                                          id v109 = [(LNActionMetadata *)self assistantDefinedSchemaTraits];

                                          if (v108 == v109)
                                          {
LABEL_128:
                                            v115 = [(LNActionMetadata *)self fullyQualifiedTypeName];
                                            v116 = [(LNActionMetadata *)self fullyQualifiedTypeName];
                                            id v117 = v115;
                                            id v118 = v116;
                                            id v100 = v118;
                                            v126 = v117;
                                            if (v117 == v118)
                                            {
                                              LOBYTE(v12) = 1;
                                            }
                                            else
                                            {
                                              LOBYTE(v12) = 0;
                                              if (v117 && v118) {
                                                LOBYTE(v12) = [v117 isEqualToString:v118];
                                              }
                                            }

                                            goto LABEL_137;
                                          }
                                          uint64_t v12 = [(LNActionMetadata *)self assistantDefinedSchemaTraits];
                                          if (v12)
                                          {
                                            id v110 = [(LNActionMetadata *)self assistantDefinedSchemaTraits];

                                            if (!v110) {
                                              goto LABEL_132;
                                            }
                                            id v111 = (void *)MEMORY[0x1E4F1CAD0];
                                            v129 = [(LNActionMetadata *)self assistantDefinedSchemaTraits];
                                            objc_super v112 = [v111 setWithArray:v129];
                                            v113 = (void *)MEMORY[0x1E4F1CAD0];
                                            v123 = [(LNActionMetadata *)self assistantDefinedSchemaTraits];
                                            v114 = [v113 setWithArray:v123];
                                            int v125 = [v112 isEqualToSet:v114];

                                            if (!v125) {
                                              goto LABEL_132;
                                            }
                                            goto LABEL_128;
                                          }
LABEL_138:

                                          goto LABEL_139;
                                        }
                                        uint64_t v12 = [(LNActionMetadata *)self requiredCapabilities];
                                        if (v12)
                                        {
                                          id v89 = [(LNActionMetadata *)v6 requiredCapabilities];

                                          if (!v89) {
                                            goto LABEL_110;
                                          }
                                          id v90 = (void *)MEMORY[0x1E4F1CAD0];
                                          v138 = [(LNActionMetadata *)self requiredCapabilities];
                                          id v91 = [v90 setWithArray:v138];
                                          id v92 = (void *)MEMORY[0x1E4F1CAD0];
                                          v131 = [(LNActionMetadata *)v6 requiredCapabilities];
                                          v93 = [v92 setWithArray:v131];
                                          int v135 = [v91 isEqualToSet:v93];

                                          if (!v135) {
                                            goto LABEL_110;
                                          }
                                          goto LABEL_105;
                                        }
LABEL_142:

                                        goto LABEL_143;
                                      }
                                    }
                                    else
                                    {
                                      uint64_t v75 = v74;
                                    }
LABEL_147:

                                    goto LABEL_148;
                                  }

                                  goto LABEL_78;
                                }
                              }
                              else
                              {
                                uint64_t v69 = v68;
                                v147 = 0;
                                int64_t v19 = v161;
                              }
LABEL_149:

                              goto LABEL_150;
                            }

                            goto LABEL_71;
                          }
                        }
                        else
                        {
                          v63 = v62;
                          id v64 = 0;
                          int64_t v19 = v161;
                        }
LABEL_151:

                        goto LABEL_152;
                      }

                      goto LABEL_64;
                    }
                  }
                  else
                  {
                    v57 = v56;
                    int64_t v19 = v161;
                  }
LABEL_153:

                  id v50 = v151;
                  uint64_t v52 = v152;
                  goto LABEL_154;
                }

                goto LABEL_57;
              }
            }
            else
            {
              uint64_t v46 = v45;
              int64_t v19 = v161;
            }
LABEL_156:

            uint64_t v31 = v158;
            id v30 = v159;
            id v28 = v156;
            goto LABEL_157;
          }

          goto LABEL_44;
        }
      }
      else
      {
        int64_t v19 = v161;
      }
LABEL_157:
      v119 = v28;
      v120 = v30;

      v25 = v120;
      id v20 = v160;
      goto LABEL_158;
    }
    id v159 = v29;

    goto LABEL_30;
  }
  LOBYTE(v12) = 1;
LABEL_163:

  return (char)v12;
}

- (unint64_t)hash
{
  id v45 = [(LNActionMetadata *)self identifier];
  uint64_t v3 = [v45 hash];
  uint64_t v44 = [(LNActionMetadata *)self parameters];
  uint64_t v4 = [v44 hash] ^ v3;
  v43 = [(LNActionMetadata *)self title];
  uint64_t v5 = [v43 hash];
  BOOL v42 = [(LNActionMetadata *)self descriptionMetadata];
  uint64_t v6 = v4 ^ v5 ^ [v42 hash];
  uint64_t v41 = [(LNActionMetadata *)self deprecationMetadata];
  uint64_t v7 = [v41 hash];
  uint64_t v8 = v6 ^ v7 ^ [(LNActionMetadata *)self openAppWhenRun];
  uint64_t v40 = [(LNActionMetadata *)self visibilityMetadata];
  uint64_t v9 = [v40 hash];
  uint64_t v39 = [(LNActionMetadata *)self explicitAuthenticationPolicy];
  uint64_t v10 = v9 ^ [v39 integerValue];
  id v38 = [(LNActionMetadata *)self outputType];
  uint64_t v11 = v10 ^ [v38 hash];
  id v37 = [(LNActionMetadata *)self systemProtocolMetadata];
  uint64_t v12 = v8 ^ v11 ^ [v37 hash];
  id v36 = [(LNActionMetadata *)self actionConfiguration];
  uint64_t v13 = [v36 hash];
  id v35 = [(LNActionMetadata *)self typeSpecificMetadata];
  uint64_t v14 = v13 ^ [v35 hash];
  id v34 = [(LNActionMetadata *)self customIntentClassName];
  uint64_t v15 = v14 ^ [v34 hash];
  unint64_t v16 = [(LNActionMetadata *)self availabilityAnnotations];
  uint64_t v17 = v15 ^ [v16 hash];
  int64_t v18 = v12 ^ v17 ^ [(LNActionMetadata *)self bundleMetadataVersion];
  int64_t v19 = [(LNActionMetadata *)self shortcutsMetadata];
  uint64_t v20 = [v19 hash];
  int v21 = [(LNActionMetadata *)self requiredCapabilities];
  uint64_t v22 = v20 ^ [v21 hash];
  uint64_t v23 = [(LNActionMetadata *)self attributionBundleIdentifier];
  uint64_t v24 = v22 ^ [v23 hash];
  v25 = [(LNActionMetadata *)self sideEffect];
  uint64_t v26 = v24 ^ [v25 hash];
  v27 = [(LNActionMetadata *)self assistantDefinedSchemas];
  uint64_t v28 = v26 ^ [v27 hash];
  id v29 = [(LNActionMetadata *)self assistantDefinedSchemaTraits];
  uint64_t v30 = v18 ^ v28 ^ [v29 hash];
  uint64_t v31 = [(LNActionMetadata *)self fullyQualifiedTypeName];
  unint64_t v32 = v30 ^ [v31 hash];

  return v32;
}

- (NSString)description
{
  int v21 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  BOOL v42 = NSStringFromClass(v3);
  uint64_t v41 = [(LNActionMetadata *)self identifier];
  uint64_t v26 = [(LNActionMetadata *)self effectiveBundleIdentifiers];
  v25 = [v26 array];
  uint64_t v24 = [v25 valueForKeyPath:@"description"];
  uint64_t v40 = [v24 componentsJoinedByString:@", "];
  int64_t v4 = [(LNActionMetadata *)self bundleMetadataVersion];
  uint64_t v5 = @"1.0";
  if (!v4) {
    uint64_t v5 = @"0.0";
  }
  uint64_t v39 = v5;
  id v38 = [(LNActionMetadata *)self title];
  id v37 = [(LNActionMetadata *)self descriptionMetadata];
  id v36 = [(LNActionMetadata *)self deprecationMetadata];
  uint64_t v23 = [(LNActionMetadata *)self parameters];
  uint64_t v22 = [v23 valueForKeyPath:@"description"];
  id v35 = [v22 componentsJoinedByString:@", "];
  id v34 = objc_msgSend(NSNumber, "numberWithBool:", -[LNActionMetadata openAppWhenRun](self, "openAppWhenRun"));
  int v33 = [(LNActionMetadata *)self visibilityMetadata];
  unint64_t v32 = [(LNActionMetadata *)self explicitAuthenticationPolicy];
  uint64_t v31 = [(LNActionMetadata *)self outputType];
  uint64_t v20 = [(LNActionMetadata *)self systemProtocolMetadata];
  int64_t v19 = [v20 valueForKeyPath:@"description"];
  uint64_t v30 = [v19 componentsJoinedByString:@", "];
  id v29 = [(LNActionMetadata *)self actionConfiguration];
  int64_t v18 = [(LNActionMetadata *)self typeSpecificMetadata];
  uint64_t v17 = [v18 count];
  if (v17)
  {
    v27 = [(LNActionMetadata *)self typeSpecificMetadata];
  }
  else
  {
    v27 = @"{}";
  }
  uint64_t v28 = [(LNActionMetadata *)self customIntentClassName];
  uint64_t v6 = [(LNActionMetadata *)self mangledTypeNameByBundleIdentifier];
  uint64_t v7 = [(LNActionMetadata *)self availabilityAnnotations];
  uint64_t v8 = [(LNActionMetadata *)self shortcutsMetadata];
  uint64_t v9 = [(LNActionMetadata *)self requiredCapabilities];
  uint64_t v10 = [(LNActionMetadata *)self attributionBundleIdentifier];
  uint64_t v11 = [(LNActionMetadata *)self sideEffect];
  uint64_t v12 = [(LNActionMetadata *)self assistantDefinedSchemas];
  uint64_t v13 = [(LNActionMetadata *)self assistantDefinedSchemaTraits];
  uint64_t v14 = [(LNActionMetadata *)self fullyQualifiedTypeName];
  objc_msgSend(v21, "stringWithFormat:", @"<%@: %p, identifier: %@, effectiveBundleIdentifiers: [%@], bundleMetadataVersion: %@, title: %@, description: %@, deprecation: %@,parameters: [%@], openAppWhenRun: %@, visibility: %@, explicitAuthenticationPolicy: %@, outputType: %@, systemProtocolMetadata: [%@], actionConfiguration: %@, typeSpecificMetadata: %@, customIntentClassName: %@, mangledTypeNameByBundleIdentifier: %@, availabilityAnnotations: %@, shortcutsMetadata: %@, requiredCapabilities: %@, attributionBundleIdentifier: %@, sideEffect: %@, assistantDefinedSchemas: %@, assistantDefinedSchemaTraits: %@, fullyQualifiedTypeName: %@>", v42, self, v41, v40, v39, v38, v37, v36, v35, v34, v33, v32, v31, v30, v29, v27,
    v28,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11,
    v12,
    v13,
  uint64_t v15 = v14);

  if (v17) {
  return (NSString *)v15;
  }
}

- (id)copyWithoutMangledTypeNameWithAvailability:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(LNActionMetadata *)self copy];
  uint64_t v7 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = &stru_1EEDBEA90;

  if (v5) {
    objc_storeStrong((id *)(v6 + 120), a3);
  }

  return (id)v6;
}

- (BOOL)visibleForUse:(int64_t)a3
{
  if (([(LNActionMetadata *)self outputFlags] & 8) != 0)
  {
    uint64_t v6 = [(LNActionMetadata *)self systemProtocols];
    uint64_t v7 = +[LNSystemProtocol urlRepresentableProtocol];
    char v5 = [v6 containsObject:v7];
  }
  else
  {
    char v5 = 1;
  }
  uint64_t v8 = [(LNActionMetadata *)self visibilityMetadata];
  char v9 = [v8 visibleForUse:a3] & v5;

  return v9;
}

- (BOOL)isDiscoverable
{
  return [(LNActionMetadata *)self visibleForUse:0];
}

- (LNActionMetadata)actionMetadataWithAttributionBundleIdentifier:(id)a3 icon:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(LNActionMetadata *)self descriptionMetadata];
  char v9 = [v8 actionDescriptionMetadataWithIcon:v6];

  uint64_t v10 = [(LNActionMetadata *)self actionMetadataDescriptionMetadata:v9];
  uint64_t v11 = [v7 copy];

  uint64_t v12 = (void *)v10[21];
  v10[21] = v11;

  return (LNActionMetadata *)v10;
}

- (id)actionMetadataDescriptionMetadata:(id)a3
{
  id v4 = a3;
  char v5 = (void *)[(LNActionMetadata *)self copy];
  uint64_t v6 = [v4 copy];

  id v7 = (void *)v5[6];
  v5[6] = v6;

  return v5;
}

- (LNActionMetadata)initWithCoder_Sydro:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  id v62 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"mangledTypeName"];
  char v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  id v61 = [v3 decodeObjectOfClasses:v7 forKey:@"effectiveBundleIdentifiers"];

  id v56 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  uint64_t v55 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"descriptionMetadata"];
  uint64_t v54 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"outputType"];
  uint64_t v53 = [v3 decodeIntegerForKey:@"outputFlags"];
  uint64_t v8 = [v3 decodeIntegerForKey:@"openAppWhenRun"];
  char v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  uint64_t v59 = [v3 decodeObjectOfClasses:v11 forKey:@"parameters"];

  uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  uint64_t v58 = [v3 decodeObjectOfClasses:v14 forKey:@"systemProtocols"];

  uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  uint64_t v57 = [v3 decodeObjectOfClasses:v17 forKey:@"mangledTypeNameByBundleIdentifier"];

  int64_t v18 = 0;
  int64_t v19 = (void *)v4;
  if (v4)
  {
    uint64_t v20 = (void *)v57;
    if (v62)
    {
      uint64_t v22 = (void *)v58;
      int v21 = (void *)v59;
      if (v59 && v58 && v61 && v57)
      {
        BOOL v51 = v8 != 0;
        id v50 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"customIntentClassName"];
        id v49 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"actionConfiguration"];
        uint64_t v23 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v24 = objc_opt_class();
        uint64_t v52 = (void *)v4;
        uint64_t v25 = objc_opt_class();
        uint64_t v26 = objc_opt_class();
        v27 = objc_msgSend(v23, "setWithObjects:", v24, v25, v26, objc_opt_class(), 0);
        id v48 = [v3 decodeObjectOfClasses:v27 forKey:@"typeSpecificMetadata"];

        [v3 decodeIntegerForKey:@"bundleMetadataVersion"];
        uint64_t v28 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v29 = objc_opt_class();
        uint64_t v30 = objc_opt_class();
        uint64_t v31 = objc_opt_class();
        uint64_t v32 = objc_opt_class();
        uint64_t v33 = objc_opt_class();
        uint64_t v34 = objc_opt_class();
        id v35 = objc_msgSend(v28, "setWithObjects:", v29, v30, v31, v32, v33, v34, objc_opt_class(), 0);
        uint64_t v36 = [v3 decodeObjectOfClasses:v35 forKey:@"shortcutsMetadata"];

        id v37 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v38 = objc_opt_class();
        uint64_t v39 = objc_opt_class();
        uint64_t v40 = objc_msgSend(v37, "setWithObjects:", v38, v39, objc_opt_class(), 0);
        uint64_t v41 = [v3 decodeObjectOfClasses:v40 forKey:@"availabilityAnnotations"];

        BOOL v42 = (void *)v36;
        LOBYTE(v47) = v51;
        v43 = (void *)v55;
        int64_t v19 = v52;
        uint64_t v44 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:", v55, v47, [v3 decodeIntegerForKey:@"authenticationPolicy"], v54, v53, v59, v58, v49, v48, v50, v41, v36);

        id v45 = (void *)v54;
        uint64_t v22 = (void *)v58;

        uint64_t v20 = (void *)v57;
        self = v44;
        int64_t v18 = v44;
        int v21 = (void *)v59;
      }
      else
      {
        v43 = (void *)v55;
        id v45 = (void *)v54;
      }
    }
    else
    {
      v43 = (void *)v55;
      id v45 = (void *)v54;
      uint64_t v22 = (void *)v58;
      int v21 = (void *)v59;
    }
  }
  else
  {
    v43 = (void *)v55;
    id v45 = (void *)v54;
    uint64_t v22 = (void *)v58;
    int v21 = (void *)v59;
    uint64_t v20 = (void *)v57;
  }

  return v18;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 effectiveBundleIdentifier:(id)a4 title:(id)a5 description:(id)a6 presentationStyle:(int64_t)a7 outputType:(id)a8 parameters:(id)a9 systemProtocols:(id)a10 actionConfiguration:(id)a11 typeSpecificMetadata:(id)a12 shortcutsMetadata:(id)a13
{
  id v16 = a4;
  BOOL v42 = (void *)MEMORY[0x1E4F1CAA0];
  id v47 = v16;
  if (v16)
  {
    id v17 = a13;
    id v18 = a12;
    id v19 = a11;
    id v38 = a10;
    id v20 = a9;
    id v21 = a8;
    id v36 = a6;
    id v22 = a5;
    id v23 = a3;
    uint64_t v41 = [[LNEffectiveBundleIdentifier alloc] initWithType:0 bundleIdentifier:v47 url:0];
    uint64_t v24 = [v42 orderedSetWithObject:v41];
    LOBYTE(v35) = 0;
    id v45 = -[LNActionMetadata initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v23, v23, v24, 0, v22, v36, a7, v21, v20, v38, v35, v19, v18, 0, v17,
            0);

    uint64_t v25 = v41;
    uint64_t v26 = v45;
  }
  else
  {
    id v39 = a13;
    id v37 = a12;
    id v27 = a11;
    id v28 = a10;
    id v29 = a9;
    id v30 = a8;
    id v31 = a6;
    id v32 = a5;
    id v33 = a3;
    uint64_t v25 = [v42 orderedSet];
    LOBYTE(v35) = 0;
    uint64_t v46 = -[LNActionMetadata initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v33, v33, v25, 0, v32, v31, a7, v30, v29, v28, v35, v27, v37, 0, v39,
            0);

    uint64_t v26 = v46;
  }

  return v26;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 effectiveBundleIdentifier:(id)a4 title:(id)a5 description:(id)a6 presentationStyle:(int64_t)a7 outputType:(id)a8 parameters:(id)a9 systemProtocols:(id)a10 actionConfiguration:(id)a11 typeSpecificMetadata:(id)a12 iconSystemImageName:(id)a13 shortcutsMetadata:(id)a14
{
  id v17 = a4;
  id v45 = (void *)MEMORY[0x1E4F1CAA0];
  id v51 = v17;
  if (v17)
  {
    id v42 = a14;
    id v41 = a13;
    id v40 = a12;
    id v18 = a11;
    id v39 = a10;
    id v19 = a9;
    id v20 = a8;
    id v21 = a6;
    id v22 = a5;
    id v23 = a3;
    uint64_t v24 = [[LNEffectiveBundleIdentifier alloc] initWithType:0 bundleIdentifier:v51 url:0];
    uint64_t v25 = v45;
    uint64_t v46 = v24;
    uint64_t v44 = objc_msgSend(v25, "orderedSetWithObject:");
    LOBYTE(v38) = 0;
    id v49 = -[LNActionMetadata initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v23, v23, v44, 0, v22, v21, a7, v20, v19, v39, v38, v18, v40, v41, v42,
            0);

    uint64_t v26 = v49;
  }
  else
  {
    id v27 = a14;
    id v28 = a13;
    id v29 = a12;
    id v30 = a11;
    id v31 = a10;
    id v32 = a9;
    id v33 = a8;
    id v34 = a6;
    id v35 = a5;
    id v36 = a3;
    [v45 orderedSet];
    uint64_t v46 = LOBYTE(v38) = 0;
    id v50 = -[LNActionMetadata initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v36, v36, a7, v33, v32, v31, v38, v30, v29, v28, v27, 0);

    uint64_t v26 = v50;
  }

  return v26;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifier:(id)a5 title:(id)a6 description:(id)a7 presentationStyle:(int64_t)a8 outputType:(id)a9 parameters:(id)a10 systemProtocols:(id)a11 actionConfiguration:(id)a12 typeSpecificMetadata:(id)a13 iconSystemImageName:(id)a14 shortcutsMetadata:(id)a15
{
  id v18 = a5;
  uint64_t v46 = (void *)MEMORY[0x1E4F1CAA0];
  id v52 = v18;
  if (v18)
  {
    id v43 = a15;
    id v42 = a13;
    id v41 = a12;
    id v19 = a11;
    id v40 = a10;
    id v20 = a9;
    id v39 = a7;
    id v21 = a6;
    id v22 = a4;
    id v45 = a3;
    id v23 = [[LNEffectiveBundleIdentifier alloc] initWithType:0 bundleIdentifier:v52 url:0];
    uint64_t v24 = v46;
    id v47 = v23;
    uint64_t v25 = objc_msgSend(v24, "orderedSetWithObject:");
    LOBYTE(v38) = 0;
    id v50 = -[LNActionMetadata initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v45, v22, v25, 0, v21, v39, a8, v20, v40, v19, v38, v41, v42, 0, v43,
            0);

    uint64_t v26 = v50;
  }
  else
  {
    id v27 = a15;
    id v28 = a13;
    id v29 = a12;
    id v30 = a11;
    id v31 = a10;
    id v32 = a9;
    id v33 = a7;
    id v34 = a6;
    id v35 = a4;
    id v36 = a3;
    [v46 orderedSet];
    id v47 = LOBYTE(v38) = 0;
    id v51 = -[LNActionMetadata initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v36, v35, a8, v32, v31, v30, v38, v29, v28, 0, v27, 0);

    uint64_t v26 = v51;
  }

  return v26;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifier:(id)a5 title:(id)a6 description:(id)a7 presentationStyle:(int64_t)a8 outputType:(id)a9 parameters:(id)a10 systemProtocols:(id)a11 actionConfiguration:(id)a12 typeSpecificMetadata:(id)a13 iconSystemImageName:(id)a14 shortcutsMetadata:(id)a15 customIntentClassName:(id)a16
{
  id v18 = a5;
  uint64_t v53 = (void *)MEMORY[0x1E4F1CAA0];
  id v58 = v18;
  if (v18)
  {
    id v44 = a16;
    id v42 = a15;
    id v19 = a14;
    id v20 = a13;
    id v40 = a12;
    id v46 = a11;
    id v21 = a10;
    id v22 = a9;
    id v23 = a7;
    id v37 = a6;
    id v36 = a4;
    id v49 = a3;
    uint64_t v24 = [[LNEffectiveBundleIdentifier alloc] initWithType:0 bundleIdentifier:v58 url:0];
    uint64_t v25 = v53;
    uint64_t v54 = v24;
    id v51 = objc_msgSend(v25, "orderedSetWithObject:");
    LOBYTE(v35) = 0;
    uint64_t v26 = v23;
    id v27 = -[LNActionMetadata initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v49, v36, v51, 0, v37, v23, a8, v22, v21, v46, v35, v40, v20, v19, v42,
            v44);

    id v28 = v27;
  }
  else
  {
    id v29 = a16;
    id v30 = a15;
    id v45 = a14;
    id v43 = a13;
    id v41 = a12;
    Class v39 = (Class)a11;
    id v47 = a10;
    id v31 = a9;
    id v38 = a7;
    id v32 = a6;
    id v52 = a4;
    id v33 = a3;
    [v53 orderedSet];
    uint64_t v54 = LOBYTE(v35) = 0;
    uint64_t v57 = -[LNActionMetadata initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v33, v52, a8, v31, v47, v39, v35, v41, v43, v45, v30, v29);

    id v28 = v57;
  }

  return v28;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifier:(id)a5 title:(id)a6 description:(id)a7 presentationStyle:(int64_t)a8 outputType:(id)a9 parameters:(id)a10 systemProtocols:(id)a11 sessionStartingAction:(BOOL)a12 actionConfiguration:(id)a13 typeSpecificMetadata:(id)a14 iconSystemImageName:(id)a15 shortcutsMetadata:(id)a16 customIntentClassName:(id)a17
{
  id v19 = a5;
  uint64_t v55 = (void *)MEMORY[0x1E4F1CAA0];
  id v60 = v19;
  if (v19)
  {
    id v39 = a3;
    id v46 = a17;
    id v44 = a16;
    id v20 = a15;
    id v21 = a14;
    id v42 = a13;
    id v48 = a11;
    id v22 = a10;
    id v23 = a9;
    id v24 = a7;
    id v37 = a6;
    id v38 = a4;
    id v51 = v39;
    uint64_t v25 = [[LNEffectiveBundleIdentifier alloc] initWithType:0 bundleIdentifier:v60 url:0];
    uint64_t v26 = v55;
    id v56 = v25;
    uint64_t v54 = objc_msgSend(v26, "orderedSetWithObject:");
    LOBYTE(v36) = a12;
    id v27 = v24;
    id v28 = -[LNActionMetadata initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v51, v38, v54, 0, v37, v24, a8, v23, v22, v48, v36, v42, v21, v20, v44,
            v46);

    id v29 = v28;
  }
  else
  {
    id v30 = a17;
    id v31 = a16;
    id v47 = a15;
    id v45 = a14;
    id v43 = a13;
    Class v41 = (Class)a11;
    id v49 = a10;
    id v32 = a9;
    id v40 = a7;
    id v52 = a6;
    id v33 = a4;
    id v34 = a3;
    [v55 orderedSet];
    id v56 = LOBYTE(v36) = a12;
    uint64_t v59 = -[LNActionMetadata initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v34, v33, a8, v32, v49, v41, v36, v43, v45, v47, v31, v30);

    id v29 = v59;
  }

  return v29;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifiers:(id)a5 title:(id)a6 description:(id)a7 presentationStyle:(int64_t)a8 outputType:(id)a9 parameters:(id)a10 systemProtocols:(id)a11 sessionStartingAction:(BOOL)a12 actionConfiguration:(id)a13 typeSpecificMetadata:(id)a14 iconSystemImageName:(id)a15 shortcutsMetadata:(id)a16 customIntentClassName:(id)a17
{
  LOBYTE(v18) = a12;
  return -[LNActionMetadata initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:sessionStartingAction:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", a3, a4, a5, 0, a6, a7, a8, a9, a10, a11, v18, a13, a14, a15, a16,
           a17);
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifiers:(id)a5 bundleMetadataVersion:(int64_t)a6 title:(id)a7 description:(id)a8 presentationStyle:(int64_t)a9 outputType:(id)a10 parameters:(id)a11 systemProtocols:(id)a12 sessionStartingAction:(BOOL)a13 actionConfiguration:(id)a14 typeSpecificMetadata:(id)a15 iconSystemImageName:(id)a16 shortcutsMetadata:(id)a17 customIntentClassName:(id)a18
{
  return -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", a3, a4, MEMORY[0x1E4F1CC08], a5, a6, a7);
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifiers:(id)a5 bundleMetadataVersion:(int64_t)a6 title:(id)a7 description:(id)a8 presentationStyle:(int64_t)a9 outputType:(id)a10 parameters:(id)a11 systemProtocols:(id)a12 sessionStartingAction:(BOOL)a13 actionConfiguration:(id)a14 typeSpecificMetadata:(id)a15 iconSystemImageName:(id)a16 shortcutsMetadata:(id)a17 customIntentClassName:(id)a18 requiresMDMChecks:(BOOL)a19
{
  id v42 = a3;
  id v40 = a4;
  id v39 = a5;
  id v38 = a7;
  id v37 = a8;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  id v26 = a14;
  id v27 = a15;
  id v28 = a16;
  id v29 = a17;
  id v30 = a18;
  Class v41 = (void *)[v25 mutableCopy];
  if (a13)
  {
    id v31 = +[LNSystemProtocol sessionStartingProtocol];
    [v41 addObject:v31];
  }
  if (a19)
  {
    id v32 = +[LNSystemProtocol requiresMDMChecksProtocol];
    [v41 addObject:v32];
  }
  uint64_t v36 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v42, v40, MEMORY[0x1E4F1CC08], v39, a6, v38, v37, a9, v23, v24, v25, v26, v27, v28, v29,
          v30);

  return v36;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifiers:(id)a5 bundleMetadataVersion:(int64_t)a6 title:(id)a7 description:(id)a8 presentationStyle:(int64_t)a9 outputType:(id)a10 parameters:(id)a11 systemProtocols:(id)a12 actionConfiguration:(id)a13 typeSpecificMetadata:(id)a14 iconSystemImageName:(id)a15 shortcutsMetadata:(id)a16 customIntentClassName:(id)a17
{
  id v32 = (void *)MEMORY[0x1E4F1CAA0];
  id v33 = a17;
  id v31 = a16;
  id v38 = a15;
  id v37 = a14;
  id v19 = a13;
  id v20 = a12;
  id v21 = a11;
  id v22 = a10;
  id v23 = a8;
  id v24 = a7;
  id v30 = a4;
  id v25 = a3;
  uint64_t v35 = [v32 orderedSet];
  id v26 = v24;
  id v27 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v25, v30, MEMORY[0x1E4F1CC08], v35, 0, v24, v23, a9, v22, v21, v20, v19, v37, v38, v31,
          v33);

  return v27;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 description:(id)a9 presentationStyle:(int64_t)a10 outputType:(id)a11 parameters:(id)a12 systemProtocols:(id)a13 actionConfiguration:(id)a14 typeSpecificMetadata:(id)a15 iconSystemImageName:(id)a16 shortcutsMetadata:(id)a17 customIntentClassName:(id)a18
{
  id v41 = a3;
  id v40 = a4;
  id v39 = a5;
  id v38 = a6;
  id v35 = a8;
  id v22 = a11;
  id v23 = a12;
  id v24 = a13;
  id v25 = a14;
  id v26 = a15;
  id v27 = a16;
  id v28 = a17;
  id v29 = a18;
  if (a9)
  {
    id v30 = a9;
    id v31 = [LNActionDescriptionMetadata alloc];
    id v32 = [(LNActionDescriptionMetadata *)v31 initWithDescriptionText:v30 categoryName:0 searchKeywords:MEMORY[0x1E4F1CBF0] resultValueName:0];
  }
  else
  {
    id v32 = 0;
  }
  id v37 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:presentationStyle:authenticationPolicy:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:customIntentClassName:shortcutsMetadata:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:presentationStyle:authenticationPolicy:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:customIntentClassName:shortcutsMetadata:", v41, v40, v39, v38, a7, v35, v32, a10, 0, v22, v23, v24, v25, v26, v27,
          v29,
          v28);

  return v37;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 presentationStyle:(int64_t)a10 authenticationPolicy:(int64_t)a11 outputType:(id)a12 outputFlags:(unint64_t)a13 parameters:(id)a14 systemProtocols:(id)a15 actionConfiguration:(id)a16 typeSpecificMetadata:(id)a17 iconSystemImageName:(id)a18 customIntentClassName:(id)a19 shortcutsMetadata:(id)a20
{
  return -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:customIntentClassName:shortcutsMetadata:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:customIntentClassName:shortcutsMetadata:", a3, a4, a5, a6, a7, a8);
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 presentationStyle:(int64_t)a10 authenticationPolicy:(int64_t)a11 outputType:(id)a12 parameters:(id)a13 systemProtocols:(id)a14 actionConfiguration:(id)a15 typeSpecificMetadata:(id)a16 iconSystemImageName:(id)a17 customIntentClassName:(id)a18 shortcutsMetadata:(id)a19
{
  return -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:presentationStyle:authenticationPolicy:outputType:outputFlags:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:customIntentClassName:shortcutsMetadata:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:presentationStyle:authenticationPolicy:outputType:outputFlags:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:customIntentClassName:shortcutsMetadata:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, 0, a13, a14, a15, a16,
           a17,
           a18,
           a19);
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 openAppWhenRun:(BOOL)a10 authenticationPolicy:(int64_t)a11 outputType:(id)a12 outputFlags:(unint64_t)a13 parameters:(id)a14 systemProtocols:(id)a15 actionConfiguration:(id)a16 typeSpecificMetadata:(id)a17 customIntentClassName:(id)a18 shortcutsMetadata:(id)a19
{
  LOBYTE(v20) = a10;
  return -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:", a3, a4, a5, a6, a7, a8, a9, v20, a11, a12, a13, a14, a15, a16, a17,
           a18,
           0,
           a19);
}

- (LNActionMetadata)initWithIdentifier:(id)a3 title:(id)a4 description:(id)a5 presentationStyle:(int64_t)a6 outputType:(id)a7 parameters:(id)a8 systemProtocols:(id)a9 actionConfiguration:(id)a10
{
  id v17 = (void *)MEMORY[0x1E4F1CAA0];
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  id v25 = [v17 orderedSet];
  id v26 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v24, v24, v22, a6, v21, v20, v19, v18, MEMORY[0x1E4F1CC08], 0, MEMORY[0x1E4F1CC08], 0);

  return v26;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 effectiveBundleIdentifier:(id)a4 title:(id)a5 description:(id)a6 presentationStyle:(int64_t)a7 outputType:(id)a8 parameters:(id)a9 systemProtocols:(id)a10 actionConfiguration:(id)a11 typeSpecificMetadata:(id)a12
{
  id v16 = (void *)MEMORY[0x1E4F1CAA0];
  id v17 = a12;
  id v18 = a11;
  id v19 = a10;
  id v20 = a9;
  id v21 = a8;
  id v22 = a6;
  id v23 = a5;
  id v24 = a3;
  id v25 = [v16 orderedSet];
  id v26 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v24, v24, v22, a7, v21, v20, v19, v18, v17, 0, MEMORY[0x1E4F1CC08], 0);

  return v26;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifier:(id)a5 title:(id)a6 description:(id)a7 presentationStyle:(int64_t)a8 outputType:(id)a9 parameters:(id)a10 systemProtocols:(id)a11 actionConfiguration:(id)a12 typeSpecificMetadata:(id)a13
{
  id v27 = (void *)MEMORY[0x1E4F1CAA0];
  id v16 = a13;
  id v17 = a12;
  id v18 = a11;
  id v19 = a10;
  id v20 = a9;
  id v21 = a7;
  id v22 = a6;
  id v23 = a4;
  id v24 = a3;
  id v25 = [v27 orderedSet];
  id v31 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v24, v23, v21, a8, v20, v19, v18, v17, v16, 0, MEMORY[0x1E4F1CC08], 0);

  return v31;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifier:(id)a5 title:(id)a6 description:(id)a7 presentationStyle:(int64_t)a8 outputType:(id)a9 parameters:(id)a10 systemProtocols:(id)a11 actionConfiguration:(id)a12 typeSpecificMetadata:(id)a13 customIntentClassName:(id)a14
{
  id v25 = (void *)MEMORY[0x1E4F1CAA0];
  id v27 = a14;
  id v26 = a13;
  id v24 = a12;
  id v16 = a11;
  id v17 = a10;
  id v18 = a9;
  id v19 = a7;
  id v20 = a6;
  id v21 = a4;
  id v22 = a3;
  id v30 = [v25 orderedSet];
  id v33 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v22, v21, v19, a8, v18, v17, v16, v24, v26, 0, MEMORY[0x1E4F1CC08], v27);

  return v33;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifier:(id)a5 title:(id)a6 description:(id)a7 presentationStyle:(int64_t)a8 outputType:(id)a9 parameters:(id)a10 systemProtocols:(id)a11 sessionStartingAction:(BOOL)a12 actionConfiguration:(id)a13 typeSpecificMetadata:(id)a14 customIntentClassName:(id)a15
{
  id v26 = (void *)MEMORY[0x1E4F1CAA0];
  id v28 = a15;
  id v27 = a14;
  id v25 = a13;
  id v17 = a11;
  id v18 = a10;
  id v19 = a9;
  id v20 = a7;
  id v21 = a6;
  id v22 = a4;
  id v23 = a3;
  id v31 = [v26 orderedSet];
  id v34 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v23, v22, v20, a8, v19, v18, v17, v25, v27, 0, MEMORY[0x1E4F1CC08], v28);

  return v34;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifiers:(id)a5 title:(id)a6 description:(id)a7 presentationStyle:(int64_t)a8 outputType:(id)a9 parameters:(id)a10 systemProtocols:(id)a11 sessionStartingAction:(BOOL)a12 actionConfiguration:(id)a13 typeSpecificMetadata:(id)a14 customIntentClassName:(id)a15
{
  id v26 = (void *)MEMORY[0x1E4F1CAA0];
  id v28 = a15;
  id v27 = a14;
  id v25 = a13;
  id v17 = a11;
  id v18 = a10;
  id v19 = a9;
  id v20 = a7;
  id v21 = a6;
  id v22 = a4;
  id v23 = a3;
  id v31 = [v26 orderedSet];
  id v34 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v23, v22, v20, a8, v19, v18, v17, v25, v27, 0, MEMORY[0x1E4F1CC08], v28);

  return v34;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 effectiveBundleIdentifiers:(id)a5 title:(id)a6 description:(id)a7 presentationStyle:(int64_t)a8 outputType:(id)a9 parameters:(id)a10 systemProtocols:(id)a11 actionConfiguration:(id)a12 typeSpecificMetadata:(id)a13 customIntentClassName:(id)a14
{
  id v25 = (void *)MEMORY[0x1E4F1CAA0];
  id v27 = a14;
  id v26 = a13;
  id v24 = a12;
  id v16 = a11;
  id v17 = a10;
  id v18 = a9;
  id v19 = a7;
  id v20 = a6;
  id v21 = a4;
  id v22 = a3;
  id v30 = [v25 orderedSet];
  id v33 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v22, v21, v19, a8, v18, v17, v16, v24, v26, 0, MEMORY[0x1E4F1CC08], v27);

  return v33;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 title:(id)a5 description:(id)a6 presentationStyle:(int64_t)a7 outputType:(id)a8 parameters:(id)a9 systemProtocols:(id)a10 actionConfiguration:(id)a11 typeSpecificMetadata:(id)a12 customIntentClassName:(id)a13
{
  id v25 = (void *)MEMORY[0x1E4F1CAA0];
  id v28 = a13;
  id v27 = a12;
  id v24 = a11;
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v30 = [v25 orderedSet];
  id v33 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:description:presentationStyle:outputType:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:iconSystemImageName:shortcutsMetadata:customIntentClassName:", v22, v21, v19, a7, v18, v17, v16, v24, v27, 0, MEMORY[0x1E4F1CC08], v28);

  return v33;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 title:(id)a5 descriptionMetadata:(id)a6 presentationStyle:(int64_t)a7 authenticationPolicy:(int64_t)a8 outputType:(id)a9 parameters:(id)a10 systemProtocols:(id)a11 actionConfiguration:(id)a12 typeSpecificMetadata:(id)a13 customIntentClassName:(id)a14
{
  return [(LNActionMetadata *)self initWithIdentifier:a3 mangledTypeName:a4 title:a5 descriptionMetadata:a6 presentationStyle:a7 authenticationPolicy:a8 outputType:a9 outputFlags:0 parameters:a10 systemProtocols:a11 actionConfiguration:a12 typeSpecificMetadata:a13 customIntentClassName:a14];
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 title:(id)a5 descriptionMetadata:(id)a6 presentationStyle:(int64_t)a7 authenticationPolicy:(int64_t)a8 outputType:(id)a9 outputFlags:(unint64_t)a10 parameters:(id)a11 systemProtocols:(id)a12 actionConfiguration:(id)a13 typeSpecificMetadata:(id)a14 customIntentClassName:(id)a15
{
  return -[LNActionMetadata initWithIdentifier:mangledTypeName:title:descriptionMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:customIntentClassName:](self, "initWithIdentifier:mangledTypeName:title:descriptionMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:customIntentClassName:", a3, a4, a5, a6, a7 != 0, a8);
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 title:(id)a5 descriptionMetadata:(id)a6 openAppWhenRun:(BOOL)a7 authenticationPolicy:(int64_t)a8 outputType:(id)a9 outputFlags:(unint64_t)a10 parameters:(id)a11 systemProtocols:(id)a12 actionConfiguration:(id)a13 typeSpecificMetadata:(id)a14 customIntentClassName:(id)a15
{
  id v28 = (void *)MEMORY[0x1E4F1CAA0];
  id v30 = a15;
  id v29 = a14;
  id v27 = a13;
  id v18 = a12;
  id v19 = a11;
  id v20 = a9;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  id v32 = [v28 orderedSet];
  LOBYTE(v26) = a7;
  uint64_t v36 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocols:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:", v24, v23, v21, v26, a8, v20, a10, v19, v18, v27, v29, v30, 0, MEMORY[0x1E4F1CC08]);

  return v36;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 openAppWhenRun:(BOOL)a10 authenticationPolicy:(int64_t)a11 outputType:(id)a12 outputFlags:(unint64_t)a13 parameters:(id)a14 systemProtocols:(id)a15 actionConfiguration:(id)a16 typeSpecificMetadata:(id)a17 customIntentClassName:(id)a18 availabilityAnnotations:(id)a19 shortcutsMetadata:(id)a20
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v51 = a3;
  id v50 = a4;
  id v48 = a5;
  id v47 = a6;
  id v44 = a8;
  id v42 = a9;
  id v49 = a12;
  id v24 = a14;
  id v25 = a15;
  id v41 = a16;
  id v40 = a17;
  id v39 = a18;
  id v26 = a19;
  id v38 = a20;
  id v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v25, "count"));
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v28 = v25;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v53 != v31) {
          objc_enumerationMutation(v28);
        }
        id v33 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        id v34 = objc_alloc_init(LNEmptySystemProtocolMetadata);
        id v35 = [v33 identifier];
        [v27 setValue:v34 forKey:v35];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v52 objects:v56 count:16];
    }
    while (v30);
  }

  LOBYTE(v37) = a10;
  id v46 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:", v51, v50, v48, v47, a7, v44, v42, v37, a11, v49, a13, v24, v27, v41, v40,
          v39,
          v26,
          v38);

  return v46;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 openAppWhenRun:(BOOL)a10 authenticationPolicy:(int64_t)a11 outputType:(id)a12 outputFlags:(unint64_t)a13 parameters:(id)a14 systemProtocolMetadata:(id)a15 actionConfiguration:(id)a16 typeSpecificMetadata:(id)a17 customIntentClassName:(id)a18 availabilityAnnotations:(id)a19 shortcutsMetadata:(id)a20
{
  LOBYTE(v21) = a10;
  return -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:", a3, a4, a5, a6, a7, a8, a9, 0, v21, a11, a12, a13, a14, a15,
           a16,
           a17,
           a18,
           a19,
           a20);
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 deprecationMetadata:(id)a10 openAppWhenRun:(BOOL)a11 authenticationPolicy:(int64_t)a12 outputType:(id)a13 outputFlags:(unint64_t)a14 parameters:(id)a15 systemProtocolMetadata:(id)a16 actionConfiguration:(id)a17 typeSpecificMetadata:(id)a18 customIntentClassName:(id)a19 availabilityAnnotations:(id)a20 shortcutsMetadata:(id)a21
{
  LOBYTE(v22) = a11;
  return -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:", a3, a4, a5, a6, a7, a8, a9, a10, v22, a12, a13, a14, a15, a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           0);
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 deprecationMetadata:(id)a10 openAppWhenRun:(BOOL)a11 authenticationPolicy:(int64_t)a12 outputType:(id)a13 outputFlags:(unint64_t)a14 parameters:(id)a15 systemProtocolMetadata:(id)a16 actionConfiguration:(id)a17 typeSpecificMetadata:(id)a18 customIntentClassName:(id)a19 availabilityAnnotations:(id)a20 shortcutsMetadata:(id)a21 requiredCapabilities:(id)a22
{
  return -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:discoverable:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:discoverable:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:", a3, a4, a5, a6, a7, a8);
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 deprecationMetadata:(id)a10 openAppWhenRun:(BOOL)a11 discoverable:(BOOL)a12 authenticationPolicy:(int64_t)a13 outputType:(id)a14 outputFlags:(unint64_t)a15 parameters:(id)a16 systemProtocolMetadata:(id)a17 actionConfiguration:(id)a18 typeSpecificMetadata:(id)a19 customIntentClassName:(id)a20 availabilityAnnotations:(id)a21 shortcutsMetadata:(id)a22 requiredCapabilities:(id)a23
{
  LOWORD(v24) = __PAIR16__(a12, a11);
  return -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:discoverable:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:discoverable:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:", a3, a4, a5, a6, a7, a8, a9, a10, v24, a13, a14, a15, a16, a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           0);
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 deprecationMetadata:(id)a10 openAppWhenRun:(BOOL)a11 discoverable:(BOOL)a12 authenticationPolicy:(int64_t)a13 outputType:(id)a14 outputFlags:(unint64_t)a15 parameters:(id)a16 systemProtocolMetadata:(id)a17 actionConfiguration:(id)a18 typeSpecificMetadata:(id)a19 customIntentClassName:(id)a20 availabilityAnnotations:(id)a21 shortcutsMetadata:(id)a22 requiredCapabilities:(id)a23 attributionBundleIdentifier:(id)a24
{
  LOWORD(v25) = __PAIR16__(a12, a11);
  return -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:discoverable:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:discoverable:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:", a3, a4, a5, a6, a7, a8, a9, a10, v25, a13, a14, a15, a16, a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           0);
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 deprecationMetadata:(id)a10 openAppWhenRun:(BOOL)a11 discoverable:(BOOL)a12 authenticationPolicy:(int64_t)a13 outputType:(id)a14 outputFlags:(unint64_t)a15 parameters:(id)a16 systemProtocolMetadata:(id)a17 actionConfiguration:(id)a18 typeSpecificMetadata:(id)a19 customIntentClassName:(id)a20 availabilityAnnotations:(id)a21 shortcutsMetadata:(id)a22 requiredCapabilities:(id)a23 attributionBundleIdentifier:(id)a24 sideEffect:(id)a25
{
  LOWORD(v26) = __PAIR16__(a12, a11);
  return -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:discoverable:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:assistantDefinedSchemas:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:discoverable:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:assistantDefinedSchemas:", a3, a4, a5, a6, a7, a8, a9, a10, v26, a13, a14, a15, a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           0);
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 deprecationMetadata:(id)a10 openAppWhenRun:(BOOL)a11 discoverable:(BOOL)a12 authenticationPolicy:(int64_t)a13 outputType:(id)a14 outputFlags:(unint64_t)a15 parameters:(id)a16 systemProtocolMetadata:(id)a17 actionConfiguration:(id)a18 typeSpecificMetadata:(id)a19 customIntentClassName:(id)a20 availabilityAnnotations:(id)a21 shortcutsMetadata:(id)a22 requiredCapabilities:(id)a23 attributionBundleIdentifier:(id)a24 sideEffect:(id)a25 assistantDefinedSchemas:(id)a26
{
  LOWORD(v27) = __PAIR16__(a12, a11);
  return -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:discoverable:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:assistantDefinedSchemas:assistantDefinedSchemaTraits:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:discoverable:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:assistantDefinedSchemas:assistantDefinedSchemaTraits:", a3, a4, a5, a6, a7, a8, a9, a10, v27, a13, a14, a15, a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           0);
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 deprecationMetadata:(id)a10 openAppWhenRun:(BOOL)a11 discoverable:(BOOL)a12 authenticationPolicy:(int64_t)a13 outputType:(id)a14 outputFlags:(unint64_t)a15 parameters:(id)a16 systemProtocolMetadata:(id)a17 actionConfiguration:(id)a18 typeSpecificMetadata:(id)a19 customIntentClassName:(id)a20 availabilityAnnotations:(id)a21 shortcutsMetadata:(id)a22 requiredCapabilities:(id)a23 attributionBundleIdentifier:(id)a24 sideEffect:(id)a25 assistantDefinedSchemas:(id)a26 assistantDefinedSchemaTraits:(id)a27
{
  id v42 = a27;
  id v27 = a26;
  id v38 = a25;
  id v37 = a24;
  id v36 = a23;
  id v33 = a22;
  id v32 = a21;
  id v31 = a20;
  id v58 = a19;
  id v57 = a18;
  id v56 = a17;
  id v53 = a16;
  id v52 = a14;
  id v55 = a10;
  id v54 = a9;
  id v35 = a8;
  id v51 = a6;
  id v49 = a5;
  id v40 = a4;
  id v28 = a3;
  id v43 = [[LNVisibilityMetadata alloc] initWithIsDiscoverable:a12 assistantOnly:0];
  id v44 = [NSNumber numberWithInteger:a13];
  LOBYTE(v30) = a11;
  id v47 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:explicitAuthenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:assistantDefinedSchemas:assistantDefinedSchemaTraits:visibilityMetadata:fullyQualifiedTypeName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:explicitAuthenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:assistantDefinedSchemas:assistantDefinedSchemaTraits:visibilityMetadata:fullyQualifiedTypeName:", v28, v40, v49, v51, a7, v35, v54, v55, v30, v44, v52, a15, v53,
          v56,
          v57,
          v58,
          v31,
          v32,
          v33,
          v36,
          v37,
          v38,
          v27,
          v42,
          v43,
          0);

  return v47;
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 deprecationMetadata:(id)a10 openAppWhenRun:(BOOL)a11 authenticationPolicy:(int64_t)a12 outputType:(id)a13 outputFlags:(unint64_t)a14 parameters:(id)a15 systemProtocolMetadata:(id)a16 actionConfiguration:(id)a17 typeSpecificMetadata:(id)a18 customIntentClassName:(id)a19 availabilityAnnotations:(id)a20 shortcutsMetadata:(id)a21 requiredCapabilities:(id)a22 attributionBundleIdentifier:(id)a23 sideEffect:(id)a24 assistantDefinedSchemas:(id)a25 assistantDefinedSchemaTraits:(id)a26 visibilityMetadata:(id)a27
{
  LOBYTE(v28) = a11;
  return -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:assistantDefinedSchemas:assistantDefinedSchemaTraits:visibilityMetadata:fullyQualifiedTypeName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:assistantDefinedSchemas:assistantDefinedSchemaTraits:visibilityMetadata:fullyQualifiedTypeName:", a3, a4, a5, a6, a7, a8, a9, a10, v28, a12, a13, a14, a15,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           0);
}

- (LNActionMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 bundleMetadataVersion:(int64_t)a7 title:(id)a8 descriptionMetadata:(id)a9 deprecationMetadata:(id)a10 openAppWhenRun:(BOOL)a11 authenticationPolicy:(int64_t)a12 outputType:(id)a13 outputFlags:(unint64_t)a14 parameters:(id)a15 systemProtocolMetadata:(id)a16 actionConfiguration:(id)a17 typeSpecificMetadata:(id)a18 customIntentClassName:(id)a19 availabilityAnnotations:(id)a20 shortcutsMetadata:(id)a21 requiredCapabilities:(id)a22 attributionBundleIdentifier:(id)a23 sideEffect:(id)a24 assistantDefinedSchemas:(id)a25 assistantDefinedSchemaTraits:(id)a26 visibilityMetadata:(id)a27 fullyQualifiedTypeName:(id)a28
{
  id v39 = NSNumber;
  id v42 = a27;
  id v29 = a26;
  id v38 = a25;
  id v37 = a24;
  id v36 = a23;
  id v35 = a22;
  id v52 = a21;
  id v51 = a20;
  id v60 = a19;
  id v59 = a18;
  id v58 = a17;
  id v57 = a16;
  id v56 = a15;
  id v55 = a13;
  id v54 = a10;
  id v53 = a9;
  id v41 = a8;
  id v30 = a6;
  id v31 = a5;
  id v45 = a4;
  id v32 = a3;
  id v47 = [v39 numberWithInteger:a12];
  LOBYTE(v34) = a11;
  id v50 = -[LNActionMetadata initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:explicitAuthenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:assistantDefinedSchemas:assistantDefinedSchemaTraits:visibilityMetadata:fullyQualifiedTypeName:](self, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:explicitAuthenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:assistantDefinedSchemas:assistantDefinedSchemaTraits:visibilityMetadata:fullyQualifiedTypeName:", v32, v45, v31, v30, a7, v41, v53, v54, v34, v47, v55, a14, v56,
          v57,
          v58,
          v59,
          v60,
          v51,
          v52,
          v35,
          v36,
          v37,
          v38,
          v29,
          v42,
          0);

  return v50;
}

- (BOOL)requiresMDMChecks
{
  v2 = [(LNActionMetadata *)self systemProtocols];
  id v3 = +[LNSystemProtocol requiresMDMChecksProtocol];
  char v4 = [v2 containsObject:v3];

  return v4;
}

- (BOOL)isSessionStartingAction
{
  v2 = [(LNActionMetadata *)self systemProtocols];
  id v3 = +[LNSystemProtocol sessionStartingProtocol];
  char v4 = [v2 containsObject:v3];

  return v4;
}

- (NSString)iconSystemImageName
{
  return 0;
}

- (int64_t)presentationStyle
{
  if ([(LNActionMetadata *)self openAppWhenRun]) {
    return 2;
  }
  else {
    return 0;
  }
}

- (NSString)effectiveBundleIdentifier
{
  v2 = [(LNActionMetadata *)self effectiveBundleIdentifiers];
  id v3 = [v2 firstObject];
  char v4 = [v3 bundleIdentifier];
  char v5 = v4;
  if (!v4) {
    char v4 = &stru_1EEDBEA90;
  }
  uint64_t v6 = v4;

  return v6;
}

- (LNStaticDeferredLocalizedString)actionDescription
{
  v2 = [(LNActionMetadata *)self descriptionMetadata];
  id v3 = [v2 descriptionText];

  return (LNStaticDeferredLocalizedString *)v3;
}

@end