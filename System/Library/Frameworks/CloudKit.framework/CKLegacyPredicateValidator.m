@interface CKLegacyPredicateValidator
- (BOOL)validate:(id)a3 error:(id *)a4;
- (BOOL)validateBasicOperatorPredicate:(id)a3;
- (BOOL)validateBeginsWithPredicate:(id)a3;
- (BOOL)validateBetweenPredicate:(id)a3;
- (BOOL)validateContainsAllInPredicate:(id)a3;
- (BOOL)validateContainsAnyPredicate:(id)a3;
- (BOOL)validateContainsPredicate:(id)a3;
- (BOOL)validateFullTextSearchPredicate:(id)a3;
- (BOOL)validateInPredicate:(id)a3;
- (BOOL)validateNearPredicate:(id)a3;
- (unint64_t)_comparisonOptionForString:(id)a3;
- (void)validate:(id)a3;
- (void)validateComparisonPredicate:(id)a3;
- (void)validateCompoundPredicate:(id)a3;
@end

@implementation CKLegacyPredicateValidator

- (BOOL)validate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_msgSend_validate_(self, v6, (uint64_t)v5, v7);

  return 1;
}

- (void)validate:(id)a3
{
  id v12 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend_validateCompoundPredicate_(self, v4, (uint64_t)v12, v5);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend_validateComparisonPredicate_(self, v6, (uint64_t)v12, v7);
    }
    else
    {
      v8 = objc_msgSend_predicateWithValue_(MEMORY[0x1E4F28F60], v6, 1, v7);
      char isEqual = objc_msgSend_isEqual_(v12, v9, (uint64_t)v8, v10);

      if ((isEqual & 1) == 0) {
        objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], (const char *)v12, *MEMORY[0x1E4F1C3C8], @"Invalid predicate: %@", v12);
      }
    }
  }
}

- (void)validateCompoundPredicate:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_compoundPredicateType(v4, v5, v6, v7) != 1)
  {
    if (objc_msgSend_compoundPredicateType(v4, v8, v9, v10))
    {
      v27 = [CKException alloc];
      v29 = objc_msgSend_initWithCode_format_(v27, v28, 1009, @"Unexpected expression: %@", v4);
    }
    else
    {
      v22 = objc_msgSend_subpredicates(v4, v19, v20, v21);
      v11 = objc_msgSend_objectAtIndexedSubscript_(v22, v23, 0, v24);

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend_validate_(self, v25, (uint64_t)v11, v26);
        goto LABEL_13;
      }
      v30 = [CKException alloc];
      v29 = objc_msgSend_initWithCode_format_(v30, v31, 1009, @"Expected comparison subpredicate: %@", v4);
    }
    objc_exception_throw(v29);
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v11 = objc_msgSend_subpredicates(v4, v8, v9, v10);
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v32, (uint64_t)v36, 16);
  if (v13)
  {
    uint64_t v16 = v13;
    uint64_t v17 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend_validate_(self, v14, *(void *)(*((void *)&v32 + 1) + 8 * i), v15);
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v32, (uint64_t)v36, 16);
    }
    while (v16);
  }
LABEL_13:
}

- (void)validateComparisonPredicate:(id)a3
{
  uint64_t v26 = (char *)a3;
  if ((objc_msgSend_validateFullTextSearchPredicate_(self, v4, (uint64_t)v26, v5) & 1) == 0)
  {
    if (objc_msgSend_options(v26, v6, v7, v8))
    {
      v25 = objc_msgSend_initWithCode_format_([CKException alloc], v26, 1009, @"Predicate comparison options are not supported for expression: %@", v26);
    }
    else
    {
      if ((objc_msgSend_validateNearPredicate_(self, v9, (uint64_t)v26, v10) & 1) != 0
        || (objc_msgSend_validateContainsPredicate_(self, v11, (uint64_t)v26, v12) & 1) != 0
        || (objc_msgSend_validateInPredicate_(self, v13, (uint64_t)v26, v14) & 1) != 0
        || (objc_msgSend_validateContainsAnyPredicate_(self, v15, (uint64_t)v26, v16) & 1) != 0
        || (objc_msgSend_validateContainsAllInPredicate_(self, v17, (uint64_t)v26, v18) & 1) != 0
        || (objc_msgSend_validateBeginsWithPredicate_(self, v19, (uint64_t)v26, v20) & 1) != 0
        || (objc_msgSend_validateBetweenPredicate_(self, v21, (uint64_t)v26, v22) & 1) != 0
        || (objc_msgSend_validateBasicOperatorPredicate_(self, v23, (uint64_t)v26, v24) & 1) != 0)
      {
        goto LABEL_11;
      }
      v25 = objc_msgSend_initWithCode_format_([CKException alloc], v26, 1009, @"Unexpected expression: %@", v26);
    }
    objc_exception_throw(v25);
  }
LABEL_11:
}

