@interface ATXComplication
+ (BOOL)supportsSecureCoding;
+ (id)complicationFromDictionaryRepresentation:(id)a3 error:(id *)a4;
+ (id)stringForComplicationSource:(int)a3;
- (ATXComplication)initWithCoder:(id)a3;
- (ATXComplication)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 containerBundleIdentifier:(id)a5 widgetFamily:(int64_t)a6 intent:(id)a7;
- (ATXComplication)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 containerBundleIdentifier:(id)a5 widgetFamily:(int64_t)a6 intent:(id)a7 source:(int)a8;
- (ATXComplication)initWithWidgetDescriptor:(id)a3 widgetFamily:(int64_t)a4 intent:(id)a5;
- (ATXComplication)initWithWidgetDescriptor:(id)a3 widgetFamily:(int64_t)a4 intent:(id)a5 source:(int)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXComplication:(id)a3;
- (BOOL)matches:(id)a3;
- (BOOL)matchesPersonality:(id)a3;
- (CHSExtensionIdentity)extensionIdentity;
- (CHSWidgetDescriptor)widgetDescriptor;
- (INIntent)intent;
- (NSString)containerBundleIdentifier;
- (NSString)description;
- (NSString)extensionBundleIdentifier;
- (NSString)kind;
- (NSString)predictionSource;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int)source;
- (int64_t)widgetFamily;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPredictionSource:(id)a3;
- (void)setScore:(double)a3;
- (void)setSource:(int)a3;
@end

@implementation ATXComplication

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXComplication)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 containerBundleIdentifier:(id)a5 widgetFamily:(int64_t)a6 intent:(id)a7 source:(int)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  v26.receiver = self;
  v26.super_class = (Class)ATXComplication;
  v18 = [(ATXComplication *)&v26 init];
  if (v18)
  {
    uint64_t v19 = [v14 copy];
    extensionBundleIdentifier = v18->_extensionBundleIdentifier;
    v18->_extensionBundleIdentifier = (NSString *)v19;

    uint64_t v21 = [v15 copy];
    kind = v18->_kind;
    v18->_kind = (NSString *)v21;

    uint64_t v23 = [v16 copy];
    containerBundleIdentifier = v18->_containerBundleIdentifier;
    v18->_containerBundleIdentifier = (NSString *)v23;

    v18->_widgetFamily = a6;
    objc_storeStrong((id *)&v18->_intent, a7);
    v18->_source = a8;
  }

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[ATXComplication allocWithZone:a3];
  v5 = [(ATXComplication *)self extensionBundleIdentifier];
  v6 = [(ATXComplication *)self kind];
  v7 = [(ATXComplication *)self containerBundleIdentifier];
  int64_t v8 = [(ATXComplication *)self widgetFamily];
  v9 = [(ATXComplication *)self intent];
  v10 = (void *)[v9 copy];
  v11 = [(ATXComplication *)v4 initWithExtensionBundleIdentifier:v5 kind:v6 containerBundleIdentifier:v7 widgetFamily:v8 intent:v10 source:[(ATXComplication *)self source]];

  [(ATXComplication *)v11 setScore:self->_score];
  [(ATXComplication *)v11 setPredictionSource:self->_predictionSource];
  return v11;
}

- (ATXComplication)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"widgetDescriptor"];
  if (!v5)
  {
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionBundleIdentifier"];
    if (v7)
    {
      int64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kind"];
      if (v8)
      {
        v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerBundleIdentifier"];
        uint64_t v10 = [v4 decodeIntegerForKey:@"widgetFamily"];
        v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intent"];
        self = -[ATXComplication initWithExtensionBundleIdentifier:kind:containerBundleIdentifier:widgetFamily:intent:source:](self, "initWithExtensionBundleIdentifier:kind:containerBundleIdentifier:widgetFamily:intent:source:", v7, v8, v9, v10, v11, [v4 decodeInt32ForKey:@"source"]);

        v6 = self;
LABEL_12:

        goto LABEL_13;
      }
      v12 = __atxlog_handle_lock_screen();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[ATXComplication initWithCoder:](v12);
      }
    }
    else
    {
      int64_t v8 = __atxlog_handle_lock_screen();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[ATXComplication initWithCoder:](v8);
      }
    }
    v6 = 0;
    goto LABEL_12;
  }
  self = -[ATXComplication initWithWidgetDescriptor:widgetFamily:intent:source:](self, "initWithWidgetDescriptor:widgetFamily:intent:source:", v5, [v4 decodeIntegerForKey:@"widgetFamily"], 0, 0);
  v6 = self;
LABEL_13:

  return v6;
}

- (int64_t)widgetFamily
{
  return self->_widgetFamily;
}

