@interface ATXHomeScreenWidgetIdentifiable
+ (BOOL)supportsSecureCoding;
- (ATXHomeScreenPage)page;
- (ATXHomeScreenWidgetIdentifiable)init;
- (ATXHomeScreenWidgetIdentifiable)initWithCoder:(id)a3;
- (ATXHomeScreenWidgetIdentifiable)initWithMemoryPressureMonitor:(id)a3;
- (ATXHomeScreenWidgetIdentifiable)initWithProto:(id)a3;
- (ATXHomeScreenWidgetIdentifiable)initWithProtoData:(id)a3;
- (BOOL)checkAndReportDecodingFailureIfNeededForNSInteger:(int64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOnboardingWidget;
- (BOOL)isSameWidgetAsWidgetBundleId:(id)a3 widgetKind:(id)a4;
- (BOOL)isSuggestedWidget;
- (BOOL)requiresAppLaunch;
- (INIntent)intent;
- (NSString)appBundleId;
- (NSString)description;
- (NSString)extensionBundleId;
- (NSString)predictionSource;
- (NSString)widgetKind;
- (NSString)widgetUniqueId;
- (double)score;
- (id)_dictionaryRepresentationIncludingFullIntent:(BOOL)a3;
- (id)compactDescription;
- (id)dictionaryRepresentation;
- (id)encodeAsProto;
- (id)initFromDictionaryRepresentation:(id)a3;
- (id)proto;
- (unint64_t)hash;
- (unint64_t)size;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)handleMemoryPressure;
- (void)intent;
- (void)proto;
- (void)setAppBundleId:(id)a3;
- (void)setExtensionBundleId:(id)a3;
- (void)setIntent:(id)a3;
- (void)setOnboardingWidget:(BOOL)a3;
- (void)setPage:(id)a3;
- (void)setPredictionSource:(id)a3;
- (void)setRequiresAppLaunch:(BOOL)a3;
- (void)setScore:(double)a3;
- (void)setSize:(unint64_t)a3;
- (void)setSuggestedWidget:(BOOL)a3;
- (void)setWidgetKind:(id)a3;
- (void)setWidgetUniqueId:(id)a3;
@end

@implementation ATXHomeScreenWidgetIdentifiable

- (ATXHomeScreenWidgetIdentifiable)init
{
  v3 = [MEMORY[0x1E4F4B640] sharedInstance];
  v4 = [(ATXHomeScreenWidgetIdentifiable *)self initWithMemoryPressureMonitor:v3];

  return v4;
}

- (ATXHomeScreenWidgetIdentifiable)initWithMemoryPressureMonitor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXHomeScreenWidgetIdentifiable;
  v6 = [(ATXHomeScreenWidgetIdentifiable *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_memoryPressureMonitor, a3);
    [(ATXMemoryPressureMonitor *)v7->_memoryPressureMonitor registerObserver:v7];
  }

  return v7;
}

