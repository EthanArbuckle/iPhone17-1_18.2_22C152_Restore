@interface LSApplicationRecord
+ (BOOL)isAnyRegisteredApplicationInstalledFromDistributorOrWeb;
+ (BOOL)supportsSecureCoding;
+ (id)_alternateIconQueue;
+ (id)_propertyClasses;
+ (id)applicationRecordsForUserActivityDomainName:(id)a3 limit:(unint64_t)a4 error:(id *)a5;
+ (id)applicationRecordsForUserActivityType:(id)a3 limit:(unint64_t)a4 error:(id *)a5;
+ (id)displayOrderEnumeratorForViableDefaultAppsForCategory:(unint64_t)a3 options:(unint64_t)a4;
+ (id)enumeratorForViableDefaultAppsForCategory:(unint64_t)a3 options:(unint64_t)a4;
+ (id)enumeratorOnVolumeAtURL:(id)a3 options:(unint64_t)a4;
+ (id)enumeratorWithOptions:(unint64_t)a3;
+ (id)personalPersonaAttributes;
+ (id)redactedProperties;
+ (id)remotePlaceholderEnumerator;
+ (id)systemPlaceholderEnumerator;
+ (void)setUpdateAvailabilityForApplicationsWithBundleIdentifiers:(id)a3 completionHandler:(id)a4;
- (BOOL)_containerized;
- (BOOL)_usesSystemPersona;
- (BOOL)appProtectionHidden;
- (BOOL)appProtectionHiddenWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (BOOL)appProtectionLocked;
- (BOOL)appProtectionLockedWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (BOOL)applicationHasMIDBasedSINF;
- (BOOL)applicationMissingRequiredSINF;
- (BOOL)canHandleWebAuthentication;
- (BOOL)defaultsToPrivateAlwaysOnDisplayTreatment;
- (BOOL)getGenericTranslocationTargetURL:(id *)a3 error:(id *)a4;
- (BOOL)hasComplication;
- (BOOL)hasCustomNotification;
- (BOOL)hasGlance;
- (BOOL)hasParallelPlaceholder;
- (BOOL)hasSettingsBundle;
- (BOOL)isAdHocCodeSigned;
- (BOOL)isAppStoreVendable;
- (BOOL)isAppStoreVendableWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (BOOL)isArcadeApp;
- (BOOL)isBeta;
- (BOOL)isDeletable;
- (BOOL)isDeletableSystemApplication;
- (BOOL)isDeletableSystemApplicationWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (BOOL)isDeletableWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (BOOL)isEligibleForWatchAppInstall;
- (BOOL)isEligibleMailClient;
- (BOOL)isEligibleWebBrowser;
- (BOOL)isFileSharingEnabled;
- (BOOL)isInstalledFromDistributorOrWeb;
- (BOOL)isLaunchDisabled;
- (BOOL)isLaunchProhibited;
- (BOOL)isMailClient;
- (BOOL)isManagedAppDistributor;
- (BOOL)isPlaceholder;
- (BOOL)isSwiftPlaygroundsApp;
- (BOOL)isSystemPlaceholder;
- (BOOL)isSystemPlaceholderWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (BOOL)isTrustedForBinding;
- (BOOL)isUpdate;
- (BOOL)isWatchOnly;
- (BOOL)isWebAppPlaceholder;
- (BOOL)isWebBrowser;
- (BOOL)isWrapped;
- (BOOL)isWrapper;
- (BOOL)mayBeBUIVisible;
- (BOOL)requiresNativeExecution;
- (BOOL)requiresPostProcessing;
- (BOOL)runsIndependentlyOfCompanionApp;
- (BOOL)shouldShowSecurityPromptsOnSignIn;
- (BOOL)shouldSkipWatchAppInstall;
- (BOOL)supportsAlternateIconNames;
- (BOOL)supportsAlwaysOnDisplay;
- (BOOL)supportsAudiobooks;
- (BOOL)supportsCarPlayDashboardScene;
- (BOOL)supportsCarPlayInstrumentClusterScene;
- (BOOL)supportsControllerUserInteraction;
- (BOOL)supportsExternallyPlayableContent;
- (BOOL)supportsLiveActivities;
- (BOOL)supportsLiveActivitiesFrequentUpdates;
- (BOOL)supportsMultiwindow;
- (BOOL)supportsOnDemandResources;
- (BOOL)supportsOpenInPlace;
- (BOOL)supportsPurgeableLocalStorage;
- (BOOL)supportsSpotlightQueryContinuation;
- (BOOL)wasRenamed;
- (LSAppClipMetadata)appClipMetadata;
- (LSApplicationRecord)initWithBundleIdentifier:(id)a3 allowPlaceholder:(BOOL)a4 error:(id *)a5;
- (LSApplicationRecord)initWithBundleIdentifier:(id)a3 fetchingPlaceholder:(int64_t)a4 error:(id *)a5;
- (LSApplicationRecord)initWithBundleIdentifierOfCompanionApplication:(id)a3 error:(id *)a4;
- (LSApplicationRecord)initWithBundleIdentifierOfSystemPlaceholder:(id)a3 error:(id *)a4;
- (LSApplicationRecord)initWithCoder:(id)a3;
- (LSApplicationRecord)initWithRemotePlaceholderBundleIdentifier:(id)a3 error:(id *)a4;
- (LSApplicationRecord)initWithStoreItemIdentifier:(unint64_t)a3 error:(id *)a4;
- (LSApplicationRecord)initWithURL:(id)a3 allowPlaceholder:(BOOL)a4 error:(id *)a5;
- (LSApplicationRecord)initWithURL:(id)a3 fetchingPlaceholder:(int64_t)a4 error:(id *)a5;
- (LSApplicationRecord)linkedParentApplication;
- (LSBundleMoreFlags)_rawMoreFlags;
- (LSBundleMoreFlags)_rawMoreFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (LSStashedAppMetadata)stashedAppMetadata;
- (LSiTunesMetadata)iTunesMetadata;
- (NSArray)VPNPlugins;
- (NSArray)_defaultCategoryTypeIdentifiers;
- (NSArray)_iconFileNames;
- (NSArray)appTags;
- (NSArray)audioComponents;
- (NSArray)backgroundTaskSchedulerPermittedIdentifiers;
- (NSArray)carPlayInstrumentClusterURLSchemes;
- (NSArray)counterpartIdentifiers;
- (NSArray)deviceFamilies;
- (NSArray)directionsModes;
- (NSArray)driverExtensionPaths;
- (NSArray)equivalentBundleIdentifiers;
- (NSArray)externalAccessoryProtocols;
- (NSArray)identities;
- (NSArray)spotlightActions;
- (NSArray)staticShortcutItems;
- (NSArray)supportedComplicationFamilies;
- (NSArray)supportedGameControllers;
- (NSArray)supportedLiveActivityLaunchAttributeTypes;
- (NSData)installSessionIdentifier;
- (NSData)uniqueInstallIdentifier;
- (NSDictionary)_localizedNamesWithContext;
- (NSDictionary)additionalEnvironmentVariables;
- (NSDictionary)iconDictionary;
- (NSDictionary)requiredDeviceCapabilities;
- (NSNumber)eligibilityDeletionDomain;
- (NSSet)applicationExtensionRecords;
- (NSSet)userActivityTypes;
- (NSString)_deviceIdentifierVendorName;
- (NSString)_linkedParentApplicationBundleID;
- (NSString)_preferredLaunchArchitecture;
- (NSString)alternateIconName;
- (NSString)appStoreToolsBuildVersion;
- (NSString)companionBundleIdentifier;
- (NSString)complicationPrincipalClassName;
- (NSString)exactBundleVersion;
- (NSString)jobLabel;
- (NSString)managementDomain;
- (NSString)maximumSystemVersion;
- (NSString)minimumSystemVersion;
- (NSString)regulatoryPrivacyDisclosureVersion;
- (NSString)shortVersionString;
- (NSString)typeForInstallMachinery;
- (NSString)watchKitApplicationTintColorName;
- (NSString)watchKitVersion;
- (NSURL)bundleContainerURL;
- (NSUUID)deviceIdentifierForAdvertising;
- (NSUUID)deviceIdentifierForVendor;
- (_LSApplicationState)applicationState;
- (_LSDiskUsage)diskUsage;
- (_LSLazyPropertyList)_rawEnvironmentVariables;
- (_LSLazyPropertyList)_rawIconDictionary;
- (id)VPNPluginsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)_compatibilityObjectWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6;
- (id)_defaultCategoryTypeIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)_deviceIdentifierVendorNameWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)_iconFileNamesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)_initWithBundleIdentifier:(id)a3 placeholder:(BOOL)a4 error:(id *)a5;
- (id)_initWithContext:(LSContext *)a3 bundleID:(unsigned int)a4 bundleData:(const LSBundleData *)a5 error:(id *)a6;
- (id)_initWithContext:(LSContext *)a3 persistentIdentifierData:(const LSPersistentIdentifierData *)a4 length:(unint64_t)a5;
- (id)_initWithNode:(id)a3 bundleIdentifier:(id)a4 context:(LSContext *)a5 tableID:(unsigned int)a6 unitID:(unsigned int)a7 bundleBaseData:(const LSBundleBaseData *)a8 error:(id *)a9;
- (id)_initWithNode:(id)a3 bundleIdentifier:(id)a4 placeholderBehavior:(int64_t)a5 systemPlaceholder:(BOOL)a6 itemID:(unint64_t)a7 forceInBundleContainer:(BOOL)a8 context:(LSContext *)a9 error:(id *)a10;
- (id)_linkedParentApplicationBundleIDWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)_localizedNamesWithContextWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)_persistentIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6;
- (id)_personasWithAttributes;
- (id)_personasWithAttributesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)_preferredLaunchArchitectureWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)_rawEnvironmentVariablesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)_rawIconDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)appClipMetadataWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)appStoreToolsBuildVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)appTagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)applicationExtensionRecordsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)applicationStateWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)associatedPersonas;
- (id)audioComponentsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)backgroundTaskSchedulerPermittedIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)bundleContainerURLWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)bundleMetadataReturningError:(id *)a3;
- (id)bundleVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)carPlayInstrumentClusterURLSchemesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)categoryTypesWithError:(id *)a3;
- (id)companionBundleIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)counterpartIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)deviceFamiliesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)directionsModesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)diskUsageWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)driverExtensionPathsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)equivalentBundleIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)exactBundleVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)extensionPointRecordForIdentifier:(id)a3 platform:(unsigned int)a4 error:(id *)a5;
- (id)externalAccessoryProtocolsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)getApplicationExtensionDiagnosticDescriptionWithError:(id *)a3;
- (id)iTunesMetadataWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)iconDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)initForInstallMachineryWithBundleIdentifier:(id)a3 error:(id *)a4;
- (id)installSessionIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)intentsRestrictedWhileLocked;
- (id)intentsRestrictedWhileProtectedDataUnavailable;
- (id)linkedChildApplicationRecordEnumeratorWithOptions:(unint64_t)a3;
- (id)localizedNameWithContext:(id)a3;
- (id)localizedNameWithContext:(id)a3 preferredLocalizations:(id)a4;
- (id)managedPersonas;
- (id)managementDomainWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)maximumSystemVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)minimumSystemVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)recordForUnredactingWithContext:(LSContext *)a3 error:(id *)a4;
- (id)regulatoryPrivacyDisclosureVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)requiredDeviceCapabilitiesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)shortVersionStringWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)stashedAppMetadataWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)staticShortcutItemsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)supportedGameControllersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)supportedIntentMediaCategories;
- (id)supportedIntents;
- (id)trustedCDHashes;
- (id)typeForInstallMachineryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)uniqueInstallIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)userActivityTypesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (int)_bundleModTime;
- (int)_bundleModTimeWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (unint64_t)_containerClass;
- (unint64_t)_rawBundleFlags;
- (unint64_t)_rawBundleFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (unint64_t)applicationDSID;
- (unint64_t)applicationDSIDWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (unint64_t)applicationDownloaderDSID;
- (unint64_t)applicationDownloaderDSIDWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (unint64_t)applicationFamilyID;
- (unint64_t)applicationFamilyIDWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (unint64_t)bundleInode;
- (unint64_t)compatibilityState;
- (unint64_t)compatibilityStateWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (unint64_t)executableInode;
- (unint64_t)installType;
- (unint64_t)installTypeWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (unint64_t)placeholderFailureReason;
- (unint64_t)placeholderFailureReasonWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (unint64_t)sequenceNumber;
- (unint64_t)supportedDefaultAppCategories;
- (unint64_t)updateAvailability;
- (unsigned)_rawIconFlags;
- (unsigned)_rawIconFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (unsigned)_rawPlistFlags;
- (unsigned)_rawPlistFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (unsigned)watchKitApplicationType;
- (void)_LSRecord_resolve_VPNPlugins;
- (void)_LSRecord_resolve__defaultCategoryTypeIdentifiers;
- (void)_LSRecord_resolve__deviceIdentifierVendorName;
- (void)_LSRecord_resolve__iconFileNames;
- (void)_LSRecord_resolve__linkedParentApplicationBundleID;
- (void)_LSRecord_resolve__localizedNamesWithContext;
- (void)_LSRecord_resolve__personasWithAttributes;
- (void)_LSRecord_resolve__preferredLaunchArchitecture;
- (void)_LSRecord_resolve__rawEnvironmentVariables;
- (void)_LSRecord_resolve__rawIconDictionary;
- (void)_LSRecord_resolve_appClipMetadata;
- (void)_LSRecord_resolve_appStoreToolsBuildVersion;
- (void)_LSRecord_resolve_appTags;
- (void)_LSRecord_resolve_applicationExtensionRecords;
- (void)_LSRecord_resolve_applicationState;
- (void)_LSRecord_resolve_audioComponents;
- (void)_LSRecord_resolve_backgroundTaskSchedulerPermittedIdentifiers;
- (void)_LSRecord_resolve_bundleContainerURL;
- (void)_LSRecord_resolve_carPlayInstrumentClusterURLSchemes;
- (void)_LSRecord_resolve_companionBundleIdentifier;
- (void)_LSRecord_resolve_counterpartIdentifiers;
- (void)_LSRecord_resolve_deviceFamilies;
- (void)_LSRecord_resolve_directionsModes;
- (void)_LSRecord_resolve_diskUsage;
- (void)_LSRecord_resolve_driverExtensionPaths;
- (void)_LSRecord_resolve_equivalentBundleIdentifiers;
- (void)_LSRecord_resolve_exactBundleVersion;
- (void)_LSRecord_resolve_externalAccessoryProtocols;
- (void)_LSRecord_resolve_iTunesMetadata;
- (void)_LSRecord_resolve_iconDictionary;
- (void)_LSRecord_resolve_installSessionIdentifier;
- (void)_LSRecord_resolve_managementDomain;
- (void)_LSRecord_resolve_maximumSystemVersion;
- (void)_LSRecord_resolve_minimumSystemVersion;
- (void)_LSRecord_resolve_regulatoryPrivacyDisclosureVersion;
- (void)_LSRecord_resolve_requiredDeviceCapabilities;
- (void)_LSRecord_resolve_shortVersionString;
- (void)_LSRecord_resolve_stashedAppMetadata;
- (void)_LSRecord_resolve_staticShortcutItems;
- (void)_LSRecord_resolve_supportedGameControllers;
- (void)_LSRecord_resolve_typeForInstallMachinery;
- (void)_LSRecord_resolve_uniqueInstallIdentifier;
- (void)_LSRecord_resolve_userActivityTypes;
- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6;
- (void)additionalEnvironmentVariables;
- (void)clearAdvertisingIdentifier;
- (void)getDeviceManagementPolicyWithCompletionHandler:(id)a3;
- (void)linkedParentApplication;
- (void)setAlternateIconName:(id)a3 completionHandler:(id)a4;
- (void)setUpdateAvailability:(unint64_t)a3 completionHandler:(id)a4;
@end

@implementation LSApplicationRecord

- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)LSApplicationRecord;
  [(LSBundleRecord *)&v29 _detachFromContext:a3 tableID:*(void *)&a4 unitID:*(void *)&a5 unitBytes:a6];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v7 = [(LSRecord *)self _resolvedPropertyValueForGetter:sel_applicationExtensionRecords];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * v10++) detach];
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v8);
  }

  v11 = [(LSRecord *)self _resolvedPropertyValueForGetter:sel__rawEnvironmentVariables];
  v12 = v11;
  if (v11) {
    [v11 detach];
  }

  v13 = [(LSRecord *)self _resolvedPropertyValueForGetter:sel__localizedNamesWithContext];
  v14 = v13;
  if (v13) {
    [v13 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_215];
  }

  v15 = [(LSRecord *)self _resolvedPropertyValueForGetter:sel_supportedGameControllers];
  v16 = v15;
  if (v15)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v21 objects:v30 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v22;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v22 != v19) {
            objc_enumerationMutation(v17);
          }
          objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v20++), "detach", (void)v21);
        }
        while (v18 != v20);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v21 objects:v30 count:16];
      }
      while (v18);
    }
  }
}

- (id)applicationExtensionRecordsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  _CSArrayEnumerateAllValues();
  v6 = (void *)[v8 copy];

  return v6;
}

- (id)exactBundleVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  v6 = (void *)_CSStringCopyCFString();

  return v6;
}

- (id)iTunesMetadataWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  id v6 = [[LSiTunesMetadata alloc] _initWithContext:a3 bundleData:a6];

  return v6;
}

