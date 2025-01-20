@interface CHManagedHandleMigrationPolicy
- (id)normalizedValueForManagedHandle:(id)a3;
- (id)valueForManagedHandle:(id)a3;
@end

@implementation CHManagedHandleMigrationPolicy

- (id)normalizedValueForManagedHandle:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 normalizedValue];
  if (![v4 length])
  {
    v5 = ch_framework_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412290;
      uint64_t v25 = (uint64_t)v3;
      _os_log_impl(&dword_1B8E4A000, v5, OS_LOG_TYPE_DEFAULT, "Performing normalization migration policy for managed handle %@", (uint8_t *)&v24, 0xCu);
    }

    v6 = NSStringFromSelector(sel_type);
    v7 = [v3 valueForKey:v6];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [v7 integerValue];
    }
    else
    {
      v9 = ch_framework_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        [(CHManagedHandleMigrationPolicy *)(uint64_t)v7 normalizedValueForManagedHandle:v9];
      }

      uint64_t v8 = 0;
    }
    v10 = ch_framework_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 134217984;
      uint64_t v25 = v8;
      _os_log_impl(&dword_1B8E4A000, v10, OS_LOG_TYPE_DEFAULT, "Comparing CHHandleType to managed handle type %ld", (uint8_t *)&v24, 0xCu);
    }

    switch(v8)
    {
      case 1:
        v16 = [v3 value];
        v17 = +[CHHandle normalizedGenericHandleForValue:v16];
        uint64_t v13 = [v17 normalizedValue];

        v14 = ch_framework_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v24 = 138412290;
          uint64_t v25 = v13;
          v15 = "Normalized user name to %@";
          goto LABEL_18;
        }
        break;
      case 2:
        v18 = [v3 remoteParticipantCalls];
        v19 = [v18 anyObject];
        v14 = objc_msgSend(v19, "iso_country_code");

        v20 = [v3 value];
        v21 = +[CHHandle normalizedPhoneNumberHandleForValue:v20 isoCountryCode:v14];
        uint64_t v13 = [v21 normalizedValue];

        v22 = ch_framework_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          int v24 = 138412290;
          uint64_t v25 = v13;
          _os_log_impl(&dword_1B8E4A000, v22, OS_LOG_TYPE_DEFAULT, "Normalized telephone number to %@", (uint8_t *)&v24, 0xCu);
        }

        break;
      case 3:
        v11 = [v3 value];
        v12 = +[CHHandle normalizedEmailAddressHandleForValue:v11];
        uint64_t v13 = [v12 normalizedValue];

        v14 = ch_framework_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v24 = 138412290;
          uint64_t v25 = v13;
          v15 = "Normalized email address to %@";
LABEL_18:
          _os_log_impl(&dword_1B8E4A000, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v24, 0xCu);
        }
        break;
      default:
LABEL_23:

        goto LABEL_24;
    }

    v4 = (void *)v13;
    goto LABEL_23;
  }
LABEL_24:

  return v4;
}

- (id)valueForManagedHandle:(id)a3
{
  return (id)[a3 value];
}

- (void)normalizedValueForManagedHandle:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1B8E4A000, log, OS_LOG_TYPE_ERROR, "Unexpected data type found in value %@ for key %@", (uint8_t *)&v3, 0x16u);
}

@end