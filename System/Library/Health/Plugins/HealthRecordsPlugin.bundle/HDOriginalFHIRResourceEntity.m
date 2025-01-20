@interface HDOriginalFHIRResourceEntity
+ (BOOL)_ensureForeignKeysAreDeferredInDatabase:(id)a3 error:(id *)a4;
+ (BOOL)_insertCodableFHIRResources:(id)a3 syncProvenance:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)_recordResourceLastSeen:(id)a3 resourcePersistentID:(id)a4 database:(id)a5 error:(id *)a6;
+ (BOOL)_validateCodableFHIRResource:(id)a3 error:(id *)a4;
+ (BOOL)_validateCodableFHIRResourceFromSync:(id)a3 error:(id *)a4;
+ (BOOL)enumerateFHIRResourceObjectsWithLocalProvenanceForAccountEntity:(id)a3 startAnchor:(int64_t)a4 endAnchor:(int64_t)a5 database:(id)a6 error:(id *)a7 enumerationHandler:(id)a8;
+ (BOOL)insertNewResourceObjects:(id)a3 account:(id)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)insertOrUpdateResourceObjects:(id)a3 upsertedResourceObjectPairs:(id *)a4 account:(id)a5 syncProvenance:(int64_t)a6 syncIdentity:(int64_t)a7 profile:(id)a8 error:(id *)a9 inaccessibilityHandler:(id)a10;
+ (id)_insertResourceObjectWithIdentifier:(id)a3 accountID:(int64_t)a4 syncProvenance:(int64_t)a5 syncIdentity:(int64_t)a6 rawContent:(id)a7 uniquenessChecksum:(id)a8 sourceURL:(id)a9 FHIRVersion:(id)a10 receivedDate:(id)a11 receivedDateTimeZoneName:(id)a12 firstSeenDate:(id)a13 firstSeenDateOut:(id *)a14 firstSeenDateTimeZoneName:(id)a15 extractionHints:(int64_t)a16 originVersion:(id *)a17 originBuild:(id)a18 database:(id)a19 error:(id *)a20;
+ (id)_predicateForLegacyResourceTypes;
+ (id)_predicateForPatientResourcesForAccountWithIdentifier:(id)a3;
+ (id)_predicateForResourceLastSeenAfter:(id)a3;
+ (id)_predicateForResourceWithIdentifier:(id)a3;
+ (id)_predicateForResourceWithSourceURL:(id)a3;
+ (id)_propertiesForEntity;
+ (id)_propertiesForResourceData;
+ (id)_rawInsertResourceObjectWithIdentifier:(id)a3 accountID:(int64_t)a4 syncProvenance:(int64_t)a5 syncIdentity:(int64_t)a6 rawContent:(id)a7 uniquenessChecksum:(id)a8 sourceURL:(id)a9 FHIRVersion:(id)a10 receivedDate:(id)a11 receivedDateTimeZoneName:(id)a12 firstSeenDate:(id)a13 firstSeenDateTimeZoneName:(id)a14 extractionHints:(int64_t)a15 originVersion:(id *)a16 originBuild:(id)a17 database:(id)a18 error:(id *)a19;
+ (id)_resourceDataWithROWID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
+ (id)_resourceDocumentWithResourceObjects:(id)a3;
+ (id)_resourceObjectWithRow:(HDSQLiteRow *)a3 rowID:(int64_t)a4 assignCountry:(id)a5 error:(id *)a6;
+ (id)_resourceObjectsInDatabase:(id)a3 withPredicate:(id)a4 limitCount:(int64_t)a5 highestPersistentID:(int64_t *)a6 assignCountry:(id)a7 error:(id *)a8;
+ (id)_resourceObjectsWithIdentifiers:(id)a3 accountIdentifier:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)_wrapRawInsertResourceObjectWithIdentifier:(id)a3 accountID:(int64_t)a4 syncProvenance:(int64_t)a5 syncIdentity:(int64_t)a6 rawContent:(id)a7 uniquenessChecksum:(id)a8 sourceURL:(id)a9 FHIRVersion:(id)a10 receivedDate:(id)a11 receivedDateTimeZoneName:(id)a12 firstSeenDate:(id)a13 firstSeenDateTimeZoneName:(id)a14 extractionHints:(int64_t)a15 originVersion:(id *)a16 originBuild:(id)a17 database:(id)a18 existingRowID:(id)a19 error:(id *)a20;
+ (id)addExtractionHints:(unint64_t)a3 toResourceEntities:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)fullResourceDocumentForAccountIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)predicateForResourcesForLegacySync;
+ (id)resourceDataForOriginalFHIRResourceWithSourceURL:(id)a3 lastSeenAfter:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)resourceDataForPatientResourceForAccountWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)resourceDocumentWithIdentifiers:(id)a3 accountIdentifier:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)resourceExtractionBatchForAccountIdentifier:(id)a3 extractionRulesVersion:(id)a4 batchSize:(int64_t)a5 profile:(id)a6 error:(id *)a7;
+ (id)resourceObjectWithIdentifier:(id)a3 accountIdentifier:(id)a4 profile:(id)a5 error:(id *)a6;
- (id)_codableWithRow:(HDSQLiteRow *)a3 gatewayExternalID:(id)a4 accountUUID:(id)a5 error:(id *)a6;
- (id)entityByAddingExtractionHints:(unint64_t)a3 database:(id)a4 error:(id *)a5;
@end

@implementation HDOriginalFHIRResourceEntity

+ (id)_propertiesForEntity
{
  if (qword_1371C0 != -1) {
    dispatch_once(&qword_1371C0, &stru_114B28);
  }
  v2 = (void *)qword_1371B8;

  return v2;
}

+ (id)_propertiesForResourceData
{
  if (qword_1371D0 != -1) {
    dispatch_once(&qword_1371D0, &stru_114B48);
  }
  v2 = (void *)qword_1371C8;

  return v2;
}

+ (id)resourceObjectWithIdentifier:(id)a3 accountIdentifier:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v17 = v10;
  id v11 = a5;
  id v12 = a4;
  v13 = +[NSArray arrayWithObjects:&v17 count:1];
  v14 = objc_msgSend(a1, "_resourceObjectsWithIdentifiers:accountIdentifier:profile:error:", v13, v12, v11, a6, v17);

  if (v14)
  {
    if (![v14 count]) {
      +[NSError hk_assignError:a6 code:118 description:@"FHIR resource not found"];
    }
    v15 = [v14 lastObject];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)resourceExtractionBatchForAccountIdentifier:(id)a3 extractionRulesVersion:(id)a4 batchSize:(int64_t)a5 profile:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v15 = [v14 database];
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  uint64_t v43 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 0;
  v16 = +[NSMutableArray array];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_9C664;
  v27[3] = &unk_114BB0;
  id v34 = a1;
  id v17 = v12;
  id v28 = v17;
  id v18 = v13;
  id v29 = v18;
  v31 = &v44;
  v32 = &v36;
  int64_t v35 = a5;
  v33 = &v40;
  id v19 = v16;
  id v30 = v19;
  v20 = v14;
  if ([a1 performReadTransactionWithHealthDatabase:v15 error:a7 block:v27]
    && (!*((unsigned char *)v45 + 24)
     || +[HDClinicalAccountEntity resetAccountRowIDsForRulesVersion:v18 identifier:v17 profile:v14 healthDatabase:v15 error:a7]))
  {
    v21 = [a1 _resourceDocumentWithResourceObjects:v19];
    v22 = [HDFHIRResourceExtractionBatch alloc];
    if (v41[3] <= v37[3]) {
      uint64_t v23 = v37[3];
    }
    else {
      uint64_t v23 = v41[3];
    }
    v24 = +[NSNumber numberWithLongLong:v23];
    v25 = [(HDFHIRResourceExtractionBatch *)v22 initWithDocument:v21 rulesVersion:v18 highestRowID:v24];
  }
  else
  {
    v25 = 0;
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

  return v25;
}