- (id)shortVersionStringWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  id v6 = (void *)_CSStringCopyCFString();

  return v6;
}

- (id)counterpartIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return _LSDatabaseGetStringArray(a3->db);
}

- (id)bundleContainerURLWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__130;
  v13 = __Block_byref_object_dispose__131;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __90__LSApplicationRecord_Containers__bundleContainerURLWithContext_tableID_unitID_unitBytes___block_invoke;
  v8[3] = &unk_1E522BF28;
  v8[5] = a3;
  v8[6] = a6;
  v8[4] = &v9;
  __LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__((uint64_t)v8);
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)typeForInstallMachineryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  id v6 = (void *)_CSStringCopyCFString();

  return v6;
}

- (id)_iconFileNamesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return _LSDatabaseGetStringArray(a3->db);
}

- (id)appTagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  if ((a6->_bundleFlags & 0x80000000000) == 0
    || ([(LSBundleRecord *)self infoDictionary],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = objc_opt_class(),
        [v6 objectForKey:@"SBAppTags" ofClass:v7 valuesOfClass:objc_opt_class()],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v8))
  {
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (id)_personasWithAttributesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v8 = _LSDatabaseGetStringArray(a3->db);
  __p = 0;
  long long v26 = 0;
  uint64_t v27 = 0;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  long long v22 = __83__LSApplicationRecord__personasWithAttributesWithContext_tableID_unitID_unitBytes___block_invoke;
  long long v23 = &__block_descriptor_40_e14_v24__0I8I12_16l;
  p_p = &__p;
  _CSArrayEnumerateAllValues();
  for (unsigned int i = 0; ; ++i)
  {
    uint64_t v11 = __p;
    uint64_t v10 = v26;
    unint64_t v12 = objc_msgSend(v8, "count", v20, v21, v22, v23, p_p);
    unint64_t v13 = v12 >= (v10 - v11) >> 3 ? (v10 - v11) >> 3 : v12;
    if (v13 <= i) {
      break;
    }
    id v14 = [_LSPersonaWithAttributes alloc];
    uint64_t v15 = *((void *)__p + i);
    v16 = [v8 objectAtIndexedSubscript:i];
    id v17 = -[_LSPersonaWithAttributes initWithPersonaType:personaUniqueString:](v14, v15, v16);
    [v7 addObject:v17];
  }
  uint64_t v18 = [v7 allObjects];
  if (__p)
  {
    long long v26 = __p;
    operator delete(__p);
  }

  return v18;
}

- (id)_deviceIdentifierVendorNameWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return +[_LSDDeviceIdentifierService vendorNameForDeviceIdentifiersWithContext:a3 bundleUnit:*(void *)&a5 bundleData:a6];
}

- (id)managementDomainWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  id v6 = (__CFString *)_CSStringCopyCFString();
  if (!v6) {
    id v6 = @"default";
  }

  return v6;
}

- (id)VPNPluginsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if ((a6->_bundleFlags & 0x100000000000) == 0) {
    goto LABEL_2;
  }
  id v8 = [(LSBundleRecord *)self infoDictionary];
  uint64_t v9 = objc_opt_class();
  id v6 = [v8 objectForKey:@"UIVPNPlugin" ofClass:v9 valuesOfClass:objc_opt_class()];

  if (!v6)
  {
    uint64_t v11 = [(LSBundleRecord *)self infoDictionary];
    unint64_t v12 = [v11 objectForKey:@"UIVPNPlugin" ofClass:objc_opt_class()];

    if (!v12
      || (v13[0] = v12,
          [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1],
          id v6 = objc_claimAutoreleasedReturnValue(),
          v12,
          !v6))
    {
LABEL_2:
      id v6 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }

  return v6;
}

- (id)_rawIconDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return +[_LSLazyPropertyList lazyPropertyListWithContext:unit:](_LSLazyPropertyList, "lazyPropertyListWithContext:unit:", a3, HIDWORD(a6->genreID), *(void *)&a5);
}

- (id)appStoreToolsBuildVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  id v6 = (__CFString *)_CSStringCopyCFString();
  id v7 = v6;
  if (!v6) {
    id v6 = &stru_1ECB1A570;
  }
  id v8 = v6;

  return v8;
}

- (id)_rawEnvironmentVariablesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return +[_LSLazyPropertyList lazyPropertyListWithContext:unit:](_LSLazyPropertyList, "lazyPropertyListWithContext:unit:", a3, a6->queriableSchemes, *(void *)&a5);
}

- (id)_preferredLaunchArchitectureWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return _LSBundleGetPreferredLaunchArchitecture(a3->db, a5);
}

- (id)_localizedNamesWithContextWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  unint64_t v12 = __Block_byref_object_copy__130;
  unint64_t v13 = __Block_byref_object_dispose__131;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__LSApplicationRecord__localizedNamesWithContextWithContext_tableID_unitID_unitBytes___block_invoke;
  v8[3] = &unk_1E522BEE0;
  v8[4] = &v9;
  v8[5] = a6;
  v8[6] = a3;
  _LSBundleDisplayNameContextEnumerate(v8);
  id v6 = (void *)[(id)v10[5] copy];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)_linkedParentApplicationBundleIDWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  id v6 = (void *)_CSStringCopyCFString();

  return v6;
}

- (id)_defaultCategoryTypeIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = (void *)_CSStringCopyCFString();
  if (v7) {
    [v6 addObject:v7];
  }

  id v8 = (void *)_CSStringCopyCFString();
  if (v8) {
    [v6 addObject:v8];
  }

  uint64_t v9 = (void *)[v6 copy];

  return v9;
}

- (id)supportedGameControllersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  id v10 = v6;
  _CSArrayEnumerateAllValues();
  id v7 = objc_msgSend(v10, "copy", v9, 3221225472, __93__LSApplicationRecord_GameKit__supportedGameControllersWithContext_tableID_unitID_unitBytes___block_invoke, &unk_1E522C108);

  return v7;
}

- (id)userActivityTypesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  id v6 = _LSDatabaseGetStringArray(a3->db);
  if (v6) {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v6];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)companionBundleIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return 0;
}

- (id)regulatoryPrivacyDisclosureVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  id v6 = [(LSBundleRecord *)self infoDictionary];
  id v7 = [v6 objectForKey:@"NSRegulatoryPrivacyDisclosure" ofClass:objc_opt_class()];

  id v8 = [v7 objectForKey:@"NSRegulatoryPrivacyDisclosureVersion"];

  return v8;
}

- (id)externalAccessoryProtocolsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  if ((a6->_bundleFlags & 0x800000000000) == 0
    || ([(LSBundleRecord *)self infoDictionary],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = objc_opt_class(),
        [v6 objectForKey:@"UISupportedExternalAccessoryProtocols" ofClass:v7 valuesOfClass:objc_opt_class()], id v8 = objc_claimAutoreleasedReturnValue(), v6, !v8))
  {
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (id)directionsModesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  if ((a6->_bundleFlags & 0x10000000000) == 0
    || ([(LSBundleRecord *)self infoDictionary],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = objc_opt_class(),
        [v6 objectForKey:@"MKDirectionsApplicationSupportedModes" ofClass:v7 valuesOfClass:objc_opt_class()], id v8 = objc_claimAutoreleasedReturnValue(), v6, !v8))
  {
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (id)deviceFamiliesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  _CSArrayEnumerateAllValues();
  id v6 = (void *)[v8 copy];

  return v6;
}

- (id)audioComponentsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  if ((a6->_bundleFlags & 0x40000000000) == 0
    || ([(LSBundleRecord *)self infoDictionary],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = objc_opt_class(),
        [v6 objectForKey:@"AudioComponents" ofClass:v7 valuesOfClass:objc_opt_class()],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v8))
  {
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (id)minimumSystemVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  long long v6 = *(_OWORD *)&a6->_minSystemVersion._opaque[8];
  v9[0] = *(_OWORD *)&a6->_mtime;
  v9[1] = v6;
  uint64_t v7 = _LSVersionNumberGetStringRepresentation(v9);

  return v7;
}

- (id)maximumSystemVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  long long v6 = *(_OWORD *)&a6->_maxSystemVersion._opaque[8];
  v9[0] = *(_OWORD *)&a6->_minSystemVersion._opaque[24];
  v9[1] = v6;
  uint64_t v7 = _LSVersionNumberGetStringRepresentation(v9);

  return v7;
}

- (id)equivalentBundleIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return _LSDatabaseGetStringArray(a3->db);
}

- (id)driverExtensionPathsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return _LSDatabaseGetStringArray(a3->db);
}

- (id)carPlayInstrumentClusterURLSchemesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  long long v6 = _LSDatabaseGetStringArray(a3->db);
  uint64_t v7 = v6;
  if (!v6) {
    long long v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v8 = v6;

  return v8;
}

- (id)backgroundTaskSchedulerPermittedIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  long long v6 = _LSDatabaseGetStringArray(a3->db);
  uint64_t v7 = v6;
  if (!v6) {
    long long v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v8 = v6;

  return v8;
}

- (id)stashedAppMetadataWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  if (a6->appClipFields.parentAppIDs) {
    long long v6 = [[LSStashedAppMetadata alloc] initWithContext:a3 unitID:a6->appClipFields.parentAppIDs];
  }
  else {
    long long v6 = 0;
  }

  return v6;
}

- (id)installSessionIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  long long v6 = _LSPlistGetValueForKey(a3->db, a6->bundlePersonas, &cfstr_Installsession.isa, *(_LSPlistHint **)&a4);
  if ((_NSIsNSData() & 1) == 0)
  {

    long long v6 = 0;
  }

  return v6;
}

- (id)staticShortcutItemsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  long long v6 = [(LSBundleRecord *)self infoDictionary];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [v6 objectForKey:@"UIApplicationShortcutItems" ofClass:v7 valuesOfClass:objc_opt_class()];

  if (v8) {
    uint64_t v9 = (void *)v8;
  }
  else {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

- (void)_LSRecord_resolve_appClipMetadata
{
  id v2 = [(LSApplicationRecord *)self appClipMetadata];
}

- (LSAppClipMetadata)appClipMetadata
{
  return (LSAppClipMetadata *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_appClipMetadataWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_shortVersionString
{
  id v2 = [(LSApplicationRecord *)self shortVersionString];
}

- (NSString)shortVersionString
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_shortVersionStringWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_counterpartIdentifiers
{
  id v2 = [(LSApplicationRecord *)self counterpartIdentifiers];
}

- (NSArray)counterpartIdentifiers
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_counterpartIdentifiersWithContext_tableID_unitID_unitBytes_);
}

- (LSApplicationRecord)initWithBundleIdentifier:(id)a3 fetchingPlaceholder:(int64_t)a4 error:(id *)a5
{
  return (LSApplicationRecord *)[(LSApplicationRecord *)self _initWithNode:0 bundleIdentifier:a3 placeholderBehavior:a4 systemPlaceholder:0 itemID:0 forceInBundleContainer:0 context:0 error:a5];
}

- (id)_initWithNode:(id)a3 bundleIdentifier:(id)a4 placeholderBehavior:(int64_t)a5 systemPlaceholder:(BOOL)a6 itemID:(unint64_t)a7 forceInBundleContainer:(BOOL)a8 context:(LSContext *)a9 error:(id *)a10
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (_LSLogAppRecordInitsForDataSeparation::onceToken != -1) {
    dispatch_once(&_LSLogAppRecordInitsForDataSeparation::onceToken, &__block_literal_global_5);
  }
  if (_LSLogAppRecordInitsForDataSeparation::result)
  {
    id v17 = _LSDataSeparationLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = a3;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = a4;
      *(_WORD *)&buf[22] = 2048;
      unint64_t v46 = a7;
      _os_log_impl(&dword_182959000, v17, OS_LOG_TYPE_INFO, "application record search init. Node: %@ bundleID: %@ itemID: %llu", buf, 0x20u);
    }
  }
  p_db = (void **)&a9->db;
  if (!a9) {
    p_db = (void **)_LSDatabaseContextGetCurrentContext(0);
  }
  v39 = p_db;
  id v40 = 0;
  char v41 = 0;
  id v42 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  uint64_t v19 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v39, v19, 0);

  if (v20)
  {
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2020000000;
    int v38 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    unint64_t v46 = (unint64_t)__Block_byref_object_copy__130;
    v47 = __Block_byref_object_dispose__131;
    id v48 = 0;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __136__LSApplicationRecord__initWithNode_bundleIdentifier_placeholderBehavior_systemPlaceholder_itemID_forceInBundleContainer_context_error___block_invoke;
    v32[3] = &unk_1E522BE50;
    BOOL v33 = a6;
    v32[4] = a4;
    v32[5] = a3;
    v32[8] = v20;
    v32[9] = a7;
    v32[6] = &v35;
    v32[7] = buf;
    v32[10] = a5;
    BOOL v34 = a8;
    __LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__((uint64_t)v32);
    if (a10) {
      *a10 = *(id *)(*(void *)&buf[8] + 40);
    }
    int v21 = *((_DWORD *)v36 + 6);
    if (v21)
    {
      uint64_t v22 = _LSBundleGet(*v20, v21);
      if (v22)
      {
        id v23 = [(LSApplicationRecord *)self _initWithNode:a3 bundleIdentifier:a4 context:v20 tableID:*((unsigned int *)*v20 + 5) unitID:*((unsigned int *)v36 + 6) bundleBaseData:v22 error:a10];
LABEL_21:
        _Block_object_dispose(buf, 8);

        _Block_object_dispose(&v35, 8);
        goto LABEL_25;
      }
      if (a10)
      {
        uint64_t v43 = *MEMORY[0x1E4F28228];
        v44 = @"Unable to find this application record in the Launch Services database.";
        uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
        _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10814, (uint64_t)"-[LSApplicationRecord _initWithNode:bundleIdentifier:placeholderBehavior:systemPlaceholder:itemID:forceInBundleContainer:context:error:]", 1160, v27);
        *a10 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    id v23 = 0;
    goto LABEL_21;
  }
  if (a10)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    long long v24 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v39, v24, 0);

    if (v25) {
      id v26 = 0;
    }
    else {
      id v26 = v42;
    }
    *a10 = v26;
  }

  id v23 = 0;
LABEL_25:
  id v28 = v23;
  if (v39 && v41) {
    _LSContextDestroy(v39);
  }
  id v29 = v40;
  v39 = 0;
  id v40 = 0;

  char v41 = 0;
  id v30 = v42;
  id v42 = 0;

  return v28;
}

- (id)_initWithNode:(id)a3 bundleIdentifier:(id)a4 context:(LSContext *)a5 tableID:(unsigned int)a6 unitID:(unsigned int)a7 bundleBaseData:(const LSBundleBaseData *)a8 error:(id *)a9
{
  uint64_t v10 = *(void *)&a7;
  uint64_t v11 = *(void *)&a6;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__130;
  v31 = __Block_byref_object_dispose__131;
  id v32 = a3;
  uint64_t v15 = v28[5];
  if (v15) {
    goto LABEL_5;
  }
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  long long v24 = __Block_byref_object_copy__130;
  uint64_t v25 = __Block_byref_object_dispose__131;
  id v26 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __98__LSApplicationRecord__initWithNode_bundleIdentifier_context_tableID_unitID_bundleBaseData_error___block_invoke;
  v19[3] = &unk_1E522BE98;
  v19[5] = &v21;
  v19[6] = a5;
  int v20 = v10;
  v19[4] = &v27;
  __LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__((uint64_t)v19);
  if (a9) {
    *a9 = (id) v22[5];
  }
  _Block_object_dispose(&v21, 8);

  uint64_t v15 = v28[5];
  if (v15)
  {
LABEL_5:
    v18.receiver = self;
    v18.super_class = (Class)LSApplicationRecord;
    id v16 = [(LSBundleRecord *)&v18 _initWithNode:v15 bundleIdentifier:a4 context:a5 tableID:v11 unitID:v10 bundleBaseData:a8 error:a9];
  }
  else
  {

    id v16 = 0;
  }
  _Block_object_dispose(&v27, 8);

  return v16;
}

