@interface CAFCharacteristicMetadata
- (CAFCharacteristicMetadata)initWithConfig:(id)a3;
- (NSArray)validValues;
- (NSNumber)maximumLength;
- (NSNumber)maximumValue;
- (NSNumber)minimumValue;
- (NSNumber)stepValue;
- (NSNumber)units;
- (NSString)formatString;
- (unint64_t)format;
@end

@implementation CAFCharacteristicMetadata

- (NSString)formatString
{
  unint64_t v2 = [(CAFCharacteristicMetadata *)self format];
  return (NSString *)NSStringFromCharacteristicMetadataFormat(v2);
}

- (CAFCharacteristicMetadata)initWithConfig:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CAFCharacteristicMetadata;
  v5 = [(CAFCharacteristicMetadata *)&v29 init];
  if (v5)
  {
    objc_opt_class();
    id v6 = [v4 objectForKeyedSubscript:@"format"];
    if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    if (v7)
    {
      v5->_format = [v7 unsignedIntValue];
      objc_opt_class();
      id v8 = [v4 objectForKeyedSubscript:@"minimumValue"];
      if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
        v9 = (NSNumber *)v8;
      }
      else {
        v9 = 0;
      }

      minimumValue = v5->_minimumValue;
      v5->_minimumValue = v9;

      objc_opt_class();
      id v11 = [v4 objectForKeyedSubscript:@"maximumValue"];
      if (v11 && (objc_opt_isKindOfClass() & 1) != 0) {
        v12 = (NSNumber *)v11;
      }
      else {
        v12 = 0;
      }

      maximumValue = v5->_maximumValue;
      v5->_maximumValue = v12;

      objc_opt_class();
      id v14 = [v4 objectForKeyedSubscript:@"maximumLength"];
      if (v14 && (objc_opt_isKindOfClass() & 1) != 0) {
        v15 = (NSNumber *)v14;
      }
      else {
        v15 = 0;
      }

      maximumLength = v5->_maximumLength;
      v5->_maximumLength = v15;

      objc_opt_class();
      id v17 = [v4 objectForKeyedSubscript:@"stepValue"];
      if (v17 && (objc_opt_isKindOfClass() & 1) != 0) {
        v18 = (NSNumber *)v17;
      }
      else {
        v18 = 0;
      }

      stepValue = v5->_stepValue;
      v5->_stepValue = v18;

      objc_opt_class();
      id v20 = [v4 objectForKeyedSubscript:@"validValues"];
      if (v20 && (objc_opt_isKindOfClass() & 1) != 0) {
        v21 = (NSArray *)v20;
      }
      else {
        v21 = 0;
      }

      validValues = v5->_validValues;
      v5->_validValues = v21;

      objc_opt_class();
      id v23 = [v4 objectForKeyedSubscript:@"units"];
      if (v23 && (objc_opt_isKindOfClass() & 1) != 0) {
        v24 = (NSNumber *)v23;
      }
      else {
        v24 = 0;
      }

      units = v5->_units;
      v5->_units = v24;

      switch(v5->_format)
      {
        case 1uLL:
        case 2uLL:
        case 3uLL:
        case 4uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
        case 8uLL:
        case 9uLL:
          if (v5->_minimumValue && v5->_maximumValue && v5->_stepValue) {
            goto LABEL_50;
          }
          v26 = CAFCharacteristicLogging();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            -[CAFCharacteristicMetadata initWithConfig:]();
          }
          goto LABEL_39;
        case 0xAuLL:
          if (v5->_maximumLength) {
            goto LABEL_50;
          }
          v26 = CAFCharacteristicLogging();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            -[CAFCharacteristicMetadata initWithConfig:].cold.4();
          }
          goto LABEL_39;
        case 0xBuLL:
          if (v5->_maximumLength) {
            goto LABEL_50;
          }
          v26 = CAFCharacteristicLogging();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            -[CAFCharacteristicMetadata initWithConfig:].cold.5();
          }
          goto LABEL_39;
        case 0xCuLL:
          if (v5->_maximumLength) {
            goto LABEL_50;
          }
          v26 = CAFCharacteristicLogging();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            -[CAFCharacteristicMetadata initWithConfig:]();
          }
          goto LABEL_39;
        case 0xDuLL:
          if (v5->_maximumLength) {
            goto LABEL_50;
          }
          v26 = CAFCharacteristicLogging();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            -[CAFCharacteristicMetadata initWithConfig:].cold.6();
          }
          goto LABEL_39;
        default:
LABEL_50:

          goto LABEL_51;
      }
    }
    v26 = CAFCharacteristicLogging();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[CAFCharacteristicMetadata initWithConfig:]();
    }
LABEL_39:

    v27 = 0;
  }
  else
  {
LABEL_51:
    v27 = v5;
  }

  return v27;
}

- (unint64_t)format
{
  return self->_format;
}

- (NSNumber)minimumValue
{
  return self->_minimumValue;
}

- (NSNumber)maximumValue
{
  return self->_maximumValue;
}

- (NSNumber)maximumLength
{
  return self->_maximumLength;
}

- (NSNumber)stepValue
{
  return self->_stepValue;
}

- (NSArray)validValues
{
  return self->_validValues;
}

- (NSNumber)units
{
  return self->_units;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_units, 0);
  objc_storeStrong((id *)&self->_validValues, 0);
  objc_storeStrong((id *)&self->_stepValue, 0);
  objc_storeStrong((id *)&self->_maximumLength, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
}

- (void)initWithConfig:.cold.1()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4_0(&dword_249710000, v0, v1, "Parsing characteristic metadata failed for format", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:.cold.2()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4_0(&dword_249710000, v0, v1, "Parsing characteristic metadata failed for dictionary format constraints", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:.cold.3()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4_0(&dword_249710000, v0, v1, "Parsing characteristic metadata failed for number format constraints", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:.cold.4()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4_0(&dword_249710000, v0, v1, "Parsing characteristic metadata failed for string format constraints", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:.cold.5()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4_0(&dword_249710000, v0, v1, "Parsing characteristic metadata failed for data format constraints", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:.cold.6()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4_0(&dword_249710000, v0, v1, "Parsing characteristic metadata failed for array format constraints", v2, v3, v4, v5, v6);
}

@end