- (BOOL)validateNearPredicate:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_comparisonPredicateModifier(v4, v5, v6, v7)) {
    goto LABEL_2;
  }
  uint64_t v12 = objc_msgSend_leftExpression(v4, v8, v9, v10);
  if (objc_msgSend_expressionType(v12, v13, v14, v15) == 4)
  {
    v19 = objc_msgSend_leftExpression(v4, v16, v17, v18);
    v23 = objc_msgSend_function(v19, v20, v21, v22);
    int isEqualToString = objc_msgSend_isEqualToString_(v23, v24, @"distanceToLocation:fromLocation:", v25);

    if (isEqualToString)
    {
      if (!objc_msgSend_predicateOperatorType(v4, v27, v28, v29)
        || objc_msgSend_predicateOperatorType(v4, v30, v31, v32) == 1)
      {
        long long v33 = objc_msgSend_rightExpression(v4, v30, v31, v32);
        uint64_t v37 = objc_msgSend_expressionType(v33, v34, v35, v36);

        if (v37)
        {
          v124 = [CKException alloc];
          v119 = objc_msgSend_initWithCode_format_(v124, v125, 1009, @"Expected search radius on right hand side of operator: %@", v4);
          goto LABEL_39;
        }
        v41 = objc_msgSend_leftExpression(v4, v38, v39, v40);
        goto LABEL_16;
      }
      goto LABEL_37;
    }
  }
  else
  {
  }
  v45 = objc_msgSend_rightExpression(v4, v27, v28, v29);
  if (objc_msgSend_expressionType(v45, v46, v47, v48) != 4)
  {
    BOOL v11 = 0;
LABEL_31:

    goto LABEL_32;
  }
  v52 = objc_msgSend_rightExpression(v4, v49, v50, v51);
  v56 = objc_msgSend_function(v52, v53, v54, v55);
  int v59 = objc_msgSend_isEqualToString_(v56, v57, @"distanceToLocation:fromLocation:", v58);

  if (v59)
  {
    if (objc_msgSend_predicateOperatorType(v4, v60, v61, v62) != 2
      || objc_msgSend_predicateOperatorType(v4, v63, v64, v65) != 3)
    {
      v66 = objc_msgSend_leftExpression(v4, v63, v64, v65);
      uint64_t v70 = objc_msgSend_expressionType(v66, v67, v68, v69);

      if (v70)
      {
        v128 = [CKException alloc];
        v119 = objc_msgSend_initWithCode_format_(v128, v129, 1009, @"Expected search radius on left hand side of operator: %@", v4);
        goto LABEL_39;
      }
      v41 = objc_msgSend_rightExpression(v4, v71, v72, v73);
LABEL_16:
      v45 = v41;
      v74 = objc_msgSend_arguments(v41, v42, v43, v44);
      uint64_t v78 = objc_msgSend_count(v74, v75, v76, v77);

      if (v78 != 2)
      {
        v120 = [CKException alloc];
        v119 = objc_msgSend_initWithCode_format_(v120, v121, 1009, @"Expected expected 2 arguments for function distanceToLocation:fromLocation: %@", v4);
        goto LABEL_39;
      }
      v82 = objc_msgSend_arguments(v45, v79, v80, v81);
      v85 = objc_msgSend_objectAtIndexedSubscript_(v82, v83, 0, v84);

      v89 = objc_msgSend_arguments(v45, v86, v87, v88);
      v92 = objc_msgSend_objectAtIndexedSubscript_(v89, v90, 1, v91);

      uint64_t v99 = objc_msgSend_expressionType(v85, v93, v94, v95);
      if (v99 == 3)
      {
        uint64_t v100 = objc_msgSend_keyPath(v85, v96, v97, v98);
        if (!v100) {
          goto LABEL_35;
        }
        v3 = (void *)v100;
        if (objc_msgSend_expressionType(v92, v101, v102, v103) != 3)
        {

LABEL_26:
          uint64_t v111 = objc_msgSend_expressionType(v85, v104, v105, v106);
          v112 = v85;
          if (!v111 || (uint64_t v113 = objc_msgSend_expressionType(v92, v108, v109, v110), v112 = v92, !v113))
          {
            uint64_t v114 = objc_msgSend_constantValue(v112, v108, v109, v110);
            if (v114)
            {
              v115 = (void *)v114;
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {

                BOOL v11 = 1;
                goto LABEL_31;
              }
            }
          }
          v117 = [CKException alloc];
          v119 = objc_msgSend_initWithCode_format_(v117, v118, 1009, @"Expected CLLocation argument for distanceToLocation:fromLocation:");
LABEL_39:
          objc_exception_throw(v119);
        }
      }
      else if (objc_msgSend_expressionType(v92, v96, v97, v98) != 3)
      {
        goto LABEL_26;
      }
      v107 = objc_msgSend_keyPath(v92, v104, v105, v106);

      if (v99 == 3) {
      if (v107)
      }
        goto LABEL_26;
LABEL_35:
      v122 = [CKException alloc];
      v119 = objc_msgSend_initWithCode_format_(v122, v123, 1009, @"Expected NSKeyPathExpressionType argument for distanceToLocation:fromLocation:");
      goto LABEL_39;
    }
LABEL_37:
    v126 = [CKException alloc];
    v119 = objc_msgSend_initWithCode_format_(v126, v127, 1009, @"Searching for locations outside of a specified circular area is not supported");
    goto LABEL_39;
  }
