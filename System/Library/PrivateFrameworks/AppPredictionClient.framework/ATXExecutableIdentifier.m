@interface ATXExecutableIdentifier
+ (BOOL)supportsSecureCoding;
- (ATXExecutableIdentifier)initWithAction:(id)a3;
- (ATXExecutableIdentifier)initWithCoder:(id)a3;
- (ATXExecutableIdentifier)initWithHeroAppPrediction:(id)a3;
- (ATXExecutableIdentifier)initWithInfoSuggestion:(id)a3;
- (ATXExecutableIdentifier)initWithLinkAction:(id)a3;
- (ATXExecutableIdentifier)initWithString:(id)a3;
- (ATXSuggestionExecutableProtocol)object;
- (BOOL)isEqual:(id)a3;
- (NSString)debugTitle;
- (id)description;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXExecutableIdentifier

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXExecutableIdentifier)initWithAction:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXExecutableIdentifier;
  v6 = [(ATXExecutableIdentifier *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = 1;
    objc_storeStrong((id *)&v6->_object, a3);
    v8 = v7;
  }

  return v7;
}

- (ATXExecutableIdentifier)initWithString:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXExecutableIdentifier;
  id v5 = [(ATXExecutableIdentifier *)&v11 init];
  v6 = v5;
  if (v5)
  {
    v5->_type = 0;
    uint64_t v7 = [v4 copy];
    object = v6->_object;
    v6->_object = (ATXSuggestionExecutableProtocol *)v7;

    v9 = v6;
  }

  return v6;
}

- (ATXExecutableIdentifier)initWithHeroAppPrediction:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXExecutableIdentifier;
  v6 = [(ATXExecutableIdentifier *)&v10 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_type = 2;
    objc_storeStrong((id *)&v6->_object, a3);
    v8 = v7;
  }

  return v7;
}

- (ATXExecutableIdentifier)initWithInfoSuggestion:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXExecutableIdentifier;
  v6 = [(ATXExecutableIdentifier *)&v10 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_type = 3;
    objc_storeStrong((id *)&v6->_object, a3);
    v8 = v7;
  }

  return v7;
}

- (ATXExecutableIdentifier)initWithLinkAction:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXExecutableIdentifier;
  v6 = [(ATXExecutableIdentifier *)&v10 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_type = 4;
    objc_storeStrong((id *)&v6->_object, a3);
    v8 = v7;
  }

  return v7;
}

- (ATXExecutableIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"type"];
  switch(v5)
  {
    case 0:
      v6 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v7 = objc_opt_class();
      v8 = __atxlog_handle_default();
      v9 = [v6 robustDecodeObjectOfClass:v7 forKey:@"object" withCoder:v4 expectNonNull:1 errorDomain:@"ATXEngagementRecordManagerUtilitiesErrorDomain" errorCode:2 logHandle:v8];

      if (!v9) {
        goto LABEL_14;
      }
      objc_super v10 = [(ATXExecutableIdentifier *)self initWithString:v9];
      goto LABEL_13;
    case 1:
      v13 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v14 = objc_opt_class();
      v15 = __atxlog_handle_default();
      v9 = [v13 robustDecodeObjectOfClass:v14 forKey:@"object" withCoder:v4 expectNonNull:1 errorDomain:@"ATXEngagementRecordManagerUtilitiesErrorDomain" errorCode:1 logHandle:v15];

      if (!v9) {
        goto LABEL_14;
      }
      objc_super v10 = [(ATXExecutableIdentifier *)self initWithAction:v9];
      goto LABEL_13;
    case 2:
      v16 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v17 = objc_opt_class();
      v18 = __atxlog_handle_default();
      v9 = [v16 robustDecodeObjectOfClass:v17 forKey:@"object" withCoder:v4 expectNonNull:1 errorDomain:@"ATXEngagementRecordManagerUtilitiesErrorDomain" errorCode:3 logHandle:v18];

      if (!v9) {
        goto LABEL_14;
      }
      objc_super v10 = [(ATXExecutableIdentifier *)self initWithHeroAppPrediction:v9];
      goto LABEL_13;
    case 3:
      v19 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v20 = objc_opt_class();
      v21 = __atxlog_handle_default();
      v9 = [v19 robustDecodeObjectOfClass:v20 forKey:@"object" withCoder:v4 expectNonNull:1 errorDomain:@"ATXEngagementRecordManagerUtilitiesErrorDomain" errorCode:3 logHandle:v21];

      if (v9)
      {
        objc_super v10 = [(ATXExecutableIdentifier *)self initWithInfoSuggestion:v9];
LABEL_13:
        self = v10;
        v12 = self;
      }
      else
      {
LABEL_14:
        v12 = 0;
      }

LABEL_16:
      return v12;
    default:
      objc_super v11 = __atxlog_handle_default();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[ATXExecutableIdentifier initWithCoder:](v5, v11);
      }

      v12 = 0;
      goto LABEL_16;
  }
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_object forKey:@"object"];
}

- (id)description
{
  return (id)[(ATXSuggestionExecutableProtocol *)self->_object description];
}

- (unint64_t)hash
{
  uint64_t v3 = [(ATXSuggestionExecutableProtocol *)self->_object hash];
  return self->_type - v3 + 32 * v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXExecutableIdentifier *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if (v5->_type == self->_type)
      {
        v6 = self->_object;
        uint64_t v7 = v6;
        if (v6 == v5->_object) {
          char v8 = 1;
        }
        else {
          char v8 = -[ATXSuggestionExecutableProtocol isEqual:](v6, "isEqual:");
        }
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (NSString)debugTitle
{
  switch(self->_type)
  {
    case 0uLL:
      v2 = [NSString stringWithFormat:@"App: %@", self->_object];
      break;
    case 1uLL:
      uint64_t v3 = NSString;
      id v4 = [(ATXSuggestionExecutableProtocol *)self->_object actionTitle];
      [v3 stringWithFormat:@"Action: %@", v4];
      goto LABEL_6;
    case 2uLL:
      id v5 = NSString;
      id v4 = [(ATXSuggestionExecutableProtocol *)self->_object bundleId];
      [v5 stringWithFormat:@"Hero App: %@", v4];
      goto LABEL_6;
    case 3uLL:
      v6 = NSString;
      id v4 = [(ATXSuggestionExecutableProtocol *)self->_object widgetBundleIdentifier];
      [v6 stringWithFormat:@"Information: %@", v4];
      v2 = LABEL_6:;

      break;
    case 4uLL:
      uint64_t v7 = NSString;
      char v8 = self->_object;
      v9 = [(ATXSuggestionExecutableProtocol *)v8 bundleId];
      objc_super v10 = [(ATXSuggestionExecutableProtocol *)v8 action];

      objc_super v11 = [v10 identifier];
      v2 = [v7 stringWithFormat:@"Link Action: %@:%@", v9, v11];

      break;
    default:
      break;
  }

  return (NSString *)v2;
}

- (unint64_t)type
{
  return self->_type;
}

- (ATXSuggestionExecutableProtocol)object
{
  return self->_object;
}

- (void).cxx_destruct
{
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "Unknown type: %ld", (uint8_t *)&v2, 0xCu);
}

@end