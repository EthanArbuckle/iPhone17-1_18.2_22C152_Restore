@interface HDVisionSampleEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)_quantityWithNumber:(void *)a3 unit:;
- (id)_valueForOptionalDoubleProperty:(uint64_t)a1 row:(void *)a2;
- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
@end

@implementation HDVisionSampleEntityEncoder

- (id)orderedProperties
{
  v8[26] = *MEMORY[0x1E4F143B8];
  v8[0] = @"prescription_type";
  v8[1] = @"verifiable_data";
  v8[2] = @"left_sphere";
  v8[3] = @"right_sphere";
  v8[4] = @"left_cylinder";
  v8[5] = @"right_cylinder";
  v8[6] = @"left_axis";
  v8[7] = @"right_axis";
  v8[8] = @"left_add_power";
  v8[9] = @"right_add_power";
  v8[10] = @"left_vertex_distance";
  v8[11] = @"right_vertex_distance";
  v8[12] = @"left_prism_amount";
  v8[13] = @"right_prism_amount";
  v8[14] = @"left_prism_angle";
  v8[15] = @"right_prism_angle";
  v8[16] = @"left_far_pupillary_distance";
  v8[17] = @"right_far_pupillary_distance";
  v8[18] = @"left_near_pupillary_distance";
  v8[19] = @"right_near_pupillary_distance";
  v8[20] = @"glasses_description";
  v8[21] = @"left_base_curve";
  v8[22] = @"right_base_curve";
  v8[23] = @"left_contact_diameter";
  v8[24] = @"right_contact_diameter";
  v8[25] = @"brand";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:26];
  v4 = [(HDEntityEncoder *)self superclassEncoder];
  v5 = [v4 orderedProperties];
  v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  v9 = [(HDEntityEncoder *)self superclassEncoder];
  v10 = [v9 codableRepresentationForPersistentID:a3 row:a4 error:a5];

  if (v10)
  {
    v11 = objc_alloc_init(HDCodableVisionSample);
    v23 = v10;
    [(HDCodableVisionSample *)v11 setSample:v10];
    uint64_t v12 = HDSQLiteColumnWithNameAsInt64();
    v13 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"left_sphere");
    v14 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"right_sphere");
    v39 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"left_cylinder");
    v38 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"right_cylinder");
    v37 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"left_axis");
    v36 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"right_axis");
    v35 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"left_add_power");
    v34 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"right_add_power");
    v33 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"left_vertex_distance");
    v32 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"right_vertex_distance");
    v31 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"left_prism_amount");
    v30 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"right_prism_amount");
    v29 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"left_prism_angle");
    v28 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"right_prism_angle");
    v27 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"left_far_pupillary_distance");
    v26 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"right_far_pupillary_distance");
    v25 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"left_near_pupillary_distance");
    v24 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"right_near_pupillary_distance");
    if (HDSQLiteColumnWithNameIsNull())
    {
      v15 = 0;
    }
    else
    {
      v15 = HDSQLiteColumnWithNameAsString();
    }
    v16 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"left_base_curve");
    v17 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"right_base_curve");
    v18 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"left_contact_diameter");
    v19 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"right_contact_diameter");
    if (HDSQLiteColumnWithNameIsNull())
    {
      v20 = 0;
    }
    else
    {
      v20 = HDSQLiteColumnWithNameAsString();
    }
    [(HDCodableVisionSample *)v11 setPrescriptionType:v12];
    if (v13)
    {
      [v13 doubleValue];
      -[HDCodableVisionSample setLeftSphere:](v11, "setLeftSphere:");
    }
    v21 = v14;
    if (v14)
    {
      [v14 doubleValue];
      -[HDCodableVisionSample setRightSphere:](v11, "setRightSphere:");
    }
    v10 = v23;
    if (v39)
    {
      [v39 doubleValue];
      -[HDCodableVisionSample setLeftCylinder:](v11, "setLeftCylinder:");
    }
    if (v38)
    {
      [v38 doubleValue];
      -[HDCodableVisionSample setRightCylinder:](v11, "setRightCylinder:");
    }
    if (v37)
    {
      [v37 doubleValue];
      -[HDCodableVisionSample setLeftAxis:](v11, "setLeftAxis:");
    }
    if (v36)
    {
      [v36 doubleValue];
      -[HDCodableVisionSample setRightAxis:](v11, "setRightAxis:");
    }
    if (v35)
    {
      [v35 doubleValue];
      -[HDCodableVisionSample setLeftAddPower:](v11, "setLeftAddPower:");
    }
    if (v34)
    {
      [v34 doubleValue];
      -[HDCodableVisionSample setRightAddPower:](v11, "setRightAddPower:");
    }
    if (v33)
    {
      [v33 doubleValue];
      -[HDCodableVisionSample setLeftVertexDistance:](v11, "setLeftVertexDistance:");
    }
    if (v32)
    {
      [v32 doubleValue];
      -[HDCodableVisionSample setRightVertexDistance:](v11, "setRightVertexDistance:");
    }
    if (v31)
    {
      [v31 doubleValue];
      -[HDCodableVisionSample setLeftPrismAmount:](v11, "setLeftPrismAmount:");
    }
    if (v30)
    {
      [v30 doubleValue];
      -[HDCodableVisionSample setRightPrismAmount:](v11, "setRightPrismAmount:");
    }
    if (v29)
    {
      [v29 doubleValue];
      -[HDCodableVisionSample setLeftPrismAngle:](v11, "setLeftPrismAngle:");
    }
    if (v28)
    {
      [v28 doubleValue];
      -[HDCodableVisionSample setRightPrismAngle:](v11, "setRightPrismAngle:");
    }
    if (v27)
    {
      [v27 doubleValue];
      -[HDCodableVisionSample setLeftFarPupillaryDistance:](v11, "setLeftFarPupillaryDistance:");
    }
    if (v26)
    {
      [v26 doubleValue];
      -[HDCodableVisionSample setRightFarPupillaryDistance:](v11, "setRightFarPupillaryDistance:");
    }
    if (v25)
    {
      [v25 doubleValue];
      -[HDCodableVisionSample setLeftNearPupillaryDistance:](v11, "setLeftNearPupillaryDistance:");
    }
    if (v24)
    {
      [v24 doubleValue];
      -[HDCodableVisionSample setRightNearPupillaryDistance:](v11, "setRightNearPupillaryDistance:");
    }
    if (v15) {
      [(HDCodableVisionSample *)v11 setGlassesDescription:v15];
    }
    if (v16)
    {
      [v16 doubleValue];
      -[HDCodableVisionSample setLeftBaseCurve:](v11, "setLeftBaseCurve:");
    }
    if (v17)
    {
      [v17 doubleValue];
      -[HDCodableVisionSample setRightBaseCurve:](v11, "setRightBaseCurve:");
    }
    if (v18)
    {
      [v18 doubleValue];
      -[HDCodableVisionSample setLeftContactDiameter:](v11, "setLeftContactDiameter:");
    }
    if (v19)
    {
      [v19 doubleValue];
      -[HDCodableVisionSample setRightContactDiameter:](v11, "setRightContactDiameter:");
    }
    if (v20) {
      [(HDCodableVisionSample *)v11 setBrand:v20];
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_valueForOptionalDoubleProperty:(uint64_t)a1 row:(void *)a2
{
  id v3 = a2;
  if (a1 && (HDSQLiteColumnWithNameIsNull() & 1) == 0)
  {
    v5 = NSNumber;
    HDSQLiteColumnWithNameAsDouble();
    v4 = objc_msgSend(v5, "numberWithDouble:");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  uint64_t v4 = HDSQLiteColumnWithNameAsInt64();
  v5 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"left_sphere");
  v6 = [MEMORY[0x1E4F2B618] diopterUnit];
  uint64_t v7 = -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v5, v6);

  v8 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"right_sphere");
  v9 = [MEMORY[0x1E4F2B618] diopterUnit];
  uint64_t v10 = -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v8, v9);

  if (v7 | v10)
  {
    if (v4 == 2)
    {
      v11 = (objc_class *)MEMORY[0x1E4F2AE38];
      goto LABEL_9;
    }
    if (v4 == 1)
    {
      v11 = (objc_class *)MEMORY[0x1E4F2B088];
      goto LABEL_9;
    }
    _HKInitializeLogging();
    uint64_t v12 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_fault_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_FAULT, "Unexpectedly reached execution point. Creating generic vision prescription bare object.", v15, 2u);
    }
  }
  v11 = (objc_class *)MEMORY[0x1E4F2B700];