LABEL_2:
  BOOL v11 = 0;
LABEL_32:

  return v11;
}

- (BOOL)validateContainsPredicate:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_predicateOperatorType(v3, v4, v5, v6) != 10
    || objc_msgSend_comparisonPredicateModifier(v3, v7, v8, v9))
  {
LABEL_6:
    if (objc_msgSend_predicateOperatorType(v3, v7, v8, v9) == 99
      && !objc_msgSend_comparisonPredicateModifier(v3, v22, v23, v24))
    {
      uint64_t v25 = objc_msgSend_leftExpression(v3, v22, v23, v24);
      if (objc_msgSend_expressionType(v25, v26, v27, v28) == 3)
      {
        uint64_t v32 = objc_msgSend_rightExpression(v3, v29, v30, v31);
        uint64_t v36 = objc_msgSend_expressionType(v32, v33, v34, v35);

        if (!v36) {
          goto LABEL_16;
        }
      }
      else
      {
      }
    }
    if (objc_msgSend_predicateOperatorType(v3, v22, v23, v24) == 4
      && objc_msgSend_comparisonPredicateModifier(v3, v37, v38, v39) == 2)
    {
      uint64_t v43 = objc_msgSend_leftExpression(v3, v40, v41, v42);
      if (objc_msgSend_expressionType(v43, v44, v45, v46) == 3)
      {
        uint64_t v50 = objc_msgSend_rightExpression(v3, v47, v48, v49);
        uint64_t v54 = objc_msgSend_expressionType(v50, v51, v52, v53);

        if (!v54) {
          goto LABEL_16;
        }
      }
      else
      {
      }
    }
    BOOL v55 = 0;
    goto LABEL_19;
  }
  uint64_t v10 = objc_msgSend_leftExpression(v3, v7, v8, v9);
  if (objc_msgSend_expressionType(v10, v11, v12, v13))
  {

    goto LABEL_6;
  }
  uint64_t v17 = objc_msgSend_rightExpression(v3, v14, v15, v16);
  uint64_t v21 = objc_msgSend_expressionType(v17, v18, v19, v20);

  if (v21 != 3) {
    goto LABEL_6;
  }
LABEL_16:
  BOOL v55 = 1;
LABEL_19:

  return v55;
}

