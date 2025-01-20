@interface CUIKUserActivityWithSource
- (BOOL)_isLocalSource;
- (BOOL)_requiresHostAndOwner;
- (BOOL)_supportsConsistentExternalIDAcrossDevices;
- (BOOL)_supportsConsistentExternalIDAcrossDevices:(int64_t)a3;
- (CUIKUserActivityWithSource)initWithDictionary:(id)a3;
- (CUIKUserActivityWithSource)initWithSource:(id)a3 type:(unint64_t)a4;
- (id)dictionary;
- (unint64_t)isMatchForSource:(id)a3;
- (void)dictionary;
@end

@implementation CUIKUserActivityWithSource

- (CUIKUserActivityWithSource)initWithSource:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CUIKUserActivityWithSource;
  v7 = [(CUIKUserActivity *)&v17 initWithType:a4];
  if (!v7) {
    goto LABEL_8;
  }
  uint64_t v8 = v6 ? [v6 sourceType] : 0;
  v7->_sourceType = v8;
  if (![(CUIKUserActivityWithSource *)v7 _requiresHostAndOwner]) {
    goto LABEL_8;
  }
  uint64_t v9 = [v6 serverHost];
  sourceHost = v7->_sourceHost;
  v7->_sourceHost = (NSString *)v9;

  if (!v7->_sourceHost)
  {
    v16 = +[CUIKLogSubsystem continuity];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CUIKUserActivityWithSource initWithSource:type:]();
    }
    goto LABEL_14;
  }
  v11 = [v6 ownerAddresses];
  uint64_t v12 = [v11 anyObject];
  sourceOwner = v7->_sourceOwner;
  v7->_sourceOwner = (NSString *)v12;

  if (!v7->_sourceOwner)
  {
    v16 = +[CUIKLogSubsystem continuity];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CUIKUserActivityWithSource initWithSource:type:]();
    }
LABEL_14:

    v14 = 0;
    goto LABEL_9;
  }
LABEL_8:
  v14 = v7;
LABEL_9:

  return v14;
}

- (CUIKUserActivityWithSource)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CUIKUserActivityWithSource;
  v5 = [(CUIKUserActivity *)&v18 initWithDictionary:v4];
  if (!v5) {
    goto LABEL_18;
  }
  char v17 = 0;
  unint64_t v6 = [(id)objc_opt_class() _unsignedIntegerFromDictionary:v4 key:@"com.apple.calendarUIKit.userActivity.sourceType" error:&v17];
  uint64_t v7 = v6;
  if (v6 >= 8)
  {
    uint64_t v9 = +[CUIKLogSubsystem continuity];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CUIKUserActivityWithSource initWithDictionary:].cold.4(v7);
    }

    int64_t v8 = 0;
  }
  else
  {
    int64_t v8 = qword_1BE0791B0[v6];
  }
  v5->_sourceType = v8;
  if (!v17)
  {
    if ([(CUIKUserActivityWithSource *)v5 _requiresHostAndOwner])
    {
      uint64_t v12 = [(id)objc_opt_class() _stringFromDictionary:v4 key:@"com.apple.calendarUIKit.userActivity.sourceHost" error:&v17];
      sourceHost = v5->_sourceHost;
      v5->_sourceHost = (NSString *)v12;

      if (v17)
      {
        v10 = +[CUIKLogSubsystem continuity];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[CUIKUserActivityWithSource initWithDictionary:]();
        }
        goto LABEL_10;
      }
      uint64_t v14 = [(id)objc_opt_class() _stringFromDictionary:v4 key:@"com.apple.calendarUIKit.userActivity.sourceOwner" error:&v17];
      sourceOwner = v5->_sourceOwner;
      v5->_sourceOwner = (NSString *)v14;

      if (v17)
      {
        v10 = +[CUIKLogSubsystem continuity];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[CUIKUserActivityWithSource initWithDictionary:]();
        }
        goto LABEL_10;
      }
    }
LABEL_18:
    v11 = v5;
    goto LABEL_19;
  }
  v10 = +[CUIKLogSubsystem continuity];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[CUIKUserActivityWithSource initWithDictionary:]();
  }
LABEL_10:

  v11 = 0;
LABEL_19:

  return v11;
}

