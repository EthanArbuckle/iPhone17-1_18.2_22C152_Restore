@interface HRSSupportedFHIRConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)emetConfiguration;
+ (void)emetConfiguration;
- (BOOL)addSupportedFHIRRelease:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSupportedFHIRRelease:(id)a3;
- (BOOL)isSupportedFHIRResourceType:(id)a3 FHIRRelease:(id)a4;
- (BOOL)isSupportedFHIRResourceType:(id)a3 FHIRVersionString:(id)a4;
- (BOOL)isSupportedFHIRVersionString:(id)a3;
- (HRSSupportedFHIRConfiguration)init;
- (HRSSupportedFHIRConfiguration)initWithCoder:(id)a3;
- (NSMutableDictionary)releasesTable;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)supportedReleaseForFHIRRelease:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setReleasesTable:(id)a3;
@end

@implementation HRSSupportedFHIRConfiguration

- (HRSSupportedFHIRConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)HRSSupportedFHIRConfiguration;
  v2 = [(HRSSupportedFHIRConfiguration *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    releasesTable = v2->_releasesTable;
    v2->_releasesTable = v3;
  }
  return v2;
}

- (id)supportedReleaseForFHIRRelease:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_releasesTable objectForKeyedSubscript:a3];
}

- (BOOL)isSupportedFHIRVersionString:(id)a3
{
  id v9 = 0;
  v4 = [MEMORY[0x263F0A378] versionFromVersionString:a3 error:&v9];
  id v5 = v9;
  if (v4)
  {
    objc_super v6 = [v4 FHIRRelease];
    BOOL v7 = [(HRSSupportedFHIRConfiguration *)self isSupportedFHIRRelease:v6];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
      -[HRSSupportedFHIRConfiguration isSupportedFHIRVersionString:]();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isSupportedFHIRRelease:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_releasesTable objectForKeyedSubscript:v4];
  if (!v5)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEBUG)) {
      -[HRSSupportedFHIRConfiguration isSupportedFHIRRelease:]();
    }
  }

  return v5 != 0;
}

- (BOOL)isSupportedFHIRResourceType:(id)a3 FHIRVersionString:(id)a4
{
  id v6 = a3;
  id v12 = 0;
  BOOL v7 = [MEMORY[0x263F0A378] versionFromVersionString:a4 error:&v12];
  id v8 = v12;
  if (v7)
  {
    id v9 = [v7 FHIRRelease];
    BOOL v10 = [(HRSSupportedFHIRConfiguration *)self isSupportedFHIRResourceType:v6 FHIRRelease:v9];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
      -[HRSSupportedFHIRConfiguration isSupportedFHIRResourceType:FHIRVersionString:]();
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)isSupportedFHIRResourceType:(id)a3 FHIRRelease:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMutableDictionary *)self->_releasesTable objectForKeyedSubscript:v7];
  id v9 = v8;
  if (!v8)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEBUG)) {
      -[HRSSupportedFHIRConfiguration isSupportedFHIRRelease:]();
    }
    goto LABEL_8;
  }
  BOOL v10 = [v8 resourceTypes];
  char v11 = [v10 containsObject:v6];

  if ((v11 & 1) == 0)
  {
    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEBUG))
    {
      v15 = v13;
      int v17 = 138543874;
      id v18 = (id)objc_opt_class();
      __int16 v19 = 2114;
      id v20 = v7;
      __int16 v21 = 2114;
      id v22 = v6;
      id v16 = v18;
      _os_log_debug_impl(&dword_221D38000, v15, OS_LOG_TYPE_DEBUG, "%{public}@ FHIR release \"%{public}@\" is supported but resource type \"%{public}@\" is not", (uint8_t *)&v17, 0x20u);
    }
LABEL_8:
    BOOL v12 = 0;
    goto LABEL_9;
  }
  BOOL v12 = 1;
LABEL_9:

  return v12;
}