- (int)source
{
  return self->_source;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (void)setPredictionSource:(id)a3
{
}

- (NSString)kind
{
  return self->_kind;
}

- (INIntent)intent
{
  return self->_intent;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionSource, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_kind, 0);

  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
}

- (ATXComplication)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 containerBundleIdentifier:(id)a5 widgetFamily:(int64_t)a6 intent:(id)a7
{
  return [(ATXComplication *)self initWithExtensionBundleIdentifier:a3 kind:a4 containerBundleIdentifier:a5 widgetFamily:a6 intent:a7 source:0];
}

- (ATXComplication)initWithWidgetDescriptor:(id)a3 widgetFamily:(int64_t)a4 intent:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [v9 extensionBundleIdentifier];
  v11 = [v9 kind];
  v12 = [v9 extensionIdentity];

  v13 = [v12 containerBundleIdentifier];
  id v14 = [(ATXComplication *)self initWithExtensionBundleIdentifier:v10 kind:v11 containerBundleIdentifier:v13 widgetFamily:a4 intent:v8 source:0];

  return v14;
}

- (ATXComplication)initWithWidgetDescriptor:(id)a3 widgetFamily:(int64_t)a4 intent:(id)a5 source:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a5;
  id v11 = a3;
  v12 = [v11 extensionBundleIdentifier];
  v13 = [v11 kind];
  id v14 = [v11 extensionIdentity];

  id v15 = [v14 containerBundleIdentifier];
  id v16 = [(ATXComplication *)self initWithExtensionBundleIdentifier:v12 kind:v13 containerBundleIdentifier:v15 widgetFamily:a4 intent:v10 source:v6];

  return v16;
}

+ (id)complicationFromDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"extensionBundleIdentifier"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = [v5 objectForKeyedSubscript:@"extensionBundleIdentifier"];
    id v9 = [v5 objectForKeyedSubscript:@"kind"];
    objc_opt_class();
    char v10 = objc_opt_isKindOfClass();

    if (v10)
    {
      id v11 = [v5 objectForKeyedSubscript:@"kind"];
      v12 = [v5 objectForKeyedSubscript:@"containerBundleIdentifier"];
      objc_opt_class();
      char v13 = objc_opt_isKindOfClass();

      if (v13)
      {
        id v14 = [v5 objectForKeyedSubscript:@"containerBundleIdentifier"];
      }
      else
      {
        id v14 = 0;
      }
      v18 = [v5 objectForKeyedSubscript:@"widgetFamily"];
      objc_opt_class();
      char v19 = objc_opt_isKindOfClass();

      if (v19)
      {
        v20 = [v5 objectForKeyedSubscript:@"widgetFamily"];
        uint64_t v21 = CHSWidgetFamilyFromString();

        if ((CHSWidgetFamilyIsAccessory() & 1) != 0 || v21 == 1)
        {
          v27 = [v5 objectForKeyedSubscript:@"intent"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v28 = [v27 objectForKeyedSubscript:@"typeName"];
            v29 = [v27 objectForKeyedSubscript:@"parameters"];
            objc_opt_class();
            if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
            {
              v30 = (void *)[objc_alloc(MEMORY[0x1E4F938E0]) initWithTypeName:@"typeName" parameters:v29];
              v31 = [v30 createIntent];
            }
            else
            {
              v31 = 0;
            }
          }
          else
          {
            v31 = 0;
          }
          id v17 = [[ATXComplication alloc] initWithExtensionBundleIdentifier:v8 kind:v11 containerBundleIdentifier:v14 widgetFamily:v21 intent:v31 source:0];

          goto LABEL_34;
        }
        if (a4)
        {
          id v22 = [NSString alloc];
          uint64_t v23 = NSStringFromWidgetFamily();
          v24 = (void *)[v22 initWithFormat:@"missing key: provided widget family is not a complication family: %@", v23];
          errorWithDescription(v24);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

          v25 = __atxlog_handle_lock_screen();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            goto LABEL_23;
          }
          goto LABEL_24;
        }
      }
      else if (a4)
      {
        objc_super v26 = (void *)[[NSString alloc] initWithFormat:@"missing key: %@", @"widgetFamily"];
        errorWithDescription(v26);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        v25 = __atxlog_handle_lock_screen();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
LABEL_23:
        }
          +[ATXComplication complicationFromDictionaryRepresentation:error:]();
LABEL_24:
      }
      id v17 = 0;
LABEL_34:

LABEL_35:
      goto LABEL_36;
    }
    if (a4)
    {
      id v16 = (void *)[[NSString alloc] initWithFormat:@"missing key: %@", @"kind"];
      errorWithDescription(v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      id v11 = __atxlog_handle_lock_screen();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[ATXComplication complicationFromDictionaryRepresentation:error:]();
      }
      id v17 = 0;
      goto LABEL_35;
    }
  }
  else
  {
    if (!a4)
    {
      id v17 = 0;
      goto LABEL_37;
    }
    id v15 = (void *)[[NSString alloc] initWithFormat:@"missing key: %@", @"extensionBundleIdentifier"];
    errorWithDescription(v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    id v8 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[ATXComplication complicationFromDictionaryRepresentation:error:]();
    }
  }
  id v17 = 0;
