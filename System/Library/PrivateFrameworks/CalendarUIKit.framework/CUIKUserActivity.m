@interface CUIKUserActivity
+ (BOOL)_BOOLFromDictionary:(id)a3 key:(id)a4 error:(BOOL *)a5;
+ (double)_doubleFromDictionary:(id)a3 key:(id)a4 error:(BOOL *)a5;
+ (id)_stringFromDictionary:(id)a3 key:(id)a4 error:(BOOL *)a5;
+ (id)activityForActivity:(id)a3;
+ (id)activityForDictionary:(id)a3;
+ (int64_t)_integerFromDictionary:(id)a3 key:(id)a4 error:(BOOL *)a5;
+ (unint64_t)_typeFromDictionary:(id)a3;
+ (unint64_t)_unsignedIntegerFromDictionary:(id)a3 key:(id)a4 error:(BOOL *)a5;
- (CUIKUserActivity)initWithDictionary:(id)a3;
- (CUIKUserActivity)initWithType:(unint64_t)a3;
- (NSSet)activityKeywords;
- (NSString)activitySubtitle;
- (NSString)activityTitle;
- (id)dictionary;
- (unint64_t)type;
- (unint64_t)version;
- (void)setActivityKeywords:(id)a3;
- (void)setActivitySubtitle:(id)a3;
- (void)setActivityTitle:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setVersion:(unint64_t)a3;
- (void)updateActivity:(id)a3;
@end

@implementation CUIKUserActivity

- (id)dictionary
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"com.apple.calendarUIKit.userActivity.type";
  v3 = [NSNumber numberWithUnsignedInteger:self->_type];
  v7[1] = @"com.apple.calendarUIKit.userActivity.version";
  v8[0] = v3;
  v4 = [NSNumber numberWithUnsignedInteger:self->_version];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (void)updateActivity:(id)a3
{
  id v13 = a3;
  v4 = [(CUIKUserActivity *)self activityTitle];
  [v13 setTitle:v4];

  v5 = [(CUIKUserActivity *)self activitySubtitle];

  if (v5)
  {
    v6 = [v13 contentAttributeSet];
    v7 = (void *)[v6 copy];

    if (!v7)
    {
      id v8 = objc_alloc((Class)EKWeakLinkClass());
      v9 = [v13 activityType];
      v7 = (void *)[v8 initWithItemContentType:v9];
    }
    v10 = [(CUIKUserActivity *)self activitySubtitle];
    [v7 setSubtitle:v10];

    [v13 setContentAttributeSet:v7];
  }
  v11 = [(CUIKUserActivity *)self activityKeywords];
  [v13 _setKeywords:v11];

  v12 = [(CUIKUserActivity *)self dictionary];
  [v13 setUserInfo:v12];

  [v13 _setEligibleForUserActivityIndexing:1];
  [v13 _setEligibleForUserActivityPublicIndexing:0];
  [v13 _setEligibleForUserActivityHandoff:1];
  [v13 _setEligibleForUserActivityReminders:1];
}

- (NSString)activitySubtitle
{
  return self->_activitySubtitle;
}

- (NSString)activityTitle
{
  return self->_activityTitle;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setActivityTitle:(id)a3
{
}

- (void)setActivitySubtitle:(id)a3
{
}

- (CUIKUserActivity)initWithType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CUIKUserActivity;
  result = [(CUIKUserActivity *)&v5 init];
  if (result)
  {
    result->_type = a3;
    result->_version = 65537;
  }
  return result;
}

- (NSSet)activityKeywords
{
  return self->_activityKeywords;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityKeywords, 0);
  objc_storeStrong((id *)&self->_activitySubtitle, 0);

  objc_storeStrong((id *)&self->_activityTitle, 0);
}

- (CUIKUserActivity)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CUIKUserActivity;
  objc_super v5 = [(CUIKUserActivity *)&v12 init];
  if (!v5) {
    goto LABEL_12;
  }
  v5->_type = [(id)objc_opt_class() _typeFromDictionary:v4];
  char v11 = 0;
  unint64_t v6 = [(id)objc_opt_class() _unsignedIntegerFromDictionary:v4 key:@"com.apple.calendarUIKit.userActivity.version" error:&v11];
  v5->_version = v6;
  if (!v11)
  {
    if (v6 <= 0x10001)
    {
      if (v6 != 65537)
      {
        v7 = +[CUIKLogSubsystem continuity];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[CUIKUserActivity initWithDictionary:]();
        }
        goto LABEL_5;
      }
    }
    else if ((v6 & 0xFFFE0000) != 0)
    {
      v7 = +[CUIKLogSubsystem continuity];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CUIKUserActivity initWithDictionary:]();
      }
      goto LABEL_5;
    }
LABEL_12:
    id v8 = v5;
    goto LABEL_13;
  }
  v7 = +[CUIKLogSubsystem continuity];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[CUIKUserActivity initWithDictionary:]();
  }
LABEL_5:

  id v8 = 0;
