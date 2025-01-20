@interface HDVisionPrescriptionEntity
+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4;
+ (BOOL)isConcreteEntity;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)codableObjectsFromObjectCollection:(id)a3;
+ (id)databaseTable;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)foreignKeys;
+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7;
+ (int64_t)protectionClass;
@end

@implementation HDVisionPrescriptionEntity

+ (id)databaseTable
{
  return @"vision_prescription";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 27;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_32;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"data_id";
  v2 = +[HDDataEntity defaultForeignKey];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v15 = objc_opt_class();
  if (([v15 isEqual:objc_opt_class()] & 1) == 0)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"HDVisionPrescriptionEntity.m", 172, @"Subclasses must override %s", "+[HDVisionPrescriptionEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __92__HDVisionPrescriptionEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
  v25[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v25[4] = a1;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __92__HDVisionPrescriptionEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke_2;
  v22[3] = &unk_1E62F2900;
  id v23 = v14;
  id v24 = v12;
  id v16 = v12;
  id v17 = v14;
  if ([v13 executeCachedStatementForKey:&insertDataObject_withProvenance_inDatabase_persistentID_error__insertKey_0 error:a7 SQLGenerator:v25 bindingHandler:v22 enumerationHandler:0])v18 = v17; {
  else
  }
    v18 = 0;
  id v19 = v18;

  return v19;
}

id __92__HDVisionPrescriptionEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  objc_msgSend(v1, "stringWithFormat:", @"INSERT INTO %@ (%@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", v2, @"data_id", @"prescription_type", @"verifiable_data", @"left_sphere", @"right_sphere", @"left_cylinder", @"right_cylinder", @"left_axis", @"right_axis", @"left_add_power", @"right_add_power", @"left_vertex_distance", @"right_vertex_distance", @"left_prism_amount", @"right_prism_amount",
    @"left_prism_angle",
    @"right_prism_angle",
    @"left_far_pupillary_distance",
    @"right_far_pupillary_distance",
    @"left_near_pupillary_distance",
    @"right_near_pupillary_distance",
    @"glasses_description",
    @"left_base_curve",
    @"right_base_curve",
    @"left_contact_diameter",
    @"right_contact_diameter",
    @"brand",
  v3 = 0);

  return v3;
}