- (BOOL)validateInPredicate:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_predicateOperatorType(v3, v4, v5, v6) != 10
    || objc_msgSend_comparisonPredicateModifier(v3, v7, v8, v9))
  {
    goto LABEL_8;
  }
  uint64_t v10 = objc_msgSend_leftExpression(v3, v7, v8, v9);
  if (objc_msgSend_expressionType(v10, v11, v12, v13) != 3)
  {

    goto LABEL_8;
  }
  uint64_t v17 = objc_msgSend_rightExpression(v3, v14, v15, v16);
  uint64_t v21 = objc_msgSend_expressionType(v17, v18, v19, v20);

  if (v21)
  {
LABEL_8:
    if (objc_msgSend_predicateOperatorType(v3, v7, v8, v9) == 4
      && objc_msgSend_comparisonPredicateModifier(v3, v31, v32, v33) == 2)
    {
      uint64_t v34 = objc_msgSend_leftExpression(v3, v31, v32, v33);
      if (objc_msgSend_expressionType(v34, v35, v36, v37))
      {
      }
      else
      {
        uint64_t v41 = objc_msgSend_rightExpression(v3, v38, v39, v40);
        uint64_t v45 = objc_msgSend_expressionType(v41, v42, v43, v44);

        if (v45 == 3) {
          goto LABEL_18;
        }
      }
    }
    if (objc_msgSend_predicateOperatorType(v3, v31, v32, v33) != 99
      || objc_msgSend_comparisonPredicateModifier(v3, v46, v47, v48))
    {
      goto LABEL_20;
    }
    uint64_t v52 = objc_msgSend_leftExpression(v3, v49, v50, v51);
    if (objc_msgSend_expressionType(v52, v53, v54, v55))
    {

LABEL_20:
      BOOL v70 = 0;
      goto LABEL_21;
    }
    int v59 = objc_msgSend_rightExpression(v3, v56, v57, v58);
    uint64_t v63 = objc_msgSend_expressionType(v59, v60, v61, v62);

    if (v63 != 3) {
      goto LABEL_20;
    }
LABEL_18:
    uint64_t v64 = objc_msgSend_leftExpression(v3, v31, v32, v33);
    uint64_t v68 = objc_msgSend_CKExpressionValue(v64, v65, v66, v67);
    char v69 = sub_18B07B22C(v68);

    if ((v69 & 1) == 0)
    {
      uint64_t v72 = [CKException alloc];
      uint64_t v30 = objc_msgSend_initWithCode_format_(v72, v73, 1009, @"Expected collection on left hand side: %@", v3);
LABEL_23:
      objc_exception_throw(v30);
    }
    goto LABEL_19;
  }
  uint64_t v22 = objc_msgSend_rightExpression(v3, v7, v8, v9);
  uint64_t v26 = objc_msgSend_CKExpressionValue(v22, v23, v24, v25);
  uint64_t v27 = sub_18B07B22C(v26);

  if ((v27 & 1) == 0)
  {
    uint64_t v28 = [CKException alloc];
    uint64_t v30 = objc_msgSend_initWithCode_format_(v28, v29, 1009, @"Expected collection right hand side: %@", v3);
    goto LABEL_23;
  }
LABEL_19:
  BOOL v70 = 1;
LABEL_21:

  return v70;
}

- (BOOL)validateContainsAnyPredicate:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_predicateOperatorType(v3, v4, v5, v6) != 10
    || objc_msgSend_comparisonPredicateModifier(v3, v7, v8, v9) != 2)
  {
    goto LABEL_8;
  }
  uint64_t v10 = objc_msgSend_leftExpression(v3, v7, v8, v9);
  if (objc_msgSend_expressionType(v10, v11, v12, v13) != 3)
  {

    goto LABEL_8;
  }
  uint64_t v17 = objc_msgSend_rightExpression(v3, v14, v15, v16);
  uint64_t v21 = objc_msgSend_expressionType(v17, v18, v19, v20);

  if (v21)
  {
LABEL_8:
    if (objc_msgSend_predicateOperatorType(v3, v7, v8, v9) == 10
      && objc_msgSend_comparisonPredicateModifier(v3, v31, v32, v33) == 2)
    {
      uint64_t v37 = objc_msgSend_leftExpression(v3, v34, v35, v36);
      if (objc_msgSend_expressionType(v37, v38, v39, v40))
      {
      }
      else
      {
        uint64_t v44 = objc_msgSend_rightExpression(v3, v41, v42, v43);
        uint64_t v48 = objc_msgSend_expressionType(v44, v45, v46, v47);

        if (v48 == 3)
        {
          uint64_t v52 = objc_msgSend_leftExpression(v3, v49, v50, v51);
          v56 = objc_msgSend_CKExpressionValue(v52, v53, v54, v55);
          char v57 = sub_18B07B22C(v56);

          if ((v57 & 1) == 0)
          {
            v60 = [CKException alloc];
            uint64_t v30 = objc_msgSend_initWithCode_format_(v60, v61, 1009, @"Expected collection on left hand side: %@", v3);
LABEL_18:
            objc_exception_throw(v30);
          }
          goto LABEL_14;
        }
      }
    }
    BOOL v58 = 0;
    goto LABEL_16;
  }
  uint64_t v22 = objc_msgSend_rightExpression(v3, v7, v8, v9);
  uint64_t v26 = objc_msgSend_CKExpressionValue(v22, v23, v24, v25);
  uint64_t v27 = sub_18B07B22C(v26);

  if ((v27 & 1) == 0)
  {
    uint64_t v28 = [CKException alloc];
    uint64_t v30 = objc_msgSend_initWithCode_format_(v28, v29, 1009, @"Expected collection on right hand side: %@", v3);
    goto LABEL_18;
  }