- (void)dealloc
{
  [(ATXMemoryPressureMonitor *)self->_memoryPressureMonitor unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)ATXHomeScreenWidgetIdentifiable;
  [(ATXHomeScreenWidgetIdentifiable *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = [(ATXHomeScreenWidgetIdentifiable *)self _dictionaryRepresentationIncludingFullIntent:0];
  v4 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v5 = [v3 descriptionWithLocale:v4];

  v6 = [(ATXHomeScreenWidgetIdentifiable *)self intent];

  if (v6)
  {
    v7 = [(ATXHomeScreenWidgetIdentifiable *)self intent];
    id v8 = [v5 stringByAppendingFormat:@"\nFull Intent: %@\n", v7];
  }
  else
  {
    id v8 = v5;
  }

  return (NSString *)v8;
}

- (id)compactDescription
{
  if (self->_suggestedWidget) {
    objc_super v3 = @"YES";
  }
  else {
    objc_super v3 = @"NO";
  }
  v4 = (objc_class *)NSString;
  id v5 = v3;
  v6 = (void *)[[v4 alloc] initWithFormat:@"{extBundleID: %@, kind: %@, isSuggestedWidget: %@}", self->_extensionBundleId, self->_widgetKind, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return [(ATXHomeScreenWidgetIdentifiable *)self _dictionaryRepresentationIncludingFullIntent:1];
}

- (id)_dictionaryRepresentationIncludingFullIntent:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_opt_new();
  [v5 setObject:self->_extensionBundleId forKeyedSubscript:@"widgetBundleId"];
  [v5 setObject:self->_appBundleId forKeyedSubscript:@"appBundleId"];
  [v5 setObject:self->_widgetUniqueId forKeyedSubscript:@"widgetUniqueId"];
  [v5 setObject:self->_widgetKind forKeyedSubscript:@"widgetKind"];
  v6 = [NSNumber numberWithUnsignedInteger:self->_size];
  [v5 setObject:v6 forKeyedSubscript:@"size"];

  v7 = [NSNumber numberWithBool:self->_suggestedWidget];
  [v5 setObject:v7 forKeyedSubscript:@"suggestedWidget"];

  id v8 = [NSNumber numberWithBool:self->_onboardingWidget];
  [v5 setObject:v8 forKeyedSubscript:@"onboardingWidget"];

  objc_super v9 = [NSNumber numberWithDouble:self->_score];
  [v5 setObject:v9 forKeyedSubscript:@"score"];

  [v5 setObject:self->_predictionSource forKeyedSubscript:@"predictionSource"];
  v10 = [(ATXHomeScreenWidgetIdentifiable *)self intent];
  v11 = v10;
  if (v3)
  {
    v12 = [v10 intentDescription];
    if (!v12)
    {
      v13 = [(ATXHomeScreenWidgetIdentifiable *)self intent];
      v14 = [v13 description];
      [v5 setObject:v14 forKeyedSubscript:@"intent"];

      goto LABEL_6;
    }
  }
  else
  {
    v12 = [v10 typeName];
  }
  [v5 setObject:v12 forKeyedSubscript:@"intent"];
LABEL_6:

  return v5;
}

- (id)initFromDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ATXHomeScreenWidgetIdentifiable;
  id v5 = [(ATXHomeScreenWidgetIdentifiable *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"widgetBundleId"];

    if (v6)
    {
      uint64_t v7 = [v4 objectForKeyedSubscript:@"widgetBundleId"];
      extensionBundleId = v5->_extensionBundleId;
      v5->_extensionBundleId = (NSString *)v7;

      uint64_t v9 = [v4 objectForKeyedSubscript:@"appBundleId"];
      appBundleId = v5->_appBundleId;
      v5->_appBundleId = (NSString *)v9;

      uint64_t v11 = [v4 objectForKeyedSubscript:@"widgetUniqueId"];
      widgetUniqueId = v5->_widgetUniqueId;
      v5->_widgetUniqueId = (NSString *)v11;

      uint64_t v13 = [v4 objectForKeyedSubscript:@"widgetKind"];
      widgetKind = v5->_widgetKind;
      v5->_widgetKind = (NSString *)v13;

      v15 = [v4 objectForKeyedSubscript:@"size"];
      v5->_size = [v15 unsignedIntegerValue];

      v16 = [v4 objectForKeyedSubscript:@"suggestedWidget"];
      v5->_suggestedWidget = [v16 BOOLValue];

      v17 = [v4 objectForKeyedSubscript:@"onboardingWidget"];
      v5->_onboardingWidget = [v17 BOOLValue];

      v18 = [v4 objectForKeyedSubscript:@"score"];
      [v18 doubleValue];
      v5->_score = v19;

      uint64_t v20 = [v4 objectForKeyedSubscript:@"predictionSource"];
      predictionSource = v5->_predictionSource;
      v5->_predictionSource = (NSString *)v20;

      v6 = v5;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setIntent:(id)a3
{
  id v4 = (INIntent *)a3;
  obj = self;
  objc_sync_enter(obj);
  intentProtoData = obj->_intentProtoData;
  obj->_intentProtoData = 0;

  intent = obj->_intent;
  obj->_intent = v4;

  objc_sync_exit(obj);
}

- (INIntent)intent
{
  v2 = self;
  uint64_t v3 = objc_sync_enter(v2);
  intent = v2->_intent;
  if (intent)
  {
    id v5 = intent;
  }
  else if (v2->_intentProtoData)
  {
    v6 = (void *)MEMORY[0x1AD0D3C30](v3);
    uint64_t v7 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v8 = objc_opt_class();
    intentProtoData = v2->_intentProtoData;
    id v15 = 0;
    uint64_t v10 = [v7 unarchivedObjectOfClass:v8 fromData:intentProtoData error:&v15];
    id v11 = v15;
    v12 = v2->_intent;
    v2->_intent = (INIntent *)v10;

    if (v11)
    {
      uint64_t v13 = __atxlog_handle_default();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        [(ATXHomeScreenWidgetIdentifiable *)(uint64_t)v11 intent];
      }
    }
    id v5 = v2->_intent;
  }
  else
  {
    id v5 = 0;
  }
  objc_sync_exit(v2);

  return v5;
}

- (void)handleMemoryPressure
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_intentProtoData && v2->_intent)
  {
    uint64_t v3 = __atxlog_handle_default();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1A790D000, v3, OS_LOG_TYPE_DEFAULT, "Purging intent proto data due to memory pressure", v5, 2u);
    }

    intentProtoData = v2->_intentProtoData;
    v2->_intentProtoData = 0;
  }
  objc_sync_exit(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    id v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      double v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForNSInteger:(int64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    id v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      double v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXHomeScreenWidgetIdentifiable *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXHomeScreenWidgetIdentifiable)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  v6 = [(ATXHomeScreenWidgetIdentifiable *)self initWithProtoData:v5];
  return v6;
}