LABEL_9:
  v13 = (void *)[[v11 alloc] _init];

  return v13;
}

- (id)_quantityWithNumber:(void *)a3 unit:
{
  id v3 = 0;
  if (a1 && a2)
  {
    v5 = (void *)MEMORY[0x1E4F2B370];
    id v6 = a3;
    [a2 doubleValue];
    id v3 = objc_msgSend(v5, "quantityWithUnit:doubleValue:", v6);
  }

  return v3;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10 = a3;
  v11 = [(HDEntityEncoder *)self superclassEncoder];
  LODWORD(a4) = [v11 applyPropertiesToObject:v10 persistentID:a4 row:a5 error:a6];

  if (a4)
  {
    uint64_t v12 = HDSQLiteColumnWithNameAsInt64();
    id v112 = v10;
    [v10 _setPrescriptionType:v12];
    v13 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"left_sphere");
    v14 = [MEMORY[0x1E4F2B618] diopterUnit];
    uint64_t v15 = -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v13, v14);

    v16 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"right_sphere");
    v17 = [MEMORY[0x1E4F2B618] diopterUnit];
    uint64_t v18 = -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v16, v17);

    v19 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"left_cylinder");
    v20 = [MEMORY[0x1E4F2B618] diopterUnit];
    v111 = -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v19, v20);

    v21 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"right_cylinder");
    v22 = [MEMORY[0x1E4F2B618] diopterUnit];
    v110 = -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v21, v22);

    v23 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"left_axis");
    v24 = [MEMORY[0x1E4F2B618] radianAngleUnit];
    v109 = -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v23, v24);

    v25 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"right_axis");
    v26 = [MEMORY[0x1E4F2B618] radianAngleUnit];
    v108 = -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v25, v26);

    v27 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"left_add_power");
    v28 = [MEMORY[0x1E4F2B618] diopterUnit];
    v107 = -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v27, v28);

    v29 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"right_add_power");
    v30 = [MEMORY[0x1E4F2B618] diopterUnit];
    v31 = -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v29, v30);

    if (!(v15 | v18))
    {
      BOOL v32 = 1;
LABEL_35:

      goto LABEL_36;
    }
    if (v12 == 2)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v33 = v10;
        uint64_t v64 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"left_base_curve");
        v65 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"right_base_curve");
        v102 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"left_contact_diameter");
        v66 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"right_contact_diameter");
        v98 = HDSQLiteColumnWithNameAsString();
        v100 = v65;
        v106 = (void *)v64;
        if (v15)
        {
          uint64_t v96 = v15;
          id v67 = objc_alloc(MEMORY[0x1E4F2AE30]);
          [MEMORY[0x1E4F2B618] meterUnit];
          v68 = v104 = v33;
          v69 = -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v106, v68);
          [MEMORY[0x1E4F2B618] meterUnit];
          v71 = v70 = v66;
          v72 = -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v102, v71);
          v73 = (void *)[v67 initWithSphere:v96 cylinder:v111 axis:v109 addPower:v107 baseCurve:v69 diameter:v72];

          v66 = v70;
          v65 = v100;

          id v33 = v104;
          [v104 _setLeftEyeSpecification:v73];

          uint64_t v15 = v96;
        }
        if (v18)
        {
          id v74 = objc_alloc(MEMORY[0x1E4F2AE30]);
          [MEMORY[0x1E4F2B618] meterUnit];
          v75 = v105 = v66;
          v76 = -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v65, v75);
          v77 = [MEMORY[0x1E4F2B618] meterUnit];
          -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v105, v77);
          v79 = v78 = v33;
          v80 = (void *)[v74 initWithSphere:v18 cylinder:v110 axis:v108 addPower:v31 baseCurve:v76 diameter:v79];

          id v33 = v78;
          v65 = v100;

          v66 = v105;
          [v78 _setRightEyeSpecification:v80];
        }
        [v33 _setBrand:v98];

        BOOL v32 = 1;
        goto LABEL_25;
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Expected a contacts prescription");
      id v81 = (id)objc_claimAutoreleasedReturnValue();
      if (v81)
      {
        if (!a6) {
          goto LABEL_29;
        }
        goto LABEL_32;
      }
    }
    else
    {
      if (v12 != 1)
      {
        BOOL v32 = 1;
        goto LABEL_35;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v33 = v10;
        v106 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"left_vertex_distance");
        uint64_t v34 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"right_vertex_distance");
        uint64_t v35 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"left_prism_amount");
        v99 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"right_prism_amount");
        uint64_t v36 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"left_prism_angle");
        v97 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"right_prism_angle");
        v94 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"left_far_pupillary_distance");
        v37 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"right_far_pupillary_distance");
        v93 = -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"left_near_pupillary_distance");
        -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, @"right_near_pupillary_distance");
        v95 = 0;
        v101 = v37;
        v103 = v33;
        v90 = (void *)v36;
        v89 = v91 = (void *)v35;
        if (v35 && v36)
        {
          id v38 = objc_alloc(MEMORY[0x1E4F2B708]);
          v39 = [MEMORY[0x1E4F2B618] prismDiopterUnit];
          v40 = -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v91, v39);
          v41 = [MEMORY[0x1E4F2B618] radianAngleUnit];
          v42 = -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v90, v41);
          v95 = (void *)[v38 initWithAmount:v40 angle:v42 eye:1];

          id v33 = v103;
          v37 = v101;
        }
        v43 = 0;
        v92 = (void *)v34;
        if (v99 && v97)
        {
          id v44 = objc_alloc(MEMORY[0x1E4F2B708]);
          v45 = [MEMORY[0x1E4F2B618] prismDiopterUnit];
          v46 = -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v99, v45);
          v47 = [MEMORY[0x1E4F2B618] radianAngleUnit];
          v48 = -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v97, v47);
          v43 = (void *)[v44 initWithAmount:v46 angle:v48 eye:2];

          id v33 = v103;
          v37 = v101;
        }
        if (v15)
        {
          id v84 = objc_alloc(MEMORY[0x1E4F2B080]);
          v86 = [MEMORY[0x1E4F2B618] meterUnit];
          v83 = -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v106, v86);
          v49 = [MEMORY[0x1E4F2B618] meterUnit];
          v50 = -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v94, v49);
          v51 = [MEMORY[0x1E4F2B618] meterUnit];
          -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v93, v51);
          v53 = v52 = v43;
          v54 = (void *)[v84 initWithSphere:v15 cylinder:v111 axis:v109 addPower:v107 vertexDistance:v83 prism:v95 farPupillaryDistance:v50 nearPupillaryDistance:v53];

          v43 = v52;
          id v33 = v103;

          v37 = v101;
          [v103 _setLeftEyeSpecification:v54];
        }
        v55 = v92;
        v56 = v89;
        if (v18)
        {
          id v87 = objc_alloc(MEMORY[0x1E4F2B080]);
          v85 = [MEMORY[0x1E4F2B618] meterUnit];
          v57 = -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v92, v85);
          v58 = [MEMORY[0x1E4F2B618] meterUnit];
          v59 = -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v101, v58);
          v60 = [MEMORY[0x1E4F2B618] meterUnit];
          v61 = -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v89, v60);
          uint64_t v62 = [v87 initWithSphere:v18 cylinder:v110 axis:v108 addPower:v31 vertexDistance:v57 prism:v43 farPupillaryDistance:v59 nearPupillaryDistance:v61];
          v88 = v43;
          v63 = (void *)v62;

          v56 = v89;
          id v33 = v103;

          v37 = v101;
          v55 = v92;

          [v103 _setRightEyeSpecification:v63];
          v43 = v88;
        }

        BOOL v32 = 1;
        id v10 = v112;
LABEL_25:
        id v81 = v106;
LABEL_34:

        goto LABEL_35;
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Expected a glasses prescription");
      id v81 = (id)objc_claimAutoreleasedReturnValue();
      if (v81)
      {
        if (!a6)
        {
LABEL_29:
          _HKLogDroppedError();
          BOOL v32 = 0;
          id v33 = v81;
          goto LABEL_34;
        }
LABEL_32:
        id v81 = v81;
        BOOL v32 = 0;
        *a6 = v81;
        id v33 = v81;
        goto LABEL_34;
      }
    }
    id v33 = 0;
    BOOL v32 = 0;
    goto LABEL_34;
  }
  BOOL v32 = 0;
LABEL_36:

  return v32;
}

@end