void __98__LSApplicationRecord__initWithNode_bundleIdentifier_context_tableID_unitID_bundleBaseData_error___block_invoke(uint64_t a1)
{
  int v2 = _LSBundleCopyNode(**(void **)(a1 + 48), *(unsigned int *)(a1 + 56), 0, 0, *(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  _LSGetNSErrorFromOSStatusImpl(v2, &obj, (uint64_t)"-[LSApplicationRecord _initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:]_block_invoke", 1266);
  objc_storeStrong((id *)(v3 + 40), obj);
}

- (id)_initWithContext:(LSContext *)a3 bundleID:(unsigned int)a4 bundleData:(const LSBundleData *)a5 error:(id *)a6
{
  uint64_t v7 = (uint64_t)a5;
  uint64_t v8 = *(void *)&a4;
  v14[1] = *MEMORY[0x1E4F143B8];
  if (a5) {
    return [(LSApplicationRecord *)self _initWithNode:0 bundleIdentifier:0 context:a3 tableID:a3->db->schema.bundleTable unitID:v8 bundleBaseData:v7 error:a6];
  }
  uint64_t v7 = _LSBundleGet(a3->db, a4);
  if (v7) {
    return [(LSApplicationRecord *)self _initWithNode:0 bundleIdentifier:0 context:a3 tableID:a3->db->schema.bundleTable unitID:v8 bundleBaseData:v7 error:a6];
  }
  if (a6)
  {
    uint64_t v13 = *MEMORY[0x1E4F28228];
    v14[0] = @"Unable to find this application record in the Launch Services database.";
    unint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10814, (uint64_t)"-[LSApplicationRecord _initWithContext:bundleID:bundleData:error:]", 1304, v12);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

void __87__LSApplicationRecord_applicationExtensionRecordsWithContext_tableID_unitID_unitBytes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = [LSApplicationExtensionRecord alloc];
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = 0;
  uint64_t v7 = [(LSApplicationExtensionRecord *)v5 _initWithContext:v6 pluginID:a3 pluginData:0 error:&v10];
  id v8 = v10;
  if (v7)
  {
    objc_storeWeak(v7 + 10, *(id *)(a1 + 32));
    [*(id *)(a1 + 40) addObject:v7];
  }
  else
  {
    uint64_t v9 = _LSDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __87__LSApplicationRecord_applicationExtensionRecordsWithContext_tableID_unitID_unitBytes___block_invoke_cold_1(a3, (uint64_t)v8, v9);
    }
  }
}

void __90__LSApplicationRecord_Containers__bundleContainerURLWithContext_tableID_unitID_unitBytes___block_invoke(uint64_t a1)
{
  int v2 = _LSAliasCopyResolvedNode(**(void ***)(a1 + 40), *(_DWORD *)(*(void *)(a1 + 48) + 504), 0, 0, 0);
  if (v2)
  {
    id v6 = v2;
    uint64_t v3 = [v2 URL];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    int v2 = v6;
  }
}

- (void)_LSRecord_resolve_managementDomain
{
  id v2 = [(LSApplicationRecord *)self managementDomain];
}

- (NSString)managementDomain
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_managementDomainWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_appStoreToolsBuildVersion
{
  id v2 = [(LSApplicationRecord *)self appStoreToolsBuildVersion];
}

- (NSString)appStoreToolsBuildVersion
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_appStoreToolsBuildVersionWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__preferredLaunchArchitecture
{
  id v2 = [(LSApplicationRecord *)self _preferredLaunchArchitecture];
}

- (NSString)_preferredLaunchArchitecture
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__preferredLaunchArchitectureWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__localizedNamesWithContext
{
  id v2 = [(LSApplicationRecord *)self _localizedNamesWithContext];
}

- (NSDictionary)_localizedNamesWithContext
{
  return (NSDictionary *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__localizedNamesWithContextWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_supportedGameControllers
{
  id v2 = [(LSApplicationRecord *)self supportedGameControllers];
}

- (NSArray)supportedGameControllers
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_supportedGameControllersWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__defaultCategoryTypeIdentifiers
{
  id v2 = [(LSApplicationRecord *)self _defaultCategoryTypeIdentifiers];
}

- (NSArray)_defaultCategoryTypeIdentifiers
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__defaultCategoryTypeIdentifiersWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__linkedParentApplicationBundleID
{
  id v2 = [(LSApplicationRecord *)self _linkedParentApplicationBundleID];
}

- (NSString)_linkedParentApplicationBundleID
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__linkedParentApplicationBundleIDWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_uniqueInstallIdentifier
{
  id v2 = [(LSApplicationRecord *)self uniqueInstallIdentifier];
}

- (NSData)uniqueInstallIdentifier
{
  return (NSData *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_uniqueInstallIdentifierWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_companionBundleIdentifier
{
  id v2 = [(LSApplicationRecord *)self companionBundleIdentifier];
}

- (NSString)companionBundleIdentifier
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_companionBundleIdentifierWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_externalAccessoryProtocols
{
  id v2 = [(LSApplicationRecord *)self externalAccessoryProtocols];
}

- (NSArray)externalAccessoryProtocols
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_externalAccessoryProtocolsWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_directionsModes
{
  id v2 = [(LSApplicationRecord *)self directionsModes];
}

- (NSArray)directionsModes
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_directionsModesWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_deviceFamilies
{
  id v2 = [(LSApplicationRecord *)self deviceFamilies];
}

- (NSArray)deviceFamilies
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_deviceFamiliesWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_maximumSystemVersion
{
  id v2 = [(LSApplicationRecord *)self maximumSystemVersion];
}

- (NSString)maximumSystemVersion
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_maximumSystemVersionWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_driverExtensionPaths
{
  id v2 = [(LSApplicationRecord *)self driverExtensionPaths];
}

- (NSArray)driverExtensionPaths
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_driverExtensionPathsWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_carPlayInstrumentClusterURLSchemes
{
  id v2 = [(LSApplicationRecord *)self carPlayInstrumentClusterURLSchemes];
}

- (NSArray)carPlayInstrumentClusterURLSchemes
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_carPlayInstrumentClusterURLSchemesWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_minimumSystemVersion
{
  id v2 = [(LSApplicationRecord *)self minimumSystemVersion];
}

- (NSString)minimumSystemVersion
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_minimumSystemVersionWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_diskUsage
{
  id v2 = [(LSApplicationRecord *)self diskUsage];
}

- (_LSDiskUsage)diskUsage
{
  return (_LSDiskUsage *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_diskUsageWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_backgroundTaskSchedulerPermittedIdentifiers
{
  id v2 = [(LSApplicationRecord *)self backgroundTaskSchedulerPermittedIdentifiers];
}

- (NSArray)backgroundTaskSchedulerPermittedIdentifiers
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_backgroundTaskSchedulerPermittedIdentifiersWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_equivalentBundleIdentifiers
{
  id v2 = [(LSApplicationRecord *)self equivalentBundleIdentifiers];
}

- (NSArray)equivalentBundleIdentifiers
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_equivalentBundleIdentifiersWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_regulatoryPrivacyDisclosureVersion
{
  id v2 = [(LSApplicationRecord *)self regulatoryPrivacyDisclosureVersion];
}

- (NSString)regulatoryPrivacyDisclosureVersion
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_regulatoryPrivacyDisclosureVersionWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_audioComponents
{
  id v2 = [(LSApplicationRecord *)self audioComponents];
}

- (NSArray)audioComponents
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_audioComponentsWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_installSessionIdentifier
{
  id v2 = [(LSApplicationRecord *)self installSessionIdentifier];
}

- (NSData)installSessionIdentifier
{
  return (NSData *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_installSessionIdentifierWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_staticShortcutItems
{
  id v2 = [(LSApplicationRecord *)self staticShortcutItems];
}

- (NSArray)staticShortcutItems
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_staticShortcutItemsWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_requiredDeviceCapabilities
{
  id v2 = [(LSApplicationRecord *)self requiredDeviceCapabilities];
}

- (NSDictionary)requiredDeviceCapabilities
{
  return (NSDictionary *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_requiredDeviceCapabilitiesWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_stashedAppMetadata
{
  id v2 = [(LSApplicationRecord *)self stashedAppMetadata];
}

- (LSStashedAppMetadata)stashedAppMetadata
{
  return (LSStashedAppMetadata *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_stashedAppMetadataWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)isArcadeApp
{
  return ([(LSApplicationRecord *)self _rawBundleFlags] >> 59) & 1;
}

- (NSString)exactBundleVersion
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_exactBundleVersionWithContext_tableID_unitID_unitBytes_);
}

- (unint64_t)applicationFamilyID
{
  return __LSRECORD_GETTER__<unsigned long long>(self, (LSRecord *)a2, sel_applicationFamilyIDWithContext_tableID_unitID_unitBytes_);
}

- (id)applicationStateWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  unint64_t v8 = [(LSApplicationRecord *)self _rawBundleFlags];
  uint64_t v9 = 12;
  char v10 = 41;
  if ((v8 & 0x40000) != 0) {
    char v10 = 12;
  }
  uint64_t v11 = 32;
  if ((v8 & 0x40000) == 0)
  {
    uint64_t v11 = 2;
    uint64_t v9 = 20;
  }
  unint64_t v12 = (v8 >> v10) & v11 | v9;
  uint64_t bundleVersion = a6->bundleVersion;
  id v14 = [_LSApplicationState alloc];
  uint64_t v15 = [(LSBundleRecord *)self bundleIdentifier];
  id v16 = [(_LSApplicationState *)v14 initWithBundleIdentifier:v15 stateFlags:v12 ratingRank:a6->sourceAppBundleID installType:bundleVersion];

  return v16;
}

- (BOOL)isBeta
{
  return ([(LSApplicationRecord *)self _rawBundleFlags] >> 21) & 1;
}

- (BOOL)isLaunchProhibited
{
  return ([(LSApplicationRecord *)self _rawBundleFlags] >> 41) & 1;
}

- (id)appClipMetadataWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  if (([(LSApplicationRecord *)self _rawBundleFlags] & 0x1000000000000000) != 0)
  {
    char v10 = _LSDatabaseGetStringArray(a3->db);
    unint64_t v12 = _LSPlistGetValueForKey(a3->db, a6->base.infoDictionary, &cfstr_Nsappclip.isa, v11);
    if (!v12 || (_NSIsNSDictionary() & 1) == 0)
    {

      unint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
    }
    id v9 = [[LSAppClipMetadata alloc] _initWithApplicationRecord:self parentApplicationIdentifiers:v10 appClipPlist:v12];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)isPlaceholder
{
  return ([(LSApplicationRecord *)self _rawBundleFlags] >> 18) & 1;
}

- (unint64_t)_rawBundleFlags
{
  return __LSRECORD_GETTER__<unsigned long long>(self, (LSRecord *)a2, sel__rawBundleFlagsWithContext_tableID_unitID_unitBytes_);
}

- (unint64_t)_rawBundleFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return *(void *)(&a6->_clas + 1);
}

- (unint64_t)applicationFamilyIDWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return a6->downloaderDSID;
}

- (unsigned)_rawPlistFlags
{
  return __LSRECORD_GETTER__<unsigned int>(self, (LSRecord *)a2, sel__rawPlistFlagsWithContext_tableID_unitID_unitBytes_);
}

- (NSURL)bundleContainerURL
{
  return (NSURL *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_bundleContainerURLWithContext_tableID_unitID_unitBytes_);
}

- (NSArray)_iconFileNames
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__iconFileNamesWithContext_tableID_unitID_unitBytes_);
}

- (unsigned)_rawIconFlags
{
  return __LSRECORD_GETTER__<unsigned char>(self, (LSRecord *)a2, sel__rawIconFlagsWithContext_tableID_unitID_unitBytes_);
}

- (unsigned)_rawPlistFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return HIDWORD(a6->_bundleFlags);
}

- (BOOL)isSystemPlaceholderWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return a6->_clas == 14;
}

- (BOOL)isSystemPlaceholder
{
  return __LSRECORD_GETTER__<BOOL>(self, (LSRecord *)a2, sel_isSystemPlaceholderWithContext_tableID_unitID_unitBytes_);
}

- (unsigned)_rawIconFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return a6->_itemFlags;
}

- (LSBundleMoreFlags)_rawMoreFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return (LSBundleMoreFlags)(*(unsigned __int16 *)((char *)&a6->_itemFlags + 1) | (HIBYTE(a6->_itemFlags) << 16));
}

- (LSBundleMoreFlags)_rawMoreFlags
{
  return (LSBundleMoreFlags)__LSRECORD_GETTER__<LSBundleMoreFlags>(self, (LSRecord *)a2, sel__rawMoreFlagsWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)appProtectionLockedWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return (HIBYTE(a6->_itemFlags) >> 5) & 1;
}

- (BOOL)appProtectionLocked
{
  return __LSRECORD_GETTER__<BOOL>(self, (LSRecord *)a2, sel_appProtectionLockedWithContext_tableID_unitID_unitBytes_);
}

- (unint64_t)applicationDownloaderDSIDWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return a6->purchaserDSID;
}

- (unint64_t)applicationDSIDWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return a6->staticDiskUsage;
}

- (void)_LSRecord_resolve_appTags
{
  id v2 = [(LSApplicationRecord *)self appTags];
}

- (NSArray)appTags
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_appTagsWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_VPNPlugins
{
  id v2 = [(LSApplicationRecord *)self VPNPlugins];
}

- (void)_LSRecord_resolve__rawIconDictionary
{
  id v2 = [(LSApplicationRecord *)self _rawIconDictionary];
}

- (BOOL)isDeletableWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  unint64_t v6 = *(void *)(&a6->_clas + 1);
  if ((v6 & 0x10000000000) == 0) {
    return 0;
  }
  uint64_t v8 = (v6 >> 40) & 1;
  int installFailureReason_high = HIDWORD(a6->installFailureReason);
  if (installFailureReason_high
    && _LSDatabaseGetStringForCFString(a3->db, @"System", 0) == installFailureReason_high)
  {
    char v10 = +[LSApplicationRestrictionsManager sharedInstance]();
    int v11 = -[LSApplicationRestrictionsManager isSystemAppDeletionEnabled]((uint64_t)v10);
    unint64_t v12 = (v6 & 0x10000000000) >> 40;

    if (v11) {
      LODWORD(v8) = v12;
    }
    else {
      LODWORD(v8) = 0;
    }
  }
  return v8 != 0;
}

- (BOOL)appProtectionHidden
{
  return __LSRECORD_GETTER__<BOOL>(self, (LSRecord *)a2, sel_appProtectionHiddenWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)appProtectionHiddenWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return (HIBYTE(a6->_itemFlags) >> 4) & 1;
}

- (int)_bundleModTimeWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return _LSBundleDataGetModTime((uint64_t)a6);
}

- (void)_LSRecord_resolve__iconFileNames
{
  id v2 = [(LSApplicationRecord *)self _iconFileNames];
}

- (unint64_t)applicationDownloaderDSID
{
  return __LSRECORD_GETTER__<unsigned long long>(self, (LSRecord *)a2, sel_applicationDownloaderDSIDWithContext_tableID_unitID_unitBytes_);
}

- (NSArray)VPNPlugins
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_VPNPluginsWithContext_tableID_unitID_unitBytes_);
}

- (_LSLazyPropertyList)_rawIconDictionary
{
  return (_LSLazyPropertyList *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__rawIconDictionaryWithContext_tableID_unitID_unitBytes_);
}

- (int)_bundleModTime
{
  return __LSRECORD_GETTER__<unsigned int>(self, (LSRecord *)a2, sel__bundleModTimeWithContext_tableID_unitID_unitBytes_);
}

- (unint64_t)placeholderFailureReason
{
  return __LSRECORD_GETTER__<unsigned long>(self, (LSRecord *)a2, sel_placeholderFailureReasonWithContext_tableID_unitID_unitBytes_);
}

- (unint64_t)placeholderFailureReasonWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return *(void *)&a6->shortVersionString;
}

- (unint64_t)installType
{
  return __LSRECORD_GETTER__<unsigned long>(self, (LSRecord *)a2, sel_installTypeWithContext_tableID_unitID_unitBytes_);
}

- (unint64_t)installTypeWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return a6->bundleVersion;
}

- (unint64_t)applicationDSID
{
  return __LSRECORD_GETTER__<unsigned long long>(self, (LSRecord *)a2, sel_applicationDSIDWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_iconDictionary
{
  id v2 = [(LSApplicationRecord *)self iconDictionary];
}

- (void)_LSRecord_resolve_bundleContainerURL
{
  id v2 = [(LSApplicationRecord *)self bundleContainerURL];
}

- (BOOL)isDeletable
{
  return __LSRECORD_GETTER__<BOOL>(self, (LSRecord *)a2, sel_isDeletableWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)isDeletableSystemApplicationWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return (a6->_bundleFlags & 0x100) != 0
      && (int installFailureReason_high = HIDWORD(a6->installFailureReason)) != 0
      && _LSDatabaseGetStringForCFString(a3->db, @"System", 0) == installFailureReason_high;
}

- (unint64_t)compatibilityStateWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return a6->sequenceNumber;
}

- (void)_LSRecord_resolve_exactBundleVersion
{
  id v2 = [(LSApplicationRecord *)self exactBundleVersion];
}

- (BOOL)isDeletableSystemApplication
{
  return __LSRECORD_GETTER__<BOOL>(self, (LSRecord *)a2, sel_isDeletableSystemApplicationWithContext_tableID_unitID_unitBytes_);
}

- (NSDictionary)iconDictionary
{
  return (NSDictionary *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_iconDictionaryWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)isAppStoreVendable
{
  return __LSRECORD_GETTER__<BOOL>(self, (LSRecord *)a2, sel_isAppStoreVendableWithContext_tableID_unitID_unitBytes_);
}

- (unint64_t)compatibilityState
{
  return __LSRECORD_GETTER__<unsigned long>(self, (LSRecord *)a2, sel_compatibilityStateWithContext_tableID_unitID_unitBytes_);
}

- (id)diskUsageWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [(LSBundleRecord *)self bundleIdentifier];
  id v14 = @"static";
  id v9 = [NSNumber numberWithUnsignedLongLong:*(void *)&a6->vendorName];
  v15[0] = v9;
  char v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];

  if (v8 && [(id)__LSDefaultsGetSharedInstance() isServer])
  {
    int v11 = (id *)-[_LSBundleIDValidationToken initWithBundleIdentifier:]([_LSBundleIDValidationToken alloc], v8);
    -[_LSValidationToken setOwner:](v11, self);
  }
  else
  {
    int v11 = 0;
  }
  id v12 = [[_LSDiskUsage alloc] _initWithBundleIdentifier:v8 alreadyKnownUsage:v10 validationToken:v11];

  return v12;
}

- (void)_LSRecord_resolve_iTunesMetadata
{
  id v2 = [(LSApplicationRecord *)self iTunesMetadata];
}

