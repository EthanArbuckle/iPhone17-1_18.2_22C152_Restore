@interface CKDeclarativePredicateValidator
- (BOOL)validate:(id)a3 error:(id *)a4;
- (CKDeclarativePredicateValidator)init;
@end

@implementation CKDeclarativePredicateValidator

- (CKDeclarativePredicateValidator)init
{
  v46.receiver = self;
  v46.super_class = (Class)CKDeclarativePredicateValidator;
  v2 = [(CKDeclarativePredicateValidator *)&v46 init];
  if (v2)
  {
    v3 = objc_opt_class();
    v4 = sub_18B11DA74(v3);
    v5 = sub_18B11CBD0();
    v6 = sub_18B11CC68();
    v7 = objc_opt_class();
    v8 = sub_18B11CD30(v7);
    v16 = sub_18B11CA40(v6, v9, v10, v11, v12, v13, v14, v15, v8, 0);
    v24 = sub_18B11C908(v5, v17, v18, v19, v20, v21, v22, v23, v16, 0);

    v25 = sub_18B162BCC();
    v26 = sub_18B11CD00();
    v34 = sub_18B11C908(v24, v27, v28, v29, v30, v31, v32, v33, v25, (uint64_t)v26);
    v42 = sub_18B11CA40(v4, v35, v36, v37, v38, v39, v40, v41, v34, 0);
    uint64_t v43 = sub_18B11CB78(v42);
    validator = v2->_validator;
    v2->_validator = (CKObjectValidating *)v43;
  }
  return v2;
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  char v9 = objc_msgSend_validate_error_(self->_validator, v7, (uint64_t)v6, 0);
  if ((v9 & 1) == 0) {
    objc_msgSend_validate_error_(self->_validator, v8, (uint64_t)v6, (uint64_t)a4);
  }

  return v9;
}

- (void).cxx_destruct
{
}

@end