@interface DRPasteAnnouncement
+ (BOOL)_canCoalesceEndpoint:(id)a3 withEndpoint:(id)a4;
+ (BOOL)supportsSecureCoding;
- (BOOL)canCoalesceWithAnnouncement:(id)a3;
- (DRPasteAnnouncement)initWithCoder:(id)a3;
- (DRPasteAnnouncement)initWithSource:(id)a3 destination:(id)a4 pasteboardUUID:(id)a5 timeout:(double)a6;
- (DRPasteAnnouncementEndpoint)destination;
- (DRPasteAnnouncementEndpoint)source;
- (NSString)localizedAnnouncementText;
- (NSString)localizedAuthorizationText;
- (NSUUID)pasteboardUUID;
- (double)timeout;
- (id)_localizedTextRequiringAuthorization:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DRPasteAnnouncement

- (DRPasteAnnouncement)initWithSource:(id)a3 destination:(id)a4 pasteboardUUID:(id)a5 timeout:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DRPasteAnnouncement;
  v14 = [(DRPasteAnnouncement *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_source, a3);
    objc_storeStrong((id *)&v15->_destination, a4);
    objc_storeStrong((id *)&v15->_pasteboardUUID, a5);
    v15->_timeout = a6;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DRPasteAnnouncement)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"source"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destination"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pasteboardUUID"];
  [v4 decodeDoubleForKey:@"timeout"];
  double v9 = v8;

  v10 = [(DRPasteAnnouncement *)self initWithSource:v5 destination:v6 pasteboardUUID:v7 timeout:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  source = self->_source;
  id v5 = a3;
  [v5 encodeObject:source forKey:@"source"];
  [v5 encodeObject:self->_destination forKey:@"destination"];
  [v5 encodeObject:self->_pasteboardUUID forKey:@"pasteboardUUID"];
  [v5 encodeDouble:@"timeout" forKey:self->_timeout];
}

- (NSString)localizedAnnouncementText
{
  return (NSString *)[(DRPasteAnnouncement *)self _localizedTextRequiringAuthorization:0];
}

- (NSString)localizedAuthorizationText
{
  return (NSString *)[(DRPasteAnnouncement *)self _localizedTextRequiringAuthorization:1];
}

- (id)_localizedTextRequiringAuthorization:(BOOL)a3
{
  BOOL v3 = a3;
  if (_localizedTextRequiringAuthorization__onceToken != -1) {
    dispatch_once(&_localizedTextRequiringAuthorization__onceToken, &__block_literal_global_0);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(DRPasteAnnouncementEndpoint *)self->_destination localizedName];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [(DRPasteAnnouncementEndpoint *)self->_source localizedName];
      if (v3)
      {
        v7 = @"PASTE_AUTHORIZATION_REQUEST_SOURCE_AND_DESTINATION";
        double v8 = @"%@ would like to paste from %@";
      }
      else
      {
        v7 = @"PASTE_ANNOUNCEMENT_SOURCE_AND_DESTINATION";
        double v8 = @"%@ pasted from %@";
      }
      id v13 = [(id)_localizedTextRequiringAuthorization__DRBundle localizedStringForKey:v7 value:v8 table:@"Localizable"];
      uint64_t v22 = 0;
      v14 = (id *)&v22;
      [NSString localizedStringWithValidatedFormat:v13, @"%@%@", &v22, v5, v6 validFormatSpecifiers error];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        double v9 = 0;
        id v13 = 0;
        goto LABEL_24;
      }
      v6 = [(DRPasteAnnouncementEndpoint *)self->_source deviceName];
      if (v6)
      {
        if (v3)
        {
          id v11 = @"PASTE_AUTHORIZATION_REQUEST_FROM_CONTINUITY_DEVICE";
          id v12 = @"%@ would like to paste from %@";
        }
        else
        {
          id v11 = @"PASTE_ANNOUNCEMENT_FROM_CONTINUITY_DEVICE";
          id v12 = @"%@ pasted from %@";
        }
        id v13 = [(id)_localizedTextRequiringAuthorization__DRBundle localizedStringForKey:v11 value:v12 table:@"Localizable"];
        uint64_t v21 = 0;
        v14 = (id *)&v21;
        [NSString localizedStringWithValidatedFormat:v13, @"%@%@", &v21, v5, v6 validFormatSpecifiers error];
      }
      else
      {
        if (v3)
        {
          v15 = @"PASTE_AUTHORIZATION_REQUEST_FROM_UNKNOWN_CONTINUITY_DEVICE";
          v16 = @"%@ would like to paste from another device";
        }
        else
        {
          v15 = @"PASTE_ANNOUNCEMENT_FROM_UNKNOWN_CONTINUITY_DEVICE";
          v16 = @"%@ pasted from another device";
        }
        id v13 = [(id)_localizedTextRequiringAuthorization__DRBundle localizedStringForKey:v15 value:v16 table:@"Localizable"];
        uint64_t v20 = 0;
        v14 = (id *)&v20;
        [NSString localizedStringWithValidatedFormat:v13, @"%@", &v20, v5, v19 validFormatSpecifiers error];
      }
    }
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    double v9 = *v14;

    if (v10)
    {
LABEL_27:

      goto LABEL_28;
    }