+ (id)_resourceObjectsWithIdentifiers:(id)a3 accountIdentifier:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [a5 database];
  +[NSMutableArray array];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_9CA60;
  v19[3] = &unk_112FD0;
  id v20 = v11;
  id v21 = v10;
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  id v23 = a1;
  id v13 = v22;
  id v14 = v10;
  id v15 = v11;
  if ([a1 performReadTransactionWithHealthDatabase:v12 error:a6 block:v19]) {
    v16 = v13;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  return v17;
}

+ (id)_resourceObjectsInDatabase:(id)a3 withPredicate:(id)a4 limitCount:(int64_t)a5 highestPersistentID:(int64_t *)a6 assignCountry:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = [a1 queryWithDatabase:v14 predicate:v15];
  id v18 = v17;
  if (kHDSQLiteQueryNoLimit != a5)
  {
    id v19 = [v17 queryDescriptor];
    [v19 setLimitCount:a5];
  }
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  id v20 = +[NSMutableArray array];
  v37[0] = HDOriginalFHIRResourceEntityPropertyRawContent;
  v37[1] = HDOriginalFHIRResourceEntityPropertyUniquenessChecksum;
  v37[2] = HDOriginalFHIRResourceEntityPropertyReceivedDate;
  v37[3] = HDOriginalFHIRResourceEntityPropertyFirstSeenDate;
  v37[4] = HDOriginalFHIRResourceEntityPropertyFHIRVersion;
  v37[5] = HDOriginalFHIRResourceEntityPropertySourceURL;
  v37[6] = HDOriginalFHIRResourceEntityPropertyExtractionHints;
  v37[7] = HDOriginalFHIRResourceEntityPropertyOriginMajorVersion;
  v37[8] = HDOriginalFHIRResourceEntityPropertyOriginMinorVersion;
  v37[9] = HDOriginalFHIRResourceEntityPropertyOriginPatchVersion;
  v37[10] = HDOriginalFHIRResourceEntityPropertyOriginBuild;
  v37[11] = HDOriginalFHIRResourceEntityPropertySyncProvenance;
  id v21 = +[NSArray arrayWithObjects:v37 count:12];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_9D058;
  v28[3] = &unk_114BD8;
  v31 = &v33;
  id v32 = a1;
  id v22 = v16;
  id v29 = v22;
  id v23 = v20;
  id v30 = v23;
  unsigned int v24 = [v18 enumeratePersistentIDsAndProperties:v21 error:a8 enumerationHandler:v28];
  if (a6) {
    *a6 = v34[3];
  }
  if (v24) {
    v25 = v23;
  }
  else {
    v25 = 0;
  }
  id v26 = v25;

  _Block_object_dispose(&v33, 8);

  return v26;
}

+ (id)_resourceObjectWithRow:(HDSQLiteRow *)a3 rowID:(int64_t)a4 assignCountry:(id)a5 error:(id *)a6
{
  id v25 = a5;
  unsigned int v24 = HDSQLiteColumnWithNameAsData();
  id v23 = HDSQLiteColumnWithNameAsData();
  id v22 = HDSQLiteColumnWithNameAsDate();
  id v21 = HDSQLiteColumnWithNameAsDate();
  id v19 = HDSQLiteColumnWithNameAsString();
  v8 = HDSQLiteColumnWithNameAsURL();
  uint64_t v20 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v9 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v10 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v11 = HDSQLiteColumnWithNameAsInt64();
  id v12 = HDSQLiteColumnWithNameAsString();
  uint64_t v13 = HDSQLiteColumnWithNameAsInt64();
  id v14 = +[HKFHIRVersion versionFromVersionString:v19];
  id v15 = +[NSNumber numberWithLongLong:a4];
  v26[0] = v9;
  v26[1] = v10;
  v26[2] = v11;
  LOBYTE(v18) = v13 == 0;
  id v16 = +[HDOriginalFHIRResourceObject resourceObjectWithData:v24 uniquenessChecksum:v23 sourceURL:v8 FHIRVersion:v14 receivedDate:v22 firstSeenDate:v21 extractionHints:v20 originVersion:v26 originBuild:v12 country:v25 existingROWID:v15 ingestedOnLocalDevice:v18 error:a6];

  return v16;
}

+ (BOOL)enumerateFHIRResourceObjectsWithLocalProvenanceForAccountEntity:(id)a3 startAnchor:(int64_t)a4 endAnchor:(int64_t)a5 database:(id)a6 error:(id *)a7 enumerationHandler:(id)a8
{
  id v14 = a3;
  id v15 = a8;
  id v16 = a6;
  [v14 accountInDatabase:v16 error:a7];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_9D778;
  v25[3] = &unk_114C20;
  id v26 = v14;
  int64_t v27 = a4;
  int64_t v28 = a5;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_9D7F0;
  v21[3] = &unk_114C48;
  id v23 = v15;
  id v24 = a1;
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v15;
  id v18 = v22;
  id v19 = v14;
  LOBYTE(a7) = [v16 executeCachedStatementForKey:&unk_F2978 error:a7 SQLGenerator:&stru_114BF8 bindingHandler:v25 enumerationHandler:v21];

  return (char)a7;
}