void __92__HDVisionPrescriptionEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, [*(id *)(a1 + 32) longLongValue]);
  sqlite3_bind_int64(a2, 2, [*(id *)(a1 + 40) prescriptionType]);
  sqlite3_bind_null(a2, 3);
  v4 = [*(id *)(a1 + 40) leftSphere];
  if (v4)
  {
    v5 = [*(id *)(a1 + 40) leftSphere];
    v6 = [MEMORY[0x1E4F2B618] diopterUnit];
    [v5 doubleValueForUnit:v6];
    sqlite3_bind_double(a2, 4, v7);
  }
  else
  {
    sqlite3_bind_null(a2, 4);
  }

  v8 = [*(id *)(a1 + 40) rightSphere];
  if (v8)
  {
    v9 = [*(id *)(a1 + 40) rightSphere];
    v10 = [MEMORY[0x1E4F2B618] diopterUnit];
    [v9 doubleValueForUnit:v10];
    sqlite3_bind_double(a2, 5, v11);
  }
  else
  {
    sqlite3_bind_null(a2, 5);
  }

  id v12 = [*(id *)(a1 + 40) leftCylinder];
  if (v12)
  {
    id v13 = [*(id *)(a1 + 40) leftCylinder];
    id v14 = [MEMORY[0x1E4F2B618] diopterUnit];
    [v13 doubleValueForUnit:v14];
    sqlite3_bind_double(a2, 6, v15);
  }
  else
  {
    sqlite3_bind_null(a2, 6);
  }

  id v16 = [*(id *)(a1 + 40) rightCylinder];
  if (v16)
  {
    id v17 = [*(id *)(a1 + 40) rightCylinder];
    v18 = [MEMORY[0x1E4F2B618] diopterUnit];
    [v17 doubleValueForUnit:v18];
    sqlite3_bind_double(a2, 7, v19);
  }
  else
  {
    sqlite3_bind_null(a2, 7);
  }

  v20 = [*(id *)(a1 + 40) leftAxis];
  if (v20)
  {
    v21 = [*(id *)(a1 + 40) leftAxis];
    v22 = [MEMORY[0x1E4F2B618] radianAngleUnit];
    [v21 doubleValueForUnit:v22];
    sqlite3_bind_double(a2, 8, v23);
  }
  else
  {
    sqlite3_bind_null(a2, 8);
  }

  id v24 = [*(id *)(a1 + 40) rightAxis];
  if (v24)
  {
    v25 = [*(id *)(a1 + 40) rightAxis];
    v26 = [MEMORY[0x1E4F2B618] radianAngleUnit];
    [v25 doubleValueForUnit:v26];
    sqlite3_bind_double(a2, 9, v27);
  }
  else
  {
    sqlite3_bind_null(a2, 9);
  }

  v28 = [*(id *)(a1 + 40) leftAddPower];
  if (v28)
  {
    v29 = [*(id *)(a1 + 40) leftAddPower];
    v30 = [MEMORY[0x1E4F2B618] diopterUnit];
    [v29 doubleValueForUnit:v30];
    sqlite3_bind_double(a2, 10, v31);
  }
  else
  {
    sqlite3_bind_null(a2, 10);
  }

  v32 = [*(id *)(a1 + 40) rightAddPower];
  if (v32)
  {
    v33 = [*(id *)(a1 + 40) rightAddPower];
    v34 = [MEMORY[0x1E4F2B618] diopterUnit];
    [v33 doubleValueForUnit:v34];
    sqlite3_bind_double(a2, 11, v35);
  }
  else
  {
    sqlite3_bind_null(a2, 11);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v36 = *(id *)(a1 + 40);
    v37 = [v36 leftEye];
    v38 = [v37 vertexDistance];
    if (v38)
    {
      v39 = [v36 leftEye];
      v40 = [v39 vertexDistance];
      v41 = [MEMORY[0x1E4F2B618] meterUnit];
      [v40 doubleValueForUnit:v41];
      sqlite3_bind_double(a2, 12, v42);
    }
    else
    {
      sqlite3_bind_null(a2, 12);
    }

    v44 = [v36 rightEye];
    v45 = [v44 vertexDistance];
    if (v45)
    {
      v46 = [v36 rightEye];
      v47 = [v46 vertexDistance];
      v48 = [MEMORY[0x1E4F2B618] meterUnit];
      [v47 doubleValueForUnit:v48];
      sqlite3_bind_double(a2, 13, v49);
    }
    else
    {
      sqlite3_bind_null(a2, 13);
    }

    v50 = [v36 leftEye];
    v51 = [v50 prism];
    v52 = [v51 amount];
    if (v52)
    {
      v53 = [v36 leftEye];
      v54 = [v53 prism];
      v55 = [v54 amount];
      v56 = [MEMORY[0x1E4F2B618] prismDiopterUnit];
      [v55 doubleValueForUnit:v56];
      sqlite3_bind_double(a2, 14, v57);
    }
    else
    {
      sqlite3_bind_null(a2, 14);
    }

    v58 = [v36 rightEye];
    v59 = [v58 prism];
    v60 = [v59 amount];
    if (v60)
    {
      v61 = [v36 rightEye];
      v62 = [v61 prism];
      v63 = [v62 amount];
      v64 = [MEMORY[0x1E4F2B618] prismDiopterUnit];
      [v63 doubleValueForUnit:v64];
      sqlite3_bind_double(a2, 15, v65);
    }
    else
    {
      sqlite3_bind_null(a2, 15);
    }

    v66 = [v36 leftEye];
    v67 = [v66 prism];
    v68 = [v67 angle];
    if (v68)
    {
      v69 = [v36 leftEye];
      v70 = [v69 prism];
      v71 = [v70 angle];
      v72 = [MEMORY[0x1E4F2B618] radianAngleUnit];
      [v71 doubleValueForUnit:v72];
      sqlite3_bind_double(a2, 16, v73);
    }
    else
    {
      sqlite3_bind_null(a2, 16);
    }

    v74 = [v36 rightEye];
    v75 = [v74 prism];
    v76 = [v75 angle];
    if (v76)
    {
      v77 = [v36 rightEye];
      v78 = [v77 prism];
      v79 = [v78 angle];
      v80 = [MEMORY[0x1E4F2B618] radianAngleUnit];
      [v79 doubleValueForUnit:v80];
      sqlite3_bind_double(a2, 17, v81);
    }
    else
    {
      sqlite3_bind_null(a2, 17);
    }

    v82 = [v36 leftEye];
    v83 = [v82 farPupillaryDistance];
    if (v83)
    {
      v84 = [v36 leftEye];
      v85 = [v84 farPupillaryDistance];
      v86 = [MEMORY[0x1E4F2B618] meterUnit];
      [v85 doubleValueForUnit:v86];
      sqlite3_bind_double(a2, 18, v87);
    }
    else
    {
      sqlite3_bind_null(a2, 18);
    }

    v88 = [v36 rightEye];
    v89 = [v88 farPupillaryDistance];
    if (v89)
    {
      v90 = [v36 rightEye];
      v91 = [v90 farPupillaryDistance];
      v92 = [MEMORY[0x1E4F2B618] meterUnit];
      [v91 doubleValueForUnit:v92];
      sqlite3_bind_double(a2, 19, v93);
    }
    else
    {
      sqlite3_bind_null(a2, 19);
    }

    v94 = [v36 leftEye];
    v95 = [v94 nearPupillaryDistance];
    if (v95)
    {
      v96 = [v36 leftEye];
      v97 = [v96 nearPupillaryDistance];
      v98 = [MEMORY[0x1E4F2B618] meterUnit];
      [v97 doubleValueForUnit:v98];
      sqlite3_bind_double(a2, 20, v99);
    }
    else
    {
      sqlite3_bind_null(a2, 20);
    }

    v100 = [v36 rightEye];
    v101 = [v100 nearPupillaryDistance];
    if (v101)
    {
      v102 = [v36 rightEye];
      v103 = [v102 nearPupillaryDistance];
      v104 = [MEMORY[0x1E4F2B618] meterUnit];
      [v103 doubleValueForUnit:v104];
      sqlite3_bind_double(a2, 21, v105);
    }
    else
    {
      sqlite3_bind_null(a2, 21);
    }

    int v43 = 22;
  }
  else
  {
    sqlite3_bind_null(a2, 12);
    sqlite3_bind_null(a2, 13);
    sqlite3_bind_null(a2, 14);
    sqlite3_bind_null(a2, 15);
    sqlite3_bind_null(a2, 16);
    sqlite3_bind_null(a2, 17);
    sqlite3_bind_null(a2, 18);
    sqlite3_bind_null(a2, 19);
    sqlite3_bind_null(a2, 20);
    sqlite3_bind_null(a2, 21);
    sqlite3_bind_null(a2, 22);
    int v43 = 23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v131 = *(id *)(a1 + 40);
    v106 = [v131 leftEye];
    v107 = [v106 baseCurve];
    if (v107)
    {
      v108 = [v131 leftEye];
      v109 = [v108 baseCurve];
      v110 = [MEMORY[0x1E4F2B618] meterUnit];
      [v109 doubleValueForUnit:v110];
      sqlite3_bind_double(a2, v43, v111);
    }
    else
    {
      sqlite3_bind_null(a2, v43);
    }

    v112 = [v131 rightEye];
    v113 = [v112 baseCurve];
    if (v113)
    {
      v114 = [v131 rightEye];
      v115 = [v114 baseCurve];
      v116 = [MEMORY[0x1E4F2B618] meterUnit];
      [v115 doubleValueForUnit:v116];
      sqlite3_bind_double(a2, v43 + 1, v117);
    }
    else
    {
      sqlite3_bind_null(a2, v43 + 1);
    }

    v118 = [v131 leftEye];
    v119 = [v118 diameter];
    if (v119)
    {
      v120 = [v131 leftEye];
      v121 = [v120 diameter];
      v122 = [MEMORY[0x1E4F2B618] meterUnit];
      [v121 doubleValueForUnit:v122];
      sqlite3_bind_double(a2, v43 + 2, v123);
    }
    else
    {
      sqlite3_bind_null(a2, v43 + 2);
    }

    v124 = [v131 rightEye];
    v125 = [v124 diameter];
    if (v125)
    {
      v126 = [v131 rightEye];
      v127 = [v126 diameter];
      v128 = [MEMORY[0x1E4F2B618] meterUnit];
      [v127 doubleValueForUnit:v128];
      sqlite3_bind_double(a2, v43 + 3, v129);
    }
    else
    {
      sqlite3_bind_null(a2, v43 + 3);
    }

    id v130 = [v131 brand];
    sqlite3_bind_text(a2, v43 + 4, (const char *)[v130 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(a2, v43);
    sqlite3_bind_null(a2, v43 + 1);
    sqlite3_bind_null(a2, v43 + 2);
    sqlite3_bind_null(a2, v43 + 3);
    sqlite3_bind_null(a2, v43 + 4);
  }
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)[a3 visionSamples];
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3) {
    [a4 addVisionSamples:a3];
  }
  return a3 != 0;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  double v15 = [(HDEntityEncoder *)[HDVisionSampleEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

@end