@interface HKOntologyShardRegistryEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)unitTesting_isIdentical:(id)a3;
- (HKOntologyShardRegistryEntry)_copy;
- (HKOntologyShardRegistryEntry)init;
- (HKOntologyShardRegistryEntry)initWithCoder:(id)a3;
- (HKOntologyShardRegistryEntry)initWithIdentifier:(id)a3 schemaType:(id)a4 schemaVersion:(int64_t)a5 availableURL:(id)a6;
- (HKOntologyShardRegistryEntry)initWithIdentifier:(id)a3 schemaType:(id)a4 schemaVersion:(int64_t)a5 availableVersion:(int64_t)a6 availableRegion:(id)a7 availableLocale:(id)a8 availableURL:(id)a9 availableChecksum:(id)a10 availableSize:(int64_t)a11 date:(id)a12;
- (HKOntologyShardRegistryEntry)initWithIdentifier:(id)a3 schemaType:(id)a4 schemaVersion:(int64_t)a5 availableVersion:(int64_t)a6 date:(id)a7;
- (HKOntologyShardRegistryEntry)initWithIdentifier:(id)a3 schemaType:(id)a4 schemaVersion:(int64_t)a5 desiredState:(int64_t)a6;
- (HKOntologyShardRegistryEntry)initWithIdentifier:(id)a3 schemaType:(id)a4 schemaVersion:(int64_t)a5 settings:(unint64_t)a6 slot:(int64_t)a7 desiredState:(int64_t)a8 desiredStateDate:(id)a9 currentVersion:(int64_t)a10 currentVersionDate:(id)a11 currentRegion:(id)a12 currentRegionDate:(id)a13 currentLocale:(id)a14 currentLocaleDate:(id)a15 availableVersion:(int64_t)a16 availableVersionDate:(id)a17 availableRegion:(id)a18 availableRegionDate:(id)a19 availableLocale:(id)a20 availableLocaleDate:(id)a21 availableURL:(id)a22 availableURLDate:(id)a23 availableChecksum:(id)a24 availableChecksumDate:(id)a25 availableSize:(int64_t)a26 availableSizeDate:(id)a27 availableState:(int64_t)a28 availableStateDate:(id)a29;
- (NSDate)availableChecksumDate;
- (NSDate)availableLocaleDate;
- (NSDate)availableRegionDate;
- (NSDate)availableSizeDate;
- (NSDate)availableStateDate;
- (NSDate)availableURLDate;
- (NSDate)availableVersionDate;
- (NSDate)currentLocaleDate;
- (NSDate)currentRegionDate;
- (NSDate)currentVersionDate;
- (NSDate)desiredStateDate;
- (NSString)availableChecksum;
- (NSString)availableLocale;
- (NSString)availableRegion;
- (NSString)currentLocale;
- (NSString)currentRegion;
- (NSString)identifier;
- (NSString)schemaType;
- (NSURL)availableURL;
- (id)copyWithAvailableState:(int64_t)a3;
- (id)copyWithAvailableStateImported;
- (id)copyWithAvailableStateNotImportedForDate:(id)a3;
- (id)copyWithAvailableVersion:(int64_t)a3;
- (id)copyWithAvailableVersion:(int64_t)a3 availableState:(int64_t)a4;
- (id)copyWithCurrentVersionUndeterminedForDate:(id)a3;
- (id)copyWithDesiredState:(int64_t)a3;
- (id)copyWithSlot:(int64_t)a3;
- (id)debugDescription;
- (id)description;
- (id)updatedCopyWithAvailableVersion:(int64_t)a3 availableRegion:(id)a4 availableLocale:(id)a5 availableURL:(id)a6 availableChecksum:(id)a7 availableSize:(int64_t)a8 date:(id)a9;
- (int64_t)availableSize;
- (int64_t)availableState;
- (int64_t)availableVersion;
- (int64_t)currentVersion;
- (int64_t)desiredState;
- (int64_t)schemaVersion;
- (int64_t)slot;
- (unint64_t)hash;
- (unint64_t)settings;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKOntologyShardRegistryEntry

- (HKOntologyShardRegistryEntry)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKOntologyShardRegistryEntry)initWithIdentifier:(id)a3 schemaType:(id)a4 schemaVersion:(int64_t)a5 settings:(unint64_t)a6 slot:(int64_t)a7 desiredState:(int64_t)a8 desiredStateDate:(id)a9 currentVersion:(int64_t)a10 currentVersionDate:(id)a11 currentRegion:(id)a12 currentRegionDate:(id)a13 currentLocale:(id)a14 currentLocaleDate:(id)a15 availableVersion:(int64_t)a16 availableVersionDate:(id)a17 availableRegion:(id)a18 availableRegionDate:(id)a19 availableLocale:(id)a20 availableLocaleDate:(id)a21 availableURL:(id)a22 availableURLDate:(id)a23 availableChecksum:(id)a24 availableChecksumDate:(id)a25 availableSize:(int64_t)a26 availableSizeDate:(id)a27 availableState:(int64_t)a28 availableStateDate:(id)a29
{
  id v93 = a3;
  id v92 = a4;
  id v91 = a9;
  id v30 = a11;
  id v31 = a12;
  id v32 = a13;
  id v33 = a14;
  id v34 = a15;
  id v35 = a17;
  id v36 = a18;
  id v37 = a19;
  id v38 = a20;
  id v90 = a21;
  id v89 = a22;
  id v88 = a23;
  id v87 = a24;
  id v86 = a25;
  id v85 = a27;
  id v84 = a29;
  v94.receiver = self;
  v94.super_class = (Class)HKOntologyShardRegistryEntry;
  v39 = [(HKOntologyShardRegistryEntry *)&v94 init];
  if (v39)
  {
    uint64_t v40 = [v93 copy];
    identifier = v39->_identifier;
    v39->_identifier = (NSString *)v40;

    uint64_t v42 = [v92 copy];
    schemaType = v39->_schemaType;
    v39->_schemaType = (NSString *)v42;

    v39->_schemaVersion = a5;
    v39->_settings = a6;
    v39->_slot = a7;
    v39->_desiredState = a8;
    uint64_t v44 = [v91 copy];
    desiredStateDate = v39->_desiredStateDate;
    v39->_desiredStateDate = (NSDate *)v44;

    v39->_currentVersion = a10;
    uint64_t v46 = [v30 copy];
    currentVersionDate = v39->_currentVersionDate;
    v39->_currentVersionDate = (NSDate *)v46;

    uint64_t v48 = [v31 copy];
    currentRegion = v39->_currentRegion;
    v39->_currentRegion = (NSString *)v48;

    uint64_t v50 = [v32 copy];
    currentRegionDate = v39->_currentRegionDate;
    v39->_currentRegionDate = (NSDate *)v50;

    uint64_t v52 = [v33 copy];
    currentLocale = v39->_currentLocale;
    v39->_currentLocale = (NSString *)v52;

    uint64_t v54 = [v34 copy];
    currentLocaleDate = v39->_currentLocaleDate;
    v39->_currentLocaleDate = (NSDate *)v54;

    v39->_availableVersion = a16;
    uint64_t v56 = [v35 copy];
    availableVersionDate = v39->_availableVersionDate;
    v39->_availableVersionDate = (NSDate *)v56;

    uint64_t v58 = [v36 copy];
    availableRegion = v39->_availableRegion;
    v39->_availableRegion = (NSString *)v58;

    uint64_t v60 = [v37 copy];
    availableRegionDate = v39->_availableRegionDate;
    v39->_availableRegionDate = (NSDate *)v60;

    uint64_t v62 = [v38 copy];
    availableLocale = v39->_availableLocale;
    v39->_availableLocale = (NSString *)v62;

    uint64_t v64 = [v90 copy];
    availableLocaleDate = v39->_availableLocaleDate;
    v39->_availableLocaleDate = (NSDate *)v64;

    uint64_t v66 = [v89 copy];
    availableURL = v39->_availableURL;
    v39->_availableURL = (NSURL *)v66;

    uint64_t v68 = [v88 copy];
    availableURLDate = v39->_availableURLDate;
    v39->_availableURLDate = (NSDate *)v68;

    uint64_t v70 = [v87 copy];
    availableChecksum = v39->_availableChecksum;
    v39->_availableChecksum = (NSString *)v70;

    uint64_t v72 = [v86 copy];
    availableChecksumDate = v39->_availableChecksumDate;
    v39->_availableChecksumDate = (NSDate *)v72;

    v39->_availableSize = a26;
    uint64_t v74 = [v85 copy];
    availableSizeDate = v39->_availableSizeDate;
    v39->_availableSizeDate = (NSDate *)v74;

    v39->_availableState = a28;
    uint64_t v76 = [v84 copy];
    availableStateDate = v39->_availableStateDate;
    v39->_availableStateDate = (NSDate *)v76;
  }
  return v39;
}

- (id)description
{
  v16 = NSString;
  uint64_t v15 = objc_opt_class();
  identifier = self->_identifier;
  schemaType = self->_schemaType;
  int64_t schemaVersion = self->_schemaVersion;
  v6 = HKStringFromOntologyShardSettings(self->_settings);
  int64_t slot = self->_slot;
  if (slot == -1)
  {
    v8 = @"none";
  }
  else
  {
    v8 = [NSNumber numberWithInteger:self->_slot];
  }
  v9 = HKStringFromOntologyShardState(self->_desiredState);
  int64_t currentVersion = self->_currentVersion;
  int64_t availableVersion = self->_availableVersion;
  v12 = HKStringFromOntologyShardState(self->_availableState);
  v13 = [v16 stringWithFormat:@"<%@: (%@:%@:%ld), %@, %@, %@, %ld, %ld, %@>", v15, identifier, schemaType, schemaVersion, v6, v8, v9, currentVersion, availableVersion, v12];

  if (slot != -1) {

  }
  return v13;
}

