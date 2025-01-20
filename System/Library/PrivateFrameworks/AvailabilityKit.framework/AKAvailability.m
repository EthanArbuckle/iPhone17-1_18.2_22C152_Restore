@interface AKAvailability
+ (id)logger;
- (AKAvailability)initWithAvailable:(BOOL)a3 activityIdentifier:(id)a4;
- (AKAvailability)initWithAvailable:(BOOL)a3 activityIdentifierString:(id)a4;
- (AKAvailability)initWithPublishedStatus:(id)a3;
- (AKAvailability)initWithStatusPayload:(id)a3 invitationPayload:(id)a4;
- (BOOL)isAvailable;
- (BOOL)personalizedAvailability;
- (NSString)activityIdentifierString;
- (NSUUID)activityIdentifier;
- (id)_initWithAvailable:(BOOL)a3 activityIdentifierString:(id)a4 personalizedAvailability:(BOOL)a5;
- (id)_payloadDictionary;
- (id)statusPublishRequest;
@end

@implementation AKAvailability

- (AKAvailability)initWithPublishedStatus:(id)a3
{
  id v4 = a3;
  v5 = [v4 statusPayload];
  v6 = [v4 invitationPayload];

  if (v5)
  {
    v7 = [(AKAvailability *)self initWithStatusPayload:v5 invitationPayload:v6];
    self = v7;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)statusPublishRequest
{
  v2 = [(AKAvailability *)self _payloadDictionary];
  v3 = (void *)[objc_alloc(MEMORY[0x263F79820]) initWithDictionary:v2];
  id v4 = (void *)[objc_alloc(MEMORY[0x263F79828]) initWithStatusPayload:v3];

  return v4;
}

- (id)_payloadDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[AKAvailability isAvailable](self, "isAvailable"));
  [v3 setObject:v4 forKeyedSubscript:@"a"];

  v5 = [(AKAvailability *)self activityIdentifierString];
  if ([v5 length]) {
    [v3 setObject:v5 forKeyedSubscript:@"i"];
  }
  v6 = (void *)[v3 copy];

  return v6;
}

- (AKAvailability)initWithStatusPayload:(id)a3 invitationPayload:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = [a3 payloadDictionary];
  uint64_t v8 = objc_msgSend(v7, "availabilityKit_BOOLForKey:defaultValue:", @"a", 1);
  v9 = objc_msgSend(v7, "availabilityKit_stringForKey:", @"i");
  uint64_t v10 = [v9 length];
  v11 = +[AKAvailability logger];
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      v35 = v9;
      _os_log_impl(&dword_221617000, v11, OS_LOG_TYPE_DEFAULT, "Availability payload has an activity identifier %@, looking at invitation to see if they may be available or unavailable to me for this activity", buf, 0xCu);
    }

    if (v6)
    {
      v13 = [[AKAvailabilityInvitation alloc] initWithStatusKitInvitationPayload:v6];
      v14 = v13;
      if (!v13)
      {
        v22 = +[AKAvailability logger];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_221617000, v22, OS_LOG_TYPE_DEFAULT, "Not overriding personalizedAvailability, users invitation payload is not a well formed AKAvailabilityInvitation", buf, 2u);
        }
        int v19 = v8;
        goto LABEL_37;
      }
      v15 = [(AKAvailabilityInvitation *)v13 availableDuringActivityIdentifiers];
      v33 = v15;
      if ([v15 count])
      {
        int v16 = [v15 containsObject:v9];
        v17 = +[AKAvailability logger];
        BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
        if (v16)
        {
          if (v18)
          {
            *(_DWORD *)buf = 138412546;
            v35 = v9;
            __int16 v36 = 2112;
            v37 = v15;
            _os_log_impl(&dword_221617000, v17, OS_LOG_TYPE_DEFAULT, "Overriding personalizedAvailability, users active activity identifier %@ is on my list of invited availableDuringActivityIdentifiers: %@", buf, 0x16u);
          }
          int v19 = 1;
          goto LABEL_26;
        }
        if (v18)
        {
          *(_DWORD *)buf = 138412546;
          v35 = v9;
          __int16 v36 = 2112;
          v37 = v15;
          v23 = "Not overriding personalizedAvailability, users active activity identifier %@ is not on my list of invite"
                "d availableDuringActivityIdentifiers: %@";
          v24 = v17;
          uint32_t v25 = 22;
          goto LABEL_24;
        }
      }
      else
      {
        v17 = +[AKAvailability logger];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v23 = "Not overriding personalizedAvailability, users has not invited me to be available to them during any act"
                "ivity identifiers";
          v24 = v17;
          uint32_t v25 = 2;
LABEL_24:
          _os_log_impl(&dword_221617000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
        }
      }
      int v19 = v8;
