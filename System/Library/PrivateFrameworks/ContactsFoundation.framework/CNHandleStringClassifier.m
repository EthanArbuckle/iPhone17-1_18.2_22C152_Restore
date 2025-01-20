@interface CNHandleStringClassifier
+ (id)classificationOfHandleStrings:(id)a3;
+ (id)classificationOfHandleStrings:(id)a3 classificationQuality:(unint64_t)a4;
+ (id)classificationStrategyForQuality:(unint64_t)a3;
- (CNHandleStringClassifier)init;
- (CNHandleStringClassifier)initWithClassificationQuality:(unint64_t)a3;
- (CNHandleStringClassifier)initWithClassificationStrategy:(id)a3;
- (_CNHandleStringClassificationStrategy)classificationStrategy;
- (id)description;
- (unint64_t)typeOfHandleString:(id)a3;
- (void)classifyHandleString:(id)a3 builder:(id)a4;
@end

@implementation CNHandleStringClassifier

uint64_t __80__CNHandleStringClassifier_classificationOfHandleStrings_classificationQuality___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) classifyHandleString:a2 builder:*(void *)(a1 + 40)];
}

- (void)classifyHandleString:(id)a3 builder:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (!off_1EE025420((uint64_t)&__block_literal_global_119, v8))
  {
    unint64_t v7 = [(CNHandleStringClassifier *)self typeOfHandleString:v8];
    if (v7 == 2)
    {
      [v6 addPhoneNumber:v8];
    }
    else if (v7 == 1)
    {
      [v6 addEmailAddress:v8];
    }
    else
    {
      [v6 addUnknown:v8];
    }
  }
}

- (unint64_t)typeOfHandleString:(id)a3
{
  v4 = objc_msgSend(a3, "_cn_trimmedString");
  if (off_1EE025420((uint64_t)&__block_literal_global_119, v4)) {
    unint64_t v5 = 0;
  }
  else {
    unint64_t v5 = [(_CNHandleStringClassificationStrategy *)self->_classificationStrategy classificationOfHandleString:v4];
  }

  return v5;
}

+ (id)classificationOfHandleStrings:(id)a3
{
  return (id)[a1 classificationOfHandleStrings:a3 classificationQuality:0];
}

- (void).cxx_destruct
{
}

+ (id)classificationOfHandleStrings:(id)a3 classificationQuality:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = +[CNLogging apiUsageLog];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[CNHandleStringClassifier classificationOfHandleStrings:classificationQuality:].cold.4(v7);
  }

  id v8 = +[CNLogging apiUsageLog];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[CNHandleStringClassifier classificationOfHandleStrings:classificationQuality:](v6, v8);
  }

  v9 = +[CNLogging apiUsageLog];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    +[CNHandleStringClassifier classificationOfHandleStrings:classificationQuality:](a4, v9);
  }

  v10 = objc_alloc_init(CNHandleStringsClassificationBuilder);
  v11 = (void *)[objc_alloc((Class)a1) initWithClassificationQuality:a4];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __80__CNHandleStringClassifier_classificationOfHandleStrings_classificationQuality___block_invoke;
  v20 = &unk_1E56A2708;
  id v12 = v11;
  id v21 = v12;
  v13 = v10;
  v22 = v13;
  objc_msgSend(v6, "_cn_each:", &v17);
  v14 = [(CNHandleStringsClassificationBuilder *)v13 build];
  v15 = +[CNLogging apiUsageLog];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    +[CNHandleStringClassifier classificationOfHandleStrings:classificationQuality:](v15);
  }

  return v14;
}

- (CNHandleStringClassifier)initWithClassificationQuality:(unint64_t)a3
{
  v4 = [(id)objc_opt_class() classificationStrategyForQuality:a3];
  unint64_t v5 = [(CNHandleStringClassifier *)self initWithClassificationStrategy:v4];

  return v5;
}

- (CNHandleStringClassifier)initWithClassificationStrategy:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    if (CNGuardOSLog_cn_once_token_0_7 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_90);
    }
    id v6 = CNGuardOSLog_cn_once_object_0_7;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT)) {
      -[CNHandleStringClassifier initWithClassificationStrategy:](v6);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)CNHandleStringClassifier;
  unint64_t v7 = [(CNHandleStringClassifier *)&v11 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_classificationStrategy, a3);
    v9 = v8;
  }

  return v8;
}

+ (id)classificationStrategyForQuality:(unint64_t)a3
{
  if (a3 == 1)
  {
    v3 = +[_CNDataDetectorsHandleStringClassificationStrategy assistedDataDetectorsStrategy];
  }
  else
  {
    v3 = objc_alloc_init(_CNRegExHandleStringClassificationStrategy);
  }

  return v3;
}

- (CNHandleStringClassifier)init
{
  return [(CNHandleStringClassifier *)self initWithClassificationQuality:0];
}

- (id)description
{
  v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"classificationStrategy" object:self->_classificationStrategy];
  id v5 = [v3 build];

  return v5;
}

- (_CNHandleStringClassificationStrategy)classificationStrategy
{
  return self->_classificationStrategy;
}

+ (void)classificationOfHandleStrings:(os_log_t)log classificationQuality:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19091D000, log, OS_LOG_TYPE_DEBUG, "< +[CNHandleStringClassifier classificationOfHandleStrings:classificationQuality:]", v1, 2u);
}

+ (void)classificationOfHandleStrings:(uint64_t)a1 classificationQuality:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_19091D000, a2, OS_LOG_TYPE_DEBUG, "   quality: %lu", (uint8_t *)&v2, 0xCu);
}

+ (void)classificationOfHandleStrings:(void *)a1 classificationQuality:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = [a1 count];
  _os_log_debug_impl(&dword_19091D000, a2, OS_LOG_TYPE_DEBUG, "   handleStrings: %lu", (uint8_t *)&v3, 0xCu);
}

+ (void)classificationOfHandleStrings:(os_log_t)log classificationQuality:.cold.4(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19091D000, log, OS_LOG_TYPE_DEBUG, "> +[CNHandleStringClassifier classificationOfHandleStrings:classificationQuality:]", v1, 2u);
}

- (void)initWithClassificationStrategy:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19091D000, log, OS_LOG_TYPE_FAULT, "parameter ‘classificationStrategy’ must be nonnull", v1, 2u);
}

@end