+ (id)resourceDataForOriginalFHIRResourceWithSourceURL:(id)a3 lastSeenAfter:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [a1 _predicateForResourceWithSourceURL:v10];
  if (v11)
  {
    id v14 = [a1 _predicateForResourceLastSeenAfter:v11];
    v37[0] = v13;
    v37[1] = v14;
    id v15 = +[NSArray arrayWithObjects:v37 count:2];
    uint64_t v16 = +[HDSQLiteCompoundPredicate predicateMatchingAllPredicates:v15];

    uint64_t v13 = (void *)v16;
  }
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = sub_9DCE8;
  uint64_t v35 = sub_9DCF8;
  id v36 = 0;
  id v17 = [v12 database];
  id v29 = a1;
  id v30 = 0;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_9DD00;
  void v26[3] = &unk_1139F0;
  id v18 = v13;
  id v27 = v18;
  int64_t v28 = &v31;
  unsigned __int8 v19 = [a1 performReadTransactionWithHealthDatabase:v17 error:&v30 block:v26];
  id v20 = v30;

  if (v19)
  {
    id v21 = (void *)v32[5];
    if (!v21)
    {
      +[NSError hk_assignError:a6 code:118 format:@"there is no resource with the given source URL"];
      id v21 = (void *)v32[5];
    }
    id v22 = v21;
  }
  else
  {
    id v23 = v20;
    id v24 = v23;
    if (v23)
    {
      if (a6) {
        *a6 = v23;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v22 = 0;
  }

  _Block_object_dispose(&v31, 8);

  return v22;
}

+ (id)resourceDataForPatientResourceForAccountWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [a1 _predicateForPatientResourcesForAccountWithIdentifier:v8];
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  int64_t v28 = sub_9DCE8;
  id v29 = sub_9DCF8;
  id v30 = 0;
  id v11 = [v9 database];
  id v23 = a1;
  id v24 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_9E04C;
  v20[3] = &unk_1139F0;
  id v12 = v10;
  id v21 = v12;
  id v22 = &v25;
  unsigned __int8 v13 = [a1 performReadTransactionWithHealthDatabase:v11 error:&v24 block:v20];
  id v14 = v24;

  if (v13)
  {
    id v15 = (void *)v26[5];
    if (!v15)
    {
      +[NSError hk_assignError:a5, 118, @"there is no Patient resource for account %@", v8 code format];
      id v15 = (void *)v26[5];
    }
    id v16 = v15;
  }
  else
  {
    id v17 = v14;
    id v18 = v17;
    if (v17)
    {
      if (a5) {
        *a5 = v17;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v16 = 0;
  }

  _Block_object_dispose(&v25, 8);

  return v16;
}

+ (id)_resourceDataWithROWID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  id v8 = HDSQLiteColumnWithNameAsData();
  if (!v8)
  {
    id v9 = NSStringFromClass((Class)a1);
    +[NSError hk_assignError:a5, 100, @"%@ nil FHIR resource data for ROWID %lld, cannot return FHIRResourceData", v9, a3 code format];
    id v12 = 0;
    goto LABEL_9;
  }
  id v9 = HDSQLiteColumnWithNameAsString();
  if (!v9)
  {
    id v10 = NSStringFromClass((Class)a1);
    +[NSError hk_assignError:a5, 100, @"%@ nil FHIR version string for ROWID %lld, cannot return FHIRResourceData", v10, a3 code format];
    goto LABEL_7;
  }
  id v10 = +[HKFHIRVersion versionFromVersionString:v9 error:a5];
  if (!v10)
  {
LABEL_7:
    id v12 = 0;
    goto LABEL_8;
  }
  id v11 = HDSQLiteColumnWithNameAsURL();
  id v12 = [objc_alloc((Class)HDFHIRResourceData) initWithData:v8 sourceURL:v11 FHIRVersion:v10];

LABEL_8:
LABEL_9:

  return v12;
}

+ (id)_predicateForResourceWithIdentifier:(id)a3
{
  uint64_t v3 = HDOriginalFHIRResourceEntityPropertyType;
  id v4 = a3;
  v5 = [v4 resourceType];
  v6 = +[HDSQLiteComparisonPredicate predicateWithProperty:v3 equalToValue:v5];

  uint64_t v7 = HDOriginalFHIRResourceEntityPropertyResourceID;
  id v8 = [v4 identifier];

  id v9 = +[HDSQLiteComparisonPredicate predicateWithProperty:v7 equalToValue:v8];

  id v10 = +[HDSQLitePredicate compoundPredicateWithPredicate:v6 otherPredicate:v9];

  return v10;
}

+ (id)_predicateForResourceWithSourceURL:(id)a3
{
  uint64_t v3 = HDOriginalFHIRResourceEntityPropertySourceURL;
  id v4 = [a3 absoluteString];
  v5 = +[HDSQLiteComparisonPredicate predicateWithProperty:v3 equalToValue:v4];

  return v5;
}

+ (id)_predicateForPatientResourcesForAccountWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[HDOriginalFHIRResourceEntity disambiguatedDatabaseTable];
  v5 = +[HDSQLiteJoinClause innerJoinClauseFromTable:v4 toTargetEntity:objc_opt_class() as:0 localReference:HDOriginalFHIRResourceEntityPropertyAccountID targetKey:HDSQLEntityPropertyPersistentID];

  v6 = +[NSSet setWithObject:v5];
  uint64_t v7 = +[HDSQLiteJoinPredicate predicateWithJoinClauses:v6];

  id v8 = +[HDClinicalAccountEntity _predicateForAccountWithIdentifier:v3];
  id v9 = [v8 SQLForEntityClass:objc_opt_class()];
  id v17 = v3;
  id v10 = +[NSArray arrayWithObjects:&v17 count:1];
  id v11 = +[HDSQLiteRawPredicate predicateWithSQL:v9 overProperties:&__NSArray0__struct values:v10];

  id v12 = +[HDSQLiteComparisonPredicate predicateWithProperty:HDOriginalFHIRResourceEntityPropertyType equalToValue:@"Patient"];
  v16[0] = v7;
  v16[1] = v11;
  v16[2] = v12;
  unsigned __int8 v13 = +[NSArray arrayWithObjects:v16 count:3];
  id v14 = +[HDSQLiteCompoundPredicate predicateMatchingAllPredicates:v13];

  return v14;
}

+ (id)_predicateForResourceLastSeenAfter:(id)a3
{
  id v3 = a3;
  id v4 = +[HDOriginalFHIRResourceEntity disambiguatedDatabaseTable];
  v5 = +[HDSQLiteJoinClause leftJoinClauseFromTable:v4 toTargetEntity:objc_opt_class() as:0 localReference:HDSQLEntityPropertyPersistentID targetKey:HDOriginalFHIRResourceLastSeenEntityResourceID];

  v6 = +[NSSet setWithObject:v5];
  uint64_t v7 = +[HDSQLiteJoinPredicate predicateWithJoinClauses:v6];

  id v8 = +[HDSQLiteComparisonPredicate predicateWithProperty:HDOriginalFHIRResourceLastSeenEntityLastSeenDate greaterThanValue:v3];
  id v9 = [v8 SQLForEntityClass:objc_opt_class()];
  id v16 = v3;
  id v10 = +[NSArray arrayWithObjects:&v16 count:1];
  id v11 = +[HDSQLiteRawPredicate predicateWithSQL:v9 overProperties:&__NSArray0__struct values:v10];

  v15[0] = v7;
  v15[1] = v11;
  id v12 = +[NSArray arrayWithObjects:v15 count:2];
  unsigned __int8 v13 = +[HDSQLiteCompoundPredicate predicateMatchingAllPredicates:v12];

  return v13;
}

+ (id)_predicateForLegacyResourceTypes
{
  v2 = +[HRSSupportedFHIRConfiguration emetConfiguration];
  id v3 = [v2 supportedReleaseForFHIRRelease:HKFHIRReleaseDSTU2];
  uint64_t v4 = HDOriginalFHIRResourceEntityPropertyType;
  v5 = [v3 resourceTypes];
  v6 = +[HDSQLiteContainsPredicate containsPredicateWithProperty:v4 values:v5];

  return v6;
}

+ (id)predicateForResourcesForLegacySync
{
  v2 = +[HDOriginalFHIRResourceEntity disambiguatedDatabaseTable];
  id v3 = +[HDSQLiteJoinClause innerJoinClauseFromTable:v2 toTargetEntity:objc_opt_class() as:0 localReference:HDOriginalFHIRResourceEntityPropertyAccountID targetKey:HDSQLEntityPropertyPersistentID];

  uint64_t v4 = +[NSSet setWithObject:v3];
  v5 = +[HDSQLiteJoinPredicate predicateWithJoinClauses:v4];

  v6 = +[HDClinicalAccountEntity predicateForAccountsForLegacySync];
  uint64_t v7 = +[HDOriginalFHIRResourceEntity _predicateForLegacyResourceTypes];
  v11[0] = v5;
  v11[1] = v6;
  v11[2] = v7;
  id v8 = +[NSArray arrayWithObjects:v11 count:3];
  id v9 = +[HDSQLiteCompoundPredicate predicateMatchingAllPredicates:v8];

  return v9;
}

+ (id)fullResourceDocumentForAccountIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  v6 = [a1 _resourceObjectsWithIdentifiers:0 accountIdentifier:a3 profile:a4 error:a5];
  if (v6)
  {
    uint64_t v7 = [a1 _resourceDocumentWithResourceObjects:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)resourceDocumentWithIdentifiers:(id)a3 accountIdentifier:(id)a4 profile:(id)a5 error:(id *)a6
{
  uint64_t v7 = [a1 _resourceObjectsWithIdentifiers:a3 accountIdentifier:a4 profile:a5 error:a6];
  if (v7)
  {
    id v8 = [a1 _resourceDocumentWithResourceObjects:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)_resourceDocumentWithResourceObjects:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"HDOriginalFHIRResourceEntity+HealthRecordsPlugin.m", 607, @"Invalid parameter not satisfying: %@", @"resourceObjects" object file lineNumber description];
  }
  v6 = objc_alloc_init(HDFHIRResourceDocument);
  [(HDFHIRResourceDocument *)v6 addResourceObjects:v5];

  return v6;
}

+ (BOOL)_insertCodableFHIRResources:(id)a3 syncProvenance:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a5;
  _HKInitializeLogging();
  unsigned __int8 v13 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v13;
    id v15 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    id v31 = a1;
    __int16 v32 = 2114;
    uint64_t v33 = v15;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ begin insert for CodableFHIRResources", buf, 0x16u);
  }
  if ([v11 count])
  {
    id v16 = [v12 database];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_9EED4;
    v24[3] = &unk_114C98;
    id v27 = a1;
    id v25 = v11;
    id v26 = v12;
    int64_t v28 = a4;
    SEL v29 = a2;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_9FC50;
    v20[3] = &unk_112900;
    id v21 = v25;
    int64_t v23 = a4;
    id v22 = v26;
    unsigned __int8 v17 = [a1 performWriteTransactionWithHealthDatabase:v16 error:a6 block:v24 inaccessibilityHandler:v20];
  }
  else
  {
    _HKInitializeLogging();
    id v18 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
      sub_B4E7C((uint64_t)a1, v18, a2);
    }
    unsigned __int8 v17 = 1;
  }

  return v17;
}

