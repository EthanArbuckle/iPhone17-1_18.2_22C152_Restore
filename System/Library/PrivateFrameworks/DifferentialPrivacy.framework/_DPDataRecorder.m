@interface _DPDataRecorder
- (BOOL)bitStringAlgorithm;
- (BOOL)directUpload;
- (NSObject)randomizer;
- (NSString)keyName;
- (_DPDataRecorder)init;
- (_DPDataRecorder)initWithKey:(id)a3;
- (_DPKeyProperties)keyProperties;
- (double)privacyParameter;
- (id)description;
- (unint64_t)fragmentWidth;
- (unint64_t)range;
@end

@implementation _DPDataRecorder

- (_DPDataRecorder)init
{
  return 0;
}

- (_DPDataRecorder)initWithKey:(id)a3
{
  id v5 = a3;
  v46.receiver = self;
  v46.super_class = (Class)_DPDataRecorder;
  v6 = [(_DPDataRecorder *)&v46 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_18;
  }
  objc_storeStrong((id *)&v6->_keyName, a3);
  uint64_t v8 = +[_DPKeyNames keyPropertiesForKey:v5];
  keyProperties = v7->_keyProperties;
  v7->_keyProperties = (_DPKeyProperties *)v8;

  v10 = v7->_keyProperties;
  if (!v10)
  {
    v13 = +[_DPLog framework];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_DPDataRecorder initWithKey:]((uint64_t)v5, v13, v20, v21, v22, v23, v24, v25);
    }
    goto LABEL_8;
  }
  v11 = [(_DPKeyProperties *)v10 privacyParameter];
  [v11 doubleValue];
  v7->_double privacyParameter = v12;

  if (!isInvalidEpsilon(v7->_privacyParameter))
  {
    v27 = [(_DPKeyProperties *)v7->_keyProperties possibleRange];
    v28 = [v27 range];
    v7->_range = [v28 unsignedIntegerValue];

    if (!v7->_range) {
      v7->_range = 200;
    }
    v7->_fragmentWidth = [(_DPKeyProperties *)v7->_keyProperties fragmentWidth];
    v7->_bitStringAlgorithm = [(_DPKeyProperties *)v7->_keyProperties bitStringAlgorithm];
    v7->_directUpload = [(_DPKeyProperties *)v7->_keyProperties directUpload];
    uint64_t v29 = [(_DPKeyProperties *)v7->_keyProperties dataAlgorithm];
    if ((unint64_t)(v29 - 2) >= 3)
    {
      if (v29 != 1) {
        goto LABEL_17;
      }
      uint64_t v37 = +[_DPStringRandomizer numbersRandomizerWithEpsilon:[(_DPKeyProperties *)v7->_keyProperties privatizationAlgorithm] privatizationAlgorithm:[(_DPKeyProperties *)v7->_keyProperties dataAlgorithm] dataAlgorithm:v7->_range range:v7->_privacyParameter];
      randomizer = v7->_randomizer;
      v7->_randomizer = v37;
    }
    else
    {
      double privacyParameter = v7->_privacyParameter;
      uint64_t v31 = [(_DPKeyProperties *)v7->_keyProperties privatizationAlgorithm];
      uint64_t v32 = [(_DPKeyProperties *)v7->_keyProperties dataAlgorithm];
      v33 = [(_DPKeyProperties *)v7->_keyProperties parameterDictionary];
      v34 = [(_DPKeyProperties *)v7->_keyProperties huffmanTableClass];
      uint64_t v35 = +[_DPStringRandomizer stringRandomizerWithEpsilon:v31 privatizationAlgorithm:v32 dataAlgorithm:v33 algorithmParameters:v34 huffmanTableClass:privacyParameter];

      randomizer = v7->_randomizer;
      v7->_randomizer = v35;
    }

LABEL_17:
    if (!v7->_randomizer)
    {
      v39 = +[_DPLog framework];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        -[_DPDataRecorder initWithKey:]((uint64_t)&v7->_keyProperties, v39, v40, v41, v42, v43, v44, v45);
      }

      goto LABEL_9;
    }
LABEL_18:
    v26 = v7;
    goto LABEL_19;
  }
  v13 = +[_DPLog framework];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[_DPDataRecorder initWithKey:]((uint64_t)&v7->_privacyParameter, v13, v14, v15, v16, v17, v18, v19);
  }
LABEL_8:

LABEL_9:
  v26 = 0;
LABEL_19:

  return v26;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"%@: { keyName=%@ ; keyProperties=%@ }",
    v5,
    self->_keyName,
  v6 = self->_keyProperties);

  return v6;
}

- (NSObject)randomizer
{
  return self->_randomizer;
}

- (double)privacyParameter
{
  return self->_privacyParameter;
}

- (unint64_t)range
{
  return self->_range;
}

- (unint64_t)fragmentWidth
{
  return self->_fragmentWidth;
}

- (BOOL)bitStringAlgorithm
{
  return self->_bitStringAlgorithm;
}

- (BOOL)directUpload
{
  return self->_directUpload;
}

- (NSString)keyName
{
  return self->_keyName;
}

- (_DPKeyProperties)keyProperties
{
  return self->_keyProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyProperties, 0);
  objc_storeStrong((id *)&self->_keyName, 0);
  objc_storeStrong((id *)&self->_randomizer, 0);
}

- (void)initWithKey:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DC55E000, a2, a3, "Cannot load key property for key = %@", a5, a6, a7, a8, 2u);
}

- (void)initWithKey:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DC55E000, a2, a3, "Invalid epsilon = %f", a5, a6, a7, a8, 0);
}

- (void)initWithKey:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DC55E000, a2, a3, "Cannot create _randomizer for _keyProperties = %@", a5, a6, a7, a8, 2u);
}

@end