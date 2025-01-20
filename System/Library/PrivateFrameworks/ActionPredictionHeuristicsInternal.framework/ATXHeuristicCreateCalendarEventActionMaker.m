@interface ATXHeuristicCreateCalendarEventActionMaker
+ (BOOL)supportsSecureCoding;
- (ATXHeuristicCreateCalendarEventActionMaker)initWithCoder:(id)a3;
- (ATXHeuristicCreateCalendarEventActionMaker)initWithTitle:(id)a3 subtitle:(id)a4 event:(id)a5 suggestionsInfoUniqueKey:(id)a6;
- (id)_makeAction;
- (id)actionTypeName;
- (void)_makeAction;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXHeuristicCreateCalendarEventActionMaker

- (ATXHeuristicCreateCalendarEventActionMaker)initWithTitle:(id)a3 subtitle:(id)a4 event:(id)a5 suggestionsInfoUniqueKey:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXHeuristicCreateCalendarEventActionMaker;
  v15 = [(ATXHeuristicCreateCalendarEventActionMaker *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->super._title, a3);
    objc_storeStrong((id *)&v16->super._subtitle, a4);
    objc_storeStrong((id *)&v16->_event, a5);
    objc_storeStrong((id *)&v16->_suggestionsInfoUniqueKey, a6);
  }

  return v16;
}

- (id)_makeAction
{
  v3 = [(ATXHeuristicObjectHandle *)self->_event obj];
  if (!v3)
  {
    v5 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ATXHeuristicCreateCalendarEventActionMaker _makeAction](self);
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ATXHeuristicCreateCalendarEventActionMaker _makeAction].cold.4();
    }
LABEL_10:
    v9 = 0;
    goto LABEL_19;
  }
  pthread_mutex_lock(&_makeAction_actionHandlerLock);
  v4 = [MEMORY[0x1E4F25540] sharedInstance];
  v5 = [v4 createEventIntentForEvent:v3 withSuggestionsInfoUniqueKey:self->_suggestionsInfoUniqueKey];

  pthread_mutex_unlock(&_makeAction_actionHandlerLock);
  v6 = INIntentWithTypedIntent();
  if (!v6)
  {
    v10 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(ATXHeuristicCreateCalendarEventActionMaker *)v10 _makeAction];
    }

    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v18 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      [(ATXHeuristicCreateCalendarEventActionMaker *)v18 _makeAction];
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Generic intent created from EKUICreateEventIntent is not an INIntent object."];
LABEL_17:
    v9 = 0;
    goto LABEL_18;
  }
  id v7 = objc_alloc(MEMORY[0x1E4F4AE38]);
  v8 = objc_opt_new();
  LOBYTE(v27) = 0;
  v9 = (void *)[v7 initWithIntent:v6 actionUUID:v8 bundleId:@"com.apple.mobilecal" heuristic:0 heuristicMetadata:0 criteria:0 isFutureMedia:v27 title:self->super._title subtitle:self->super._subtitle];

LABEL_18:
LABEL_19:

  return v9;
}

- (id)actionTypeName
{
  return @"EKUICreateEventIntent";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXHeuristicCreateCalendarEventActionMaker)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATXHeuristicCreateCalendarEventActionMaker;
  v5 = [(ATXHeuristicActionMaker *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->super._title;
    v5->super._title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    subtitle = v5->super._subtitle;
    v5->super._subtitle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"event"];
    event = v5->_event;
    v5->_event = (ATXHeuristicObjectHandle *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suggestionsInfoUniqueKey"];
    suggestionsInfoUniqueKey = v5->_suggestionsInfoUniqueKey;
    v5->_suggestionsInfoUniqueKey = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ATXHeuristicCreateCalendarEventActionMaker;
  id v4 = a3;
  [(ATXHeuristicActionMaker *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_event, @"event", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_suggestionsInfoUniqueKey forKey:@"suggestionsInfoUniqueKey"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsInfoUniqueKey, 0);

  objc_storeStrong((id *)&self->_event, 0);
}

- (void)_makeAction
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v1 = objc_claimAutoreleasedReturnValue();
  [v1 UTF8String];
  OUTLINED_FUNCTION_0_0(&dword_1D0F43000, v2, v3, "Wrong type: expected EKEvent, got %s", v4, v5, v6, v7, 2u);
}

@end