LABEL_14:
  BOOL v58 = 1;
LABEL_16:

  return v58;
}

- (BOOL)validateContainsAllInPredicate:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_predicateOperatorType(v3, v4, v5, v6) != 10
    || objc_msgSend_comparisonPredicateModifier(v3, v7, v8, v9) != 1)
  {
    BOOL v34 = 0;
    goto LABEL_8;
  }
  uint64_t v13 = objc_msgSend_rightExpression(v3, v10, v11, v12);
  uint64_t v17 = objc_msgSend_expressionType(v13, v14, v15, v16);

  if (v17 != 3)
  {
    uint64_t v36 = [CKException alloc];
    uint64_t v38 = objc_msgSend_initWithCode_format_(v36, v37, 1009, @"Expected key-path on right hand side: %@", v3);
    goto LABEL_12;
  }
  uint64_t v21 = objc_msgSend_leftExpression(v3, v18, v19, v20);
  if (objc_msgSend_expressionType(v21, v22, v23, v24))
  {

    goto LABEL_11;
  }
  uint64_t v28 = objc_msgSend_leftExpression(v3, v25, v26, v27);
  uint64_t v32 = objc_msgSend_CKExpressionValue(v28, v29, v30, v31);
  char v33 = sub_18B07B22C(v32);

  if ((v33 & 1) == 0)
  {
LABEL_11:
    uint64_t v39 = [CKException alloc];
    uint64_t v38 = objc_msgSend_initWithCode_format_(v39, v40, 1009, @"Expected collection on left hand side: %@", v3);
LABEL_12:
    objc_exception_throw(v38);
  }
  BOOL v34 = 1;
LABEL_8:

  return v34;
}

- (BOOL)validateBeginsWithPredicate:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_predicateOperatorType(v3, v4, v5, v6) != 8) {
    goto LABEL_4;
  }
  uint64_t v10 = objc_msgSend_leftExpression(v3, v7, v8, v9);
  uint64_t v14 = objc_msgSend_expressionType(v10, v11, v12, v13);
  BOOL v18 = v14 == 3;
  if (v14 != 3)
  {
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v19 = objc_msgSend_rightExpression(v3, v15, v16, v17);
  uint64_t v23 = objc_msgSend_expressionType(v19, v20, v21, v22);

  if (v23)
  {
LABEL_4:
    BOOL v18 = 0;
    goto LABEL_8;
  }
  uint64_t v10 = objc_msgSend_rightExpression(v3, v24, v25, v26);
  uint64_t v30 = objc_msgSend_CKExpressionValue(v10, v27, v28, v29);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    goto LABEL_7;
  }
  uint64_t v35 = objc_msgSend_rightExpression(v3, v31, v32, v33);
  uint64_t v39 = objc_msgSend_CKExpressionValue(v35, v36, v37, v38);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v41 = [CKException alloc];
    id v43 = (id)objc_msgSend_initWithCode_format_(v41, v42, 1009, @"Expected NSString or NSData on right hand side: %@", v3);
    objc_exception_throw(v43);
  }
  BOOL v18 = 1;
LABEL_8:

  return v18;
}

- (BOOL)validateBetweenPredicate:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_predicateOperatorType(v3, v4, v5, v6) != 100
    || objc_msgSend_comparisonPredicateModifier(v3, v7, v8, v9))
  {
    goto LABEL_3;
  }
  uint64_t v15 = objc_msgSend_leftExpression(v3, v10, v11, v12);
  uint64_t v19 = objc_msgSend_expressionType(v15, v16, v17, v18);
  BOOL v13 = v19 == 3;
  if (v19 != 3)
  {
LABEL_12:

    goto LABEL_4;
  }
  uint64_t v23 = objc_msgSend_rightExpression(v3, v20, v21, v22);
  uint64_t v27 = objc_msgSend_expressionType(v23, v24, v25, v26);

  if (v27 == 14)
  {
    uint64_t v31 = objc_msgSend_rightExpression(v3, v28, v29, v30);
    uint64_t v15 = objc_msgSend_constantValue(v31, v32, v33, v34);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_13;
    }
    if (objc_msgSend_count(v15, v35, v36, v37) != 2) {
      goto LABEL_13;
    }
    uint64_t v40 = objc_msgSend_objectAtIndexedSubscript_(v15, v38, 0, v39);
    uint64_t v44 = objc_msgSend_CKExpressionValue(v40, v41, v42, v43);

    uint64_t v47 = objc_msgSend_objectAtIndexedSubscript_(v15, v45, 1, v46);
    uint64_t v51 = objc_msgSend_CKExpressionValue(v47, v48, v49, v50);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