+ (BOOL)insertNewResourceObjects:(id)a3 account:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  unsigned __int8 v13 = [v12 gateway];
  id v14 = [v13 externalID];

  id v15 = [v12 identifier];
  id v16 = [v15 UUIDString];

  id v17 = [v11 currentSyncIdentityPersistentID];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_9FE44;
  v23[3] = &unk_113790;
  id v24 = v11;
  id v25 = v10;
  id v26 = v14;
  id v27 = v16;
  id v18 = v16;
  id v19 = v14;
  id v20 = v10;
  id v21 = v11;
  LOBYTE(a6) = [a1 insertOrUpdateResourceObjects:v20 upsertedResourceObjectPairs:0 account:v12 syncProvenance:0 syncIdentity:v17 profile:v21 error:a6 inaccessibilityHandler:v23];

  return (char)a6;
}

+ (BOOL)insertOrUpdateResourceObjects:(id)a3 upsertedResourceObjectPairs:(id *)a4 account:(id)a5 syncProvenance:(int64_t)a6 syncIdentity:(int64_t)a7 profile:(id)a8 error:(id *)a9 inaccessibilityHandler:(id)a10
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a8;
  id v19 = v16;
  id v20 = a10;
  if ([v16 count])
  {
    int64_t v48 = a7;
    int64_t v49 = a6;
    id v51 = v20;
    id v21 = [v17 gateway];
    char v47 = [v21 externalID];

    id v50 = v17;
    id v22 = [v17 gateway];
    uint64_t v46 = [v22 country];

    int64_t v23 = [v18 daemon];
    id v24 = [v23 behavior];
    v45 = [v24 localTimeZone];

    id v25 = objc_alloc((Class)HDHRSOriginInformation);
    id v26 = [v18 daemon];
    id v27 = [v26 behavior];
    int64_t v28 = v27;
    id v29 = a1;
    id v30 = v19;
    if (v27) {
      [v27 currentOSVersionStruct];
    }
    else {
      memset(v62, 0, 24);
    }
    __int16 v32 = [v18 daemon];
    uint64_t v33 = [v32 behavior];
    id v34 = [v33 currentOSBuild];
    id v35 = [v25 initWithOperatingSystemVersion:v62 build:v34];

    if (a4) {
      id v36 = objc_alloc_init((Class)NSMutableArray);
    }
    else {
      id v36 = 0;
    }
    id v19 = v30;
    v37 = v29;
    uint64_t v38 = [v18 database];
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_A0368;
    v52[3] = &unk_114CE8;
    id v59 = v29;
    id v53 = v47;
    id v54 = v30;
    id v55 = v45;
    int64_t v60 = v49;
    int64_t v61 = v48;
    id v56 = v35;
    id v39 = v36;
    id v57 = v39;
    id v58 = v46;
    id v40 = v46;
    id v41 = v35;
    id v42 = v45;
    id v43 = v47;
    unsigned int v31 = [v37 performWriteTransactionWithHealthDatabase:v38 error:a9 block:v52 inaccessibilityHandler:v51];

    if (a4 && v31) {
      *a4 = v39;
    }

    id v17 = v50;
    id v20 = v51;
  }
  else
  {
    if (a4) {
      *a4 = &__NSArray0__struct;
    }
    LOBYTE(v31) = 1;
  }

  return v31;
}

+ (id)_insertResourceObjectWithIdentifier:(id)a3 accountID:(int64_t)a4 syncProvenance:(int64_t)a5 syncIdentity:(int64_t)a6 rawContent:(id)a7 uniquenessChecksum:(id)a8 sourceURL:(id)a9 FHIRVersion:(id)a10 receivedDate:(id)a11 receivedDateTimeZoneName:(id)a12 firstSeenDate:(id)a13 firstSeenDateOut:(id *)a14 firstSeenDateTimeZoneName:(id)a15 extractionHints:(int64_t)a16 originVersion:(id *)a17 originBuild:(id)a18 database:(id)a19 error:(id *)a20
{
  id v22 = a3;
  id v75 = a7;
  id v73 = a8;
  id v76 = a9;
  id v81 = a10;
  id v23 = a11;
  id v78 = a12;
  id v80 = a13;
  id v72 = a15;
  id v77 = a18;
  id v24 = a19;
  v83 = v22;
  id v25 = [v22 resourceType];
  id v26 = [v22 identifier];
  id v27 = [v81 stringRepresentation];
  uint64_t v126 = 0;
  v127 = &v126;
  uint64_t v128 = 0x3032000000;
  v129 = sub_9DCE8;
  v130 = sub_9DCF8;
  id v131 = 0;
  uint64_t v120 = 0;
  v121 = &v120;
  uint64_t v122 = 0x3032000000;
  v123 = sub_9DCE8;
  v124 = sub_9DCF8;
  id v125 = 0;
  uint64_t v114 = 0;
  v115 = &v114;
  uint64_t v116 = 0x3032000000;
  v117 = sub_9DCE8;
  v118 = sub_9DCF8;
  id v119 = 0;
  uint64_t v108 = 0;
  v109 = &v108;
  uint64_t v110 = 0x3032000000;
  v111 = sub_9DCE8;
  v112 = sub_9DCF8;
  id v113 = 0;
  uint64_t v104 = 0;
  v105 = &v104;
  uint64_t v106 = 0x2020000000;
  uint64_t v107 = 0;
  id v103 = 0;
  v102[0] = _NSConcreteStackBlock;
  v102[1] = 3221225472;
  v102[2] = sub_A1308;
  v102[3] = &unk_112668;
  v102[4] = a1;
  v95[0] = _NSConcreteStackBlock;
  v95[1] = 3221225472;
  v95[2] = sub_A1420;
  v95[3] = &unk_114D10;
  id v70 = v25;
  id v96 = v70;
  id v71 = v26;
  id v97 = v71;
  int64_t v101 = a4;
  id v28 = v27;
  id v98 = v28;
  id v74 = v73;
  id v99 = v74;
  id v29 = v23;
  id v100 = v29;
  v94[0] = _NSConcreteStackBlock;
  v94[1] = 3221225472;
  v94[2] = sub_A14B0;
  v94[3] = &unk_114D38;
  v94[4] = &v126;
  v94[5] = &v120;
  v94[6] = &v114;
  v94[7] = &v104;
  v94[8] = &v108;
  id v30 = v24;
  LOBYTE(a8) = [v24 executeCachedStatementForKey:&unk_F2979 error:&v103 SQLGenerator:v102 bindingHandler:v95 enumerationHandler:v94];
  id v31 = v103;
  __int16 v32 = v31;
  if (a8)
  {
    if (v127[5])
    {
      if (v80) {
        unsigned int v33 = objc_msgSend((id)v121[5], "hk_isBeforeOrEqualToDate:");
      }
      else {
        unsigned int v33 = 1;
      }
      uint64_t v37 = v105[3];
      BOOL v39 = v37 == a16;
      unint64_t v38 = v37 & 0xFFFFFFFFFFFFFFEFLL;
      BOOL v39 = v39 || v38 == a16;
      int v40 = v39;
      if (v39) {
        unsigned int v41 = 1;
      }
      else {
        unsigned int v41 = objc_msgSend((id)v109[5], "hk_isAfterOrEqualToDate:", v29);
      }
      if ((v33 & v41) == 1)
      {
        if (a5)
        {
          id v36 = v32;
        }
        else
        {
          uint64_t v50 = v127[5];
          id v93 = 0;
          unsigned __int8 v51 = [a1 _recordResourceLastSeen:v29 resourcePersistentID:v50 database:v24 error:&v93];
          id v36 = v93;

          if ((v51 & 1) == 0)
          {
            _HKInitializeLogging();
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
              sub_B50D4();
            }
          }
        }
        if (a14) {
          *a14 = (id) v121[5];
        }
        id v52 = (id)v127[5];
        goto LABEL_76;
      }
      _HKInitializeLogging();
      id v42 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG))
      {
        id v43 = v42;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          v66 = HKSensitiveLogItem();
          uint64_t v67 = v127[5];
          LODWORD(buf.var0) = 138544642;
          *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)a1;
          WORD2(buf.var1) = 2114;
          *(int64_t *)((char *)&buf.var1 + 6) = (int64_t)v66;
          HIWORD(buf.var2) = 2114;
          uint64_t v134 = v67;
          __int16 v135 = 1024;
          unsigned int v136 = v33;
          __int16 v137 = 1024;
          int v138 = v40;
          __int16 v139 = 1024;
          unsigned int v140 = v41;
          _os_log_debug_impl(&dword_0, v43, OS_LOG_TYPE_DEBUG, "%{public}@ Found the same resource (%{public}@, ROWID %{public}@) in the database but will replace. existingWasSeenEarlier = %d, extractionHintsAreEquivalent = %d, existingHasSameHintsOrWasReceivedLater = %d", (uint8_t *)&buf, 0x32u);
        }
      }
    }
  }
  else
  {
    if (objc_msgSend(v31, "hk_isTransactionInterruptedError"))
    {
      _HKInitializeLogging();
      id v34 = HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_B513C((uint64_t)a1, v34);
      }
      id v35 = v32;
      id v36 = v35;
      if (v35)
      {
        if (a20) {
          *a20 = v35;
        }
        else {
          _HKLogDroppedError();
        }
      }

      goto LABEL_47;
    }
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      sub_B51B4();
    }
  }
  uint64_t v44 = (void *)v127[5];
  v127[5] = 0;

  v45 = (void *)v121[5];
  if (!v45)
  {
    v91[0] = _NSConcreteStackBlock;
    v91[1] = 3221225472;
    v91[2] = sub_A15A8;
    v91[3] = &unk_112668;
    v91[4] = a1;
    id v92 = v32;
    v87[0] = _NSConcreteStackBlock;
    v87[1] = 3221225472;
    v87[2] = sub_A167C;
    v87[3] = &unk_114D60;
    id v88 = v70;
    id v89 = v71;
    int64_t v90 = a4;
    v86[0] = _NSConcreteStackBlock;
    v86[1] = 3221225472;
    v86[2] = sub_A16DC;
    v86[3] = &unk_114D88;
    v86[4] = &v126;
    v86[5] = &v120;
    v86[6] = &v114;
    unsigned __int8 v47 = [v30 executeCachedStatementForKey:&unk_F297A error:&v92 SQLGenerator:v91 bindingHandler:v87 enumerationHandler:v86];
    id v46 = v92;

    if ((v47 & 1) == 0)
    {
      if (objc_msgSend(v46, "hk_isTransactionInterruptedError"))
      {
        _HKInitializeLogging();
        int64_t v48 = HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
          sub_B4FF4((uint64_t)a1, v48);
        }
        id v49 = v46;
        id v36 = v49;
        if (v49)
        {
          if (a20) {
            *a20 = v49;
          }
          else {
            _HKLogDroppedError();
          }
        }

LABEL_47:
        id v52 = 0;
        goto LABEL_76;
      }
      _HKInitializeLogging();
      id v53 = HKLogHealthRecords;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
      {
        id v54 = HKSensitiveLogItem();
        sub_B506C((uint64_t)a1, v54, v132, v53);
      }
    }
    v45 = (void *)v121[5];
    goto LABEL_52;
  }
  id v46 = v32;