- (id)debugDescription
{
  v45 = NSString;
  uint64_t v3 = objc_opt_class();
  identifier = self->_identifier;
  uint64_t v44 = v3;
  int64_t schemaVersion = self->_schemaVersion;
  schemaType = self->_schemaType;
  uint64_t v4 = HKStringFromOntologyShardSettings(self->_settings);
  int64_t slot = self->_slot;
  uint64_t v48 = (void *)v4;
  if (slot == -1)
  {
    uint64_t v46 = @"none";
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithInteger:");
    uint64_t v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v58 = HKStringFromOntologyShardState(self->_desiredState);
  v57 = HKDiagnosticStringFromDate(self->_desiredStateDate);
  [(NSDate *)self->_desiredStateDate timeIntervalSinceReferenceDate];
  uint64_t v40 = v5;
  uint64_t v56 = HKStringFromOntologyShardVersion(self->_currentVersion);
  v55 = HKDiagnosticStringFromDate(self->_currentVersionDate);
  [(NSDate *)self->_currentVersionDate timeIntervalSinceReferenceDate];
  uint64_t v39 = v6;
  currentRegion = self->_currentRegion;
  uint64_t v54 = HKDiagnosticStringFromDate(self->_currentRegionDate);
  [(NSDate *)self->_currentRegionDate timeIntervalSinceReferenceDate];
  uint64_t v8 = v7;
  currentLocale = self->_currentLocale;
  v53 = HKDiagnosticStringFromDate(self->_currentLocaleDate);
  [(NSDate *)self->_currentLocaleDate timeIntervalSinceReferenceDate];
  uint64_t v10 = v9;
  uint64_t v52 = HKStringFromOntologyShardVersion(self->_availableVersion);
  v51 = HKDiagnosticStringFromDate(self->_availableVersionDate);
  [(NSDate *)self->_availableVersionDate timeIntervalSinceReferenceDate];
  uint64_t v12 = v11;
  availableRegion = self->_availableRegion;
  uint64_t v50 = HKDiagnosticStringFromDate(self->_availableRegionDate);
  [(NSDate *)self->_availableRegionDate timeIntervalSinceReferenceDate];
  uint64_t v14 = v13;
  availableLocale = self->_availableLocale;
  v49 = HKDiagnosticStringFromDate(self->_availableLocaleDate);
  [(NSDate *)self->_availableLocaleDate timeIntervalSinceReferenceDate];
  uint64_t v16 = v15;
  availableURL = self->_availableURL;
  v18 = HKDiagnosticStringFromDate(self->_availableURLDate);
  [(NSDate *)self->_availableURLDate timeIntervalSinceReferenceDate];
  uint64_t v20 = v19;
  availableChecksum = self->_availableChecksum;
  v22 = HKDiagnosticStringFromDate(self->_availableChecksumDate);
  [(NSDate *)self->_availableChecksumDate timeIntervalSinceReferenceDate];
  uint64_t v24 = v23;
  int64_t availableSize = self->_availableSize;
  if (availableSize == -1)
  {
    v26 = @"unknown";
  }
  else
  {
    v26 = [NSNumber numberWithInteger:self->_availableSize];
  }
  v27 = HKDiagnosticStringFromDate(self->_availableSizeDate);
  [(NSDate *)self->_availableSizeDate timeIntervalSinceReferenceDate];
  uint64_t v29 = v28;
  id v30 = HKStringFromOntologyShardState(self->_availableState);
  id v31 = HKDiagnosticStringFromDate(self->_availableStateDate);
  [(NSDate *)self->_availableStateDate timeIntervalSinceReferenceDate];
  objc_msgSend(v45, "stringWithFormat:", @"<%@:%p id: %@, schema: %@, scheamVersion: %ld, settings:%@, slot:%@, desired:%@, desiredDate:\"%@\" (%f), currentVersion:%@, currentVersionDate:\"%@\" (%f), currentRegion:%@, currentRegionDate:\"%@\" (%f), currentLocale:%@, currentLocaleDate:\"%@\" (%f), availableVersion:%@, availableVersionDate:\"%@\" (%f), availableRegion:%@, availableRegionDate:\"%@\" (%f), availableLocale:%@, availableLocaleDate:\"%@\" (%f), availableURL:%@, availableURLDate:\"%@\" (%f), availableChecksum:%@, availableChecksumDate:\"%@\" (%f), availableSize:%@, availableSizeDate:\"%@\" (%f), availableState:%@, availableStateDate:\"%@\" (%f)>", v44, self, identifier, schemaType, schemaVersion, v48, v46, v58, v57, v40, v56, v55, v39, currentRegion, v54, v8,
    currentLocale,
    v53,
    v10,
    v52,
    v51,
    v12,
    availableRegion,
    v50,
    v14,
    availableLocale,
    v49,
    v16,
    availableURL,
    v18,
    v20,
    availableChecksum,
    v22,
    v24,
    v26,
    v27,
    v29,
    v30,
    v31,
  id v33 = v32);

  if (availableSize != -1) {
  if (slot != -1)
  }

  return v33;
}

- (HKOntologyShardRegistryEntry)initWithIdentifier:(id)a3 schemaType:(id)a4 schemaVersion:(int64_t)a5 desiredState:(int64_t)a6
{
  uint64_t v10 = (void *)MEMORY[0x1E4F1C9C8];
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [v10 date];
  uint64_t v14 = -[HKOntologyShardRegistryEntry initWithIdentifier:schemaType:schemaVersion:settings:slot:desiredState:desiredStateDate:currentVersion:currentVersionDate:currentRegion:currentRegionDate:currentLocale:currentLocaleDate:availableVersion:availableVersionDate:availableRegion:availableRegionDate:availableLocale:availableLocaleDate:availableURL:availableURLDate:availableChecksum:availableChecksumDate:availableSize:availableSizeDate:availableState:availableStateDate:](self, "initWithIdentifier:schemaType:schemaVersion:settings:slot:desiredState:desiredStateDate:currentVersion:currentVersionDate:currentRegion:currentRegionDate:currentLocale:currentLocaleDate:availableVersion:availableVersionDate:availableRegion:availableRegionDate:availableLocale:availableLocaleDate:availableURL:availableURLDate:availableChecksum:availableChecksumDate:availableSize:availableSizeDate:availableState:availableStateDate:", v12, v11, a5, 0, -1, a6, v13, 0, v13, @"XX", v13, 0, v13, -1,
          v13,
          @"XX",
          v13,
          0,
          v13,
          0,
          v13,
          0,
          v13,
          -1,
          v13,
          0,
          v13);

  return v14;
}

- (HKOntologyShardRegistryEntry)initWithIdentifier:(id)a3 schemaType:(id)a4 schemaVersion:(int64_t)a5 availableURL:(id)a6
{
  uint64_t v10 = (void *)MEMORY[0x1E4F1C9C8];
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [v10 date];
  uint64_t v15 = -[HKOntologyShardRegistryEntry initWithIdentifier:schemaType:schemaVersion:settings:slot:desiredState:desiredStateDate:currentVersion:currentVersionDate:currentRegion:currentRegionDate:currentLocale:currentLocaleDate:availableVersion:availableVersionDate:availableRegion:availableRegionDate:availableLocale:availableLocaleDate:availableURL:availableURLDate:availableChecksum:availableChecksumDate:availableSize:availableSizeDate:availableState:availableStateDate:](self, "initWithIdentifier:schemaType:schemaVersion:settings:slot:desiredState:desiredStateDate:currentVersion:currentVersionDate:currentRegion:currentRegionDate:currentLocale:currentLocaleDate:availableVersion:availableVersionDate:availableRegion:availableRegionDate:availableLocale:availableLocaleDate:availableURL:availableURLDate:availableChecksum:availableChecksumDate:availableSize:availableSizeDate:availableState:availableStateDate:", v13, v12, a5, 0, -1, 3, v14, 0, v14, @"XX", v14, 0, v14, -1,
          v14,
          @"XX",
          v14,
          0,
          v14,
          v11,
          v14,
          0,
          v14,
          -1,
          v14,
          1,
          v14);

  return v15;
}

- (HKOntologyShardRegistryEntry)initWithIdentifier:(id)a3 schemaType:(id)a4 schemaVersion:(int64_t)a5 availableVersion:(int64_t)a6 availableRegion:(id)a7 availableLocale:(id)a8 availableURL:(id)a9 availableChecksum:(id)a10 availableSize:(int64_t)a11 date:(id)a12
{
  return -[HKOntologyShardRegistryEntry initWithIdentifier:schemaType:schemaVersion:settings:slot:desiredState:desiredStateDate:currentVersion:currentVersionDate:currentRegion:currentRegionDate:currentLocale:currentLocaleDate:availableVersion:availableVersionDate:availableRegion:availableRegionDate:availableLocale:availableLocaleDate:availableURL:availableURLDate:availableChecksum:availableChecksumDate:availableSize:availableSizeDate:availableState:availableStateDate:](self, "initWithIdentifier:schemaType:schemaVersion:settings:slot:desiredState:desiredStateDate:currentVersion:currentVersionDate:currentRegion:currentRegionDate:currentLocale:currentLocaleDate:availableVersion:availableVersionDate:availableRegion:availableRegionDate:availableLocale:availableLocaleDate:availableURL:availableURLDate:availableChecksum:availableChecksumDate:availableSize:availableSizeDate:availableState:availableStateDate:", a3, a4, a5, 0, -1, 0, a12, 0, a12, @"XX", a12, 0, a12, a6,
           a12,
           a7,
           a12,
           a8,
           a12,
           a9,
           a12,
           a10,
           a12,
           a11,
           a12,
           1,
           a12);
}

- (HKOntologyShardRegistryEntry)initWithIdentifier:(id)a3 schemaType:(id)a4 schemaVersion:(int64_t)a5 availableVersion:(int64_t)a6 date:(id)a7
{
  return -[HKOntologyShardRegistryEntry initWithIdentifier:schemaType:schemaVersion:settings:slot:desiredState:desiredStateDate:currentVersion:currentVersionDate:currentRegion:currentRegionDate:currentLocale:currentLocaleDate:availableVersion:availableVersionDate:availableRegion:availableRegionDate:availableLocale:availableLocaleDate:availableURL:availableURLDate:availableChecksum:availableChecksumDate:availableSize:availableSizeDate:availableState:availableStateDate:](self, "initWithIdentifier:schemaType:schemaVersion:settings:slot:desiredState:desiredStateDate:currentVersion:currentVersionDate:currentRegion:currentRegionDate:currentLocale:currentLocaleDate:availableVersion:availableVersionDate:availableRegion:availableRegionDate:availableLocale:availableLocaleDate:availableURL:availableURLDate:availableChecksum:availableChecksumDate:availableSize:availableSizeDate:availableState:availableStateDate:", a3, a4, a5, 0, -1, 0, a7, -1, a7, @"XX", a7, 0, a7, a6,
           a7,
           @"XX",
           a7,
           0,
           a7,
           0,
           a7,
           0,
           a7,
           -1,
           a7,
           2,
           a7);
}

- (id)copyWithAvailableState:(int64_t)a3
{
  uint64_t v4 = -[HKOntologyShardRegistryEntry _copy](self);
  v4->_availableState = a3;
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  availableStateDate = v4->_availableStateDate;
  v4->_availableStateDate = (NSDate *)v5;

  return v4;
}

- (HKOntologyShardRegistryEntry)_copy
{
  if (result) {
    return -[HKOntologyShardRegistryEntry initWithIdentifier:schemaType:schemaVersion:settings:slot:desiredState:desiredStateDate:currentVersion:currentVersionDate:currentRegion:currentRegionDate:currentLocale:currentLocaleDate:availableVersion:availableVersionDate:availableRegion:availableRegionDate:availableLocale:availableLocaleDate:availableURL:availableURLDate:availableChecksum:availableChecksumDate:availableSize:availableSizeDate:availableState:availableStateDate:]([HKOntologyShardRegistryEntry alloc], "initWithIdentifier:schemaType:schemaVersion:settings:slot:desiredState:desiredStateDate:currentVersion:currentVersionDate:currentRegion:currentRegionDate:currentLocale:currentLocaleDate:availableVersion:availableVersionDate:availableRegion:availableRegionDate:availableLocale:availableLocaleDate:availableURL:availableURLDate:availableChecksum:availableChecksumDate:availableSize:availableSizeDate:availableState:availableStateDate:", result->_identifier, result->_schemaType, result->_schemaVersion, result->_settings, result->_slot, result->_desiredState, result->_desiredStateDate, result->_currentVersion, result->_currentVersionDate, result->_currentRegion, result->_currentRegionDate, result->_currentLocale, result->_currentLocaleDate, result->_availableVersion,
  }
             result->_availableVersionDate,
             result->_availableRegion,
             result->_availableRegionDate,
             result->_availableLocale,
             result->_availableLocaleDate,
             result->_availableURL,
             result->_availableURLDate,
             result->_availableChecksum,
             result->_availableChecksumDate,
             result->_availableSize,
             result->_availableSizeDate,
             result->_availableState,
             result->_availableStateDate);
  return result;
}

- (id)copyWithAvailableVersion:(int64_t)a3
{
  uint64_t v4 = -[HKOntologyShardRegistryEntry _copy](self);
  v4->_int64_t availableVersion = a3;
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  availableVersionDate = v4->_availableVersionDate;
  v4->_availableVersionDate = (NSDate *)v5;

  return v4;
}

- (id)copyWithAvailableVersion:(int64_t)a3 availableState:(int64_t)a4
{
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v8 = -[HKOntologyShardRegistryEntry _copy](self);
  v8->_int64_t availableVersion = a3;
  objc_storeStrong((id *)&v8->_availableVersionDate, v7);
  availableStateDate = v8->_availableStateDate;
  v8->_availableState = a4;
  v8->_availableStateDate = v7;

  return v8;
}

- (id)copyWithAvailableStateImported
{
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v4 = -[HKOntologyShardRegistryEntry _copy](self);
  v4->_int64_t currentVersion = v4->_availableVersion;
  objc_storeStrong((id *)&v4->_currentVersionDate, v3);
  objc_storeStrong((id *)&v4->_currentRegion, v4->_availableRegion);
  objc_storeStrong((id *)&v4->_currentRegionDate, v3);
  objc_storeStrong((id *)&v4->_currentLocale, v4->_availableLocale);
  objc_storeStrong((id *)&v4->_currentLocaleDate, v3);
  availableStateDate = v4->_availableStateDate;
  v4->_availableState = 3;
  v4->_availableStateDate = v3;

  return v4;
}

- (id)copyWithAvailableStateNotImportedForDate:(id)a3
{
  id v5 = a3;
  uint64_t v6 = -[HKOntologyShardRegistryEntry _copy](self);
  v6->_int64_t slot = -1;
  v6->_int64_t currentVersion = 0;
  objc_storeStrong((id *)&v6->_currentVersionDate, a3);
  objc_storeStrong((id *)&v6->_currentRegion, @"XX");
  objc_storeStrong((id *)&v6->_currentRegionDate, a3);
  currentLocale = v6->_currentLocale;
  v6->_currentLocale = 0;

  objc_storeStrong((id *)&v6->_currentLocaleDate, a3);
  if (self->_availableState == 3)
  {
    v6->_availableState = 1;
    objc_storeStrong((id *)&v6->_availableStateDate, a3);
  }

  return v6;
}

- (id)copyWithCurrentVersionUndeterminedForDate:(id)a3
{
  id v5 = (NSDate *)a3;
  uint64_t v6 = -[HKOntologyShardRegistryEntry _copy](self);
  v6->_int64_t currentVersion = -1;
  objc_storeStrong((id *)&v6->_currentVersionDate, a3);
  objc_storeStrong((id *)&v6->_currentRegion, @"XX");
  objc_storeStrong((id *)&v6->_currentRegionDate, a3);
  currentLocale = v6->_currentLocale;
  v6->_currentLocale = 0;

  currentLocaleDate = v6->_currentLocaleDate;
  v6->_currentLocaleDate = v5;

  return v6;
}

- (id)copyWithDesiredState:(int64_t)a3
{
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v6 = -[HKOntologyShardRegistryEntry _copy](self);
  desiredStateDate = v6->_desiredStateDate;
  v6->_desiredState = a3;
  v6->_desiredStateDate = (NSDate *)v5;

  return v6;
}

- (id)copyWithSlot:(int64_t)a3
{
  id result = -[HKOntologyShardRegistryEntry _copy](self);
  *((void *)result + 5) = a3;
  return result;
}

- (id)updatedCopyWithAvailableVersion:(int64_t)a3 availableRegion:(id)a4 availableLocale:(id)a5 availableURL:(id)a6 availableChecksum:(id)a7 availableSize:(int64_t)a8 date:(id)a9
{
  id v13 = (NSString *)a4;
  v51 = (NSString *)a5;
  id v50 = a6;
  v49 = (NSString *)a7;
  uint64_t v14 = v13;
  id v48 = a9;
  int64_t availableVersion = self->_availableVersion;
  availableRegion = self->_availableRegion;
  if (availableRegion == v13)
  {
    int v17 = 1;
  }
  else if (availableRegion)
  {
    int v17 = -[NSString isEqualToString:](v13, "isEqualToString:");
  }
  else
  {
    int v17 = 0;
  }
  availableLocale = self->_availableLocale;
  if (availableLocale == v51)
  {
    int v19 = 1;
  }
  else if (availableLocale)
  {
    int v19 = -[NSString isEqualToString:](v51, "isEqualToString:");
  }
  else
  {
    int v19 = 0;
  }
  uint64_t v20 = [v50 absoluteString];
  v21 = [(NSURL *)self->_availableURL absoluteString];
  if (v20 == v21)
  {
    int v29 = 1;
  }
  else
  {
    int64_t v45 = availableVersion;
    v22 = [(NSURL *)self->_availableURL absoluteString];
    if (v22)
    {
      uint64_t v23 = [v50 absoluteString];
      [(NSURL *)self->_availableURL absoluteString];
      int v24 = v19;
      int v25 = v17;
      v27 = v26 = v14;
      int v28 = [v23 isEqualToString:v27];

      uint64_t v14 = v26;
      int v17 = v25;
      int v19 = v24;
      int v29 = v28;
    }
    else
    {
      int v29 = 0;
    }

    int64_t availableVersion = v45;
  }

  availableChecksum = self->_availableChecksum;
  if (availableChecksum == v49)
  {
    int v31 = 1;
  }
  else if (availableChecksum)
  {
    int v31 = -[NSString isEqualToString:](v49, "isEqualToString:");
  }
  else
  {
    int v31 = 0;
  }
  int64_t availableSize = self->_availableSize;
  if (availableVersion == a3
    && ((v17 ^ 1) & 1) == 0
    && ((v19 ^ 1) & 1) == 0
    && ((v29 ^ 1) & 1) == 0
    && v31
    && availableSize == a8)
  {
    id v33 = self;
    goto LABEL_40;
  }
  id v33 = -[HKOntologyShardRegistryEntry _copy](self);
  id v34 = (void *)[v48 copy];
  id v35 = v34;
  if (availableVersion == a3)
  {
    if (v17) {
      goto LABEL_31;
    }
  }
  else
  {
    v33->_int64_t availableVersion = a3;
    objc_storeStrong((id *)&v33->_availableVersionDate, v34);
    if (v17)
    {
LABEL_31:
      if (v19) {
        goto LABEL_32;
      }
      goto LABEL_45;
    }
  }
  uint64_t v39 = [(NSString *)v14 copy];
  uint64_t v40 = v33->_availableRegion;
  v33->_availableRegion = (NSString *)v39;

  objc_storeStrong((id *)&v33->_availableRegionDate, v35);
  if (v19)
  {
LABEL_32:
    if (v29) {
      goto LABEL_33;
    }
LABEL_46:
    uint64_t v43 = [v50 copy];
    availableURL = v33->_availableURL;
    v33->_availableURL = (NSURL *)v43;

    objc_storeStrong((id *)&v33->_availableURLDate, v35);
    if (v31) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_45:
  uint64_t v41 = [(NSString *)v51 copy];
  uint64_t v42 = v33->_availableLocale;
  v33->_availableLocale = (NSString *)v41;

  objc_storeStrong((id *)&v33->_availableLocaleDate, v35);
  if ((v29 & 1) == 0) {
    goto LABEL_46;
  }
LABEL_33:
  if ((v31 & 1) == 0)
  {
LABEL_34:
    uint64_t v36 = [(NSString *)v49 copy];
    id v37 = v33->_availableChecksum;
    v33->_availableChecksum = (NSString *)v36;

    objc_storeStrong((id *)&v33->_availableChecksumDate, v35);
  }
LABEL_35:
  if (availableSize != a8)
  {
    v33->_int64_t availableSize = a8;
    objc_storeStrong((id *)&v33->_availableSizeDate, v35);
  }
  if (self->_availableState != 1)
  {
    v33->_availableState = 1;
    objc_storeStrong((id *)&v33->_availableStateDate, v35);
  }

LABEL_40:

  return v33;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  return [(NSString *)self->_schemaType hash] ^ v3 ^ self->_schemaVersion;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKOntologyShardRegistryEntry *)a3;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      identifier = self->_identifier;
      uint64_t v7 = v5->_identifier;
      BOOL v10 = (identifier == v7 || v7 && -[NSString isEqualToString:](identifier, "isEqualToString:"))
         && ((schemaType = self->_schemaType, uint64_t v9 = v5->_schemaType, schemaType == v9)
          || v9 && -[NSString isEqualToString:](schemaType, "isEqualToString:"))
         && self->_schemaVersion == v5->_schemaVersion;
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_schemaType forKey:@"schema"];
  [v5 encodeInteger:self->_schemaVersion forKey:@"schemaVersion"];
  [v5 encodeInteger:self->_settings forKey:@"settings"];
  [v5 encodeInteger:self->_slot forKey:@"slot"];
  [v5 encodeInteger:self->_desiredState forKey:@"desired_state"];
  [v5 encodeObject:self->_desiredStateDate forKey:@"desired_state_date"];
  [v5 encodeInteger:self->_currentVersion forKey:@"current_version"];
  [v5 encodeObject:self->_currentVersionDate forKey:@"current_version_date"];
  [v5 encodeObject:self->_currentRegion forKey:@"current_region"];
  [v5 encodeObject:self->_currentRegionDate forKey:@"current_region_date"];
  [v5 encodeObject:self->_currentLocale forKey:@"current_locale"];
  [v5 encodeObject:self->_currentLocaleDate forKey:@"current_locale_date"];
  [v5 encodeInteger:self->_availableVersion forKey:@"available_version"];
  [v5 encodeObject:self->_availableVersionDate forKey:@"available_version_date"];
  [v5 encodeObject:self->_availableRegion forKey:@"available_region"];
  [v5 encodeObject:self->_availableRegionDate forKey:@"available_region_date"];
  [v5 encodeObject:self->_availableLocale forKey:@"available_locale"];
  [v5 encodeObject:self->_availableLocaleDate forKey:@"available_locale_date"];
  [v5 encodeObject:self->_availableURL forKey:@"available_url"];
  [v5 encodeObject:self->_availableURLDate forKey:@"available_url_date"];
  [v5 encodeObject:self->_availableChecksum forKey:@"available_checksum"];
  [v5 encodeObject:self->_availableChecksumDate forKey:@"available_checksum_date"];
  [v5 encodeInteger:self->_availableSize forKey:@"available_size"];
  [v5 encodeObject:self->_availableSizeDate forKey:@"available_size_date"];
  [v5 encodeInteger:self->_availableState forKey:@"available_state"];
  [v5 encodeObject:self->_availableStateDate forKey:@"available_state_date"];
}

- (HKOntologyShardRegistryEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)HKOntologyShardRegistryEntry;
  id v5 = [(HKOntologyShardRegistryEntry *)&v45 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"schema"];
    schemaType = v5->_schemaType;
    v5->_schemaType = (NSString *)v8;

    v5->_int64_t schemaVersion = [v4 decodeIntegerForKey:@"schemaVersion"];
    v5->_settings = [v4 decodeIntegerForKey:@"settings"];
    v5->_int64_t slot = [v4 decodeIntegerForKey:@"slot"];
    v5->_desiredState = [v4 decodeIntegerForKey:@"desired_state"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"desired_state_date"];
    desiredStateDate = v5->_desiredStateDate;
    v5->_desiredStateDate = (NSDate *)v10;

    v5->_int64_t currentVersion = [v4 decodeIntegerForKey:@"current_version"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"current_version_date"];
    currentVersionDate = v5->_currentVersionDate;
    v5->_currentVersionDate = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"current_region"];
    currentRegion = v5->_currentRegion;
    v5->_currentRegion = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"current_region_date"];
    currentRegionDate = v5->_currentRegionDate;
    v5->_currentRegionDate = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"current_locale"];
    currentLocale = v5->_currentLocale;
    v5->_currentLocale = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"current_locale_date"];
    currentLocaleDate = v5->_currentLocaleDate;
    v5->_currentLocaleDate = (NSDate *)v20;

    v5->_int64_t availableVersion = [v4 decodeIntegerForKey:@"available_version"];
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"available_version_date"];
    availableVersionDate = v5->_availableVersionDate;
    v5->_availableVersionDate = (NSDate *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"available_region"];
    availableRegion = v5->_availableRegion;
    v5->_availableRegion = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"available_region_date"];
    availableRegionDate = v5->_availableRegionDate;
    v5->_availableRegionDate = (NSDate *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"available_locale"];
    availableLocale = v5->_availableLocale;
    v5->_availableLocale = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"available_locale_date"];
    availableLocaleDate = v5->_availableLocaleDate;
    v5->_availableLocaleDate = (NSDate *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"available_url"];
    availableURL = v5->_availableURL;
    v5->_availableURL = (NSURL *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"available_url_date"];
    availableURLDate = v5->_availableURLDate;
    v5->_availableURLDate = (NSDate *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"available_checksum"];
    availableChecksum = v5->_availableChecksum;
    v5->_availableChecksum = (NSString *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"available_checksum_date"];
    availableChecksumDate = v5->_availableChecksumDate;
    v5->_availableChecksumDate = (NSDate *)v38;

    v5->_int64_t availableSize = [v4 decodeIntegerForKey:@"available_size"];
    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"available_size_date"];
    availableSizeDate = v5->_availableSizeDate;
    v5->_availableSizeDate = (NSDate *)v40;

    v5->_availableState = [v4 decodeIntegerForKey:@"available_state"];
    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"available_state_date"];
    availableStateDate = v5->_availableStateDate;
    v5->_availableStateDate = (NSDate *)v42;
  }
  return v5;
}