- (LSiTunesMetadata)iTunesMetadata
{
  return (LSiTunesMetadata *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_iTunesMetadataWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_typeForInstallMachinery
{
  id v2 = [(LSApplicationRecord *)self typeForInstallMachinery];
}

- (NSString)typeForInstallMachinery
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_typeForInstallMachineryWithContext_tableID_unitID_unitBytes_);
}

uint64_t __67__LSApplicationRecord__detachFromContext_tableID_unitID_unitBytes___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if ((void *)*MEMORY[0x1E4F1D260] != a3) {
    return [a3 detach];
  }
  return result;
}

- (void)_LSRecord_resolve_userActivityTypes
{
  id v2 = [(LSApplicationRecord *)self userActivityTypes];
}

- (NSSet)userActivityTypes
{
  return (NSSet *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_userActivityTypesWithContext_tableID_unitID_unitBytes_);
}

- (NSString)alternateIconName
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__130;
  char v10 = __Block_byref_object_dispose__131;
  id v11 = 0;
  if ([(id)__LSDefaultsGetSharedInstance() allowsAlternateIcons]
    && [(LSApplicationRecord *)self supportsAlternateIconNames])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke;
    v5[3] = &unk_1E522C090;
    v5[4] = self;
    v5[5] = &v6;
    __LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__((uint64_t)v5);
  }
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (id)intentsRestrictedWhileProtectedDataUnavailable
{
  if (([(LSApplicationRecord *)self _rawPlistFlags] & 0x200000) == 0
    || ([(LSBundleRecord *)self infoDictionary],
        id v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = objc_opt_class(),
        [v3 objectForKey:@"INIntentsRestrictedWhileProtectedDataUnavailable" ofClass:v4 valuesOfClass:objc_opt_class()], v5 = objc_claimAutoreleasedReturnValue(), v3, !v5))
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (id)intentsRestrictedWhileLocked
{
  if (([(LSApplicationRecord *)self _rawPlistFlags] & 0x200000) == 0
    || ([(LSBundleRecord *)self infoDictionary],
        id v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = objc_opt_class(),
        [v3 objectForKey:@"INIntentsRestrictedWhileLocked" ofClass:v4 valuesOfClass:objc_opt_class()], v5 = objc_claimAutoreleasedReturnValue(), v3, !v5))
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (id)supportedIntentMediaCategories
{
  if (([(LSApplicationRecord *)self _rawPlistFlags] & 0x200000) == 0
    || ([(LSBundleRecord *)self infoDictionary],
        id v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = objc_opt_class(),
        [v3 objectForKey:@"INSupportedMediaCategories" ofClass:v4 valuesOfClass:objc_opt_class()], v5 = objc_claimAutoreleasedReturnValue(), v3, !v5))
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (id)supportedIntents
{
  if (([(LSApplicationRecord *)self _rawPlistFlags] & 0x200000) == 0
    || ([(LSBundleRecord *)self infoDictionary],
        id v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = objc_opt_class(),
        [v3 objectForKey:@"INIntentsSupported" ofClass:v4 valuesOfClass:objc_opt_class()],
        v5 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v5))
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (BOOL)supportsMultiwindow
{
  [(LSBundleRecord *)self platform];
  int base_platform = dyld_get_base_platform();
  if ((base_platform - 2) < 2)
  {
LABEL_4:
    uint64_t v4 = [(LSBundleRecord *)self infoDictionary];
    v5 = [v4 objectForKey:@"UIApplicationSceneManifest" ofClass:objc_opt_class()];

    if (v5)
    {
      uint64_t v6 = [v5 objectForKeyedSubscript:@"UIApplicationSupportsMultipleScenes"];
      if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        char v7 = [v6 BOOLValue];
LABEL_17:

        return v7;
      }
    }
    else
    {
      uint64_t v8 = [(LSBundleRecord *)self infoDictionary];
      uint64_t v6 = [v8 objectForKey:@"UIApplicationInterfaceManifest" ofClass:objc_opt_class()];

      if (v6)
      {
        id v9 = [v6 objectForKeyedSubscript:@"UIApplicationSupportsMultiwindow"];
        if (v9 && (objc_opt_respondsToSelector() & 1) != 0) {
          char v7 = [v9 BOOLValue];
        }
        else {
          char v7 = 0;
        }

        goto LABEL_17;
      }
    }
    char v7 = 0;
    goto LABEL_17;
  }
  if (base_platform == 1) {
    return 1;
  }
  if (base_platform == 11) {
    goto LABEL_4;
  }
  return 0;
}

- (id)iconDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  if (HIDWORD(a6->genreID))
  {
    char v7 = +[_LSLazyPropertyList lazyPropertyListWithContext:unit:](_LSLazyPropertyList, "lazyPropertyListWithContext:unit:");
    uint64_t v8 = (void *)_CSStringCopyCFString();
    if (![(LSApplicationRecord *)self supportsAlternateIconNames]) {
      goto LABEL_12;
    }
    uint64_t v9 = [(LSApplicationRecord *)self alternateIconName];
    char v10 = (void *)v9;
    id v11 = v9 ? (void *)v9 : v8;
    id v12 = v11;

    if (!v12) {
      goto LABEL_12;
    }
    uint64_t v13 = [v7 objectForKey:@"CFBundleAlternateIcons" ofClass:objc_opt_class()];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = [v13 objectForKey:v12];
    id v16 = (void *)v15;
    if (v14 && v15 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      id v16 = 0;
    }

    if (!v16)
    {
LABEL_12:
      id v16 = [v7 objectForKey:@"CFBundlePrimaryIcon" ofClass:objc_opt_class()];
    }
    id v17 = [v7 objectForKey:@"ISGraphicIconConfiguration" ofClass:objc_opt_class()];
    if (v17)
    {
      objc_super v18 = objc_opt_new();
      [v18 setObject:v17 forKey:@"ISGraphicIconConfiguration"];
      if (v16)
      {
        [v18 addEntriesFromDictionary:v16];
        uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v18];

        id v16 = (void *)v19;
      }
      else
      {
        id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v18];
      }
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (id)requiredDeviceCapabilitiesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((a6->_bundleFlags & 0x200000000000) == 0) {
    goto LABEL_2;
  }
  uint64_t v8 = [(LSBundleRecord *)self infoDictionary];
  uint64_t v9 = objc_opt_class();
  uint64_t v6 = [v8 objectForKey:@"UIRequiredDeviceCapabilities" ofClass:v9 valuesOfClass:objc_opt_class()];

  if (!v6)
  {
    id v11 = [(LSBundleRecord *)self infoDictionary];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = [v11 objectForKey:@"UIRequiredDeviceCapabilities" ofClass:v12 valuesOfClass:objc_opt_class()];

    if (!v13) {
      goto LABEL_2;
    }
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v13, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v21;
      uint64_t v18 = MEMORY[0x1E4F1CC38];
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v15);
          }
          [v14 setObject:v18 forKeyedSubscript:*(void *)(*((void *)&v20 + 1) + 8 * i)];
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v16);
    }

    uint64_t v6 = (void *)[v14 copy];
    if (!v6) {
LABEL_2:
    }
      uint64_t v6 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v6;
}

- (id)uniqueInstallIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  uint64_t v6 = _LSPlistGetValueForKey(a3->db, a6->bundlePersonas, &cfstr_Uniqueinstalli.isa, *(_LSPlistHint **)&a4);
  if ((_NSIsNSData() & 1) == 0)
  {

    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)supportsAlternateIconNames
{
  return ([(LSApplicationRecord *)self _rawIconFlags] >> 3) & 1;
}

- (void)_LSRecord_resolve_applicationState
{
  id v2 = [(LSApplicationRecord *)self applicationState];
}

- (_LSApplicationState)applicationState
{
  return (_LSApplicationState *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_applicationStateWithContext_tableID_unitID_unitBytes_);
}

void __93__LSApplicationRecord_InfoPlistRarities__deviceFamiliesWithContext_tableID_unitID_unitBytes___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:");
}

- (LSApplicationRecord)initWithBundleIdentifier:(id)a3 allowPlaceholder:(BOOL)a4 error:(id *)a5
{
  return [(LSApplicationRecord *)self initWithBundleIdentifier:a3 fetchingPlaceholder:a4 error:a5];
}

- (id)_persistentIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  v11.receiver = self;
  v11.super_class = (Class)LSApplicationRecord;
  char v7 = -[LSRecord _persistentIdentifierWithContext:tableID:unitID:unitBytes:](&v11, sel__persistentIdentifierWithContext_tableID_unitID_unitBytes_, a3, *(void *)&a4, *(void *)&a5);
  uint64_t v8 = (void *)[v7 mutableCopy];

  [v8 appendBytes:(char *)a6 + 272 length:8];
  uint64_t v9 = (void *)[v8 copy];

  return v9;
}

- (void)_LSRecord_resolve_applicationExtensionRecords
{
  id v2 = [(LSApplicationRecord *)self applicationExtensionRecords];
}

- (NSSet)applicationExtensionRecords
{
  return (NSSet *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_applicationExtensionRecordsWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)isAppStoreVendableWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  uint64_t v8 = (void *)_CSStringCopyCFString();
  if ([v8 isEqualToString:@"System"])
  {
    LOBYTE(self) = _LSFindBundleWithInfo(a3, 7uLL, [(LSBundleRecord *)self bundleIdentifier], 0, 0, 0, 0) != 0;
  }
  else
  {
    uint64_t v9 = [(LSApplicationRecord *)self iTunesMetadata];
    if ([v9 storeItemIdentifier]
      && ([(LSApplicationRecord *)self _rawBundleFlags] & 0x8000001200000) == 0)
    {
      LODWORD(self) = ![(LSBundleRecord *)self isProfileValidated];
    }
    else
    {
      LOBYTE(self) = 0;
    }
  }
  return (char)self;
}

void __136__LSApplicationRecord__initWithNode_bundleIdentifier_placeholderBehavior_systemPlaceholder_itemID_forceInBundleContainer_context_error___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 88))
  {
    id v2 = *(void **)(a1 + 64);
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) URL];
    uint64_t v5 = *(void *)(a1 + 72);
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v6 + 40);
    int v7 = _LSFindBundleWithInfo(v2, 7uLL, v3, 0, v4, v5, &obj);
    objc_storeStrong((id *)(v6 + 40), obj);
    uint64_t v8 = a1 + 48;
LABEL_15:
    *(_DWORD *)(*(void *)(*(void *)v8 + 8) + 24) = v7;

    return;
  }
  unint64_t v9 = *(void *)(a1 + 80);
  switch(v9)
  {
    case 1uLL:
    case 3uLL:
      unint64_t v10 = 3;
      goto LABEL_7;
    case 2uLL:
      unint64_t v10 = 1;
      unint64_t v9 = 3;
      goto LABEL_7;
    case 4uLL:
      unint64_t v10 = 8;
      if (*(unsigned char *)(a1 + 89))
      {
        unint64_t v9 = 8;
LABEL_11:
        uint64_t v12 = @"must be in bundle container";
        objc_super v11 = &__block_literal_global_144;
      }
      else
      {
        uint64_t v12 = @"must be remote placeholder";
        unint64_t v9 = 8;
        objc_super v11 = &__block_literal_global_149;
      }
      break;
    default:
      unint64_t v9 = 1;
      unint64_t v10 = 1;
LABEL_7:
      if (*(unsigned char *)(a1 + 89)) {
        goto LABEL_11;
      }
      objc_super v11 = 0;
      uint64_t v12 = 0;
      break;
  }
  uint64_t v13 = *(void **)(a1 + 64);
  uint64_t v14 = *(void **)(a1 + 32);
  id v15 = [*(id *)(a1 + 40) URL];
  uint64_t v16 = *(void *)(a1 + 72);
  uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
  id v23 = *(id *)(v17 + 40);
  LODWORD(v13) = _LSFindBundleWithInfo_NoIOFiltered(v13, v9, v14, 0, v15, v16, v12, v11, &v23);
  objc_storeStrong((id *)(v17 + 40), v23);
  uint64_t v8 = a1 + 48;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v13;

  if (v9 != v10 && !*(_DWORD *)(*(void *)(*(void *)v8 + 8) + 24))
  {
    uint64_t v18 = *(void **)(a1 + 64);
    uint64_t v19 = *(void **)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) URL];
    uint64_t v20 = *(void *)(a1 + 72);
    uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
    id v22 = *(id *)(v21 + 40);
    int v7 = _LSFindBundleWithInfo_NoIOFiltered(v18, v10, v19, 0, v4, v20, v12, v11, &v22);
    objc_storeStrong((id *)(v21 + 40), v22);
    goto LABEL_15;
  }
}

- (id)_compatibilityObjectWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  uint64_t v6 = *(void *)&a5;
  unint64_t v9 = [LSApplicationProxy alloc];
  unint64_t v10 = [(LSBundleRecord *)self bundleIdentifier];
  id v11 = [(LSApplicationProxy *)v9 _initWithContext:a3 bundleUnit:v6 applicationRecord:self bundleID:v10 resolveAndDetach:0];

  return v11;
}

- (LSApplicationRecord)initWithURL:(id)a3 allowPlaceholder:(BOOL)a4 error:(id *)a5
{
  return [(LSApplicationRecord *)self initWithURL:a3 fetchingPlaceholder:a4 error:a5];
}

+ (id)enumeratorWithOptions:(unint64_t)a3
{
  id v3 = [[_LSApplicationRecordEnumerator alloc] initWithContext:0 volumeURL:0 options:a3];

  return v3;
}

- (BOOL)isWebAppPlaceholder
{
  return ([(LSApplicationRecord *)self _rawBundleFlags] >> 39) & 1;
}

void __86__LSApplicationRecord__localizedNamesWithContextWithContext_tableID_unitID_unitBytes___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(*(void *)(a1[4] + 8) + 40))
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v7 = *(void *)(a1[4] + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  id v9 = [[_LSLocalizedStringRecord alloc] _initWithContext:a1[6] unitID:*(unsigned int *)(a1[5] + 4 * a2 + 516)];
  id v10 = v9;
  if (v9) {
    [*(id *)(*(void *)(a1[4] + 8) + 40) setObject:v9 forKeyedSubscript:a3];
  }
  else {
    [*(id *)(*(void *)(a1[4] + 8) + 40) setObject:*MEMORY[0x1E4F1D260] forKeyedSubscript:a3];
  }
}

+ (id)_propertyClasses
{
  v4[13] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  v4[9] = objc_opt_class();
  v4[10] = objc_opt_class();
  v4[11] = objc_opt_class();
  v4[12] = objc_opt_class();
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:13];

  return v2;
}

- (NSUUID)deviceIdentifierForVendor
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__130;
  uint64_t v14 = __Block_byref_object_dispose__131;
  id v15 = 0;
  v9[0] = (void (*)(void, void))MEMORY[0x1E4F143A8];
  v9[1] = (void (*)(void, void))3221225472;
  _OWORD v9[2] = __67__LSApplicationRecord_UniqueIdentifiers__deviceIdentifierForVendor__block_invoke;
  v9[3] = (void (*)(void, void))&unk_1E522BF50;
  v9[4] = (void (*)(void, void))self;
  id v3 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDDeviceIdentifierService, v9);
  uint64_t v4 = [(LSApplicationRecord *)self _deviceIdentifierVendorName];
  uint64_t v5 = [(LSBundleRecord *)self bundleIdentifier];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__LSApplicationRecord_UniqueIdentifiers__deviceIdentifierForVendor__block_invoke_499;
  v8[3] = &unk_1E522BF78;
  v8[4] = &v10;
  [v3 getIdentifierOfType:0 vendorName:v4 bundleIdentifier:v5 completionHandler:v8];

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (NSUUID *)v6;
}

- (void)_LSRecord_resolve__deviceIdentifierVendorName
{
  id v2 = [(LSApplicationRecord *)self _deviceIdentifierVendorName];
}

- (NSString)_deviceIdentifierVendorName
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__deviceIdentifierVendorNameWithContext_tableID_unitID_unitBytes_);
}

- (NSArray)identities
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(LSApplicationRecord *)self _personasWithAttributes];
  if ([v3 count])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __45__LSApplicationRecord_Identities__identities__block_invoke;
    v13[3] = &unk_1E522C130;
    v13[4] = self;
    uint64_t v4 = XNSArrayByMappingBlock(v3, v13);
  }
  else if (([(id)__LSDefaultsGetSharedInstance() isInEducationMode] & 1) != 0 {
         || ([(id)__LSDefaultsGetSharedInstance() isUsingEphemeralStorage] & 1) != 0)
  }
  {
    id v5 = [[LSApplicationIdentity alloc] initForRecord:self personaWithAttributes:0];
    id v14 = v5;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  }
  else
  {
    id v6 = _LSDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[LSApplicationRecord(Identities) identities](v6);
    }

    uint64_t v7 = +[LSApplicationRecord personalPersonaAttributes];
    uint64_t v8 = [v7 userPersonaUniqueString];

    id v9 = [LSApplicationIdentity alloc];
    uint64_t v10 = -[_LSPersonaWithAttributes initWithPersonaType:personaUniqueString:]([_LSPersonaWithAttributes alloc], 1, v8);
    id v11 = [(LSApplicationIdentity *)v9 initForRecord:self personaWithAttributes:v10];
    v15[0] = v11;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  }

  return (NSArray *)v4;
}