LABEL_52:
  id v55 = v45;
  id v56 = (id)v115[5];
  if (v80 && (!v121[5] || objc_msgSend(v80, "hk_isBeforeDate:")))
  {
    id v57 = v80;

    id v58 = v72;
    id v55 = v57;
LABEL_58:
    id v59 = v58;

    id v56 = v59;
    goto LABEL_59;
  }
  if (!v55)
  {
    id v55 = v29;
    id v58 = v78;
    goto LABEL_58;
  }
LABEL_59:
  uint64_t v60 = v127[5];
  id v85 = v46;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D buf = *a17;
  objc_msgSend(a1, "_wrapRawInsertResourceObjectWithIdentifier:accountID:syncProvenance:syncIdentity:rawContent:uniquenessChecksum:sourceURL:FHIRVersion:receivedDate:receivedDateTimeZoneName:firstSeenDate:firstSeenDateTimeZoneName:extractionHints:originVersion:originBuild:database:existingRowID:error:", v83, a4, a5, a6, v75, v74, v76, v28, v29, v78, v55, v56, a16, &buf, v77,
    v30,
    v60,
    &v85);
  id v52 = (id)objc_claimAutoreleasedReturnValue();
  id v61 = v85;

  if (v52)
  {
    if (a5)
    {
      id v36 = v61;
    }
    else
    {
      id v84 = 0;
      unsigned __int8 v63 = [a1 _recordResourceLastSeen:v29 resourcePersistentID:v52 database:v30 error:&v84];
      id v36 = v84;

      if ((v63 & 1) == 0)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
          sub_B4F8C();
        }
      }
    }
    if (a14) {
      *a14 = (id) v121[5];
    }
    id v64 = v52;
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B4F24();
    }
    id v62 = v61;
    id v36 = v62;
    if (v62)
    {
      if (a20) {
        *a20 = v62;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
LABEL_76:

  _Block_object_dispose(&v104, 8);
  _Block_object_dispose(&v108, 8);

  _Block_object_dispose(&v114, 8);
  _Block_object_dispose(&v120, 8);

  _Block_object_dispose(&v126, 8);

  return v52;
}

+ (id)_wrapRawInsertResourceObjectWithIdentifier:(id)a3 accountID:(int64_t)a4 syncProvenance:(int64_t)a5 syncIdentity:(int64_t)a6 rawContent:(id)a7 uniquenessChecksum:(id)a8 sourceURL:(id)a9 FHIRVersion:(id)a10 receivedDate:(id)a11 receivedDateTimeZoneName:(id)a12 firstSeenDate:(id)a13 firstSeenDateTimeZoneName:(id)a14 extractionHints:(int64_t)a15 originVersion:(id *)a16 originBuild:(id)a17 database:(id)a18 existingRowID:(id)a19 error:(id *)a20
{
  id v87 = a3;
  id v23 = a7;
  id v86 = a8;
  id v85 = a9;
  id v24 = a10;
  id v82 = a11;
  id v25 = a12;
  id v84 = a13;
  id v26 = a14;
  id v27 = a17;
  id v28 = a18;
  id v29 = a19;
  id v74 = a1;
  id v75 = v29;
  id v80 = v23;
  id v76 = v25;
  id v77 = v24;
  id v78 = v27;
  id v79 = v26;
  if (v29)
  {
    id v30 = a1;
    id v109 = 0;
    v104[0] = _NSConcreteStackBlock;
    v104[1] = 3221225472;
    v104[2] = sub_A2030;
    v104[3] = &unk_114DB0;
    id v31 = objc_alloc_init((Class)NSMutableArray);
    id v105 = v31;
    id v32 = v28;
    id v106 = v32;
    id v108 = a1;
    id v33 = v29;
    id v107 = v33;
    unsigned __int8 v34 = +[HDClinicalRecordEntity _enumerateEntitiesWithOriginalFHIRResourceROWID:v33 database:v32 error:&v109 enumerationHandler:v104];
    id v35 = v109;
    if (v34)
    {
      id v83 = [v31 copy];
      id v103 = v35;
      v98[0] = _NSConcreteStackBlock;
      v98[1] = 3221225472;
      v98[2] = sub_A2184;
      v98[3] = &unk_114DD8;
      id v36 = objc_alloc_init((Class)NSMutableArray);
      id v99 = v36;
      id v100 = v32;
      id v102 = v30;
      id v37 = v33;
      id v101 = v37;
      unsigned __int8 v38 = +[HDMedicalRecordEntity _enumerateEntitiesWithOriginalFHIRResourceROWID:v37 database:v100 error:&v103 enumerationHandler:v98];
      id v29 = v103;

      if (v38)
      {
        id v81 = [v36 copy];
        int v39 = 0;
        int v40 = v82;
        id v25 = v76;
        id v26 = v79;
        unsigned int v41 = a20;
      }
      else
      {
        _HKInitializeLogging();
        v45 = HKLogHealthRecords;
        id v26 = v79;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf.var0) = 138543874;
          *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v74;
          WORD2(buf.var1) = 2114;
          *(int64_t *)((char *)&buf.var1 + 6) = (int64_t)v37;
          HIWORD(buf.var2) = 2114;
          id v112 = v29;
          _os_log_error_impl(&dword_0, v45, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve HDMedicalRecordEntity for associated HDOriginalFHIRResourceEntity with ROWID %{public}@: %{public}@", (uint8_t *)&buf, 0x20u);
        }
        id v46 = v29;
        int v40 = v82;
        id v25 = v76;
        unsigned int v41 = a20;
        if (v46)
        {
          if (a20) {
            *a20 = v46;
          }
          else {
            _HKLogDroppedError();
          }
        }

        id v81 = 0;
        int v39 = 1;
      }

      id v27 = v78;
    }
    else
    {
      _HKInitializeLogging();
      id v43 = HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf.var0) = 138543874;
        *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v74;
        WORD2(buf.var1) = 2114;
        *(int64_t *)((char *)&buf.var1 + 6) = (int64_t)v33;
        HIWORD(buf.var2) = 2114;
        id v112 = v35;
        _os_log_error_impl(&dword_0, v43, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve HDClinicalRecordEntity for associated HDOriginalFHIRResourceEntity with ROWID %{public}@: %{public}@", (uint8_t *)&buf, 0x20u);
      }
      id v44 = v35;
      id v36 = v44;
      id v25 = v76;
      int v40 = v82;
      if (v44)
      {
        id v27 = v78;
        id v26 = v79;
        unsigned int v41 = a20;
        if (a20)
        {
          id v36 = v44;
          id v81 = 0;
          id v83 = 0;
          *a20 = v36;
        }
        else
        {
          _HKLogDroppedError();
          id v81 = 0;
          id v83 = 0;
        }
        int v39 = 1;
        id v29 = v36;
      }
      else
      {
        id v81 = 0;
        id v83 = 0;
        int v39 = 1;
        id v29 = 0;
        id v27 = v78;
        id v26 = v79;
        unsigned int v41 = a20;
      }
    }

    if (v39)
    {
      id v47 = 0;
      int64_t v48 = v80;
      id v24 = v77;
      goto LABEL_57;
    }
    id v23 = v80;
    id v24 = v77;
    id v42 = v83;
  }
  else
  {
    id v81 = 0;
    id v42 = 0;
    unsigned int v41 = a20;
    int v40 = v82;
  }
  $9FE6E10C8CE45DBC9A88DFDEA39A390D buf = *a16;
  objc_msgSend(v74, "_rawInsertResourceObjectWithIdentifier:accountID:syncProvenance:syncIdentity:rawContent:uniquenessChecksum:sourceURL:FHIRVersion:receivedDate:receivedDateTimeZoneName:firstSeenDate:firstSeenDateTimeZoneName:extractionHints:originVersion:originBuild:database:error:", v87, a4, a5, a6, v23, v86, v85, v24, v40, v25, v84, v26, a15, &buf, v27,
    v28,
  id v49 = v41);
  id v83 = v42;
  if (v49)
  {
    if (v42)
    {
      long long v96 = 0u;
      long long v97 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      id v50 = v42;
      id v51 = [v50 countByEnumeratingWithState:&v94 objects:v115 count:16];
      if (v51)
      {
        id v52 = v51;
        uint64_t v53 = *(void *)v95;
LABEL_29:
        id v54 = 0;
        id v55 = v29;
        while (1)
        {
          if (*(void *)v95 != v53) {
            objc_enumerationMutation(v50);
          }
          id v56 = *(void **)(*((void *)&v94 + 1) + 8 * (void)v54);
          id v93 = v55;
          unsigned __int8 v57 = [v56 _updateOriginalFHIRResourceROWID:v49 database:v28 error:&v93];
          id v29 = v93;

          if ((v57 & 1) == 0) {
            break;
          }
          id v54 = (char *)v54 + 1;
          id v55 = v29;
          if (v52 == v54)
          {
            id v52 = [v50 countByEnumeratingWithState:&v94 objects:v115 count:16];
            id v27 = v78;
            id v26 = v79;
            if (v52) {
              goto LABEL_29;
            }
            goto LABEL_35;
          }
        }
        _HKInitializeLogging();
        v65 = (void *)HKLogHealthRecords;
        if (!os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
          goto LABEL_51;
        }
        v66 = v65;
        uint64_t v67 = [v28 lastInsertRowID];
        LODWORD(buf.var0) = 138544130;
        *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v74;
        WORD2(buf.var1) = 2114;
        *(int64_t *)((char *)&buf.var1 + 6) = (int64_t)v56;
        HIWORD(buf.var2) = 2114;
        id v112 = v67;
        __int16 v113 = 2114;
        id v114 = v29;
        v68 = "%{public}@ Failed to re-associate clinical record %{public}@ with new originalFHIRResourceROWID %{public}@: %{public}@";
        goto LABEL_61;
      }
LABEL_35:

      id v25 = v76;
      id v24 = v77;
      int v40 = v82;
    }
    if (v81)
    {
      long long v91 = 0u;
      long long v92 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      id v50 = v81;
      id v58 = [v50 countByEnumeratingWithState:&v89 objects:v110 count:16];
      if (v58)
      {
        id v59 = v58;
        uint64_t v60 = *(void *)v90;
LABEL_39:
        id v61 = 0;
        id v62 = v29;
        while (1)
        {
          if (*(void *)v90 != v60) {
            objc_enumerationMutation(v50);
          }
          unsigned __int8 v63 = *(void **)(*((void *)&v89 + 1) + 8 * (void)v61);
          id v88 = v62;
          unsigned __int8 v64 = [v63 _updateOriginalFHIRResourceROWID:v49 database:v28 error:&v88];
          id v29 = v88;

          if ((v64 & 1) == 0) {
            break;
          }
          id v61 = (char *)v61 + 1;
          id v62 = v29;
          if (v59 == v61)
          {
            id v59 = [v50 countByEnumeratingWithState:&v89 objects:v110 count:16];
            if (v59) {
              goto LABEL_39;
            }
            goto LABEL_45;
          }
        }
        _HKInitializeLogging();
        v69 = (void *)HKLogHealthRecords;
        if (!os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
          goto LABEL_51;
        }
        v66 = v69;
        uint64_t v67 = [v28 lastInsertRowID];
        LODWORD(buf.var0) = 138544130;
        *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v74;
        WORD2(buf.var1) = 2114;
        *(int64_t *)((char *)&buf.var1 + 6) = (int64_t)v63;
        HIWORD(buf.var2) = 2114;
        id v112 = v67;
        __int16 v113 = 2114;
        id v114 = v29;
        v68 = "%{public}@ Failed to re-associate medical record %{public}@ with new originalFHIRResourceROWID %{public}@: %{public}@";
LABEL_61:
        _os_log_error_impl(&dword_0, v66, OS_LOG_TYPE_ERROR, v68, (uint8_t *)&buf, 0x2Au);

LABEL_51:
        id v29 = v29;
        id v24 = v77;
        id v27 = v78;
        int v40 = v82;
        id v26 = v79;
        if (v29)
        {
          if (a20) {
            *a20 = v29;
          }
          else {
            _HKLogDroppedError();
          }
        }

        id v47 = 0;
        id v25 = v76;
        goto LABEL_56;
      }
LABEL_45:

      id v25 = v76;
      id v24 = v77;
      int v40 = v82;
      id v27 = v78;
      id v26 = v79;
    }
    id v47 = v49;
  }
  else
  {
    id v47 = 0;
  }