LABEL_13:
      uint64_t v52 = [CKException alloc];
      id v54 = (id)objc_msgSend_initWithCode_format_(v52, v53, 1009, @"Expected array with two number arguments on right hand side: %@", v3);
      objc_exception_throw(v54);
    }

    goto LABEL_12;
  }
LABEL_3:
  BOOL v13 = 0;
LABEL_4:

  return v13;
}

- (unint64_t)_comparisonOptionForString:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_rangeOfString_(v3, v4, @"n", v5) == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend_rangeOfString_(v3, v6, @"N", v7) == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v12 = objc_msgSend_rangeOfString_(v3, v8, @"c", v9) != 0x7FFFFFFFFFFFFFFFLL
       || objc_msgSend_rangeOfString_(v3, v10, @"C", v11) != 0x7FFFFFFFFFFFFFFFLL;
    if (objc_msgSend_rangeOfString_(v3, v10, @"d", v11) != 0x7FFFFFFFFFFFFFFFLL
      || objc_msgSend_rangeOfString_(v3, v14, @"D", v15) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 |= 2uLL;
    }
    if (objc_msgSend_rangeOfString_(v3, v14, @"l", v15) != 0x7FFFFFFFFFFFFFFFLL
      || objc_msgSend_rangeOfString_(v3, v16, @"L", v17) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 |= 8uLL;
    }
  }
  else
  {
    unint64_t v12 = 4;
  }

  return v12;
}