- (id)managedPersonas
{
  id v2 = [(LSApplicationRecord *)self _personasWithAttributes];
  if ([v2 count] == 1)
  {
    id v3 = [v2 firstObject];
    uint64_t v4 = -[_LSPersonaWithAttributes personaType]((uint64_t)v3);

    if (v4 == 1)
    {

      id v2 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  id v5 = XNSArrayByMappingBlock(v2, &__block_literal_global_160);

  return v5;
}

id __45__LSApplicationRecord_Identities__identities__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [[LSApplicationIdentity alloc] initForRecord:*(void *)(a1 + 32) personaWithAttributes:a2];

  return v2;
}

- (NSDictionary)additionalEnvironmentVariables
{
  if (![(LSBundleRecord *)self isRedacted]) {
    goto LABEL_4;
  }
  id v20 = 0;
  BOOL v3 = [(LSBundleRecord *)self unredactWithError:&v20];
  id v4 = v20;
  id v5 = v4;
  if (v3)
  {

LABEL_4:
    char v6 = [(id)__LSDefaultsGetSharedInstance() isInEducationMode];
    BOOL v19 = 0;
    uint64_t v7 = [(LSApplicationRecord *)self _personasWithAttributes];
    uint64_t v8 = _LSShouldFetchContainersFromContainermanagerForPersona(v7, [(LSApplicationRecord *)self _usesSystemPersona], &v19);

    if (v6)
    {
      BOOL v9 = 1;
    }
    else if (v8)
    {
      uint64_t v10 = _LSDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        [(LSApplicationRecord *)(uint64_t)v8 additionalEnvironmentVariables];
      }

      BOOL v9 = 0;
    }
    else
    {
      BOOL v9 = v19;
    }
    unsigned int active_platform = dyld_get_active_platform();
    if (v9)
    {
      unsigned int v14 = active_platform;
      id v15 = [(LSBundleRecord *)self bundleIdentifier];
      uint64_t v16 = _LSCopyEnvironmentVariablesFromContainermanager(v15, (void *)[(LSApplicationRecord *)self _containerClass], v14);
    }
    else
    {
      uint64_t v17 = [(LSApplicationRecord *)self _rawEnvironmentVariables];
      id v15 = -[_LSLazyPropertyList propertyList](v17);

      uint64_t v16 = (uint64_t)_LSCopyRationalizedEnvironmentVariablesDict(v15);
    }
    uint64_t v12 = (void *)v16;

    goto LABEL_18;
  }
  id v11 = _LSDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
    -[LSApplicationRecord additionalEnvironmentVariables]((uint64_t)self);
  }

  uint64_t v12 = 0;
LABEL_18:

  return (NSDictionary *)v12;
}

- (void)_LSRecord_resolve__rawEnvironmentVariables
{
  id v2 = [(LSApplicationRecord *)self _rawEnvironmentVariables];
}

- (_LSLazyPropertyList)_rawEnvironmentVariables
{
  return (_LSLazyPropertyList *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__rawEnvironmentVariablesWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__personasWithAttributes
{
  id v2 = [(LSApplicationRecord *)self _personasWithAttributes];
}

- (id)_personasWithAttributes
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__personasWithAttributesWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)_containerized
{
  return ([(LSApplicationRecord *)self _rawBundleFlags] >> 38) & 1;
}

- (BOOL)_usesSystemPersona
{
  return ([(LSApplicationRecord *)self _rawBundleFlags] >> 56) & 1;
}

uint64_t __38__LSApplicationRecord_managedPersonas__block_invoke(uint64_t a1, uint64_t a2)
{
  return -[_LSDatabase store](a2);
}

void __83__LSApplicationRecord__personasWithAttributesWithContext_tableID_unitID_unitBytes___block_invoke(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = a3;
  id v5 = *(void **)(v3 + 8);
  unint64_t v6 = *(void *)(v3 + 16);
  if ((unint64_t)v5 >= v6)
  {
    uint64_t v8 = *(void **)v3;
    uint64_t v9 = ((uint64_t)v5 - *(void *)v3) >> 3;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 61) {
      abort();
    }
    uint64_t v11 = v6 - (void)v8;
    if (v11 >> 2 > v10) {
      unint64_t v10 = v11 >> 2;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      uint64_t v13 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<os_eligibility_answer_t>>(v3 + 16, v12);
      uint64_t v8 = *(void **)v3;
      id v5 = *(void **)(v3 + 8);
    }
    else
    {
      uint64_t v13 = 0;
    }
    unsigned int v14 = &v13[8 * v9];
    id v15 = &v13[8 * v12];
    *(void *)unsigned int v14 = v4;
    uint64_t v7 = v14 + 8;
    while (v5 != v8)
    {
      uint64_t v16 = *--v5;
      *((void *)v14 - 1) = v16;
      v14 -= 8;
    }
    *(void *)uint64_t v3 = v14;
    *(void *)(v3 + 8) = v7;
    *(void *)(v3 + 16) = v15;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    void *v5 = a3;
    uint64_t v7 = v5 + 1;
  }
  *(void *)(v3 + 8) = v7;
}

void __67__LSApplicationRecord_UniqueIdentifiers__deviceIdentifierForVendor__block_invoke_499(uint64_t a1, void *a2)
{
}

- (unint64_t)updateAvailability
{
  return ([(LSApplicationRecord *)self _rawMoreFlags] >> 7) & 1;
}

- (BOOL)applicationHasMIDBasedSINF
{
  return ([(LSApplicationRecord *)self _rawBundleFlags] >> 24) & 1;
}

- (NSString)jobLabel
{
  if (([(LSApplicationRecord *)self _rawPlistFlags] & 0x80) != 0)
  {
    uint64_t v4 = [(LSBundleRecord *)self infoDictionary];
    uint64_t v3 = [v4 objectForKey:@"LSLaunchDLabel" ofClass:objc_opt_class()];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (NSString *)v3;
}

- (LSApplicationRecord)initWithURL:(id)a3 fetchingPlaceholder:(int64_t)a4 error:(id *)a5
{
  uint64_t v8 = [[FSNode alloc] initWithURL:a3 flags:0 error:0];
  uint64_t v9 = [(LSApplicationRecord *)self _initWithNode:v8 bundleIdentifier:0 placeholderBehavior:a4 systemPlaceholder:0 itemID:0 forceInBundleContainer:0 context:0 error:a5];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSApplicationRecord)initWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)LSApplicationRecord;
  uint64_t v3 = [(LSBundleRecord *)&v14 initWithCoder:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = -[LSRecord _resolvedPropertyValueForGetter:](v3, "_resolvedPropertyValueForGetter:", sel_applicationExtensionRecords, 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          objc_storeWeak((id *)(*(void *)(*((void *)&v10 + 1) + 8 * v8++) + 80), v4);
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
      }
      while (v6);
    }
  }
  return v4;
}

- (id)_initWithContext:(LSContext *)a3 persistentIdentifierData:(const LSPersistentIdentifierData *)a4 length:(unint64_t)a5
{
  db = a3->db;
  if (a4->var3 != a3->db->schema.bundleTable)
  {
    objc_super v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"LSApplicationRecord.mm", 1522, @"Invalid parameter not satisfying: %@", @"pi->tableID == ctx->db->schema.bundleTable" object file lineNumber description];

    db = a3->db;
  }
  uint64_t v10 = _LSBundleGet(db, a4->var2);
  if (v10 && a5 == 36 && *(void *)a4->var5 == *(void *)(v10 + 272))
  {
    uint64_t var2 = a4->var2;
    return [(LSApplicationRecord *)self _initWithContext:a3 bundleID:var2 bundleData:v10 error:0];
  }
  else
  {

    return 0;
  }
}

+ (id)applicationRecordsForUserActivityDomainName:(id)a3 limit:(unint64_t)a4 error:(id *)a5
{
  id v9 = a3;
  if (!v9)
  {
    long long v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"LSApplicationRecord.mm", 2260, @"Invalid parameter not satisfying: %@", @"domainName != nil" object file lineNumber description];
  }
  uint64_t v10 = [v9 lowercaseString];

  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext(v11);
  id v33 = 0;
  char v34 = 0;
  id v35 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  long long v12 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  long long v13 = (void *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v12, 0);

  if (v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v31[3] = 0;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __93__LSApplicationRecord_UserActivity__applicationRecordsForUserActivityDomainName_limit_error___block_invoke;
    v25[3] = &unk_1E522C0E0;
    uint64_t v29 = v13;
    id v26 = v10;
    id v15 = v14;
    id v27 = v15;
    id v28 = v31;
    unint64_t v30 = a4;
    _LSEnumerateViableBundlesOfClass(v13, 2, v25);
    uint64_t v16 = (void *)[v15 copy];

    _Block_object_dispose(v31, 8);
  }
  else if (a5)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    uint64_t v17 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v17, 0);

    if (v18) {
      id v19 = 0;
    }
    else {
      id v19 = v35;
    }
    uint64_t v16 = 0;
    *a5 = v19;
  }
  else
  {
    uint64_t v16 = 0;
  }
  id v20 = v16;
  if (CurrentContext && v34) {
    _LSContextDestroy(CurrentContext);
  }
  id v21 = v33;
  CurrentContext = 0;
  id v33 = 0;

  char v34 = 0;
  id v22 = v35;
  id v35 = 0;

  return v20;
}

- (LSApplicationRecord)initWithBundleIdentifierOfSystemPlaceholder:(id)a3 error:(id *)a4
{
  return (LSApplicationRecord *)[(LSApplicationRecord *)self _initWithNode:0 bundleIdentifier:a3 placeholderBehavior:0 systemPlaceholder:1 itemID:0 forceInBundleContainer:0 context:0 error:a4];
}

- (LSApplicationRecord)initWithRemotePlaceholderBundleIdentifier:(id)a3 error:(id *)a4
{
  return [(LSApplicationRecord *)self initWithBundleIdentifier:a3 fetchingPlaceholder:4 error:a4];
}

- (LSApplicationRecord)initWithStoreItemIdentifier:(unint64_t)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (a3) {
    return (LSApplicationRecord *)[(LSApplicationRecord *)self _initWithNode:0 bundleIdentifier:0 placeholderBehavior:0 systemPlaceholder:1 itemID:a3 forceInBundleContainer:0 context:0 error:a4];
  }

  if (a4)
  {
    uint64_t v7 = *MEMORY[0x1E4F28228];
    v8[0] = @"Item ID 0 never exists.";
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[LSApplicationRecord initWithStoreItemIdentifier:error:]", 137, v6);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)extensionPointRecordForIdentifier:(id)a3 platform:(unsigned int)a4 error:(id *)a5
{
  id v5 = [[LSExtensionPointRecord alloc] initWithIdentifier:a3 platform:*(void *)&a4 parentAppRecord:self error:a5];

  return v5;
}

- (BOOL)isUpdate
{
  return ([(LSApplicationRecord *)self _rawBundleFlags] >> 19) & 1;
}

- (void)setUpdateAvailability:(unint64_t)a3 completionHandler:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(LSBundleRecord *)self bundleIdentifier];
  if (v7)
  {
    Class Class = object_getClass(self);
    long long v13 = v7;
    id v9 = [NSNumber numberWithUnsignedInteger:a3];
    v14[0] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    [(objc_class *)Class setUpdateAvailabilityForApplicationsWithBundleIdentifiers:v10 completionHandler:a4];
LABEL_5:

    goto LABEL_6;
  }
  if (a4)
  {
    uint64_t v11 = *MEMORY[0x1E4F28228];
    long long v12 = @"This application does not have a bundle identifier and cannot have its updateAvailability property modified.";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    uint64_t v10 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[LSApplicationRecord setUpdateAvailability:completionHandler:]", 266, v9);
    (*((void (**)(id, void, void *))a4 + 2))(a4, 0, v10);
    goto LABEL_5;
  }
LABEL_6:
}

+ (void)setUpdateAvailabilityForApplicationsWithBundleIdentifiers:(id)a3 completionHandler:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"LSApplicationRecord.mm", 274, @"Invalid parameter not satisfying: %@", @"updateAvailabilities != nil" object file lineNumber description];
  }
  if ([a3 count])
  {
    if (([(id)__LSDefaultsGetSharedInstance() isServer] & 1) != 0
      || ([(id)__LSDefaultsGetSharedInstance() hasServer] & 1) == 0)
    {
      uint64_t v8 = _LSServer_DatabaseExecutionContext();
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      void v15[2] = __99__LSApplicationRecord_setUpdateAvailabilityForApplicationsWithBundleIdentifiers_completionHandler___block_invoke;
      v15[3] = &unk_1E522BCF0;
      v15[4] = a3;
      v15[5] = a4;
      v15[6] = a2;
      -[LSDBExecutionContext syncWrite:]((uint64_t)v8, v15);
    }
    else
    {
      v14[0] = (void (*)(void, void))MEMORY[0x1E4F143A8];
      v14[1] = (void (*)(void, void))3221225472;
      void v14[2] = (void (*)(void, void))__99__LSApplicationRecord_setUpdateAvailabilityForApplicationsWithBundleIdentifiers_completionHandler___block_invoke_38;
      v14[3] = (void (*)(void, void))&unk_1E522BD18;
      v14[4] = (void (*)(void, void))a4;
      uint64_t v7 = +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)_LSDModifyService, v14);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      void v13[2] = __99__LSApplicationRecord_setUpdateAvailabilityForApplicationsWithBundleIdentifiers_completionHandler___block_invoke_2;
      v13[3] = &unk_1E522BD40;
      v13[4] = a4;
      [v7 setUpdateAvailabilities:a3 completionHandler:v13];
    }
  }
  else if (a4)
  {
    uint64_t v16 = *MEMORY[0x1E4F28228];
    v17[0] = @"updateAvailabilities";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    uint64_t v10 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"+[LSApplicationRecord setUpdateAvailabilityForApplicationsWithBundleIdentifiers:completionHandler:]", 366, v9);
    (*((void (**)(id, void, void *))a4 + 2))(a4, 0, v10);
  }
}

void __99__LSApplicationRecord_setUpdateAvailabilityForApplicationsWithBundleIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v35 = 0;
  id v32 = 0;
  id v33 = 0;
  char v34 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  id v2 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v32, v2, 0);

  if (v3)
  {
    unint64_t v4 = [*(id *)(a1 + 32) count];
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x5812000000;
    id v27 = __Block_byref_object_copy__2;
    id v28 = __Block_byref_object_dispose__2;
    memset(v29, 0, sizeof(v29));
    uint64_t v30 = 0;
    int v31 = 1065353216;
    std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::__rehash<true>((uint64_t)v29 + 8, (unint64_t)(float)v4);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __99__LSApplicationRecord_setUpdateAvailabilityForApplicationsWithBundleIdentifiers_completionHandler___block_invoke_34;
    v23[3] = &unk_1E522BCC8;
    v23[5] = &v24;
    v23[6] = v3;
    id v5 = *(void **)(a1 + 32);
    v23[4] = *(void *)(a1 + 40);
    uint64_t v6 = [v5 enumerateKeysAndObjectsUsingBlock:v23];
    if (v25[9] == v4)
    {
      uint64_t v7 = v25 + 8;
      while (1)
      {
        uint64_t v7 = (void *)*v7;
        if (!v7) {
          break;
        }
        uint64_t v8 = *((unsigned int *)v7 + 4);
        unint64_t v9 = v7[3];
        uint64_t v10 = (void *)MEMORY[0x18530F680](v6);
        if (_LSBundleGet(*v3, v8))
        {
          if (v9 > 1)
          {
            long long v12 = _LSDefaultLog();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              Name = sel_getName(*(SEL *)(a1 + 48));
              *(_DWORD *)buf = 136446722;
              uint64_t v37 = Name;
              __int16 v38 = 2048;
              uint64_t v39 = v8;
              __int16 v40 = 1024;
              LODWORD(v41) = v9;
              _os_log_error_impl(&dword_182959000, v12, OS_LOG_TYPE_ERROR, "%{public}s: Caller told us to set the update availability of bundle 0x%llx to invalid value %u. Ignoring.", buf, 0x1Cu);
            }
          }
          if (!_CSStoreWriteToUnit())
          {
            long long v13 = _LSDefaultLog();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              id v15 = sel_getName(*(SEL *)(a1 + 48));
              *(_DWORD *)buf = 136446722;
              uint64_t v37 = v15;
              __int16 v38 = 2048;
              uint64_t v39 = v8;
              __int16 v40 = 2112;
              uint64_t v41 = 0;
              _os_log_error_impl(&dword_182959000, v13, OS_LOG_TYPE_ERROR, "%{public}s: Failed to write to bundle 0x%llx, ignoring: %@", buf, 0x20u);
            }
          }
        }
        else
        {
          uint64_t v11 = _LSDefaultLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            id v14 = sel_getName(*(SEL *)(a1 + 48));
            *(_DWORD *)buf = 136446466;
            uint64_t v37 = v14;
            __int16 v38 = 2048;
            uint64_t v39 = v8;
            _os_log_error_impl(&dword_182959000, v11, OS_LOG_TYPE_ERROR, "%{public}s: While enumerating bundles, lost track of bundle 0x%llx. Ignoring.", buf, 0x16u);
          }
        }
      }
      _LSDatabaseCommit((uint64_t)*v3);
      _LSArmSaveTimer(1);
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    _Block_object_dispose(&v24, 8);
    std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>>>::~__hash_table((uint64_t)v29 + 8);
  }
  else
  {
    uint64_t v17 = *(void *)(a1 + 40);
    +[_LSDServiceDomain defaultServiceDomain]();
    uint64_t v18 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v32, v18, 0);

    if (v19) {
      id v20 = 0;
    }
    else {
      id v20 = v35;
    }
    (*(void (**)(uint64_t, void, id))(v17 + 16))(v17, 0, v20);
  }
  if (v32 && v34) {
    _LSContextDestroy(v32);
  }
  id v21 = v33;
  id v32 = 0;
  id v33 = 0;

  char v34 = 0;
  id v22 = v35;
  id v35 = 0;
}