- (id)encodeAsProto
{
  v2 = [(ATXHomeScreenWidgetIdentifiable *)self proto];
  uint64_t v3 = [v2 data];

  return v3;
}

- (id)proto
{
  uint64_t v3 = objc_opt_new();
  -[ATXPBHomeScreenWidgetIdentifiable setAppBundleId:]((uint64_t)v3, self->_appBundleId);
  -[ATXPBHomeScreenWidgetIdentifiable setExtensionBundleId:]((uint64_t)v3, self->_extensionBundleId);
  -[ATXPBHomeScreenWidgetIdentifiable setWidgetUniqueId:]((uint64_t)v3, self->_widgetUniqueId);
  -[ATXPBHomeScreenWidgetIdentifiable setWidgetKind:]((uint64_t)v3, self->_widgetKind);
  int v4 = ATXStackLayoutSizeToProto(self->_size);
  -[ATXPBHomeScreenWidgetIdentifiable setSize:]((uint64_t)v3, v4);
  -[ATXPBHomeScreenWidgetIdentifiable setSuggestedWidget:]((uint64_t)v3, self->_suggestedWidget);
  -[ATXPBHomeScreenWidgetIdentifiable setOnboardingWidget:]((uint64_t)v3, self->_onboardingWidget);
  -[ATXPBHomeScreenWidgetIdentifiable setScore:]((uint64_t)v3, self->_score);
  -[ATXPBHomeScreenWidgetIdentifiable setPredictionSource:]((uint64_t)v3, self->_predictionSource);
  id v5 = self;
  objc_sync_enter(v5);
  intentProtoData = v5->_intentProtoData;
  if (intentProtoData)
  {
    -[ATXPBHomeScreenWidgetIdentifiable setIntent:]((uint64_t)v3, intentProtoData);
  }
  else
  {
    uint64_t v7 = [(ATXHomeScreenWidgetIdentifiable *)v5 intent];

    if (v7)
    {
      uint64_t v8 = (void *)MEMORY[0x1AD0D3C30]();
      uint64_t v9 = (void *)MEMORY[0x1E4F28DB0];
      uint64_t v10 = [(ATXHomeScreenWidgetIdentifiable *)v5 intent];
      id v15 = 0;
      id v11 = [v9 archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v15];
      id v12 = v15;
      -[ATXPBHomeScreenWidgetIdentifiable setIntent:]((uint64_t)v3, v11);

      if (v12)
      {
        id v13 = __atxlog_handle_default();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          [(ATXHomeScreenWidgetIdentifiable *)(uint64_t)v12 proto];
        }
      }
    }
  }
  objc_sync_exit(v5);

  return v3;
}