- (id)dictionary
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v12.receiver = self;
  v12.super_class = (Class)CUIKUserActivityWithSource;
  id v4 = [(CUIKUserActivity *)&v12 dictionary];
  v5 = (void *)[v3 initWithDictionary:v4];

  unint64_t v6 = NSNumber;
  unint64_t sourceType = self->_sourceType;
  if (sourceType >= 7)
  {
    uint64_t v9 = +[CUIKLogSubsystem continuity];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CUIKUserActivityWithSource dictionary](sourceType);
    }

    unint64_t v8 = 0;
  }
  else
  {
    unint64_t v8 = sourceType + 1;
  }
  v10 = [v6 numberWithUnsignedInteger:v8];
  [v5 setObject:v10 forKeyedSubscript:@"com.apple.calendarUIKit.userActivity.sourceType"];

  if ([(CUIKUserActivityWithSource *)self _requiresHostAndOwner])
  {
    [v5 setObject:self->_sourceHost forKeyedSubscript:@"com.apple.calendarUIKit.userActivity.sourceHost"];
    [v5 setObject:self->_sourceOwner forKeyedSubscript:@"com.apple.calendarUIKit.userActivity.sourceOwner"];
  }

  return v5;
}

- (unint64_t)isMatchForSource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 sourceType];
  if (v5 && (int64_t sourceType = self->_sourceType) != 0)
  {
    if (v5 == sourceType)
    {
      if ([(CUIKUserActivityWithSource *)self _requiresHostAndOwner])
      {
        uint64_t v7 = [v4 serverHost];
        if ([v7 length])
        {
          if (![v7 isEqualToString:self->_sourceHost]) {
            goto LABEL_16;
          }
        }
        else if ([(NSString *)self->_sourceHost length])
        {
          goto LABEL_16;
        }
        uint64_t v9 = [v4 ownerAddresses];
        if ([v9 count])
        {
          int v10 = [v9 containsObject:self->_sourceOwner];

          if (v10)
          {
LABEL_14:
            unint64_t v8 = 1;
LABEL_17:

            goto LABEL_18;
          }
        }
        else
        {
          NSUInteger v11 = [(NSString *)self->_sourceOwner length];

          if (!v11) {
            goto LABEL_14;
          }
        }
LABEL_16:
        unint64_t v8 = 0;
        goto LABEL_17;
      }
      unint64_t v8 = 1;
    }
    else
    {
      unint64_t v8 = 0;
    }
  }
  else
  {
    unint64_t v8 = 2;
  }
LABEL_18:

  return v8;
}

- (BOOL)_requiresHostAndOwner
{
  return (unint64_t)(self->_sourceType - 1) < 2;
}

- (BOOL)_supportsConsistentExternalIDAcrossDevices:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFBLL) == 2;
}

- (BOOL)_supportsConsistentExternalIDAcrossDevices
{
  return [(CUIKUserActivityWithSource *)self _supportsConsistentExternalIDAcrossDevices:self->_sourceType];
}

- (BOOL)_isLocalSource
{
  return self->_sourceType == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceOwner, 0);

  objc_storeStrong((id *)&self->_sourceHost, 0);
}

- (void)initWithSource:type:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1BDF08000, v0, v1, "failed to extract host from EKSource", v2, v3, v4, v5, v6);
}

- (void)initWithSource:type:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1BDF08000, v0, v1, "failed to extract owner from EKSource", v2, v3, v4, v5, v6);
}

- (void)initWithDictionary:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1BDF08000, v0, v1, "failed to extract source owner from continuation dictionary", v2, v3, v4, v5, v6);
}

- (void)initWithDictionary:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1BDF08000, v0, v1, "failed to extract source host from continuation dictionary", v2, v3, v4, v5, v6);
}

- (void)initWithDictionary:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1BDF08000, v0, v1, "failed to extract source type from continuation dictionary", v2, v3, v4, v5, v6);
}

- (void)initWithDictionary:(uint64_t)a1 .cold.4(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_2_0(&dword_1BDF08000, v2, v3, "Invalid CUIKUserActivitySourceType: %@", v4, v5, v6, v7, 2u);
}

- (void)dictionary
{
  uint64_t v1 = [NSNumber numberWithInteger:a1];
  OUTLINED_FUNCTION_2_0(&dword_1BDF08000, v2, v3, "Invalid EKSourceType: %@", v4, v5, v6, v7, 2u);
}

@end