LABEL_26:

      v26 = [(AKAvailabilityInvitation *)v14 unavailableDuringActivityIdentifiers];
      if ([v26 count])
      {
        v32 = self;
        int v27 = [v26 containsObject:v9];
        v28 = +[AKAvailability logger];
        BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
        if (v27)
        {
          if (v29)
          {
            *(_DWORD *)buf = 138412546;
            v35 = v9;
            __int16 v36 = 2112;
            v37 = v33;
            _os_log_impl(&dword_221617000, v28, OS_LOG_TYPE_DEFAULT, "Overriding personalizedAvailability, users active activity identifier %@ is on my list of invited unavailableDuringActivityIdentifiers: %@", buf, 0x16u);
          }
          int v19 = 0;
        }
        else if (v29)
        {
          *(_DWORD *)buf = 138412546;
          v35 = v9;
          __int16 v36 = 2112;
          v37 = v33;
          _os_log_impl(&dword_221617000, v28, OS_LOG_TYPE_DEFAULT, "Not overriding personalizedAvailability, users active activity identifier %@ is not on my list of invited unavailableDuringActivityIdentifiers: %@", buf, 0x16u);
        }
        self = v32;
      }
      else
      {
        v28 = +[AKAvailability logger];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_221617000, v28, OS_LOG_TYPE_DEFAULT, "Not overriding personalizedAvailability, users has not invited me to be unavailable to them during any activity identifiers", buf, 2u);
        }
      }

      v22 = v33;
LABEL_37:

      BOOL v21 = v19 != 0;
      goto LABEL_38;
    }
    v11 = +[AKAvailability logger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v20 = "Not overriding personalizedAvailability, users has not provided an invitation payload";
      goto LABEL_15;
    }
  }
  else if (v12)
  {
    *(_WORD *)buf = 0;
    v20 = "Not overriding personalizedAvailability, users has not provided an activity identifier for their active activity";
LABEL_15:
    _os_log_impl(&dword_221617000, v11, OS_LOG_TYPE_DEFAULT, v20, buf, 2u);
  }

  BOOL v21 = v8;
LABEL_38:
  v30 = [(AKAvailability *)self _initWithAvailable:v8 activityIdentifierString:v9 personalizedAvailability:v21];

  return v30;
}

+ (id)logger
{
  if (logger_onceToken != -1) {
    dispatch_once(&logger_onceToken, &__block_literal_global);
  }
  v2 = (void *)logger__logger;

  return v2;
}

uint64_t __35__AKAvailability_StatusKit__logger__block_invoke()
{
  logger__logger = (uint64_t)os_log_create("com.apple.StatusKit", "AKAvailability");

  return MEMORY[0x270F9A758]();
}

- (AKAvailability)initWithAvailable:(BOOL)a3 activityIdentifierString:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AKAvailability;
  uint64_t v8 = [(AKAvailability *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_available = a3;
    objc_storeStrong((id *)&v8->_activityIdentifierString, a4);
  }

  return v9;
}

- (id)_initWithAvailable:(BOOL)a3 activityIdentifierString:(id)a4 personalizedAvailability:(BOOL)a5
{
  id result = [(AKAvailability *)self initWithAvailable:a3 activityIdentifierString:a4];
  if (result) {
    *((unsigned char *)result + 9) = a5;
  }
  return result;
}

- (BOOL)isAvailable
{
  return self->_available;
}

- (NSString)activityIdentifierString
{
  return self->_activityIdentifierString;
}

- (BOOL)personalizedAvailability
{
  return self->_personalizedAvailability;
}

- (void).cxx_destruct
{
}

- (AKAvailability)initWithAvailable:(BOOL)a3 activityIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = [a4 UUIDString];
  id v7 = [(AKAvailability *)self initWithAvailable:v4 activityIdentifierString:v6];

  return v7;
}

- (NSUUID)activityIdentifier
{
  if (self->_activityIdentifierString) {
    v2 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:self->_activityIdentifierString];
  }
  else {
    v2 = 0;
  }

  return (NSUUID *)v2;
}

@end