LABEL_36:

LABEL_37:

  return v17;
}

- (id)dictionaryRepresentation
{
  v11[4] = *MEMORY[0x1E4F143B8];
  v10[0] = @"extensionBundleIdentifier";
  v3 = [(ATXComplication *)self extensionBundleIdentifier];
  v11[0] = v3;
  v10[1] = @"kind";
  id v4 = [(ATXComplication *)self kind];
  v11[1] = v4;
  v10[2] = @"containerBundleIdentifier";
  id v5 = [(ATXComplication *)self containerBundleIdentifier];
  uint64_t v6 = v5;
  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[2] = v6;
  v10[3] = @"widgetFamily";
  [(ATXComplication *)self widgetFamily];
  v7 = NSStringFromWidgetFamily();
  v11[3] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];

  if (!v5) {

  }
  return v8;
}

- (CHSWidgetDescriptor)widgetDescriptor
{
  id v3 = objc_alloc(MEMORY[0x1E4F58DF8]);
  id v4 = objc_alloc(MEMORY[0x1E4F58CC0]);
  id v5 = [(ATXComplication *)self extensionBundleIdentifier];
  uint64_t v6 = [(ATXComplication *)self containerBundleIdentifier];
  v7 = (void *)[v4 initWithExtensionBundleIdentifier:v5 containerBundleIdentifier:v6 deviceIdentifier:0];
  id v8 = [(ATXComplication *)self kind];
  [(ATXComplication *)self widgetFamily];
  uint64_t v9 = CHSWidgetFamilyMaskFromWidgetFamily();
  char v10 = [(ATXComplication *)self intent];
  id v11 = [v10 _className];
  v12 = (void *)[v3 initWithExtensionIdentity:v7 kind:v8 supportedFamilies:v9 intentType:v11];

  return (CHSWidgetDescriptor *)v12;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(ATXComplication *)self extensionBundleIdentifier];
  id v5 = [(ATXComplication *)self kind];
  uint64_t v6 = [(ATXComplication *)self containerBundleIdentifier];
  [(ATXComplication *)self widgetFamily];
  v7 = NSStringFromWidgetFamily();
  id v8 = [(ATXComplication *)self intent];
  uint64_t v9 = [v8 description];
  char v10 = objc_msgSend((id)objc_opt_class(), "stringForComplicationSource:", -[ATXComplication source](self, "source"));
  id v11 = (void *)[v3 initWithFormat:@"ATXComplication: extensionBundleIdentifier: %@, kind: %@, containerBundleIdentifier: %@, widgetFamily: %@, intent: %@, source:%@", v4, v5, v6, v7, v9, v10];

  return (NSString *)v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(ATXComplication *)self extensionBundleIdentifier];
  [v8 encodeObject:v4 forKey:@"extensionBundleIdentifier"];

  id v5 = [(ATXComplication *)self kind];
  [v8 encodeObject:v5 forKey:@"kind"];

  uint64_t v6 = [(ATXComplication *)self containerBundleIdentifier];
  [v8 encodeObject:v6 forKey:@"containerBundleIdentifier"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[ATXComplication widgetFamily](self, "widgetFamily"), @"widgetFamily");
  v7 = [(ATXComplication *)self intent];
  [v8 encodeObject:v7 forKey:@"intent"];

  objc_msgSend(v8, "encodeInt32:forKey:", -[ATXComplication source](self, "source"), @"source");
}

- (unint64_t)hash
{
  id v3 = [(ATXComplication *)self extensionBundleIdentifier];
  uint64_t v4 = [v3 hash];

  id v5 = [(ATXComplication *)self kind];
  uint64_t v6 = [v5 hash] - v4 + 32 * v4;

  v7 = [(ATXComplication *)self containerBundleIdentifier];
  uint64_t v8 = [v7 hash] - v6 + 32 * v6;

  return self->_widgetFamily - v8 + 32 * v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ATXComplication *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXComplication *)self isEqualToATXComplication:v5];

  return v6;
}

