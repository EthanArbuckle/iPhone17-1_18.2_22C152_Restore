@interface HDUnitPreferencesSyncEntity
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3;
+ (int)nanoSyncObjectType;
+ (int64_t)category;
+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3;
+ (void)didReceiveValuesForKeys:(id)a3 profile:(id)a4;
@end

@implementation HDUnitPreferencesSyncEntity

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (int64_t)category
{
  return 104;
}

+ (int)nanoSyncObjectType
{
  return 9;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 3;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:10];
}

+ (void)didReceiveValuesForKeys:(id)a3 profile:(id)a4
{
  objc_msgSend(a4, "unitPreferencesManager", a3);
  v5 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    os_unfair_lock_lock(v5 + 8);
    v4 = *(void **)&v5[4]._os_unfair_lock_opaque;
    *(void *)&v5[4]._os_unfair_lock_opaque = 0;

    -[HDUnitPreferencesManager _lock_notifyObserversWithUnitPreferences]((uint64_t)v5);
    os_unfair_lock_unlock(v5 + 8);
  }
}

@end