void __99__LSApplicationRecord_setUpdateAvailabilityForApplicationsWithBundleIdentifiers_completionHandler___block_invoke_34(void *a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unsigned int v13 = 0;
  uint64_t v7 = a1[6];
  memset(v14, 0, sizeof(v14));
  int v8 = _LSBundleFindWithInfo(v7, 0, a2, 0, v14, 2, 0, &v13, 0);
  if (v8)
  {
    uint64_t v9 = a1[4];
    uint64_t v10 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], v8, (uint64_t)"+[LSApplicationRecord setUpdateAvailabilityForApplicationsWithBundleIdentifiers:completionHandler:]_block_invoke", 295, 0);
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);

    *a4 = 1;
  }
  else
  {
    uint64_t v11 = *(void *)(a1[5] + 8);
    uint64_t v12 = [a3 unsignedLongLongValue];
    std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>>>::__emplace_unique_key_args<unsigned int,unsigned int &,LSApplicationRecordUpdateAvailability>(v11 + 48, &v13, &v13, &v12);
  }
}

uint64_t __99__LSApplicationRecord_setUpdateAvailabilityForApplicationsWithBundleIdentifiers_completionHandler___block_invoke_38(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

uint64_t __99__LSApplicationRecord_setUpdateAvailabilityForApplicationsWithBundleIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)hasParallelPlaceholder
{
  return ([(LSApplicationRecord *)self _rawBundleFlags] >> 46) & 1;
}

- (BOOL)isLaunchDisabled
{
  return ([(LSApplicationRecord *)self _rawBundleFlags] >> 7) & 1;
}

- (BOOL)isManagedAppDistributor
{
  return ([(LSApplicationRecord *)self _rawMoreFlags] >> 19) & 1;
}

- (BOOL)isInstalledFromDistributorOrWeb
{
  id v2 = [(LSApplicationRecord *)self iTunesMetadata];
  uint64_t v3 = [v2 distributorInfo];
  unint64_t v4 = [v3 distributorID];

  if (v4 && ([v4 isEqualToString:@"com.apple.AppStore"] & 1) == 0) {
    int v5 = [v4 isEqualToString:@"com.apple.TestFlight"] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (BOOL)isAnyRegisteredApplicationInstalledFromDistributorOrWeb
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [a1 enumeratorWithOptions:192];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
        int v8 = (void *)MEMORY[0x18530F680](v3);
        LOBYTE(v7) = objc_msgSend(v7, "isInstalledFromDistributorOrWeb", (void)v10);
        if (v7)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)canHandleWebAuthentication
{
  id v2 = [(LSBundleRecord *)self entitlements];
  uint64_t v3 = [v2 objectForKey:@"com.apple.AuthenticationServices.canHandleASWebAuthenticationSessionRequest" ofClass:objc_opt_class()];

  return v3 != 0;
}

- (BOOL)supportsOnDemandResources
{
  return ([(LSApplicationRecord *)self _rawBundleFlags] >> 43) & 1;
}

- (BOOL)supportsAudiobooks
{
  return ([(LSApplicationRecord *)self _rawBundleFlags] >> 29) & 1;
}

- (BOOL)supportsCarPlayDashboardScene
{
  return ([(LSApplicationRecord *)self _rawBundleFlags] >> 62) & 1;
}

- (BOOL)supportsCarPlayInstrumentClusterScene
{
  return [(LSApplicationRecord *)self _rawBundleFlags] >> 63;
}

- (void)getDeviceManagementPolicyWithCompletionHandler:(id)a3
{
  if (!a3)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[LSApplicationRecord getDeviceManagementPolicyWithCompletionHandler:]"];
    [v6 handleFailureInFunction:v7, @"LSApplicationRecord.mm", 760, @"Invalid parameter not satisfying: %@", @"completionHandler != nil" file lineNumber description];
  }
  uint64_t v5 = [(LSBundleRecord *)self bundleIdentifier];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __70__LSApplicationRecord_getDeviceManagementPolicyWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E522BD90;
  v8[4] = a3;
  _LSGetDMFPolicyWithCompletionHandler((uint64_t)v5, v8);
}

uint64_t __70__LSApplicationRecord_getDeviceManagementPolicyWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)shouldShowSecurityPromptsOnSignIn
{
  return ([(LSApplicationRecord *)self _rawBundleFlags] & 0x8000) == 0;
}

- (BOOL)isWebBrowser
{
  return [(LSApplicationRecord *)self _rawMoreFlags] & 1;
}

- (BOOL)isEligibleWebBrowser
{
  BOOL IsBundleWithFlagsEligibleToBindAsBrowser = LaunchServices::BindingEvaluator::IsBundleWithFlagsEligibleToBindAsBrowser([(LSApplicationRecord *)self _rawBundleFlags], [(LSApplicationRecord *)self _rawMoreFlags] & 0xFFFFFF, [(LSBundleRecord *)self _profileValidationState]);
  if (IsBundleWithFlagsEligibleToBindAsBrowser) {
    LOBYTE(IsBundleWithFlagsEligibleToBindAsBrowser) = ![(LSApplicationRecord *)self appProtectionHidden];
  }
  return IsBundleWithFlagsEligibleToBindAsBrowser;
}

- (BOOL)isMailClient
{
  return ([(LSApplicationRecord *)self _rawMoreFlags] >> 1) & 1;
}

- (BOOL)isEligibleMailClient
{
  BOOL v3 = [(LSApplicationRecord *)self isMailClient];
  if (v3) {
    LOBYTE(v3) = ![(LSApplicationRecord *)self appProtectionHidden];
  }
  return v3;
}

- (BOOL)supportsSpotlightQueryContinuation
{
  return ([(LSApplicationRecord *)self _rawMoreFlags] >> 3) & 1;
}

- (NSArray)spotlightActions
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (([(LSApplicationRecord *)self _rawMoreFlags] & 0x10) != 0)
  {
    BOOL v3 = [(LSBundleRecord *)self infoDictionary];
    uint64_t v4 = [v3 objectForKey:@"CoreSpotlightActions" ofClass:objc_opt_class()];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (!v5) {
      goto LABEL_30;
    }
    uint64_t v6 = *(void *)v27;
    while (1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(obj);
        }
        int v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v9 = objc_opt_class();
        uint64_t v10 = [v8 objectForKey:@"CoreSpotlightActionIdentifier"];
        long long v11 = (void *)v10;
        if (v9) {
          BOOL v12 = v10 == 0;
        }
        else {
          BOOL v12 = 1;
        }
        if (!v12 && (objc_opt_isKindOfClass() & 1) == 0)
        {

          long long v11 = 0;
        }
        uint64_t v13 = objc_opt_class();
        uint64_t v14 = [v8 objectForKey:@"CoreSpotlightActionTitle"];
        uint64_t v15 = (void *)v14;
        if (v13 && v14 && (objc_opt_isKindOfClass() & 1) == 0)
        {
          id v21 = v15;
          uint64_t v15 = 0;
LABEL_27:

          goto LABEL_28;
        }
        if (v11) {
          BOOL v16 = v15 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (!v16)
        {
          uint64_t v17 = [LSSpotlightAction alloc];
          uint64_t v18 = objc_opt_class();
          uint64_t v19 = [v8 objectForKey:@"CoreSpotlightActionSymbolImage"];
          id v20 = (void *)v19;
          if (v18 && v19 && (objc_opt_isKindOfClass() & 1) == 0)
          {

            id v20 = 0;
          }
          id v21 = [(LSSpotlightAction *)v17 _initWithIdentifier:v11 unlocalizedTitle:v15 symbolImageName:v20];

          if (v21) {
            [v24 addObject:v21];
          }
          goto LABEL_27;
        }
LABEL_28:
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (!v5)
      {
LABEL_30:

        break;
      }
    }
  }
  id v22 = (void *)[v24 copy];

  return (NSArray *)v22;
}

- (BOOL)requiresNativeExecution
{
  return 0;
}

- (BOOL)isSwiftPlaygroundsApp
{
  return ([(LSApplicationRecord *)self _rawMoreFlags] >> 8) & 1;
}

- (LSApplicationRecord)linkedParentApplication
{
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__130;
  id v24 = __Block_byref_object_dispose__131;
  id v25 = 0;
  BOOL v3 = [(LSApplicationRecord *)self _linkedParentApplicationBundleID];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v17 = 0;
    v18[0] = &v17;
    v18[1] = 0x3032000000;
    v18[2] = __Block_byref_object_copy__130;
    v18[3] = __Block_byref_object_dispose__131;
    id v19 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __46__LSApplicationRecord_linkedParentApplication__block_invoke;
    v13[3] = &unk_1E522BDB8;
    uint64_t v15 = &v20;
    id v14 = v3;
    BOOL v16 = &v17;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    _OWORD v9[2] = __46__LSApplicationRecord_linkedParentApplication__block_invoke_2;
    v9[3] = &unk_1E522BDE0;
    long long v11 = &v20;
    id v5 = v14;
    id v10 = v5;
    BOOL v12 = &v17;
    [(LSRecord *)self _ifAttached:v13 else:v9];
    if (!v21[5])
    {
      uint64_t v6 = _LSDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        [(LSApplicationRecord *)(uint64_t)v5 linkedParentApplication];
      }
    }
    _Block_object_dispose(&v17, 8);
  }
  id v7 = (id)v21[5];

  _Block_object_dispose(&v20, 8);

  return (LSApplicationRecord *)v7;
}

void __46__LSApplicationRecord_linkedParentApplication__block_invoke(void *a1, uint64_t a2)
{
  uint64_t v4 = [LSApplicationRecord alloc];
  uint64_t v5 = a1[4];
  id v12 = 0;
  uint64_t v6 = [(LSApplicationRecord *)v4 _initWithNode:0 bundleIdentifier:v5 placeholderBehavior:0 systemPlaceholder:0 itemID:0 forceInBundleContainer:0 context:a2 error:&v12];
  id v7 = v12;
  uint64_t v8 = *(void *)(a1[5] + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;

  uint64_t v10 = *(void *)(a1[6] + 8);
  long long v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
}

void __46__LSApplicationRecord_linkedParentApplication__block_invoke_2(void *a1)
{
  id v2 = [LSApplicationRecord alloc];
  uint64_t v3 = a1[4];
  id v10 = 0;
  uint64_t v4 = [(LSApplicationRecord *)v2 initWithBundleIdentifier:v3 allowPlaceholder:0 error:&v10];
  id v5 = v10;
  uint64_t v6 = *(void *)(a1[5] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  uint64_t v8 = *(void *)(a1[6] + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

- (id)categoryTypesWithError:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = [(LSBundleRecord *)self _node];
  v23[4] = self;
  CFArrayRef theArray = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __46__LSApplicationRecord_categoryTypesWithError___block_invoke;
  v23[3] = &unk_1E522BE08;
  int v6 = _LSCopyApplicationCategoriesForNodeWithDefaultIdentifierProvider(v5, &theArray, v23);

  if (v6)
  {
    if (a3)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], v6, (uint64_t)"-[LSApplicationRecord categoryTypesWithError:]", 998, 0);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_4:
      uint64_t v8 = 0;
      *a3 = v7;
      goto LABEL_24;
    }
LABEL_21:
    uint64_t v8 = 0;
    goto LABEL_24;
  }
  uint64_t v9 = (void *)_LSGetUTTypeClass();
  if (!v9)
  {
    if (a3)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], 78, (uint64_t)"-[LSApplicationRecord categoryTypesWithError:]", 995, 0);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
    goto LABEL_21;
  }
  id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
  long long v11 = (void *)[v10 initWithCapacity:CFArrayGetCount(theArray)];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  CFArrayRef v12 = theArray;
  uint64_t v13 = [(__CFArray *)v12 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v12);
        }
        BOOL v16 = objc_msgSend(v9, "typeWithIdentifier:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
        if (!v16)
        {
          if (a3)
          {
            _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], 2, (uint64_t)"-[LSApplicationRecord categoryTypesWithError:]", 984, 0);
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_17;
        }
        [v11 addObject:v16];
      }
      uint64_t v13 = [(__CFArray *)v12 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  uint64_t v17 = [v11 count];
  if (v17 == CFArrayGetCount(theArray)) {
    uint64_t v8 = (void *)[v11 copy];
  }
  else {
    uint64_t v8 = 0;
  }

LABEL_24:
  if (theArray) {
    CFRelease(theArray);
  }

  return v8;
}

uint64_t __46__LSApplicationRecord_categoryTypesWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _defaultCategoryTypeIdentifiers];
}

- (BOOL)isEligibleForWatchAppInstall
{
  return ([(LSApplicationRecord *)self _rawMoreFlags] >> 16) & 1;
}

- (BOOL)supportsAlwaysOnDisplay
{
  return ([(LSApplicationRecord *)self _rawMoreFlags] >> 9) & 1;
}

- (BOOL)defaultsToPrivateAlwaysOnDisplayTreatment
{
  return ([(LSApplicationRecord *)self _rawMoreFlags] >> 10) & 1;
}

- (BOOL)isTrustedForBinding
{
  return ([(LSApplicationRecord *)self _rawBundleFlags] & 0x80) == 0;
}

- (id)trustedCDHashes
{
  return 0;
}

BOOL __136__LSApplicationRecord__initWithNode_bundleIdentifier_placeholderBehavior_systemPlaceholder_itemID_forceInBundleContainer_context_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return *(_DWORD *)(a4 + 504) != 0;
}

BOOL __136__LSApplicationRecord__initWithNode_bundleIdentifier_placeholderBehavior_systemPlaceholder_itemID_forceInBundleContainer_context_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return *(_DWORD *)(a4 + 168) == 16;
}

- (id)_initWithBundleIdentifier:(id)a3 placeholder:(BOOL)a4 error:(id *)a5
{
  uint64_t v5 = 3;
  if (!a4) {
    uint64_t v5 = 0;
  }
  return [(LSApplicationRecord *)self _initWithNode:0 bundleIdentifier:a3 placeholderBehavior:v5 systemPlaceholder:0 itemID:0 forceInBundleContainer:0 context:0 error:a5];
}

- (id)bundleVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  int v6 = (void *)_CSStringCopyCFString();

  return v6;
}

- (id)associatedPersonas
{
  id v2 = [(LSApplicationRecord *)self _personasWithAttributes];
  uint64_t v3 = XNSArrayByMappingBlock(v2, &__block_literal_global_162);

  return v3;
}

uint64_t __41__LSApplicationRecord_associatedPersonas__block_invoke(uint64_t a1, uint64_t a2)
{
  return -[_LSDatabase store](a2);
}

- (unint64_t)_containerClass
{
  return 2;
}

- (BOOL)requiresPostProcessing
{
  return ([(LSApplicationRecord *)self _rawMoreFlags] >> 13) & 1;
}

void __67__LSApplicationRecord_UniqueIdentifiers__deviceIdentifierForVendor__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _LSRecordLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = [*(id *)(a1 + 32) bundleIdentifier];
    int v6 = 138478083;
    id v7 = v5;
    __int16 v8 = 2112;
    uint64_t v9 = a2;
    _os_log_impl(&dword_182959000, v4, OS_LOG_TYPE_ERROR, "Error getting identifier for vendor for %{private}@: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (NSUUID)deviceIdentifierForAdvertising
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__130;
  uint64_t v14 = __Block_byref_object_dispose__131;
  id v15 = 0;
  v9[0] = (void (*)(void, void))MEMORY[0x1E4F143A8];
  v9[1] = (void (*)(void, void))3221225472;
  _OWORD v9[2] = __72__LSApplicationRecord_UniqueIdentifiers__deviceIdentifierForAdvertising__block_invoke;
  v9[3] = (void (*)(void, void))&unk_1E522BF50;
  void v9[4] = (void (*)(void, void))self;
  uint64_t v3 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDDeviceIdentifierService, v9);
  uint64_t v4 = [(LSApplicationRecord *)self _deviceIdentifierVendorName];
  uint64_t v5 = [(LSBundleRecord *)self bundleIdentifier];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __72__LSApplicationRecord_UniqueIdentifiers__deviceIdentifierForAdvertising__block_invoke_501;
  v8[3] = &unk_1E522BF78;
  v8[4] = &v10;
  [v3 getIdentifierOfType:1 vendorName:v4 bundleIdentifier:v5 completionHandler:v8];

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (NSUUID *)v6;
}

void __72__LSApplicationRecord_UniqueIdentifiers__deviceIdentifierForAdvertising__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _LSRecordLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = [*(id *)(a1 + 32) bundleIdentifier];
    int v6 = 138478083;
    id v7 = v5;
    __int16 v8 = 2112;
    uint64_t v9 = a2;
    _os_log_impl(&dword_182959000, v4, OS_LOG_TYPE_ERROR, "Error getting identifier for vendor for %{private}@: %@", (uint8_t *)&v6, 0x16u);
  }
}

void __72__LSApplicationRecord_UniqueIdentifiers__deviceIdentifierForAdvertising__block_invoke_501(uint64_t a1, void *a2)
{
}