- (ATXHomeScreenWidgetIdentifiable)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBHomeScreenWidgetIdentifiable alloc] initWithData:v4];

    self = [(ATXHomeScreenWidgetIdentifiable *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXHomeScreenWidgetIdentifiable)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = __atxlog_handle_default();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[ATXHomeScreenWidgetIdentifiable initWithProto:]((uint64_t)self, v5);
      }
      uint64_t v21 = 0;
      goto LABEL_11;
    }
    v23.receiver = self;
    v23.super_class = (Class)ATXHomeScreenWidgetIdentifiable;
    self = [(ATXHomeScreenWidgetIdentifiable *)&v23 init];
    if (self)
    {
      id v5 = v4;
      v6 = self;
      objc_sync_enter(v6);
      uint64_t v7 = -[ATXPBHomeScreenWidgetIdentifiable intent]((uint64_t)v5);

      if (v7)
      {
        uint64_t v8 = -[ATXPBHomeScreenWidgetIdentifiable intent]((uint64_t)v5);
        intentProtoData = v6->_intentProtoData;
        v6->_intentProtoData = (NSData *)v8;
      }
      objc_sync_exit(v6);

      uint64_t v10 = -[ATXPBHomeScreenWidgetIdentifiable appBundleId]((uint64_t)v5);
      appBundleId = v6->_appBundleId;
      v6->_appBundleId = (NSString *)v10;

      uint64_t v12 = -[ATXPBHomeScreenWidgetIdentifiable extensionBundleId]((uint64_t)v5);
      extensionBundleId = v6->_extensionBundleId;
      v6->_extensionBundleId = (NSString *)v12;

      uint64_t v14 = -[ATXPBHomeScreenWidgetIdentifiable widgetUniqueId]((uint64_t)v5);
      widgetUniqueId = v6->_widgetUniqueId;
      v6->_widgetUniqueId = (NSString *)v14;

      uint64_t v16 = -[ATXPBHomeScreenWidgetIdentifiable widgetKind]((uint64_t)v5);
      widgetKind = v6->_widgetKind;
      v6->_widgetKind = (NSString *)v16;

      int v18 = -[ATXPBHomeScreenWidgetIdentifiable size]((uint64_t)v5);
      v6->_size = ATXStackLayoutSizeFromProto(v18);
      v6->_suggestedWidget = -[ATXPBHomeScreenWidgetIdentifiable suggestedWidget]((BOOL)v5);
      v6->_onboardingWidget = -[ATXPBHomeScreenWidgetIdentifiable onboardingWidget]((BOOL)v5);
      v6->_score = -[ATXPBHomeScreenWidgetIdentifiable score]((uint64_t)v5);
      uint64_t v19 = -[ATXPBHomeScreenWidgetIdentifiable predictionSource]((uint64_t)v5);
      predictionSource = v6->_predictionSource;
      v6->_predictionSource = (NSString *)v19;

      self = v6;
      uint64_t v21 = self;
LABEL_11:

      goto LABEL_12;
    }
  }
  uint64_t v21 = 0;
LABEL_12:

  return v21;
}

- (BOOL)isSameWidgetAsWidgetBundleId:(id)a3 widgetKind:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 isEqualToString:&stru_1EFD9B408]) {
    goto LABEL_14;
  }
  if ([v7 isEqualToString:@"SBHSpecialAvocadoDescriptorKindSiri"])
  {
    extensionBundleId = self->_extensionBundleId;
    uint64_t v9 = (__CFString **)MEMORY[0x1E4F4B5F8];
LABEL_6:
    uint64_t v10 = *v9;
    goto LABEL_10;
  }
  if ([v7 isEqualToString:@"SBHSpecialAvocadoDescriptorKindAppPredictions"])
  {
    extensionBundleId = self->_extensionBundleId;
    uint64_t v9 = ATXAppPredictionPanelBundleIdentifier;
    goto LABEL_6;
  }
  if (([v7 isEqualToString:@"SBHSpecialAvocadoDescriptorKindShortcutsFolder"] & 1) != 0
    || [v7 isEqualToString:@"SBHSpecialAvocadoDescriptorKindShortcutsSingle"])
  {
    extensionBundleId = self->_extensionBundleId;
    uint64_t v10 = @"Shortcuts";
  }
  else
  {
    if (![v7 isEqualToString:@"SBHSpecialAvocadoDescriptorKindFiles"]) {
      goto LABEL_14;
    }
    extensionBundleId = self->_extensionBundleId;
    uint64_t v10 = @"Files";
  }
LABEL_10:
  if (![(NSString *)extensionBundleId isEqualToString:v10])
  {
LABEL_14:
    uint64_t v12 = +[ATXWidgetPersonality stringRepresentationForExtensionBundleId:v6 kind:v7];
    id v13 = +[ATXWidgetPersonality stringRepresentationForExtensionBundleId:self->_extensionBundleId kind:self->_widgetKind];
    char v11 = [v12 isEqualToString:v13];

    goto LABEL_15;
  }
  char v11 = 1;