- (BOOL)addSupportedFHIRRelease:(id)a3 error:(id *)a4
{
  id v6 = a3;
  releasesTable = self->_releasesTable;
  id v8 = [v6 FHIRRelease];
  id v9 = [(NSMutableDictionary *)releasesTable objectForKeyedSubscript:v8];

  if (v9)
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 3, @"%@ already has FHIR release %@ configured, cannot add a second configuration", self, v6);
  }
  else
  {
    BOOL v10 = self->_releasesTable;
    char v11 = [v6 FHIRRelease];
    [(NSMutableDictionary *)v10 setObject:v6 forKeyedSubscript:v11];
  }
  return v9 == 0;
}

+ (id)emetConfiguration
{
  id v3 = objc_alloc_init((Class)a1);
  id v4 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"AllergyIntolerance", @"Condition", @"DiagnosticReport", @"Immunization", @"MedicationDispense", @"MedicationOrder", @"MedicationStatement", @"Observation", @"Patient", @"Procedure", 0);
  id v5 = [HRSSupportedFHIRRelease alloc];
  id v6 = [(HRSSupportedFHIRRelease *)v5 initWithFHIRRelease:*MEMORY[0x263F09550] resourceTypes:v4];
  id v11 = 0;
  char v7 = [v3 addSupportedFHIRRelease:v6 error:&v11];
  id v8 = v11;
  if ((v7 & 1) == 0)
  {
    _HKInitializeLogging();
    id v9 = *MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
      +[HRSSupportedFHIRConfiguration emetConfiguration];
    }
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HRSSupportedFHIRConfiguration *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      releasesTable = self->_releasesTable;
      id v6 = [(HRSSupportedFHIRConfiguration *)v4 releasesTable];
      char v7 = [(NSMutableDictionary *)releasesTable isEqualToDictionary:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSMutableDictionary *)self->_releasesTable hash];
}

- (id)description
{
  id v3 = [(NSMutableDictionary *)self->_releasesTable allValues];
  id v4 = objc_msgSend(v3, "hk_map:", &__block_literal_global_11);

  id v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  char v7 = NSStringFromClass(v6);
  id v8 = [v4 componentsJoinedByString:@", "];
  id v9 = [v5 stringWithFormat:@"<%@ %p supported releases: %@>", v7, self, v8];

  return v9;
}

uint64_t __44__HRSSupportedFHIRConfiguration_description__block_invoke(uint64_t a1, void *a2)
{
  return [a2 FHIRRelease];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = (void *)[(NSMutableDictionary *)self->_releasesTable copy];
  [v4 setReleasesTable:v5];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (HRSSupportedFHIRConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"ReleasesTable"];
  if (v9)
  {
    v15.receiver = self;
    v15.super_class = (Class)HRSSupportedFHIRConfiguration;
    BOOL v10 = [(HRSSupportedFHIRConfiguration *)&v15 init];
    if (v10)
    {
      uint64_t v11 = [v9 mutableCopy];
      releasesTable = v10->_releasesTable;
      v10->_releasesTable = (NSMutableDictionary *)v11;
    }
    self = v10;
    v13 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v13 = 0;
  }

  return v13;
}

- (NSMutableDictionary)releasesTable
{
  return self->_releasesTable;
}

- (void)setReleasesTable:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)isSupportedFHIRVersionString:.cold.1()
{
  OUTLINED_FUNCTION_2();
  id v3 = v2;
  id v4 = (id)OUTLINED_FUNCTION_3();
  id v5 = [v0 localizedDescription];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_221D38000, v6, v7, "%{public}@ isSupportedFHIRVersionString: %{public}@", v8, v9, v10, v11, v12);
}

- (void)isSupportedFHIRRelease:.cold.1()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_1_3(v3);
  OUTLINED_FUNCTION_4(&dword_221D38000, v5, v6, "%{public}@ FHIR release \"%{public}@\" is not supported", v7, v8, v9, v10, v11);
}

- (void)isSupportedFHIRResourceType:FHIRVersionString:.cold.1()
{
  OUTLINED_FUNCTION_2();
  id v3 = v2;
  id v4 = (id)OUTLINED_FUNCTION_3();
  uint64_t v5 = [v0 localizedDescription];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_221D38000, v6, v7, "%{public}@ isSupportedFHIRResourceType:FHIRVersionString: %{public}@", v8, v9, v10, v11, v12);
}

+ (void)emetConfiguration
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_221D38000, log, OS_LOG_TYPE_ERROR, "%{public}@ failed to add DSTU-2 release to Emet configuration: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end