LABEL_13:

  return v8;
}

+ (id)activityForDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _typeFromDictionary:v4];
  uint64_t v6 = v5;
  switch(v5)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
      break;
    default:
      switch(v5)
      {
        case 4097:
          if ([a1 _BOOLFromDictionary:v4 key:@"com.apple.calendarUIKit.userActivity.tomorrow" error:0])goto LABEL_4; {
          uint64_t v6 = 4097;
          }
          break;
        case 4098:
        case 4099:
          goto LABEL_6;
        case 4100:
LABEL_4:
          uint64_t v6 = 4100;
          break;
        default:
          goto LABEL_7;
      }
      break;
  }
LABEL_6:
  v7 = (objc_class *)objc_opt_class();
  if (!v7)
  {
LABEL_7:
    id v8 = +[CUIKLogSubsystem continuity];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[CUIKUserActivity activityForDictionary:](v6);
    }

    v7 = 0;
  }
  v9 = (void *)[[v7 alloc] initWithDictionary:v4];

  return v9;
}

+ (id)activityForActivity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  uint64_t v6 = [a1 activityForDictionary:v5];

  v7 = [v4 title];
  [v6 setActivityTitle:v7];

  id v8 = [v4 contentAttributeSet];
  v9 = [v8 subtitle];
  [v6 setActivitySubtitle:v9];

  v10 = [v4 _keywords];

  [v6 setActivityKeywords:v10];

  return v6;
}

+ (BOOL)_BOOLFromDictionary:(id)a3 key:(id)a4 error:(BOOL *)a5
{
  uint64_t v6 = [a3 objectForKeyedSubscript:a4];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v7 = [v6 BOOLValue];
      BOOL v8 = 0;
      if (!a5) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  char v7 = 0;
  BOOL v8 = 1;
  if (a5) {
LABEL_6:
  }
    *a5 = v8;
LABEL_7:

  return v7;
}

+ (int64_t)_integerFromDictionary:(id)a3 key:(id)a4 error:(BOOL *)a5
{
  uint64_t v6 = [a3 objectForKeyedSubscript:a4];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v7 = [v6 integerValue];
      BOOL v8 = 0;
      if (!a5) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  int64_t v7 = 0;
  BOOL v8 = 1;
  if (a5) {
LABEL_6:
  }
    *a5 = v8;
LABEL_7:

  return v7;
}

+ (unint64_t)_unsignedIntegerFromDictionary:(id)a3 key:(id)a4 error:(BOOL *)a5
{
  uint64_t v6 = [a3 objectForKeyedSubscript:a4];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v7 = [v6 unsignedIntegerValue];
      BOOL v8 = 0;
      if (!a5) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  unint64_t v7 = 0;
  BOOL v8 = 1;
  if (a5) {
LABEL_6:
  }
    *a5 = v8;
LABEL_7:

  return v7;
}

+ (double)_doubleFromDictionary:(id)a3 key:(id)a4 error:(BOOL *)a5
{
  uint64_t v6 = [a3 objectForKeyedSubscript:a4];
  double v7 = 0.0;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      double v7 = v8;
      BOOL v9 = 0;
      if (!a5) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  BOOL v9 = 1;
  if (a5) {
LABEL_6:
  }
    *a5 = v9;
LABEL_7:

  return v7;
}

+ (id)_stringFromDictionary:(id)a3 key:(id)a4 error:(BOOL *)a5
{
  uint64_t v6 = [a3 objectForKeyedSubscript:a4];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v7 = 0;
    BOOL v8 = 1;
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v7 = v6;
  BOOL v8 = 0;
  if (a5) {
LABEL_6:
  }
    *a5 = v8;
LABEL_7:

  return v7;
}

+ (unint64_t)_typeFromDictionary:(id)a3
{
  char v5 = 0;
  unint64_t result = [a1 _unsignedIntegerFromDictionary:a3 key:@"com.apple.calendarUIKit.userActivity.type" error:&v5];
  if (v5)
  {
    id v4 = +[CUIKLogSubsystem continuity];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[CUIKUserActivity _typeFromDictionary:]();
    }

    return 0;
  }
  return result;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setActivityKeywords:(id)a3
{
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (void)initWithDictionary:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1BDF08000, v0, v1, "incompatible version in continuation dictionary", v2, v3, v4, v5, v6);
}

- (void)initWithDictionary:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1BDF08000, v0, v1, "invalid version in continuation dictionary", v2, v3, v4, v5, v6);
}

- (void)initWithDictionary:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1BDF08000, v0, v1, "failed to extract version from continuation dictionary", v2, v3, v4, v5, v6);
}

+ (void)activityForDictionary:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_2_0(&dword_1BDF08000, v2, v3, "invalid CUIKUserActivityType: %@", v4, v5, v6, v7, 2u);
}

+ (void)_typeFromDictionary:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1BDF08000, v0, v1, "failed to extract activity type from continuation dictionary", v2, v3, v4, v5, v6);
}

@end