- (BOOL)isEqualToATXComplication:(id)a3
{
  uint64_t v4 = (id *)a3;
  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  BOOL v6 = (NSString *)v4[2];
  if (extensionBundleIdentifier == v6)
  {
  }
  else
  {
    v7 = v6;
    uint64_t v8 = extensionBundleIdentifier;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_11;
    }
  }
  kind = self->_kind;
  id v11 = (NSString *)v4[3];
  if (kind == v11)
  {
  }
  else
  {
    v12 = v11;
    char v13 = kind;
    char v14 = [(NSString *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_11;
    }
  }
  containerBundleIdentifier = self->_containerBundleIdentifier;
  id v16 = (NSString *)v4[4];
  if (containerBundleIdentifier == v16)
  {

    goto LABEL_13;
  }
  id v17 = v16;
  v18 = containerBundleIdentifier;
  char v19 = [(NSString *)v18 isEqual:v17];

  if (v19)
  {
LABEL_13:
    int64_t widgetFamily = self->_widgetFamily;
    BOOL v20 = widgetFamily == [v4 widgetFamily];
    goto LABEL_14;
  }
LABEL_11:
  BOOL v20 = 0;
LABEL_14:

  return v20;
}

+ (id)stringForComplicationSource:(int)a3
{
  if ((a3 - 1) > 5) {
    return @"unknown";
  }
  else {
    return off_1E5D09738[a3 - 1];
  }
}

- (BOOL)matchesPersonality:(id)a3
{
  id v5 = a3;
  BOOL v6 = v5;
  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  uint64_t v8 = extensionBundleIdentifier;
  if (extensionBundleIdentifier)
  {
LABEL_2:
    char v9 = [v6 extensionBundleIdentifier];
    LOBYTE(v8) = [(NSString *)v8 isEqualToString:v9];

    if (extensionBundleIdentifier) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v3 = [v5 extensionBundleIdentifier];
  if (v3)
  {
    uint64_t v8 = self->_extensionBundleIdentifier;
    if (v8) {
      goto LABEL_2;
    }
  }
  else
  {
    LOBYTE(v8) = 1;
  }
LABEL_8:

LABEL_9:
  kind = self->_kind;
  id v11 = kind;
  if (kind) {
    goto LABEL_10;
  }
  id v3 = [v6 kind];
  if (!v3)
  {
    char v13 = 1;
    goto LABEL_16;
  }
  id v11 = self->_kind;
  if (!v11)
  {
    char v13 = 0;
LABEL_16:

    goto LABEL_17;
  }
LABEL_10:
  v12 = [v6 kind];
  char v13 = [(NSString *)v11 isEqualToString:v12];

  if (!kind) {
    goto LABEL_16;
  }
LABEL_17:

  return v8 & v13;
}

- (BOOL)matches:(id)a3
{
  id v6 = a3;
  v7 = v6;
  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  char v9 = extensionBundleIdentifier;
  if (extensionBundleIdentifier)
  {
LABEL_2:
    char v10 = [v7 extensionIdentity];
    id v11 = [v10 extensionBundleIdentifier];
    LOBYTE(v9) = [(NSString *)v9 isEqualToString:v11];

    if (extensionBundleIdentifier) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v3 = [v6 extensionIdentity];
  uint64_t v4 = [v3 extensionBundleIdentifier];
  if (v4)
  {
    char v9 = self->_extensionBundleIdentifier;
    if (v9) {
      goto LABEL_2;
    }
  }
  else
  {
    LOBYTE(v9) = 1;
  }
LABEL_8:

LABEL_9:
  kind = self->_kind;
  char v13 = kind;
  if (kind) {
    goto LABEL_10;
  }
  id v3 = [v7 kind];
  if (!v3)
  {
    char v15 = 1;
    goto LABEL_16;
  }
  char v13 = self->_kind;
  if (!v13)
  {
    char v15 = 0;
LABEL_16:

    goto LABEL_17;
  }
LABEL_10:
  char v14 = [v7 kind];
  char v15 = [(NSString *)v13 isEqualToString:v14];

  if (!kind) {
    goto LABEL_16;
  }
LABEL_17:

  return v9 & v15;
}

- (CHSExtensionIdentity)extensionIdentity
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F58CC0]) initWithExtensionBundleIdentifier:self->_extensionBundleIdentifier containerBundleIdentifier:self->_containerBundleIdentifier deviceIdentifier:0];

  return (CHSExtensionIdentity *)v2;
}

- (void)setSource:(int)a3
{
  self->_source = a3;
}

- (double)score
{
  return self->_score;
}

- (NSString)predictionSource
{
  return self->_predictionSource;
}

+ (void)complicationFromDictionaryRepresentation:error:.cold.1()
{
  OUTLINED_FUNCTION_2_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_5(&dword_1A790D000, v0, v1, "%s: %@", v2, v3, v4, v5, 2u);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[ATXComplication initWithCoder:]";
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "%s: error decoding extensionBundleIdentifier", (uint8_t *)&v1, 0xCu);
}

- (void)initWithCoder:(os_log_t)log .cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[ATXComplication initWithCoder:]";
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "%s: error decoding kind", (uint8_t *)&v1, 0xCu);
}

@end