- (void)clearAdvertisingIdentifier
{
  +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)_LSDDeviceIdentifierService, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 clearAllIdentifiersOfType:1];
}

- (BOOL)supportsExternallyPlayableContent
{
  return ([(LSApplicationRecord *)self _rawBundleFlags] >> 30) & 1;
}

- (BOOL)supportsOpenInPlace
{
  return ([(LSApplicationRecord *)self _rawBundleFlags] >> 33) & 1;
}

- (BOOL)isFileSharingEnabled
{
  return ([(LSApplicationRecord *)self _rawBundleFlags] >> 31) & 1;
}

- (BOOL)supportsPurgeableLocalStorage
{
  return ([(LSApplicationRecord *)self _rawBundleFlags] >> 34) & 1;
}

- (BOOL)supportsLiveActivitiesFrequentUpdates
{
  return ([(LSApplicationRecord *)self _rawMoreFlags] >> 12) & 1;
}

- (BOOL)supportsLiveActivities
{
  return ([(LSApplicationRecord *)self _rawMoreFlags] >> 11) & 1;
}

- (NSArray)supportedLiveActivityLaunchAttributeTypes
{
  return 0;
}

- (id)localizedNameWithContext:(id)a3
{
  return [(LSApplicationRecord *)self localizedNameWithContext:a3 preferredLocalizations:0];
}

- (id)localizedNameWithContext:(id)a3 preferredLocalizations:(id)a4
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  BOOL v16 = __Block_byref_object_copy__130;
  uint64_t v17 = __Block_byref_object_dispose__131;
  id v18 = 0;
  if (a3 && [a3 length])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __85__LSApplicationRecord_Localization__localizedNameWithContext_preferredLocalizations___block_invoke;
    v12[3] = &unk_1E522BFC8;
    v12[4] = a3;
    v12[5] = self;
    v12[6] = a4;
    v12[7] = &v13;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __85__LSApplicationRecord_Localization__localizedNameWithContext_preferredLocalizations___block_invoke_3;
    v11[3] = &unk_1E522BFF0;
    v11[4] = self;
    v11[5] = a3;
    v11[6] = a4;
    v11[7] = &v13;
    [(LSRecord *)self _ifAttached:v12 else:v11];
  }
  else
  {
    id v7 = _LSRecordLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_182959000, v7, OS_LOG_TYPE_FAULT, "You must pass a valid context string when using -localizedNameWithContext:. Did you want -localizedName?", v10, 2u);
    }
  }
  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __85__LSApplicationRecord_Localization__localizedNameWithContext_preferredLocalizations___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__LSApplicationRecord_Localization__localizedNameWithContext_preferredLocalizations___block_invoke_2;
  v6[3] = &unk_1E522BFA0;
  uint64_t v9 = a2;
  int v10 = a4;
  long long v4 = *(_OWORD *)(a1 + 48);
  long long v7 = *(_OWORD *)(a1 + 32);
  long long v8 = v4;
  return __LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__((uint64_t)v6);
}

void __85__LSApplicationRecord_Localization__localizedNameWithContext_preferredLocalizations___block_invoke_2(uint64_t a1)
{
  id v2 = **(void ***)(a1 + 64);
  uint64_t v3 = *(unsigned int *)(a1 + 72);
  long long v4 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) _node];
  uint64_t v5 = _LSBundleGetLocalizedName(v2, v3, v4, v8, *(void **)(a1 + 48), 0);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __85__LSApplicationRecord_Localization__localizedNameWithContext_preferredLocalizations___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _resolvedPropertyValueForGetter:sel__localizedNamesWithContext];
  uint64_t v3 = v2;
  if (v2)
  {
    id v8 = v2;
    id v4 = (id)[v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
    uint64_t v3 = v8;
    if (v4 != (id)*MEMORY[0x1E4F1D260])
    {
      uint64_t v5 = [v4 stringValueWithPreferredLocalizations:*(void *)(a1 + 48)];
      uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
      long long v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      uint64_t v3 = v8;
    }
  }
}

- (BOOL)wasRenamed
{
  return 0;
}

+ (id)_alternateIconQueue
{
  if (+[LSApplicationRecord(AlternateIcons) _alternateIconQueue]::once != -1) {
    dispatch_once(&+[LSApplicationRecord(AlternateIcons) _alternateIconQueue]::once, &__block_literal_global_618);
  }
  id v2 = (void *)+[LSApplicationRecord(AlternateIcons) _alternateIconQueue]::result;

  return v2;
}

void __58__LSApplicationRecord_AlternateIcons___alternateIconQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("LS alternate icon queue", v2);
  v1 = (void *)+[LSApplicationRecord(AlternateIcons) _alternateIconQueue]::result;
  +[LSApplicationRecord(AlternateIcons) _alternateIconQueue]::uint64_t result = (uint64_t)v0;
}

- (void)setAlternateIconName:(id)a3 completionHandler:(id)a4
{
  long long v7 = [(id)objc_opt_class() _alternateIconQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__LSApplicationRecord_AlternateIcons__setAlternateIconName_completionHandler___block_invoke;
  block[3] = &unk_1E522C040;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async(v7, block);
}

void __78__LSApplicationRecord_AlternateIcons__setAlternateIconName_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([(id)__LSDefaultsGetSharedInstance() allowsAlternateIcons])
  {
    if (_LSIconsLog(void)::onceToken != -1) {
      dispatch_once(&_LSIconsLog(void)::onceToken, &__block_literal_global_964);
    }
    id v2 = _LSIconsLog(void)::log;
    if (os_log_type_enabled((os_log_t)_LSIconsLog(void)::log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v26 = v3;
      __int16 v27 = 2112;
      uint64_t v28 = v4;
      _os_log_impl(&dword_182959000, v2, OS_LOG_TYPE_DEFAULT, "Setting preferredIconName to %@ for %@", buf, 0x16u);
    }
    uint64_t v5 = [*(id *)(a1 + 40) bundleIdentifier];
    uint64_t v6 = [*(id *)(a1 + 40) _rawIconDictionary];
    long long v7 = [v6 _expensiveDictionaryRepresentation];

    uint64_t v15 = (void (*)(void, void))MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __78__LSApplicationRecord_AlternateIcons__setAlternateIconName_completionHandler___block_invoke_621;
    id v18 = &unk_1E522C018;
    id v8 = v5;
    uint64_t v9 = *(void *)(a1 + 48);
    id v19 = v8;
    uint64_t v20 = v9;
    int v10 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDIconService, &v15);
    objc_msgSend(v10, "setAlternateIconName:forIdentifier:iconsDictionary:reply:", *(void *)(a1 + 32), v8, v7, *(void *)(a1 + 48), v15, v16, v17, v18);
  }
  else
  {
    uint64_t v23 = *MEMORY[0x1E4F28568];
    id v24 = @"alternateIcons not allowed";
    long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    uint64_t v12 = _LSMakeNSErrorImpl(@"LSApplicationWorkspaceErrorDomain", 110, (uint64_t)"-[LSApplicationRecord(AlternateIcons) setAlternateIconName:completionHandler:]_block_invoke", 2033, v11);

    uint64_t v21 = *MEMORY[0x1E4F28A50];
    uint64_t v22 = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    long long v7 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F281F8], 3328, (uint64_t)"-[LSApplicationRecord(AlternateIcons) setAlternateIconName:completionHandler:]_block_invoke", 2035, v13);

    if (_LSIconsLog(void)::onceToken != -1) {
      dispatch_once(&_LSIconsLog(void)::onceToken, &__block_literal_global_964);
    }
    uint64_t v14 = _LSIconsLog(void)::log;
    if (os_log_type_enabled((os_log_t)_LSIconsLog(void)::log, OS_LOG_TYPE_ERROR)) {
      __78__LSApplicationRecord_AlternateIcons__setAlternateIconName_completionHandler___block_invoke_cold_1(a1, (uint64_t)v7, v14);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v8 = (id)v12;
  }
}

uint64_t __78__LSApplicationRecord_AlternateIcons__setAlternateIconName_completionHandler___block_invoke_621(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (_LSIconsLog(void)::onceToken != -1) {
    dispatch_once(&_LSIconsLog(void)::onceToken, &__block_literal_global_964);
  }
  uint64_t v4 = _LSIconsLog(void)::log;
  if (os_log_type_enabled((os_log_t)_LSIconsLog(void)::log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = a2;
    _os_log_impl(&dword_182959000, v4, OS_LOG_TYPE_DEFAULT, "Failed to set alternate icon name for bundleID %@ with error: %@", (uint8_t *)&v7, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke(uint64_t a1)
{
  id v2 = [(id)objc_opt_class() _alternateIconQueue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke_2;
  v3[3] = &unk_1E522C090;
  long long v4 = *(_OWORD *)(a1 + 32);
  dispatch_sync(v2, v3);
}

void __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) bundleIdentifier];
  if ([(id)__LSDefaultsGetSharedInstance() isServer])
  {
    uint64_t v3 = +[LSAltIconManager sharedInstance];
    id v15 = 0;
    uint64_t v4 = [v3 alternateIconNameForIdentifier:v2 error:&v15];
    id v5 = v15;
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    int v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v4;

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      if (_LSIconsLog(void)::onceToken != -1) {
        dispatch_once(&_LSIconsLog(void)::onceToken, &__block_literal_global_964);
      }
      if (os_log_type_enabled((os_log_t)_LSIconsLog(void)::log, OS_LOG_TYPE_DEBUG)) {
        __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke_2_cold_1((uint64_t)v2);
      }
    }
  }
  else
  {
    v13[0] = (void (*)(void, void))MEMORY[0x1E4F143A8];
    v13[1] = (void (*)(void, void))3221225472;
    void v13[2] = __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke_626;
    v13[3] = (void (*)(void, void))&unk_1E522BF50;
    id v8 = v2;
    id v14 = v8;
    __int16 v9 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDIconService, v13);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke_627;
    v10[3] = &unk_1E522C068;
    uint64_t v12 = *(void *)(a1 + 40);
    id v11 = v8;
    [v9 getAlternateIconNameForIdentifier:v11 reply:v10];

    id v5 = v14;
  }
}

void __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke_626(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (_LSIconsLog(void)::onceToken != -1) {
    dispatch_once(&_LSIconsLog(void)::onceToken, &__block_literal_global_964);
  }
  uint64_t v4 = _LSIconsLog(void)::log;
  if (os_log_type_enabled((os_log_t)_LSIconsLog(void)::log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    uint64_t v9 = a2;
    _os_log_impl(&dword_182959000, v4, OS_LOG_TYPE_DEFAULT, "Failed to retrieve alternate icon name for bundleID %@ with error: %@", (uint8_t *)&v6, 0x16u);
  }
}

void __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke_627(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_storeStrong(v3, a2);
  }
  else
  {
    if (_LSIconsLog(void)::onceToken != -1) {
      dispatch_once(&_LSIconsLog(void)::onceToken, &__block_literal_global_964);
    }
    if (os_log_type_enabled((os_log_t)_LSIconsLog(void)::log, OS_LOG_TYPE_DEBUG)) {
      __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke_627_cold_1(a1);
    }
  }
}

+ (id)applicationRecordsForUserActivityType:(id)a3 limit:(unint64_t)a4 error:(id *)a5
{
  if (!a3)
  {
    char v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, a1, @"LSApplicationRecord.mm", 2205, @"Invalid parameter not satisfying: %@", @"userActivityType != nil" object file lineNumber description];
  }
  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext((LaunchServices::DatabaseContext *)a1);
  id v46 = 0;
  char v47 = 0;
  id v48 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  __int16 v8 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v8, 0);

  v44 = v9;
  if (v9)
  {
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x4812000000;
    __int16 v38 = __Block_byref_object_copy__671;
    uint64_t v39 = __Block_byref_object_dispose__672;
    __int16 v40 = &unk_182B5933F;
    uint64_t v42 = 0;
    uint64_t v43 = 0;
    __p = 0;
    _LSDatabaseGetStringForCFString(*v9, (const __CFString *)a3, 0);
    _LSDatabaseEnumeratingBindingMap();
    uint64_t v10 = v36[6];
    unint64_t v11 = v36[7];
    unint64_t v12 = 126 - 2 * __clz((uint64_t)(v11 - v10) >> 4);
    uint64_t v49 = &v44;
    if (v11 == v10) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = v12;
    }
    std::__introsort<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:&v49 limit:v13 error:1];
    id v14 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v15 = (void *)[v14 initWithCapacity:(v36[7] - v36[6]) >> 4];
    uint64_t v16 = (unsigned int *)v36[6];
    uint64_t v17 = (unsigned int *)v36[7];
    if (v16 != v17)
    {
      uint64_t v18 = 0;
      do
      {
        id v19 = (void *)MEMORY[0x18530F680]();
        uint64_t v20 = [LSApplicationRecord alloc];
        id v21 = [(LSApplicationRecord *)v20 _initWithContext:v44 bundleID:*v16 bundleData:*((void *)v16 + 1) error:0];
        BOOL v22 = 0;
        if (v21)
        {
          [v15 addObject:v21];
          if (++v18 >= a4) {
            BOOL v22 = 1;
          }
        }

        v16 += 4;
        char v23 = v16 == v17 || v22;
      }
      while ((v23 & 1) == 0);
    }
    id v24 = (void *)[v15 copy];

    _Block_object_dispose(&v35, 8);
    if (__p)
    {
      uint64_t v42 = __p;
      operator delete(__p);
    }
  }
  else if (a5)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    id v25 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v25, 0);

    if (v26) {
      id v27 = 0;
    }
    else {
      id v27 = v48;
    }
    id v24 = 0;
    *a5 = v27;
  }
  else
  {
    id v24 = 0;
  }
  id v28 = v24;
  if (CurrentContext && v47) {
    _LSContextDestroy(CurrentContext);
  }
  id v29 = v46;
  CurrentContext = 0;
  id v46 = 0;

  char v47 = 0;
  id v30 = v48;
  id v48 = 0;

  return v28;
}

void __87__LSApplicationRecord_UserActivity__applicationRecordsForUserActivityType_limit_error___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5 = _LSBundleGet(**(void ***)(a1 + 48), a3);
  if (v5)
  {
    uint64_t v6 = v5;
    if (_LSBundleCouldBeSelectedForActivityContinuation(**(void ***)(a1 + 48), a3, v5, *(void **)(a1 + 32)))
    {
      uint64_t v7 = *(void **)(*(void *)(a1 + 40) + 8);
      unint64_t v8 = v7[7];
      unint64_t v9 = v7[8];
      if (v8 >= v9)
      {
        uint64_t v11 = v7[6];
        uint64_t v12 = (uint64_t)(v8 - v11) >> 4;
        unint64_t v13 = v12 + 1;
        if ((unint64_t)(v12 + 1) >> 60) {
          abort();
        }
        uint64_t v14 = v9 - v11;
        if (v14 >> 3 > v13) {
          unint64_t v13 = v14 >> 3;
        }
        if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v15 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v15 = v13;
        }
        uint64_t v16 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned int,NSUUID * {__strong}>>>((uint64_t)(v7 + 8), v15);
        uint64_t v17 = &v16[16 * v12];
        id v19 = &v16[16 * v18];
        *(_DWORD *)uint64_t v17 = a3;
        *((void *)v17 + 1) = v6;
        uint64_t v10 = v17 + 16;
        id v21 = (char *)v7[6];
        uint64_t v20 = (char *)v7[7];
        if (v20 != v21)
        {
          do
          {
            *((_OWORD *)v17 - 1) = *((_OWORD *)v20 - 1);
            v17 -= 16;
            v20 -= 16;
          }
          while (v20 != v21);
          uint64_t v20 = (char *)v7[6];
        }
        v7[6] = v17;
        v7[7] = v10;
        v7[8] = v19;
        if (v20) {
          operator delete(v20);
        }
      }
      else
      {
        *(_DWORD *)unint64_t v8 = a3;
        *(void *)(v8 + 8) = v6;
        uint64_t v10 = (char *)(v8 + 16);
      }
      v7[7] = v10;
    }
  }
}

void __93__LSApplicationRecord_UserActivity__applicationRecordsForUserActivityDomainName_limit_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  unint64_t v8 = (void *)MEMORY[0x18530F680]();
  CFSetRef v9 = _LSBundleCopyUserActivityDomainNames(**(void **)(a1 + 56), a2, a3);
  CFSetRef v10 = v9;
  if (v9)
  {
    uint64_t v11 = [(__CFSet *)v9 member:*(void *)(a1 + 32)];

    if (v11)
    {
      id v12 = [[LSApplicationRecord alloc] _initWithContext:*(void *)(a1 + 56) bundleID:a2 bundleData:a3 error:0];
      if (v12)
      {
        [*(id *)(a1 + 40) addObject:v12];
        if (++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= *(void *)(a1 + 64)) {
          *a4 = 1;
        }
      }
    }
  }
}

- (BOOL)supportsControllerUserInteraction
{
  return ([(LSApplicationRecord *)self _rawMoreFlags] >> 2) & 1;
}

void __93__LSApplicationRecord_GameKit__supportedGameControllersWithContext_tableID_unitID_unitBytes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = +[_LSLazyPropertyList lazyPropertyListWithContext:*(void *)(a1 + 40) unit:a3];
  if (v4) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (BOOL)isWrapper
{
  return 0;
}

- (BOOL)isWrapped
{
  return 0;
}