LABEL_24:
    objc_super v17 = DRLogTarget();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[DRPasteAnnouncement _localizedTextRequiringAuthorization:]((uint64_t)v9, v17);
    }

    v10 = @"PASTE OCCURRED";
    goto LABEL_27;
  }
  double v9 = DRLogTarget();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
    -[DRPasteAnnouncement _localizedTextRequiringAuthorization:](v9);
  }
  v10 = @"PASTE OCCURRED";
LABEL_28:

  return v10;
}

uint64_t __60__DRPasteAnnouncement__localizedTextRequiringAuthorization___block_invoke()
{
  _localizedTextRequiringAuthorization__DRBundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return MEMORY[0x270F9A758]();
}

- (BOOL)canCoalesceWithAnnouncement:(id)a3
{
  id v4 = a3;
  pasteboardUUID = self->_pasteboardUUID;
  v6 = [v4 pasteboardUUID];
  LODWORD(pasteboardUUID) = [(NSUUID *)pasteboardUUID isEqual:v6];

  if (pasteboardUUID
    && ([v4 source],
        v7 = objc_claimAutoreleasedReturnValue(),
        BOOL v8 = +[DRPasteAnnouncement _canCoalesceEndpoint:v7 withEndpoint:self->_source], v7, v8))
  {
    double v9 = [v4 destination];
    BOOL v10 = +[DRPasteAnnouncement _canCoalesceEndpoint:v9 withEndpoint:self->_destination];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (BOOL)_canCoalesceEndpoint:(id)a3 withEndpoint:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_class();
  if ([v7 isEqual:objc_opt_class()])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v8 = [v6 isSimilarToApplicationEndpoint:v5];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        BOOL v9 = 1;
        goto LABEL_9;
      }
      char v8 = [v6 isSimilarToContinuityEndpoint:v5];
    }
    BOOL v9 = v8;
  }
  else
  {
    BOOL v9 = 0;
  }
LABEL_9:

  return v9;
}

- (DRPasteAnnouncementEndpoint)source
{
  return self->_source;
}

- (DRPasteAnnouncementEndpoint)destination
{
  return self->_destination;
}

- (NSUUID)pasteboardUUID
{
  return self->_pasteboardUUID;
}

- (double)timeout
{
  return self->_timeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pasteboardUUID, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

- (void)_localizedTextRequiringAuthorization:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2129E2000, a2, OS_LOG_TYPE_ERROR, "Invalid format string for paste announcement (error: %@)", (uint8_t *)&v2, 0xCu);
}

- (void)_localizedTextRequiringAuthorization:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_2129E2000, log, OS_LOG_TYPE_FAULT, "Unknown kind of source or destination for paste announcement", v1, 2u);
}

@end