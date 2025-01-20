@interface HDHealthMedicationsDaemonPlugin
- (NSString)pluginIdentifier;
- (NSString)schemaName;
- (NSString)syncSchemaIdentifier;
- (id)_databaseSchemaForProtectionClass:(id)a1;
- (id)createMedicationsDaemonExtensionForHealthDaemon:(id)a3;
- (id)createMedicationsProfileExtensionForProfile:(id)a3;
- (id)databaseEntitiesForProtectionClass:(int64_t)a3;
- (id)demoDataGeneratorClasses;
- (id)extensionForProfile:(id)a3;
- (id)notificationInstructionCriteriaClasses;
- (id)ontologyFeatureEvaluatorsForDaemon:(id)a3;
- (id)ontologySchemaImporterClasses;
- (id)orderedSyncEntities;
- (id)stateSyncEntityClasses;
- (id)taskServerClasses;
- (id)userDomainConceptEntityClasses;
- (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3;
- (void)registerMigrationStepsForProtectionClass:(int64_t)a3 migrator:(id)a4;
@end

@implementation HDHealthMedicationsDaemonPlugin

- (NSString)pluginIdentifier
{
  return (NSString *)@"com.apple.health.MedicationsDaemonPlugin";
}

- (id)extensionForProfile:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(HDHealthMedicationsDaemonPlugin *)self createMedicationsProfileExtensionForProfile:v4];
    [v5 start];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)createMedicationsDaemonExtensionForHealthDaemon:(id)a3
{
  id v3 = a3;
  id v4 = [[HDHealthMedicationsDaemonExtension alloc] initWithHealthDaemon:v3];

  return v4;
}

- (id)createMedicationsProfileExtensionForProfile:(id)a3
{
  id v3 = a3;
  id v4 = [[HDHealthMedicationsProfileExtension alloc] initWithProfile:v3];

  return v4;
}

- (id)taskServerClasses
{
  v4[7] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:7];
  return v2;
}

- (NSString)schemaName
{
  return (NSString *)(id)*MEMORY[0x1E4F66938];
}

- (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3
{
  id v3 = -[HDHealthMedicationsDaemonPlugin _databaseSchemaForProtectionClass:](self, a3);
  int64_t v4 = [v3 currentSchemaVersion];

  return v4;
}

- (id)_databaseSchemaForProtectionClass:(id)a1
{
  if (a1)
  {
    if (a2 == 1)
    {
      id v3 = off_1E63367F8;
    }
    else
    {
      if (a2 != 2) {
        goto LABEL_7;
      }
      id v3 = off_1E63367F0;
    }
    a1 = objc_alloc_init(*v3);
  }
LABEL_7:
  return a1;
}

- (id)databaseEntitiesForProtectionClass:(int64_t)a3
{
  id v3 = -[HDHealthMedicationsDaemonPlugin _databaseSchemaForProtectionClass:](self, a3);
  int64_t v4 = [v3 databaseEntities];

  return v4;
}

- (void)registerMigrationStepsForProtectionClass:(int64_t)a3 migrator:(id)a4
{
  id v6 = a4;
  -[HDHealthMedicationsDaemonPlugin _databaseSchemaForProtectionClass:](self, a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = [(HDHealthMedicationsDaemonPlugin *)self schemaName];
  [v8 registerMigrationStepsWithMigrator:v6 schemaName:v7];
}

- (id)notificationInstructionCriteriaClasses
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)userDomainConceptEntityClasses
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F2B690] medicationUserDomainConceptTypeIdentifier];
  v5 = v2;
  v6[0] = objc_opt_class();
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (NSString)syncSchemaIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E4F66940];
}

- (id)orderedSyncEntities
{
  void v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

- (id)ontologySchemaImporterClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F2A2F0];
  v5[0] = objc_opt_class();
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (id)ontologyFeatureEvaluatorsForDaemon:(id)a3
{
  id v3 = [a3 healthMedicationsDaemonExtension];
  uint64_t v4 = [v3 ontologyFeatureEvaluators];

  return v4;
}

- (id)demoDataGeneratorClasses
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)stateSyncEntityClasses
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

@end