- (BOOL)getGenericTranslocationTargetURL:(id *)a3 error:(id *)a4
{
  if (a4)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -4, (uint64_t)"-[LSApplicationRecord(AppWrappers) getGenericTranslocationTargetURL:error:]", 2371, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)bundleMetadataReturningError:(id *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x18530F680](self, a2);
  uint64_t v6 = [(LSBundleRecord *)self bundleIdentifier];
  id v11 = 0;
  uint64_t v7 = ((void (*)(void *, uint64_t))softLinkMobileInstallationCopyAppMetadata[0])(v6, (uint64_t)&v11);
  id v8 = v11;

  if (!v7)
  {
    CFSetRef v9 = _LSRecordLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      unint64_t v13 = self;
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_impl(&dword_182959000, v9, OS_LOG_TYPE_ERROR, "Failed to lookup metadata for app %@: %@", buf, 0x16u);
    }

    if (a3) {
      *a3 = v8;
    }
  }

  return v7;
}

- (BOOL)isAdHocCodeSigned
{
  return ([(LSApplicationRecord *)self _rawBundleFlags] >> 26) & 1;
}

- (BOOL)hasSettingsBundle
{
  return ([(LSApplicationRecord *)self _rawBundleFlags] >> 32) & 1;
}

- (BOOL)applicationMissingRequiredSINF
{
  return ([(LSApplicationRecord *)self _rawBundleFlags] >> 25) & 1;
}

- (BOOL)hasCustomNotification
{
  return ([(LSApplicationRecord *)self _rawBundleFlags] >> 44) & 1;
}

- (LSApplicationRecord)initWithBundleIdentifierOfCompanionApplication:(id)a3 error:(id *)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    uint64_t v8 = *MEMORY[0x1E4F28228];
    v9[0] = @"This platform does not support discovery of companion application identifiers.";
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -4, (uint64_t)"-[LSApplicationRecord(watchOS) initWithBundleIdentifierOfCompanionApplication:error:]", 2744, v6);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (unsigned)watchKitApplicationType
{
  return 0;
}

- (NSString)watchKitVersion
{
  return 0;
}

- (NSString)complicationPrincipalClassName
{
  return 0;
}

- (NSArray)supportedComplicationFamilies
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (BOOL)hasComplication
{
  return 0;
}

- (BOOL)hasGlance
{
  return 0;
}

- (BOOL)shouldSkipWatchAppInstall
{
  return ([(LSApplicationRecord *)self _rawBundleFlags] >> 48) & 1;
}

- (BOOL)isWatchOnly
{
  return 0;
}

- (BOOL)runsIndependentlyOfCompanionApp
{
  return 0;
}

- (NSString)watchKitApplicationTintColorName
{
  return 0;
}

- (id)initForInstallMachineryWithBundleIdentifier:(id)a3 error:(id *)a4
{
  return [(LSApplicationRecord *)self _initWithNode:0 bundleIdentifier:a3 placeholderBehavior:1 systemPlaceholder:0 itemID:0 forceInBundleContainer:0 context:0 error:a4];
}

- (NSNumber)eligibilityDeletionDomain
{
  if (([(LSApplicationRecord *)self _rawPlistFlags] & 0x20) != 0)
  {
    id v4 = [(LSBundleRecord *)self infoDictionary];
    uint64_t v3 = [v4 objectForKey:@"LSEligibilityDeletionDomain" ofClass:objc_opt_class()];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (NSNumber *)v3;
}

- (unint64_t)sequenceNumber
{
  id v2 = [(LSRecord *)self persistentIdentifier];
  unint64_t SequenceNumberInternal = _LSApplicationRecordPersistentIdentifierGetSequenceNumberInternal(v2);

  return SequenceNumberInternal;
}

+ (id)personalPersonaAttributes
{
  if (+[LSApplicationRecord(Identities) personalPersonaAttributes]::once != -1) {
    dispatch_once(&+[LSApplicationRecord(Identities) personalPersonaAttributes]::once, &__block_literal_global_932);
  }
  id v2 = (void *)+[LSApplicationRecord(Identities) personalPersonaAttributes]::result;

  return v2;
}

void __60__LSApplicationRecord_Identities__personalPersonaAttributes__block_invoke()
{
  uint64_t v0 = [(id)getUMUserPersonaAttributesClass() personaAttributesForPersonaType:0];
  v1 = (void *)+[LSApplicationRecord(Identities) personalPersonaAttributes]::result;
  +[LSApplicationRecord(Identities) personalPersonaAttributes]::uint64_t result = v0;
}

- (unint64_t)supportedDefaultAppCategories
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v3 = [(LSBundleRecord *)self claimRecords];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (([v7 _rawFlags] & 0x2000) != 0)
        {
          id v18 = v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v32 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v18 = 0;
LABEL_11:

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = [v18 typeIdentifiers];
  unint64_t v9 = 0;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * j);
        InfoFromTypeIdentifier = (uint64_t *)LSDefaultAppCategoryGetInfoFromTypeIdentifier(v13);
        if (InfoFromTypeIdentifier)
        {
          v9 |= LSDefaultAppCategoryMaskForCategory(*InfoFromTypeIdentifier);
        }
        else
        {
          id v15 = _LSDefaultLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            uint64_t v16 = [(LSBundleRecord *)self bundleIdentifier];
            *(_DWORD *)buf = 138543618;
            uint64_t v28 = v13;
            __int16 v29 = 2114;
            id v30 = v16;
            _os_log_fault_impl(&dword_182959000, v15, OS_LOG_TYPE_FAULT, "no category for type %{public}@ in default apps claim of bundle %{public}@!", buf, 0x16u);
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v31 count:16];
    }
    while (v10);
  }

  return v9;
}

- (BOOL)mayBeBUIVisible
{
  id v2 = [(LSApplicationRecord *)self typeForInstallMachinery];
  if ([v2 isEqualToString:@"System"]) {
    char v3 = 1;
  }
  else {
    char v3 = [v2 isEqualToString:@"User"];
  }

  return v3;
}

- (unint64_t)bundleInode
{
  return 0;
}

- (unint64_t)executableInode
{
  return 0;
}

+ (id)redactedProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__LSApplicationRecord_Redaction__redactedProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[LSApplicationRecord(Redaction) redactedProperties]::once != -1) {
    dispatch_once(&+[LSApplicationRecord(Redaction) redactedProperties]::once, block);
  }
  id v2 = (void *)+[LSApplicationRecord(Redaction) redactedProperties]::properties;

  return v2;
}

void __52__LSApplicationRecord_Redaction__redactedProperties__block_invoke(uint64_t a1)
{
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)&OBJC_METACLASS___LSApplicationRecord;
  v1 = objc_msgSendSuper2(&v4, sel_redactedProperties);
  uint64_t v2 = [v1 arrayByAddingObject:@"_rawEnvironmentVariables"];
  char v3 = (void *)+[LSApplicationRecord(Redaction) redactedProperties]::properties;
  +[LSApplicationRecord(Redaction) redactedProperties]::properties = v2;
}

- (id)recordForUnredactingWithContext:(LSContext *)a3 error:(id *)a4
{
  uint64_t v7 = [LSApplicationRecord alloc];
  uint64_t v8 = [(LSBundleRecord *)self _node];
  unint64_t v9 = [(LSBundleRecord *)self bundleIdentifier];
  BOOL v10 = [(LSApplicationRecord *)self isPlaceholder];
  BOOL v11 = [(LSApplicationRecord *)self isSystemPlaceholder];
  if (v10) {
    uint64_t v12 = 3;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = [(LSApplicationRecord *)v7 _initWithNode:v8 bundleIdentifier:v9 placeholderBehavior:v12 systemPlaceholder:v11 itemID:0 forceInBundleContainer:0 context:a3 error:a4];

  return v13;
}

- (id)getApplicationExtensionDiagnosticDescriptionWithError:(id *)a3
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__130;
  id v18 = __Block_byref_object_dispose__131;
  id v19 = 0;
  uint64_t v8 = 0;
  unint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  BOOL v11 = __Block_byref_object_copy__130;
  uint64_t v12 = __Block_byref_object_dispose__131;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__LSApplicationRecord_Diagnostic__getApplicationExtensionDiagnosticDescriptionWithError___block_invoke;
  v7[3] = &unk_1E522C178;
  v7[4] = &v8;
  v7[5] = &v14;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __89__LSApplicationRecord_Diagnostic__getApplicationExtensionDiagnosticDescriptionWithError___block_invoke_2;
  v6[3] = &unk_1E522C1A0;
  void v6[4] = self;
  v6[5] = &v8;
  v6[6] = &v14;
  [(LSRecord *)self _ifAttached:v7 else:v6];
  if (a3) {
    *a3 = (id) v15[5];
  }
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);

  return v4;
}

void __89__LSApplicationRecord_Diagnostic__getApplicationExtensionDiagnosticDescriptionWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  uint64_t v7 = _LSGetApplicationExtensionDiagnosticDescriptionForBundle(a2, a4);
  objc_storeStrong((id *)(v5 + 40), v6);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void __89__LSApplicationRecord_Diagnostic__getApplicationExtensionDiagnosticDescriptionWithError___block_invoke_2(uint64_t a1)
{
  id v19 = 0;
  uint64_t v16 = 0;
  id v17 = 0;
  char v18 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  uint64_t v2 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  char v3 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v16, v2, 0);

  if (!v3)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    uint64_t v10 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v16, v10, 0);

    if (v11) {
      id v12 = 0;
    }
    else {
      id v12 = v19;
    }
    goto LABEL_8;
  }
  if (!_LSBundleGet(*v3, [*(id *)(a1 + 32) unitID]))
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10814, (uint64_t)"-[LSApplicationRecord(Diagnostic) getApplicationExtensionDiagnosticDescriptionWithError:]_block_invoke_2", 3138, 0);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    unint64_t v9 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
    goto LABEL_9;
  }
  unsigned int v4 = [*(id *)(a1 + 32) unitID];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  uint64_t v7 = _LSGetApplicationExtensionDiagnosticDescriptionForBundle((uint64_t)v3, v4);
  objc_storeStrong((id *)(v5 + 40), v6);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
LABEL_9:

  if (v16 && v18) {
    _LSContextDestroy(v16);
  }
  id v14 = v17;
  uint64_t v16 = 0;
  id v17 = 0;

  char v18 = 0;
  id v15 = v19;
  id v19 = 0;
}

+ (id)enumeratorOnVolumeAtURL:(id)a3 options:(unint64_t)a4
{
  if (!a3)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"LSRecord+Enumeration.mm", 37, @"Invalid parameter not satisfying: %@", @"volumeURL != nil" object file lineNumber description];
  }
  if (([a3 isFileURL] & 1) == 0)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"LSRecord+Enumeration.mm", 38, @"Invalid parameter not satisfying: %@", @"volumeURL.fileURL" object file lineNumber description];
  }
  uint64_t v8 = [[_LSApplicationRecordEnumerator alloc] initWithContext:0 volumeURL:a3 options:a4];

  return v8;
}

+ (id)systemPlaceholderEnumerator
{
  uint64_t v2 = [[_LSApplicationRecordEnumerator alloc] initWithContext:0 volumeURL:0 options:0];
  [(_LSApplicationRecordEnumerator *)v2 setBundleClass:14];

  return v2;
}

+ (id)remotePlaceholderEnumerator
{
  uint64_t v2 = [(_LSApplicationRecordEnumerator *)[_LSRemotePlaceholderEnumerator alloc] initWithContext:0 volumeURL:0 options:64];
  [(_LSApplicationRecordEnumerator *)v2 setBundleClass:16];

  return v2;
}

- (id)linkedChildApplicationRecordEnumeratorWithOptions:(unint64_t)a3
{
  uint64_t v5 = [_LSLinkedChildApplicationRecordEnumerator alloc];
  uint64_t v6 = [(LSBundleRecord *)self bundleIdentifier];
  uint64_t v7 = [(_LSLinkedChildApplicationRecordEnumerator *)v5 initWithContext:0 parentBundleID:v6 options:a3];

  return v7;
}

+ (id)enumeratorForViableDefaultAppsForCategory:(unint64_t)a3 options:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v21 = 0;
  char v18 = 0;
  id v19 = 0;
  char v20 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  uint64_t v6 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v18, v6, 0);

  if (v7)
  {
    bundleUnitsClaimingDefaultAppCategory(v7, a3, (void **)buf);
    uint64_t v8 = *(void **)buf;
    uint64_t v9 = *(void *)&buf[8];
  }
  else
  {
    uint64_t v10 = _LSDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      id v15 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v18, v15, 0);

      if (v16) {
        id v17 = 0;
      }
      else {
        id v17 = v21;
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "+[LSApplicationRecord(Enumeration) enumeratorForViableDefaultAppsForCategory:options:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v17;
      _os_log_error_impl(&dword_182959000, v10, OS_LOG_TYPE_ERROR, "couldn't get to database in %s: %@", buf, 0x16u);
    }
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  uint64_t v11 = [[_LSApplicationRecordSpecificUnitsEnumerator alloc] initWithContext:v7 options:a4 unitIDs:v8 unitCount:(v9 - (uint64_t)v8) >> 2];
  if (v18 && v20) {
    _LSContextDestroy(v18);
  }
  id v12 = v19;
  char v18 = 0;
  id v19 = 0;

  char v20 = 0;
  id v13 = v21;
  id v21 = 0;

  if (v8) {
    operator delete(v8);
  }

  return v11;
}

+ (id)displayOrderEnumeratorForViableDefaultAppsForCategory:(unint64_t)a3 options:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v24 = 0;
  id v21 = 0;
  id v22 = 0;
  char v23 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  uint64_t v6 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v21, v6, 0);

  if (v7)
  {
    bundleUnitsClaimingDefaultAppCategory(v7, a3, (void **)buf);
    uint64_t v8 = *(unsigned char **)buf;
    uint64_t v9 = *(unsigned int **)&buf[8];
    if (*(void *)&buf[8] - *(void *)buf >= 5uLL)
    {
      uint64_t v10 = (unsigned int *)(*(void *)buf + 4);
      unint64_t v11 = 126 - 2 * __clz((*(void *)&buf[8] - (*(void *)buf + 4)) >> 2);
      *(void *)&buf[16] = 0;
      uint64_t v27 = 0;
      *(void *)buf = v7;
      *(void *)&buf[8] = &buf[16];
      long long v25 = buf;
      if (v9 == (unsigned int *)(v8 + 4)) {
        uint64_t v12 = 0;
      }
      else {
        uint64_t v12 = v11;
      }
      std::__introsort<std::_ClassicAlgPolicy,+[LSApplicationRecord(Enumeration) displayOrderEnumeratorForViableDefaultAppsForCategory:options:]::$_2 &,unsigned int *,false>(v10, v9, &v25, v12, 1);
      std::__tree<std::__value_type<unsigned int,NSString * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,NSString * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,NSString * {__strong}>>>::destroy((uint64_t)&buf[8], *(void **)&buf[16]);
    }
  }
  else
  {
    id v13 = _LSDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      char v18 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v21, v18, 0);

      if (v19) {
        id v20 = 0;
      }
      else {
        id v20 = v24;
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "+[LSApplicationRecord(Enumeration) displayOrderEnumeratorForViableDefaultAppsForCategory:options:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v20;
      _os_log_error_impl(&dword_182959000, v13, OS_LOG_TYPE_ERROR, "couldn't get to database in %s: %@", buf, 0x16u);
    }
    uint64_t v9 = 0;
    uint64_t v8 = 0;
  }
  id v14 = [[_LSApplicationRecordSpecificUnitsEnumerator alloc] initWithContext:v7 options:a4 unitIDs:v8 unitCount:((char *)v9 - v8) >> 2];
  if (v21 && v23) {
    _LSContextDestroy(v21);
  }
  id v15 = v22;
  id v21 = 0;
  id v22 = 0;

  char v23 = 0;
  id v16 = v24;
  id v24 = 0;

  if (v8) {
    operator delete(v8);
  }

  return v14;
}

void __87__LSApplicationRecord_applicationExtensionRecordsWithContext_tableID_unitID_unitBytes___block_invoke_cold_1(unsigned int a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)char v3 = 134349314;
  *(void *)&void v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_182959000, a2, a3, "Could not create appex record for plugin unit %{public}llx! Error: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)linkedParentApplication
{
  *(_DWORD *)char v3 = 138412546;
  *(void *)&void v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *(void *)(*(void *)a2 + 40);
  OUTLINED_FUNCTION_1(&dword_182959000, a2, a3, "could not find parent application with bundle identifier %@: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)additionalEnvironmentVariables
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0_3();
  _os_log_fault_impl(&dword_182959000, v1, OS_LOG_TYPE_FAULT, "could not unredact record %@: %@", (uint8_t *)&v2, 0x16u);
}

void __78__LSApplicationRecord_AlternateIcons__setAlternateIconName_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_182959000, log, OS_LOG_TYPE_ERROR, "Failed to set preferredIconName to %@ for %@ error: %@", (uint8_t *)&v5, 0x20u);
}

void __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke_2_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3(&dword_182959000, v1, v2, "Couldn't fetch alternate icon name for %@, error: %@", (void)v3, DWORD2(v3));
}

void __56__LSApplicationRecord_AlternateIcons__alternateIconName__block_invoke_627_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3(&dword_182959000, v1, v2, "Failed to retrieve alternate icon name for bundleID %@ with error: %@", (void)v3, DWORD2(v3));
}

@end