- (BOOL)unitTesting_isIdentical:(id)a3
{
  id v7 = a3;
  if ([(HKOntologyShardRegistryEntry *)self isEqual:v7])
  {
    identifier = self->_identifier;
    uint64_t v9 = (NSString *)*((void *)v7 + 1);
    if (identifier == v9 || v9 && -[NSString isEqualToString:](identifier, "isEqualToString:"))
    {
      schemaType = self->_schemaType;
      id v11 = (NSString *)*((void *)v7 + 2);
      if ((schemaType == v11 || v11 && -[NSString isEqualToString:](schemaType, "isEqualToString:"))
        && self->_schemaVersion == *((void *)v7 + 3)
        && self->_settings == *((void *)v7 + 4)
        && self->_slot == *((void *)v7 + 5)
        && self->_desiredState == *((void *)v7 + 6))
      {
        desiredStateDate = self->_desiredStateDate;
        id v13 = (NSDate *)*((void *)v7 + 7);
        if ((desiredStateDate == v13 || v13 && -[NSDate isEqualToDate:](desiredStateDate, "isEqualToDate:"))
          && self->_currentVersion == *((void *)v7 + 8))
        {
          currentVersionDate = self->_currentVersionDate;
          uint64_t v15 = (NSDate *)*((void *)v7 + 9);
          if (currentVersionDate == v15 || v15 && -[NSDate isEqualToDate:](currentVersionDate, "isEqualToDate:"))
          {
            currentRegion = self->_currentRegion;
            int v17 = (NSString *)*((void *)v7 + 10);
            if (currentRegion == v17 || v17 && -[NSString isEqualToString:](currentRegion, "isEqualToString:"))
            {
              currentRegionDate = self->_currentRegionDate;
              int v19 = (NSDate *)*((void *)v7 + 11);
              if (currentRegionDate == v19 || v19 && -[NSDate isEqualToDate:](currentRegionDate, "isEqualToDate:"))
              {
                currentLocale = self->_currentLocale;
                v21 = (NSString *)*((void *)v7 + 12);
                if (currentLocale == v21 || v21 && -[NSString isEqualToString:](currentLocale, "isEqualToString:"))
                {
                  currentLocaleDate = self->_currentLocaleDate;
                  uint64_t v23 = (NSDate *)*((void *)v7 + 13);
                  if ((currentLocaleDate == v23 || v23 && -[NSDate isEqualToDate:](currentLocaleDate, "isEqualToDate:"))
                    && self->_availableVersion == *((void *)v7 + 14))
                  {
                    availableVersionDate = self->_availableVersionDate;
                    int v25 = (NSDate *)*((void *)v7 + 15);
                    if (availableVersionDate == v25
                      || v25 && -[NSDate isEqualToDate:](availableVersionDate, "isEqualToDate:"))
                    {
                      availableRegion = self->_availableRegion;
                      v27 = (NSString *)*((void *)v7 + 16);
                      if (availableRegion == v27
                        || v27 && -[NSString isEqualToString:](availableRegion, "isEqualToString:"))
                      {
                        availableRegionDate = self->_availableRegionDate;
                        int v29 = (NSDate *)*((void *)v7 + 17);
                        if (availableRegionDate == v29
                          || v29 && -[NSDate isEqualToDate:](availableRegionDate, "isEqualToDate:"))
                        {
                          availableLocale = self->_availableLocale;
                          int v31 = (NSString *)*((void *)v7 + 18);
                          if (availableLocale == v31
                            || v31 && -[NSString isEqualToString:](availableLocale, "isEqualToString:"))
                          {
                            availableLocaleDate = self->_availableLocaleDate;
                            id v33 = (NSDate *)*((void *)v7 + 19);
                            if (availableLocaleDate == v33
                              || v33 && -[NSDate isEqualToDate:](availableLocaleDate, "isEqualToDate:"))
                            {
                              uint64_t v34 = [(NSURL *)self->_availableURL absoluteString];
                              id v35 = [*((id *)v7 + 20) absoluteString];
                              if (v34 != v35)
                              {
                                uint64_t v36 = [*((id *)v7 + 20) absoluteString];
                                if (!v36)
                                {
                                  char v37 = 0;
                                  goto LABEL_74;
                                }
                                NSUInteger v3 = (void *)v36;
                                id v4 = [(NSURL *)self->_availableURL absoluteString];
                                id v5 = [*((id *)v7 + 20) absoluteString];
                                if (![v4 isEqual:v5])
                                {
                                  char v37 = 0;
                                  goto LABEL_72;
                                }
                              }
                              availableURLDate = self->_availableURLDate;
                              uint64_t v40 = (NSDate *)*((void *)v7 + 21);
                              if (availableURLDate == v40
                                || v40 && -[NSDate isEqualToDate:](availableURLDate, "isEqualToDate:"))
                              {
                                availableChecksum = self->_availableChecksum;
                                uint64_t v42 = (NSString *)*((void *)v7 + 22);
                                if (availableChecksum == v42
                                  || v42 && -[NSString isEqualToString:](availableChecksum, "isEqualToString:"))
                                {
                                  availableChecksumDate = self->_availableChecksumDate;
                                  uint64_t v44 = (NSDate *)*((void *)v7 + 23);
                                  if ((availableChecksumDate == v44
                                     || v44 && -[NSDate isEqualToDate:](availableChecksumDate, "isEqualToDate:"))
                                    && self->_availableSize == *((void *)v7 + 24))
                                  {
                                    availableSizeDate = self->_availableSizeDate;
                                    uint64_t v46 = (NSDate *)*((void *)v7 + 25);
                                    if ((availableSizeDate == v46
                                       || v46 && -[NSDate isEqualToDate:](availableSizeDate, "isEqualToDate:"))
                                      && self->_availableState == *((void *)v7 + 26))
                                    {
                                      availableStateDate = self->_availableStateDate;
                                      id v48 = (NSDate *)*((void *)v7 + 27);
                                      if (availableStateDate == v48)
                                      {
                                        char v37 = 1;
LABEL_71:
                                        if (v34 == v35)
                                        {
LABEL_74:

                                          goto LABEL_52;
                                        }
LABEL_72:

                                        goto LABEL_74;
                                      }
                                      if (v48)
                                      {
                                        char v37 = -[NSDate isEqualToDate:](availableStateDate, "isEqualToDate:");
                                        goto LABEL_71;
                                      }
                                    }
                                  }
                                }
                              }
                              char v37 = 0;
                              goto LABEL_71;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  char v37 = 0;
LABEL_52:

  return v37;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)schemaType
{
  return self->_schemaType;
}

- (int64_t)schemaVersion
{
  return self->_schemaVersion;
}

- (unint64_t)settings
{
  return self->_settings;
}

- (int64_t)slot
{
  return self->_slot;
}

- (int64_t)desiredState
{
  return self->_desiredState;
}

- (NSDate)desiredStateDate
{
  return self->_desiredStateDate;
}

- (int64_t)currentVersion
{
  return self->_currentVersion;
}

- (NSDate)currentVersionDate
{
  return self->_currentVersionDate;
}

- (NSString)currentRegion
{
  return self->_currentRegion;
}

- (NSDate)currentRegionDate
{
  return self->_currentRegionDate;
}

- (NSString)currentLocale
{
  return self->_currentLocale;
}

- (NSDate)currentLocaleDate
{
  return self->_currentLocaleDate;
}

- (int64_t)availableVersion
{
  return self->_availableVersion;
}

- (NSDate)availableVersionDate
{
  return self->_availableVersionDate;
}

- (NSString)availableRegion
{
  return self->_availableRegion;
}

- (NSDate)availableRegionDate
{
  return self->_availableRegionDate;
}

- (NSString)availableLocale
{
  return self->_availableLocale;
}

- (NSDate)availableLocaleDate
{
  return self->_availableLocaleDate;
}

- (NSURL)availableURL
{
  return self->_availableURL;
}

- (NSDate)availableURLDate
{
  return self->_availableURLDate;
}

- (NSString)availableChecksum
{
  return self->_availableChecksum;
}

- (NSDate)availableChecksumDate
{
  return self->_availableChecksumDate;
}

- (int64_t)availableSize
{
  return self->_availableSize;
}

- (NSDate)availableSizeDate
{
  return self->_availableSizeDate;
}

- (int64_t)availableState
{
  return self->_availableState;
}

- (NSDate)availableStateDate
{
  return self->_availableStateDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableStateDate, 0);
  objc_storeStrong((id *)&self->_availableSizeDate, 0);
  objc_storeStrong((id *)&self->_availableChecksumDate, 0);
  objc_storeStrong((id *)&self->_availableChecksum, 0);
  objc_storeStrong((id *)&self->_availableURLDate, 0);
  objc_storeStrong((id *)&self->_availableURL, 0);
  objc_storeStrong((id *)&self->_availableLocaleDate, 0);
  objc_storeStrong((id *)&self->_availableLocale, 0);
  objc_storeStrong((id *)&self->_availableRegionDate, 0);
  objc_storeStrong((id *)&self->_availableRegion, 0);
  objc_storeStrong((id *)&self->_availableVersionDate, 0);
  objc_storeStrong((id *)&self->_currentLocaleDate, 0);
  objc_storeStrong((id *)&self->_currentLocale, 0);
  objc_storeStrong((id *)&self->_currentRegionDate, 0);
  objc_storeStrong((id *)&self->_currentRegion, 0);
  objc_storeStrong((id *)&self->_currentVersionDate, 0);
  objc_storeStrong((id *)&self->_desiredStateDate, 0);
  objc_storeStrong((id *)&self->_schemaType, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end