LABEL_15:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_appBundleId hash];
  NSUInteger v4 = [(NSString *)self->_extensionBundleId hash] - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_widgetUniqueId hash] - v4 + 32 * v4;
  NSUInteger v6 = [(NSString *)self->_widgetKind hash];
  unint64_t v7 = self->_size - (v6 - v5 + 32 * v5) + 32 * (v6 - v5 + 32 * v5);
  uint64_t v8 = self->_suggestedWidget - v7 + 32 * v7;
  return self->_onboardingWidget - v8 + 32 * v8;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (ATXHomeScreenWidgetIdentifiable *)a3;
  if (self == v4)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      NSUInteger v5 = v4;
      unint64_t size = self->_size;
      if (size != [v5 size]) {
        goto LABEL_22;
      }
      int suggestedWidget = self->_suggestedWidget;
      if (suggestedWidget != [v5 isSuggestedWidget]) {
        goto LABEL_22;
      }
      int onboardingWidget = self->_onboardingWidget;
      if (onboardingWidget != [v5 isOnboardingWidget]) {
        goto LABEL_22;
      }
      extensionBundleId = self->_extensionBundleId;
      uint64_t v10 = (NSString *)v5[6];
      if (extensionBundleId == v10)
      {
      }
      else
      {
        char v11 = v10;
        uint64_t v12 = extensionBundleId;
        char v13 = [(NSString *)v12 isEqual:v11];

        if ((v13 & 1) == 0) {
          goto LABEL_22;
        }
      }
      appBundleId = self->_appBundleId;
      uint64_t v16 = (NSString *)v5[8];
      if (appBundleId == v16)
      {
      }
      else
      {
        v17 = v16;
        int v18 = appBundleId;
        char v19 = [(NSString *)v18 isEqual:v17];

        if ((v19 & 1) == 0) {
          goto LABEL_22;
        }
      }
      widgetUniqueId = self->_widgetUniqueId;
      uint64_t v21 = (NSString *)v5[10];
      if (widgetUniqueId == v21)
      {
      }
      else
      {
        v22 = v21;
        objc_super v23 = widgetUniqueId;
        char v24 = [(NSString *)v23 isEqual:v22];

        if ((v24 & 1) == 0) {
          goto LABEL_22;
        }
      }
      id widgetKind = self->_widgetKind;
      id v26 = v5[7];
      if (widgetKind == v26)
      {
      }
      else
      {
        v27 = v26;
        id widgetKind = widgetKind;
        char v28 = [widgetKind isEqual:v27];

        if ((v28 & 1) == 0)
        {
LABEL_22:
          char v14 = 0;
LABEL_23:

          goto LABEL_24;
        }
      }
      v30 = [(ATXHomeScreenWidgetIdentifiable *)self intent];
      if (v30 || ([v5 intent], (id widgetKind = (id)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v31 = [(ATXHomeScreenWidgetIdentifiable *)self intent];
        v32 = [v5 intent];
        char v14 = objc_msgSend(v31, "atx_isEqualToIntent:", v32);

        if (v30)
        {
LABEL_32:

          goto LABEL_23;
        }
      }
      else
      {
        char v14 = 1;
      }

      goto LABEL_32;
    }
    char v14 = 0;
  }
LABEL_24:

  return v14;
}

- (ATXHomeScreenPage)page
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);

  return (ATXHomeScreenPage *)WeakRetained;
}

- (void)setPage:(id)a3
{
}

- (NSString)extensionBundleId
{
  return self->_extensionBundleId;
}

- (void)setExtensionBundleId:(id)a3
{
}

- (NSString)widgetKind
{
  return self->_widgetKind;
}

- (void)setWidgetKind:(id)a3
{
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_unint64_t size = a3;
}

- (NSString)widgetUniqueId
{
  return self->_widgetUniqueId;
}

- (void)setWidgetUniqueId:(id)a3
{
}

- (BOOL)isSuggestedWidget
{
  return self->_suggestedWidget;
}

- (void)setSuggestedWidget:(BOOL)a3
{
  self->_int suggestedWidget = a3;
}

- (BOOL)isOnboardingWidget
{
  return self->_onboardingWidget;
}

- (void)setOnboardingWidget:(BOOL)a3
{
  self->_int onboardingWidget = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (NSString)predictionSource
{
  return self->_predictionSource;
}

- (void)setPredictionSource:(id)a3
{
}

- (BOOL)requiresAppLaunch
{
  return self->_requiresAppLaunch;
}

- (void)setRequiresAppLaunch:(BOOL)a3
{
  self->_requiresAppLaunch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionSource, 0);
  objc_storeStrong((id *)&self->_widgetUniqueId, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_widgetKind, 0);
  objc_storeStrong((id *)&self->_extensionBundleId, 0);
  objc_destroyWeak((id *)&self->_page);
  objc_storeStrong((id *)&self->_memoryPressureMonitor, 0);
  objc_storeStrong((id *)&self->_intent, 0);

  objc_storeStrong((id *)&self->_intentProtoData, 0);
}

- (void)intent
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "Could not unarchive intent for widget identifiable: %@", (uint8_t *)&v2, 0xCu);
}

- (void)proto
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "Could not serialize intent: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  NSUInteger v6 = v4;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBHomeScreenWidgetIdentifiable proto", (uint8_t *)&v5, 0xCu);
}

@end