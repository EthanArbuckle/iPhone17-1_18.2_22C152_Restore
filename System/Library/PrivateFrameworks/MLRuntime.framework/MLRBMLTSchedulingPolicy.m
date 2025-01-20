@interface MLRBMLTSchedulingPolicy
+ (BOOL)supportsSecureCoding;
- (BOOL)dodMLRequireDESRecordStore;
- (MLRBMLTSchedulingPolicy)initWithCoder:(id)a3;
- (MLRBMLTSchedulingPolicy)initWithDictionary:(id)a3;
- (MLRBMLTSchedulingPolicy)initWithTRIPBStruct:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)dodMLPredicate;
- (NSString)attachmentsFactorName;
- (NSString)recipeFactorName;
- (NSString)recipeID;
- (double)maxRunTimeInSeconds;
- (double)pluginMinGapInSeconds;
- (double)taskMinGapInSeconds;
- (id)description;
- (unint64_t)maxEvaluation;
- (unint64_t)taskCount;
- (unint64_t)taskType;
- (unint64_t)upload;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MLRBMLTSchedulingPolicy

- (MLRBMLTSchedulingPolicy)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v24 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"nil dictionary" userInfo:0];
    objc_exception_throw(v24);
  }
  v5 = v4;
  v25.receiver = self;
  v25.super_class = (Class)MLRBMLTSchedulingPolicy;
  v6 = [(MLRBMLTSchedulingPolicy *)&v25 init];
  if (!v6) {
    goto LABEL_13;
  }
  uint64_t v7 = objc_msgSend(v5, "mlr_stringValueForKey:defaultValue:", @"attachments_factor_name", @"attachments");
  v8 = (void *)*((void *)v6 + 3);
  *((void *)v6 + 3) = v7;

  uint64_t v9 = objc_msgSend(v5, "mlr_stringValueForKey:defaultValue:", @"recipe_factor_name", @"recipe");
  v10 = (void *)*((void *)v6 + 6);
  *((void *)v6 + 6) = v9;

  uint64_t v11 = objc_msgSend(v5, "mlr_stringValueForKey:defaultValue:", @"recipe_id", 0);
  v12 = (void *)*((void *)v6 + 7);
  *((void *)v6 + 7) = v11;

  objc_msgSend(v5, "mlr_doubleValueForKey:defaultValue:", @"min_gap_in_seconds", 0.0);
  *((void *)v6 + 8) = v13;
  *((void *)v6 + 9) = objc_msgSend(v5, "mlr_unsignedIntegerValueForKey:defaultValue:", @"task_type", 0);
  *((void *)v6 + 10) = objc_msgSend(v5, "mlr_unsignedIntegerValueForKey:defaultValue:", @"upload", 0);
  v14 = objc_msgSend(v5, "mlr_dictionaryValueForKey:", @"dodml");
  v15 = v14;
  if (v14)
  {
    v6[8] = objc_msgSend(v14, "mlr_BOOLValueForKey:defaultValue:", @"require_des_record_store", 1);
    uint64_t v16 = objc_msgSend(v15, "mlr_dictionaryValueForKey:", @"predicate");
    v17 = (void *)*((void *)v6 + 4);
    *((void *)v6 + 4) = v16;

    *((void *)v6 + 9) = 1;
  }
  else if (*((void *)v6 + 9) != 1)
  {
    goto LABEL_7;
  }
  *(_OWORD *)(v6 + 88) = xmmword_21C385100;
  *((void *)v6 + 13) = 3;
  *((void *)v6 + 10) = 1;
LABEL_7:
  *((void *)v6 + 5) = objc_msgSend(v5, "mlr_unsignedIntegerValueForKey:defaultValue:", @"max_evaluation");
  uint64_t v18 = *((void *)v6 + 9);
  if (v18 == 1)
  {
    if (!*((void *)v6 + 7))
    {
      v19 = [MEMORY[0x263F3A438] coreChannel];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[MLRBMLTSchedulingPolicy initWithDictionary:](v19);
      }
      goto LABEL_17;
    }
  }
  else if (!v18)
  {
    v19 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MLRBMLTSchedulingPolicy initWithDictionary:](v19);
    }
LABEL_17:

    v22 = 0;
    goto LABEL_18;
  }
  uint64_t v20 = [v5 copy];
  v21 = (void *)*((void *)v6 + 2);
  *((void *)v6 + 2) = v20;

LABEL_13:
  v22 = v6;
LABEL_18:

  return v22;
}

- (MLRBMLTSchedulingPolicy)initWithTRIPBStruct:(id)a3
{
  id v4 = objc_msgSend(a3, "mlr_dictionaryRepresentation");
  v5 = [(MLRBMLTSchedulingPolicy *)self initWithDictionary:v4];

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@(%@)", v5, self->_dictionaryRepresentation];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (MLRBMLTSchedulingPolicy)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v4, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
  uint64_t v11 = [v5 decodeObjectOfClasses:v10 forKey:@"dictionaryRepresentation"];

  v12 = [(MLRBMLTSchedulingPolicy *)self initWithDictionary:v11];
  return v12;
}

- (NSDictionary)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

- (NSString)attachmentsFactorName
{
  return self->_attachmentsFactorName;
}

- (NSDictionary)dodMLPredicate
{
  return self->_dodMLPredicate;
}

- (BOOL)dodMLRequireDESRecordStore
{
  return self->_dodMLRequireDESRecordStore;
}

- (unint64_t)maxEvaluation
{
  return self->_maxEvaluation;
}

- (NSString)recipeFactorName
{
  return self->_recipeFactorName;
}

- (NSString)recipeID
{
  return self->_recipeID;
}

- (double)taskMinGapInSeconds
{
  return self->_taskMinGapInSeconds;
}

- (unint64_t)taskType
{
  return self->_taskType;
}

- (unint64_t)upload
{
  return self->_upload;
}

- (double)maxRunTimeInSeconds
{
  return self->_maxRunTimeInSeconds;
}

- (double)pluginMinGapInSeconds
{
  return self->_pluginMinGapInSeconds;
}

- (unint64_t)taskCount
{
  return self->_taskCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipeID, 0);
  objc_storeStrong((id *)&self->_recipeFactorName, 0);
  objc_storeStrong((id *)&self->_dodMLPredicate, 0);
  objc_storeStrong((id *)&self->_attachmentsFactorName, 0);

  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);
}

- (void)initWithDictionary:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21C376000, log, OS_LOG_TYPE_ERROR, "Unknown taskType", v1, 2u);
}

- (void)initWithDictionary:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21C376000, log, OS_LOG_TYPE_ERROR, "Invalid schedulingPolicy: nil recipe_id", v1, 2u);
}

@end