- (BOOL)validateFullTextSearchPredicate:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_leftExpression(v4, v5, v6, v7);
  if (objc_msgSend_expressionType(v8, v9, v10, v11) == 3)
  {
    uint64_t v15 = objc_msgSend_leftExpression(v4, v12, v13, v14);
    uint64_t v19 = objc_msgSend_keyPath(v15, v16, v17, v18);
    int isEqualToString = objc_msgSend_isEqualToString_(v19, v20, @"allTokens", v21);

    if (isEqualToString)
    {
      uint64_t v26 = objc_msgSend_leftExpression(v4, v23, v24, v25);
      uint64_t v30 = objc_msgSend_rightExpression(v4, v27, v28, v29);
      goto LABEL_8;
    }
  }
  else
  {
  }
  uint64_t v34 = objc_msgSend_rightExpression(v4, v23, v24, v25);
  if (objc_msgSend_expressionType(v34, v35, v36, v37) == 3)
  {
    uint64_t v41 = objc_msgSend_rightExpression(v4, v38, v39, v40);
    uint64_t v45 = objc_msgSend_keyPath(v41, v42, v43, v44);
    int v48 = objc_msgSend_isEqualToString_(v45, v46, @"allTokens", v47);

    if (v48)
    {
      uint64_t v26 = objc_msgSend_rightExpression(v4, v49, v50, v51);
      uint64_t v30 = objc_msgSend_leftExpression(v4, v52, v53, v54);
LABEL_8:
      uint64_t v55 = v30;
      uint64_t v59 = objc_msgSend_expressionType(v30, v31, v32, v33);
      if (v59)
      {
        if (objc_msgSend_expressionType(v55, v56, v57, v58) != 4
          || (objc_msgSend_function(v55, v60, v61, v62),
              uint64_t v63 = objc_claimAutoreleasedReturnValue(),
              int v66 = objc_msgSend_isEqualToString_(v63, v64, @"tokenize:using:", v65),
              v63,
              !v66))
        {
          v130 = [CKException alloc];
          uint64_t v98 = objc_msgSend_initWithCode_format_(v130, v131, 1009, @"Required string or tokenize() arguments when searching special key-path allTokens: %@", v4);
          goto LABEL_39;
        }
        BOOL v70 = objc_msgSend_arguments(v55, v67, v68, v69);
        uint64_t v73 = objc_msgSend_objectAtIndexedSubscript_(v70, v71, 1, v72);
        uint64_t v77 = objc_msgSend_constantValue(v73, v74, v75, v76);
        char v80 = objc_msgSend__comparisonOptionForString_(self, v78, (uint64_t)v77, v79);

        if ((v80 & 0xF) != 0xBLL)
        {
          v132 = [CKException alloc];
          uint64_t v98 = objc_msgSend_initWithCode_format_(v132, v133, 1009, @"Required NSCaseInsensitivePredicateOption, NSDiacriticInsensitivePredicateOption, and NSLocaleSensitivePredicateOption tokenization options on tokenize() function: %@", v4);
          goto LABEL_39;
        }
        uint64_t v84 = objc_msgSend_arguments(v55, v81, v82, v83);
        uint64_t v87 = objc_msgSend_objectAtIndexedSubscript_(v84, v85, 0, v86);
        uint64_t v91 = objc_msgSend_constantValue(v87, v88, v89, v90);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          v96 = [CKException alloc];
          uint64_t v98 = objc_msgSend_initWithCode_format_(v96, v97, 1009, @"Required string argument when using tokenize(): %@", v4);
          goto LABEL_39;
        }
      }
      else
      {
        uint64_t v100 = objc_msgSend_constantValue(v55, v56, v57, v58);
        objc_opt_class();
        char v101 = objc_opt_isKindOfClass();

        if ((v101 & 1) == 0)
        {
          v140 = [CKException alloc];
          uint64_t v98 = objc_msgSend_initWithCode_format_(v140, v141, 1009, @"Required string or tokenize() arguments when comparing to special key-path allTokens: %@", v4);
          goto LABEL_39;
        }
      }
      if (objc_msgSend_comparisonPredicateModifier(v4, v93, v94, v95) == 1
        && (objc_msgSend_leftExpression(v4, v102, v103, v104),
            uint64_t v105 = objc_claimAutoreleasedReturnValue(),
            v105,
            v26 == v105))
      {
        v134 = [CKException alloc];
        uint64_t v98 = objc_msgSend_initWithCode_format_(v134, v135, 1009, @"Enumerating special key-path allTokens is not allowed: %@", v4);
      }
      else
      {
        if (objc_msgSend_predicateOperatorType(v4, v102, v103, v104) == 1000)
        {
          if (!v59
            && ((objc_msgSend_options(v4, v106, v107, v108) & 4) != 0
             || (objc_msgSend_options(v4, v109, v110, v111) & 1) == 0
             || (objc_msgSend_options(v4, v112, v113, v114) & 2) == 0
             || (objc_msgSend_options(v4, v115, v116, v117) & 8) == 0))
          {
            v118 = [CKException alloc];
            uint64_t v98 = objc_msgSend_initWithCode_format_(v118, v119, 1009, @"Required NSCaseInsensitivePredicateOption, NSDiacriticInsensitivePredicateOption, and NSLocaleSensitivePredicateOption comparison predicate options: %@", v4);
            goto LABEL_39;
          }
          goto LABEL_30;
        }
        if (objc_msgSend_predicateOperatorType(v4, v106, v107, v108) == 10)
        {
          if (objc_msgSend_expressionType(v55, v120, v121, v122))
          {
            if (objc_msgSend_comparisonPredicateModifier(v4, v123, v124, v125) == 2
              || objc_msgSend_comparisonPredicateModifier(v4, v126, v127, v128) == 1)
            {
LABEL_30:
              BOOL v99 = 1;
              goto LABEL_31;
            }
            v142 = [CKException alloc];
            uint64_t v98 = objc_msgSend_initWithCode_format_(v142, v143, 1009, @"Required predicate modifier ANY or ALL when searching special key-path allTokens: %@", v4);
          }
          else
          {
            v138 = [CKException alloc];
            uint64_t v98 = objc_msgSend_initWithCode_format_(v138, v139, 1009, @"Required tokenize() operand when searching special key-path allTokens: %@", v4);
          }
        }
        else
        {
          v136 = [CKException alloc];
          uint64_t v98 = objc_msgSend_initWithCode_format_(v136, v137, 1009, @"Required comparison operators TOKENMATCHES or IN when searching special key-path allTokens: %@", v4);
        }
      }
LABEL_39:
      objc_exception_throw(v98);
    }
  }
  else
  {
  }
  BOOL v99 = 0;
  uint64_t v26 = 0;
  uint64_t v55 = 0;
LABEL_31:

  return v99;
}