LABEL_56:

  int64_t v48 = v80;
LABEL_57:

  return v47;
}

+ (id)_rawInsertResourceObjectWithIdentifier:(id)a3 accountID:(int64_t)a4 syncProvenance:(int64_t)a5 syncIdentity:(int64_t)a6 rawContent:(id)a7 uniquenessChecksum:(id)a8 sourceURL:(id)a9 FHIRVersion:(id)a10 receivedDate:(id)a11 receivedDateTimeZoneName:(id)a12 firstSeenDate:(id)a13 firstSeenDateTimeZoneName:(id)a14 extractionHints:(int64_t)a15 originVersion:(id *)a16 originBuild:(id)a17 database:(id)a18 error:(id *)a19
{
  id v42 = a7;
  id v41 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v38 = a12;
  id v24 = a13;
  id v25 = a14;
  id v26 = a17;
  id v39 = a18;
  id v27 = a3;
  int v40 = [v27 resourceType];
  id v28 = [v27 identifier];

  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_A2600;
  v70[3] = &unk_112668;
  v70[4] = a1;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_A2660;
  v52[3] = &unk_114E00;
  id v53 = v40;
  id v54 = v28;
  id v55 = v42;
  id v56 = v41;
  id v57 = v23;
  id v58 = v38;
  id v59 = v24;
  id v60 = v25;
  id v61 = v22;
  id v62 = v21;
  int64_t v65 = a5;
  int64_t v66 = a15;
  int64_t var2 = a16->var2;
  long long v67 = *(_OWORD *)&a16->var0;
  id v63 = v26;
  int64_t v64 = a4;
  int64_t v68 = var2;
  int64_t v69 = a6;
  id v51 = v26;
  id v49 = v21;
  id v47 = v22;
  id v45 = v25;
  id v44 = v24;
  id v30 = v38;
  id v31 = v23;
  id v32 = v41;
  id v33 = v42;
  id v34 = v28;
  id v35 = v40;
  id v36 = 0;
  if ([v39 executeCachedStatementForKey:&unk_F297B error:a19 SQLGenerator:v70 bindingHandler:v52 enumerationHandler:0])
  {
    if ((int)[v39 getChangesCount] < 1)
    {
      id v36 = 0;
    }
    else
    {
      id v36 = [v39 lastInsertRowID];
    }
  }

  return v36;
}