- (BOOL)validateBasicOperatorPredicate:(id)a3
{
  id v3 = a3;
  unint64_t v10 = objc_msgSend_predicateOperatorType(v3, v4, v5, v6);
  if (v10 > 5)
  {
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    goto LABEL_27;
  }
  uint64_t v11 = objc_msgSend_leftExpression(v3, v7, v8, v9);
  if (objc_msgSend_expressionType(v11, v12, v13, v14) == 3)
  {

LABEL_6:
    uint64_t v28 = objc_msgSend_leftExpression(v3, v18, v19, v20);
LABEL_11:
    uint64_t v47 = v28;
    uint64_t v21 = objc_msgSend_CKExpressionValue(v28, v29, v30, v31);

    goto LABEL_12;
  }
  uint64_t v23 = objc_msgSend_leftExpression(v3, v15, v16, v17);
  uint64_t v27 = objc_msgSend_expressionType(v23, v24, v25, v26);

  if (v27 == 1) {
    goto LABEL_6;
  }
  uint64_t v32 = objc_msgSend_rightExpression(v3, v18, v19, v20);
  if (objc_msgSend_expressionType(v32, v33, v34, v35) == 3)
  {

LABEL_10:
    uint64_t v28 = objc_msgSend_rightExpression(v3, v39, v40, v41);
    goto LABEL_11;
  }
  uint64_t v42 = objc_msgSend_rightExpression(v3, v36, v37, v38);
  uint64_t v46 = objc_msgSend_expressionType(v42, v43, v44, v45);

  if (v46 == 1) {
    goto LABEL_10;
  }
  uint64_t v21 = 0;
LABEL_12:
  int v48 = objc_msgSend_leftExpression(v3, v39, v40, v41);
  uint64_t v52 = objc_msgSend_expressionType(v48, v49, v50, v51);

  if (v52)
  {
    v56 = objc_msgSend_rightExpression(v3, v53, v54, v55);
    uint64_t v60 = objc_msgSend_expressionType(v56, v57, v58, v59);

    if (v60)
    {
      uint64_t v22 = 0;
      goto LABEL_18;
    }
    uint64_t v64 = objc_msgSend_rightExpression(v3, v61, v62, v63);
  }
  else
  {
    uint64_t v64 = objc_msgSend_leftExpression(v3, v53, v54, v55);
  }
  uint64_t v68 = v64;
  uint64_t v22 = objc_msgSend_CKExpressionValue(v64, v65, v66, v67);

LABEL_18:
  if (!v21)
  {
    uint64_t v79 = [CKException alloc];
    uint64_t v81 = objc_msgSend_initWithCode_format_(v79, v80, 1009, @"Expected key-path in comparison expression: %@", v3);
    goto LABEL_34;
  }
  if (objc_msgSend_isEqualToString_(v21, v61, @"___share", v63))
  {
    BOOL v72 = v22 != 0;
    int v73 = 1;
  }
  else
  {
    int isEqualToString = objc_msgSend_isEqualToString_(v21, v69, @"___parent", v71);
    int v73 = isEqualToString;
    BOOL v72 = v22 != 0;
    if (!v22 && (isEqualToString & 1) == 0)
    {
      uint64_t v91 = [CKException alloc];
      uint64_t v81 = objc_msgSend_initWithCode_format_(v91, v92, 1009, @"Expected constant value in comparison expression: %@", v3);
LABEL_34:
      objc_exception_throw(v81);
    }
  }
  if (objc_msgSend_comparisonPredicateModifier(v3, v69, v70, v71) == 1)
  {
    uint64_t v82 = [CKException alloc];
    uint64_t v81 = objc_msgSend_initWithCode_format_(v82, v83, 1009, @"Aggregate operator ALL not allowed for comparison expression: %@", v3);
    goto LABEL_34;
  }
  if (objc_msgSend_comparisonPredicateModifier(v3, v75, v76, v77) == 2)
  {
    uint64_t v84 = [CKException alloc];
    uint64_t v81 = objc_msgSend_initWithCode_format_(v84, v85, 1009, @"Aggregate operator ANY not allowed for comparison expression: %@", v3);
    goto LABEL_34;
  }
  if (!CKValueIsAcceptablePredicateClass(v22) && v72 | v73 ^ 1)
  {
    uint64_t v86 = [CKException alloc];
    uint64_t v87 = (objc_class *)objc_opt_class();
    uint64_t v88 = NSStringFromClass(v87);
    id v90 = (id)objc_msgSend_initWithCode_format_(v86, v89, 1009, @"Type '%@' not allowed in comparison expression: %@", v88, v3);

    objc_exception_throw(v90);
  }
LABEL_27:

  return v10 < 6;
}

@end