+ (BOOL)_recordResourceLastSeen:(id)a3 resourcePersistentID:(id)a4 database:(id)a5 error:(id *)a6
{
  v6 = +[HDOriginalFHIRResourceLastSeenEntity insertOrUpdateLastSeenDate:a3 resourcePersistentID:a4 database:a5 error:a6];
  BOOL v7 = v6 != 0;

  return v7;
}

+ (id)addExtractionHints:(unint64_t)a3 toResourceEntities:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v11 = a4;
  id v12 = a5;
  if ([v11 count])
  {
    id v13 = objc_alloc_init((Class)NSMutableArray);
    id v14 = [v12 database];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_A2968;
    v21[3] = &unk_1128D8;
    id v24 = a1;
    unint64_t v25 = a3;
    id v22 = v11;
    id v23 = v13;
    id v15 = v13;
    id v16 = v11;
    unsigned int v17 = [a1 performWriteTransactionWithHealthDatabase:v14 error:a6 block:v21];

    if (v17) {
      id v18 = v15;
    }
    else {
      id v18 = 0;
    }
    id v11 = v18;
  }
  else
  {
    _HKInitializeLogging();
    id v19 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
      sub_B4E7C((uint64_t)a1, v19, a2);
    }
  }

  return v11;
}

- (id)entityByAddingExtractionHints:(unint64_t)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v75 = 0;
  id v76 = &v75;
  uint64_t v77 = 0x3032000000;
  id v78 = sub_9DCE8;
  id v79 = sub_9DCF8;
  id v80 = 0;
  uint64_t v71 = 0;
  id v72 = &v71;
  uint64_t v73 = 0x2020000000;
  uint64_t v74 = 0;
  uint64_t v67 = 0;
  int64_t v68 = &v67;
  uint64_t v69 = 0x2020000000;
  uint64_t v70 = -1;
  uint64_t v61 = 0;
  id v62 = &v61;
  uint64_t v63 = 0x3032000000;
  int64_t v64 = sub_9DCE8;
  int64_t v65 = sub_9DCF8;
  id v66 = 0;
  uint64_t v55 = 0;
  id v56 = &v55;
  uint64_t v57 = 0x3032000000;
  id v58 = sub_9DCE8;
  id v59 = sub_9DCF8;
  id v60 = 0;
  id v9 = [(id)objc_opt_class() _propertiesForEntity];
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_A3340;
  v54[3] = &unk_114E28;
  v54[6] = &v71;
  v54[7] = &v67;
  v54[4] = self;
  v54[5] = &v75;
  v54[8] = &v61;
  v54[9] = &v55;
  unsigned __int8 v10 = [(HDOriginalFHIRResourceEntity *)self getValuesForProperties:v9 database:v8 error:a5 handler:v54];

  if ((v10 & 1) == 0) {
    goto LABEL_23;
  }
  if (!v76[5])
  {
    +[NSError hk_assignError:a5, 100, @"Missing account ID on existing original FHIR resource with ROWID %lu", [(HDOriginalFHIRResourceEntity *)self persistentID] code format];
LABEL_23:
    id v16 = 0;
    goto LABEL_24;
  }
  id v11 = (void *)v62[5];
  if (!v11)
  {
    id v17 = (id)v56[5];
    id v18 = v17;
    if (v17)
    {
      if (a5) {
        *a5 = v17;
      }
      else {
        _HKLogDroppedError();
      }
    }

    goto LABEL_23;
  }
  unint64_t v12 = (unint64_t)[v11 extractionHints];
  unint64_t v13 = v12 | a3;
  if (v12 == (v12 | a3))
  {
    _HKInitializeLogging();
    id v14 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG))
    {
      id v15 = v14;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        id v34 = (id)objc_opt_class();
        id v35 = [(HDOriginalFHIRResourceEntity *)self persistentID];
        *(_DWORD *)$9FE6E10C8CE45DBC9A88DFDEA39A390D buf = 138543874;
        *(void *)&uint8_t buf[4] = v34;
        *(_WORD *)&buf[12] = 2050;
        *(void *)&buf[14] = v35;
        *(_WORD *)&buf[22] = 2048;
        unint64_t v82 = a3;
        _os_log_debug_impl(&dword_0, v15, OS_LOG_TYPE_DEBUG, "%{public}@ Existing resource with ROWID %{public}lu already has extraction hints %lu, not replacing", buf, 0x20u);
      }
    }
    id v16 = self;
  }
  else
  {
    id v19 = +[NSNumber numberWithLongLong:[(HDOriginalFHIRResourceEntity *)self persistentID]];
    id v53 = 0;
    id v52 = +[HDOriginalFHIRResourceLastSeenEntity lastSeenDateForResourceWithPersistentID:v19 database:v8 error:&v53];
    id v51 = v53;

    if (v52 || !v51)
    {
      id v20 = objc_alloc((Class)HKFHIRIdentifier);
      id v21 = [(id)v62[5] resourceType];
      id v22 = [(id)v62[5] resourceID];
      id v50 = [v20 initWithResourceType:v21 identifier:v22];

      if ([(id)v62[5] hasOriginVersionMajor]) {
        id v23 = [(id)v62[5] originVersionMajor];
      }
      else {
        id v23 = &dword_8 + 3;
      }
      if ([(id)v62[5] hasOriginVersionMinor]) {
        id v25 = [(id)v62[5] originVersionMinor];
      }
      else {
        id v25 = &dword_0 + 3;
      }
      id v43 = v25;
      id v44 = v23;
      if ([(id)v62[5] hasOriginVersionPatch]) {
        id v41 = [(id)v62[5] originVersionPatch];
      }
      else {
        id v41 = 0;
      }
      id v42 = objc_opt_class();
      id v40 = [(id)v76[5] unsignedLongValue];
      uint64_t v38 = v68[3];
      uint64_t v39 = v72[3];
      id v46 = [(id)v62[5] rawContent];
      id v49 = [(id)v62[5] uniquenessChecksum];
      int64_t v48 = [(id)v62[5] sourceURL];
      id v47 = [(id)v62[5] fhirVersion];
      [(id)v62[5] receivedDate];
      id v45 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      id v26 = [(id)v62[5] receivedDateTimeZoneName];
      [(id)v62[5] firstSeenDate];
      id v27 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      id v28 = [(id)v62[5] firstSeenDateTimeZoneName];
      id v29 = [(id)v62[5] originVersionBuild];
      id v30 = +[NSNumber numberWithLongLong:[(HDOriginalFHIRResourceEntity *)self persistentID]];
      *(void *)$9FE6E10C8CE45DBC9A88DFDEA39A390D buf = v44;
      *(void *)&buf[8] = v43;
      *(void *)&buf[16] = v41;
      objc_msgSend(v42, "_wrapRawInsertResourceObjectWithIdentifier:accountID:syncProvenance:syncIdentity:rawContent:uniquenessChecksum:sourceURL:FHIRVersion:receivedDate:receivedDateTimeZoneName:firstSeenDate:firstSeenDateTimeZoneName:extractionHints:originVersion:originBuild:database:existingRowID:error:", v50, v40, v39, v38, v46, v49, v48, v47, v45, v26, v27, v28, v13, buf, v29,
        v8,
        v30,
      id v31 = a5);

      if (!v31
        || v52
        && (+[HDOriginalFHIRResourceLastSeenEntity insertOrUpdateLastSeenDate:v52 resourcePersistentID:v31 database:v8 error:a5], id v32 = objc_claimAutoreleasedReturnValue(), v33 = v32 == 0, v32, v33)|| ([(HDOriginalFHIRResourceEntity *)self deleteFromDatabase:v8 error:a5] & 1) == 0)
      {
        id v16 = 0;
      }
      else
      {
        id v16 = [(id)objc_opt_class() entityWithPersistentID:v31];
      }
    }
    else
    {
      _HKInitializeLogging();
      id v50 = HKLogHealthRecords;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        id v36 = (id)objc_opt_class();
        id v37 = [(HDOriginalFHIRResourceEntity *)self persistentID];
        *(_DWORD *)$9FE6E10C8CE45DBC9A88DFDEA39A390D buf = 138543874;
        *(void *)&uint8_t buf[4] = v36;
        *(_WORD *)&buf[12] = 2050;
        *(void *)&buf[14] = v37;
        *(_WORD *)&buf[22] = 2112;
        unint64_t v82 = (unint64_t)v51;
        _os_log_error_impl(&dword_0, v50, OS_LOG_TYPE_ERROR, "%{public}@ Error finding current last seen date for resource with ROWID %{public}lu: %@", buf, 0x20u);
      }
      id v16 = 0;
    }
  }
LABEL_24:
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v75, 8);

  return v16;
}

+ (BOOL)_validateCodableFHIRResourceFromSync:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 hasMessageVersion])
  {
    v6 = [v5 messageVersion];
    int v7 = [v6 compatibilityVersion];

    if (v7 > 1)
    {
      CFStringRef v8 = @"Codable FHIR resource compatibilty version is higher than what we support";
LABEL_24:
      +[NSError hk_assignError:a4 code:3 description:v8];
      BOOL v21 = 0;
      goto LABEL_25;
    }
    unsigned __int8 v10 = [v5 messageVersion];
    BOOL v9 = (int)[v10 entityVersion] > 0;
  }
  else
  {
    BOOL v9 = 0;
  }
  id v11 = [v5 gatewayExternalID];
  id v12 = [v11 length];

  if (!v12)
  {
    CFStringRef v8 = @"Missing gateway external ID";
    goto LABEL_24;
  }
  unint64_t v13 = [v5 resourceID];
  id v14 = [v13 length];

  if (!v14)
  {
    CFStringRef v8 = @"Missing FHIR resource ID";
    goto LABEL_24;
  }
  id v15 = [v5 resourceType];
  id v16 = [v15 length];

  if (!v16)
  {
    CFStringRef v8 = @"Missing FHIR resource type";
    goto LABEL_24;
  }
  id v17 = [v5 rawContent];
  id v18 = [v17 length];

  if (!v18)
  {
    CFStringRef v8 = @"Missing FHIR resource raw content";
    goto LABEL_24;
  }
  if (v9 && ![v5 hasUniquenessChecksum])
  {
    CFStringRef v8 = @"Missing FHIR resource uniqueness checksum";
    goto LABEL_24;
  }
  id v19 = [v5 fhirVersion];
  id v20 = [v19 length];

  if (!v20)
  {
    CFStringRef v8 = @"Missing FHIR version for resource";
    goto LABEL_24;
  }
  if (![v5 hasReceivedDate])
  {
    CFStringRef v8 = @"Missing FHIR resource received date";
    goto LABEL_24;
  }
  if (([v5 hasReceivedDateTimeZoneName] & 1) == 0)
  {
    CFStringRef v8 = @"Missing FHIR resource received date time zone";
    goto LABEL_24;
  }
  BOOL v21 = 1;
LABEL_25:

  return v21;
}

+ (BOOL)_validateCodableFHIRResource:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![a1 _validateCodableFHIRResourceFromSync:v6 error:a4]) {
    goto LABEL_16;
  }
  if (![v6 hasOriginVersionMajor])
  {
    CFStringRef v8 = @"Missing FHIR resource origin version major";
LABEL_15:
    +[NSError hk_assignError:a4 code:3 description:v8];
LABEL_16:
    BOOL v7 = 0;
    goto LABEL_17;
  }
  if (![v6 hasOriginVersionMinor])
  {
    CFStringRef v8 = @"Missing FHIR resource origin version minor";
    goto LABEL_15;
  }
  if (![v6 hasOriginVersionPatch])
  {
    CFStringRef v8 = @"Missing FHIR resource origin version patch";
    goto LABEL_15;
  }
  if (![v6 hasOriginVersionBuild])
  {
    CFStringRef v8 = @"Missing FHIR resource origin version build";
    goto LABEL_15;
  }
  if (![v6 hasFirstSeenDate])
  {
    CFStringRef v8 = @"Missing FHIR resource first seen date";
    goto LABEL_15;
  }
  if (([v6 hasFirstSeenDateTimeZoneName] & 1) == 0)
  {
    CFStringRef v8 = @"Missing FHIR resource first seen date time zone";
    goto LABEL_15;
  }
  BOOL v7 = 1;
LABEL_17:

  return v7;
}

- (id)_codableWithRow:(HDSQLiteRow *)a3 gatewayExternalID:(id)a4 accountUUID:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = objc_opt_class();
  id v13 = [(HDOriginalFHIRResourceEntity *)self persistentID];
  id v14 = [v12 _resourceObjectWithRow:a3 rowID:v13 assignCountry:HKCountryCodeUnknownCountry error:a6];
  if (v14)
  {
    id v15 = HDSQLiteColumnWithNameAsString();
    id v16 = HDSQLiteColumnWithNameAsString();
    id v17 = [v14 codableFHIRResourceWithGatewayExternalID:v10 accountID:v11 receivedDateTimeZoneName:v15 firstSeenDateTimeZoneName:v16];
    if ([(id)objc_opt_class() _validateCodableFHIRResource:v17 error:a6]) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

+ (BOOL)_ensureForeignKeysAreDeferredInDatabase:(id)a3 error:(id *)a4
{
  id v11 = 0;
  unsigned __int8 v6 = [a3 executeUncachedSQL:@"PRAGMA defer_foreign_keys = ON" error:&v11];
  id v7 = v11;
  if ((v6 & 1) == 0)
  {
    _HKInitializeLogging();
    CFStringRef v8 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B521C(v8, (uint64_t)a1, (uint64_t)v7);
    }
    id v9 = v7;
    if (v9)
    {
      if (a4) {
        *a4 = v9;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v6;
}

@end