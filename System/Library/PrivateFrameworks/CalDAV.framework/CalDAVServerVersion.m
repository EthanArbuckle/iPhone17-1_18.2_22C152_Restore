@interface CalDAVServerVersion
+ (CalDAVServerVersion)versionWithHTTPHeaders:(id)a3;
+ (CalDAVServerVersion)versionWithPropertyValue:(id)a3;
+ (id)_prototypeMatchingServerHeaders:(id)a3;
- (BOOL)alwaysSupportsFreebusyOnOutbox;
- (BOOL)expandPropertyReportIsUnreliable;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresOpeningAttachmentAsLink;
- (BOOL)shouldUseDeleteAndAddInsteadOfMoveBetweenCalendars;
- (BOOL)supportsAutoSchedule;
- (BOOL)supportsCalendarAudit;
- (BOOL)supportsCalendarHomeSync;
- (BOOL)supportsCalendarNoTimezone;
- (BOOL)supportsCalendarProxy;
- (BOOL)supportsCalendarRecurrenceSplit;
- (BOOL)supportsCheckForValidEmail;
- (BOOL)supportsChecksumming;
- (BOOL)supportsClearingPrivateComments;
- (BOOL)supportsDefaultAlarms;
- (BOOL)supportsExtendedCalendarQuery;
- (BOOL)supportsInboxAvailability;
- (BOOL)supportsLikenessPropagation;
- (BOOL)supportsManagedAttachments;
- (BOOL)supportsManagedSubscriptionCalendars;
- (BOOL)supportsParticipantRoles;
- (BOOL)supportsPrincipalPropertySearch;
- (BOOL)supportsPrivateComments;
- (BOOL)supportsPrivateEvents;
- (BOOL)supportsRequestCompression;
- (BOOL)supportsSharing;
- (BOOL)supportsSharingNoScheduling;
- (BOOL)supportsSubscriptionCalendars;
- (BOOL)supportsSubscriptionMirroring;
- (BOOL)supportsTelephone;
- (BOOL)supportsTimeRangeFilter;
- (BOOL)supportsTimeRangeFilterOnInbox;
- (BOOL)supportsTimeRangeFilterWithoutEndDate;
- (CalDAVServerVersion)init;
- (NSSet)complianceClasses;
- (NSString)serverHeader;
- (NSString)supportedCalendarComponentSets;
- (NSString)type;
- (double)version;
- (id)_additionalFlagKeys;
- (id)_allFlagKeys;
- (id)_propertiesToComplianceClasses;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)propertyValue;
- (unint64_t)hash;
- (void)_setPropertiesFromComplianceClasses:(id)a3;
- (void)setAlwaysSupportsFreebusyOnOutbox:(BOOL)a3;
- (void)setComplianceClasses:(id)a3;
- (void)setExpandPropertyReportIsUnreliable:(BOOL)a3;
- (void)setServerHeader:(id)a3;
- (void)setSupportedCalendarComponentSets:(id)a3;
- (void)setSupportsAutoSchedule:(BOOL)a3;
- (void)setSupportsCalendarAudit:(BOOL)a3;
- (void)setSupportsCalendarHomeSync:(BOOL)a3;
- (void)setSupportsCalendarNoTimezone:(BOOL)a3;
- (void)setSupportsCalendarProxy:(BOOL)a3;
- (void)setSupportsCalendarRecurrenceSplit:(BOOL)a3;
- (void)setSupportsCheckForValidEmail:(BOOL)a3;
- (void)setSupportsChecksumming:(BOOL)a3;
- (void)setSupportsClearingPrivateComments:(BOOL)a3;
- (void)setSupportsDefaultAlarms:(BOOL)a3;
- (void)setSupportsExtendedCalendarQuery:(BOOL)a3;
- (void)setSupportsInboxAvailability:(BOOL)a3;
- (void)setSupportsLikenessPropagation:(BOOL)a3;
- (void)setSupportsManagedAttachments:(BOOL)a3;
- (void)setSupportsManagedSubscriptionCalendars:(BOOL)a3;
- (void)setSupportsParticipantRoles:(BOOL)a3;
- (void)setSupportsPrincipalPropertySearch:(BOOL)a3;
- (void)setSupportsPrivateComments:(BOOL)a3;
- (void)setSupportsPrivateEvents:(BOOL)a3;
- (void)setSupportsRequestCompression:(BOOL)a3;
- (void)setSupportsSharing:(BOOL)a3;
- (void)setSupportsSharingNoScheduling:(BOOL)a3;
- (void)setSupportsSubscriptionCalendars:(BOOL)a3;
- (void)setSupportsSubscriptionMirroring:(BOOL)a3;
- (void)setSupportsTelephone:(BOOL)a3;
- (void)setSupportsTimeRangeFilter:(BOOL)a3;
- (void)setSupportsTimeRangeFilterOnInbox:(BOOL)a3;
- (void)setSupportsTimeRangeFilterWithoutEndDate:(BOOL)a3;
- (void)setVersion:(double)a3;
@end

@implementation CalDAVServerVersion

+ (id)_prototypeMatchingServerHeaders:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = +[CalDAVConcreteServerVersion prototypes];
  v5 = v4;
  if (v3)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
        v12 = objc_msgSend(v11, "regularExpression", (void)v22);
        if (v12)
        {
          v13 = objc_msgSend(v12, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
          if ([v13 count])
          {
            v14 = (void *)[v11 copy];
            v15 = [v13 objectAtIndex:0];
            if ((unint64_t)[v15 numberOfRanges] >= 2)
            {
              uint64_t v16 = [v15 rangeAtIndex:1];
              if (v16 != 0x7FFFFFFFFFFFFFFFLL)
              {
                v18 = objc_msgSend(v3, "substringWithRange:", v16, v17);
                [v18 doubleValue];
                double v20 = v19;

                [v14 setVersion:v20];
              }
            }

            if (v14) {
              goto LABEL_18;
            }
            goto LABEL_17;
          }
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
LABEL_17:
  v14 = objc_msgSend((id)_unknownServerVersionPrototype, "copy", (void)v22);
LABEL_18:
  [v14 setServerHeader:v3];

  return v14;
}

- (id)_propertiesToComplianceClasses
{
  if (_propertiesToComplianceClasses_configuredProperties != -1) {
    dispatch_once(&_propertiesToComplianceClasses_configuredProperties, &__block_literal_global_64);
  }
  v2 = (void *)_calDAVPropertyToComplianceClassMapping;
  return v2;
}

uint64_t __53__CalDAVServerVersion__propertiesToComplianceClasses__block_invoke()
{
  _calDAVPropertyToComplianceClassMapping = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"calendar-auto-schedule", @"supportsAutoSchedule", @"calendarserver-private-comments", @"supportsPrivateComments", @"calendarserver-clearing-private-comments", @"supportsClearingPrivateComments", @"calendarserver-recurrence-split", @"supportsLikenessPropagation", @"calendarserver-sharing", @"supportsSharing", @"calendarserver-sharing-no-scheduling", @"supportsSharingNoScheduling", @"calendar-proxy", @"supportsCalendarProxy", @"inbox-availability", @"supportsInboxAvailability", @"calendarserver-private-events",
                                              @"supportsPrivateEvents",
                                              @"calendarserver-subscribed",
                                              @"supportsSubscriptionCalendars",
                                              @"calendarserver-managed-subscribed",
                                              @"supportsManagedSubscriptionCalendars",
                                              @"calendarserver-subscribed-mirror",
                                              @"supportsSubscriptionMirroring",
                                              @"calendar-role",
                                              @"supportsParticipantRoles",
                                              @"calendarserver-principal-property-search",
                                              @"supportsPrincipalPropertySearch",
                                              @"calendar-query-extended",
                                              @"supportsExtendedCalendarQuery",
                                              @"calendar-managed-attachments",
                                              @"supportsManagedAttachments",
                                              @"calendarserver-home-sync",
                                              @"supportsCalendarHomeSync",
                                              @"calendar-no-timezone",
                                              @"supportsCalendarNoTimezone",
                                              @"calendarserver-recurrence-split",
                                              @"supportsCalendarRecurrenceSplit",
                                              @"calendar-audit",
                                              @"supportsCalendarAudit",
                                              @"caldavserver-supports-telephone",
                                              @"supportsTelephone",
                                              @"calendar-default-alarms",
                                              @"supportsDefaultAlarms",
                                              0);
  return MEMORY[0x270F9A758]();
}

- (id)_additionalFlagKeys
{
  return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"supportsTimeRangeFilter", @"supportsTimeRangeFilterWithoutEndDate", @"supportsTimeRangeFilterOnInbox", @"supportsRequestCompression", @"supportsCheckForValidEmail", @"supportsChecksumming", @"alwaysSupportsFreebusyOnOutbox", 0);
}

- (id)_allFlagKeys
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__CalDAVServerVersion__allFlagKeys__block_invoke;
  block[3] = &unk_2641EBF88;
  block[4] = self;
  if (_allFlagKeys_configuredFlags != -1) {
    dispatch_once(&_allFlagKeys_configuredFlags, block);
  }
  return (id)_calDAVAllFlagProperties;
}

void __35__CalDAVServerVersion__allFlagKeys__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) _propertiesToComplianceClasses];
  v2 = [v6 allKeys];
  id v3 = [*(id *)(a1 + 32) _additionalFlagKeys];
  uint64_t v4 = [v2 arrayByAddingObjectsFromArray:v3];
  v5 = (void *)_calDAVAllFlagProperties;
  _calDAVAllFlagProperties = v4;
}

- (void)_setPropertiesFromComplianceClasses:(id)a3
{
  id v4 = a3;
  [(CalDAVServerVersion *)self setComplianceClasses:v4];
  v5 = [(CalDAVServerVersion *)self _propertiesToComplianceClasses];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __59__CalDAVServerVersion__setPropertiesFromComplianceClasses___block_invoke;
  uint64_t v10 = &unk_2641EC3A8;
  id v6 = v4;
  id v11 = v6;
  v12 = self;
  [v5 enumerateKeysAndObjectsUsingBlock:&v7];

  if (![(CalDAVServerVersion *)self supportsInboxAvailability]) {
    -[CalDAVServerVersion setSupportsInboxAvailability:](self, "setSupportsInboxAvailability:", [v6 containsObject:@"calendar-availability"]);
  }
}

void __59__CalDAVServerVersion__setPropertiesFromComplianceClasses___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 containsObject:a3];
  id v8 = [NSNumber numberWithBool:v7];
  [*(id *)(a1 + 40) setValue:v8 forKey:v6];
}

+ (CalDAVServerVersion)versionWithHTTPHeaders:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 objectForKey:*MEMORY[0x263F34A88]];
  id v6 = CDVCleanedStringsFromResponseHeaders();
  uint64_t v7 = [a1 _prototypeMatchingServerHeaders:v5];
  [v7 _setPropertiesFromComplianceClasses:v6];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = CDVCleanedStringsFromResponseHeaders();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        if (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "isEqualToString:", @"gzip", (void)v14))
        {
          [v7 setSupportsRequestCompression:1];
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (CalDAVServerVersion *)v7;
}

- (CalDAVServerVersion)init
{
  v3.receiver = self;
  v3.super_class = (Class)CalDAVServerVersion;
  result = [(CalDAVServerVersion *)&v3 init];
  if (result)
  {
    result->_version = 0.0;
    *(_WORD *)&result->_supportsTimeRangeFilter = 257;
    result->_supportsTimeRangeFilterOnInbox = 1;
    result->_supportsRequestCompression = 0;
    result->_supportsChecksumming = 1;
    result->_alwaysSupportsFreebusyOnOutbox = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [(CalDAVServerVersion *)self version];
  objc_msgSend(v4, "setVersion:");
  v5 = [(CalDAVServerVersion *)self serverHeader];
  [v4 setServerHeader:v5];

  id v6 = [(CalDAVServerVersion *)self supportedCalendarComponentSets];
  [v4 setSupportedCalendarComponentSets:v6];

  uint64_t v7 = [(CalDAVServerVersion *)self complianceClasses];
  [v4 setComplianceClasses:v7];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = [(CalDAVServerVersion *)self _allFlagKeys];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        long long v14 = [(CalDAVServerVersion *)self valueForKey:v13];
        [v4 setValue:v14 forKey:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  return v4;
}

- (unint64_t)hash
{
  objc_super v3 = [(CalDAVServerVersion *)self type];
  uint64_t v4 = [v3 hash];
  [(CalDAVServerVersion *)self version];
  unint64_t v6 = v4 + (unint64_t)v5 + [(CalDAVServerVersion *)self supportsAutoSchedule];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [v5 type];
    uint64_t v7 = [(CalDAVServerVersion *)self type];
    if ([v6 isEqualToString:v7])
    {
      [v5 version];
      double v9 = v8;
      [(CalDAVServerVersion *)self version];
      double v11 = v10;

      if (v9 == v11)
      {
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        v12 = [(CalDAVServerVersion *)self _allFlagKeys];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v24;
          while (2)
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v24 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
              long long v18 = [v5 valueForKey:v17];
              long long v19 = [(CalDAVServerVersion *)self valueForKey:v17];
              int v20 = [v18 isEqualToNumber:v19];

              if (!v20)
              {
                BOOL v21 = 0;
                goto LABEL_19;
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
        BOOL v21 = 1;
LABEL_19:

        goto LABEL_16;
      }
    }
    else
    {
    }
    BOOL v21 = 0;
LABEL_16:

    goto LABEL_17;
  }
  BOOL v21 = 0;
LABEL_17:

  return v21;
}

- (id)description
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_super v3 = [MEMORY[0x263F089D8] string];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(CalDAVServerVersion *)self complianceClasses];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"%@, ", *(void *)(*((void *)&v14 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  if ((unint64_t)[v3 length] >= 3) {
    objc_msgSend(v3, "deleteCharactersInRange:", objc_msgSend(v3, "length") - 2, 2);
  }
  double v9 = NSString;
  double v10 = [(CalDAVServerVersion *)self type];
  [(CalDAVServerVersion *)self version];
  v12 = [v9 stringWithFormat:@"%@/%0.1f (%@)", v10, v11, v3];

  return v12;
}

- (NSString)type
{
  return (NSString *)@"Unknown";
}

+ (CalDAVServerVersion)versionWithPropertyValue:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a3;
  double v4 = 0.0;
  if (!v3)
  {
    v30 = 0;
    v31 = 0;
    unsigned int v32 = 0;
    v12 = 0;
    uint64_t v5 = @"Unknown";
    goto LABEL_26;
  }
  objc_opt_class();
  uint64_t v5 = @"Unknown";
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v30 = 0;
    v31 = 0;
    unsigned int v32 = 0;
    v12 = 0;
    goto LABEL_26;
  }
  uint64_t v6 = [v3 objectForKey:@"CalDAVServerType"];
  uint64_t v7 = (void *)v6;
  if (v6) {
    double v8 = (__CFString *)v6;
  }
  else {
    double v8 = @"Unknown";
  }
  uint64_t v5 = v8;

  double v9 = [v3 objectForKey:@"CalDAVServerVersion"];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 doubleValue];
      double v4 = v10;
    }
  }
  uint64_t v11 = [v3 objectForKey:@"SupportsCompression"];
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v32 = [v11 BOOLValue];
  }
  else {
    unsigned int v32 = 0;
  }
  v12 = [v3 objectForKey:@"ComplianceClasses"];
  v31 = [v3 objectForKey:@"ServerHeader"];
  v30 = [v3 objectForKey:@"SupportedCalendarComponentSets"];
  uint64_t v13 = [v3 objectForKey:@"CalDAVAutoSchedule"];
  if (v13
    || ([v3 objectForKey:@"CalDAVSupportsComments"],
        (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_18:
    long long v14 = [MEMORY[0x263EFF9C0] set];
    long long v15 = [v3 objectForKey:@"CalDAVAutoSchedule"];

    if (v15) {
      [v14 addObject:@"calendar-auto-schedule"];
    }
    long long v16 = [v3 objectForKey:@"CalDAVSupportsComments"];

    if (v16) {
      [v14 addObject:@"calendarserver-private-comments"];
    }
    long long v17 = [v3 objectForKey:@"CalDAVSupportsSharing"];

    if (v17) {
      [v14 addObject:@"calendarserver-sharing"];
    }
    uint64_t v18 = [v14 setByAddingObjectsFromSet:v12];

    v12 = (void *)v18;
    goto LABEL_25;
  }
  v29 = [v3 objectForKey:@"CalDAVSupportsSharing"];

  if (v29) {
    goto LABEL_18;
  }
LABEL_25:

LABEL_26:
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v19 = +[CalDAVConcreteServerVersion prototypes];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v34;
LABEL_28:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v34 != v22) {
        objc_enumerationMutation(v19);
      }
      long long v24 = *(void **)(*((void *)&v33 + 1) + 8 * v23);
      long long v25 = [v24 type];
      char v26 = [(__CFString *)v5 isEqualToString:v25];

      if (v26) {
        break;
      }
      if (v21 == ++v23)
      {
        uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v21) {
          goto LABEL_28;
        }
        goto LABEL_34;
      }
    }
    uint64_t v27 = (void *)[v24 copy];
    [v27 setVersion:v4];

    if (v27) {
      goto LABEL_37;
    }
  }
  else
  {
LABEL_34:
  }
  uint64_t v27 = (void *)[(id)_unknownServerVersionPrototype copy];
LABEL_37:
  [v27 _setPropertiesFromComplianceClasses:v12];
  [v27 setServerHeader:v31];
  [v27 setSupportsRequestCompression:v32];
  [v27 setSupportedCalendarComponentSets:v30];

  return (CalDAVServerVersion *)v27;
}

- (id)propertyValue
{
  id v3 = [(CalDAVServerVersion *)self complianceClasses];
  if (![v3 count])
  {
    double v4 = [MEMORY[0x263EFF9C0] set];
    uint64_t v5 = [(CalDAVServerVersion *)self _propertiesToComplianceClasses];
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __36__CalDAVServerVersion_propertyValue__block_invoke;
    uint64_t v20 = &unk_2641EC3A8;
    uint64_t v21 = self;
    id v6 = v4;
    id v22 = v6;
    [v5 enumerateKeysAndObjectsUsingBlock:&v17];

    id v7 = v6;
    id v3 = v7;
  }
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  double v9 = NSNumber;
  [(CalDAVServerVersion *)self version];
  double v10 = objc_msgSend(v9, "numberWithDouble:");
  [v8 setObject:v10 forKey:@"CalDAVServerVersion"];

  uint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", -[CalDAVServerVersion supportsRequestCompression](self, "supportsRequestCompression"));
  [v8 setObject:v11 forKey:@"SupportsCompression"];

  v12 = [v3 allObjects];
  [v8 setObject:v12 forKey:@"ComplianceClasses"];

  uint64_t v13 = [(CalDAVServerVersion *)self type];
  if (v13) {
    [v8 setObject:v13 forKey:@"CalDAVServerType"];
  }
  long long v14 = [(CalDAVServerVersion *)self serverHeader];
  if (v14) {
    [v8 setObject:v14 forKey:@"ServerHeader"];
  }
  long long v15 = [(CalDAVServerVersion *)self supportedCalendarComponentSets];
  if (v15) {
    [v8 setObject:v15 forKey:@"SupportedCalendarComponentSets"];
  }

  return v8;
}

void __36__CalDAVServerVersion_propertyValue__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) valueForKey:a2];
  int v6 = [v5 BOOLValue];

  if (v6) {
    [*(id *)(a1 + 40) addObject:v7];
  }
}

- (BOOL)requiresOpeningAttachmentAsLink
{
  return 0;
}

- (BOOL)shouldUseDeleteAndAddInsteadOfMoveBetweenCalendars
{
  return 0;
}

- (double)version
{
  return self->_version;
}

- (void)setVersion:(double)a3
{
  self->_version = a3;
}

- (BOOL)supportsTimeRangeFilter
{
  return self->_supportsTimeRangeFilter;
}

- (void)setSupportsTimeRangeFilter:(BOOL)a3
{
  self->_supportsTimeRangeFilter = a3;
}

- (BOOL)supportsTimeRangeFilterWithoutEndDate
{
  return self->_supportsTimeRangeFilterWithoutEndDate;
}

- (void)setSupportsTimeRangeFilterWithoutEndDate:(BOOL)a3
{
  self->_supportsTimeRangeFilterWithoutEndDate = a3;
}

- (BOOL)supportsTimeRangeFilterOnInbox
{
  return self->_supportsTimeRangeFilterOnInbox;
}

- (void)setSupportsTimeRangeFilterOnInbox:(BOOL)a3
{
  self->_supportsTimeRangeFilterOnInbox = a3;
}

- (BOOL)supportsAutoSchedule
{
  return self->_supportsAutoSchedule;
}

- (void)setSupportsAutoSchedule:(BOOL)a3
{
  self->_supportsAutoSchedule = a3;
}

- (BOOL)supportsPrivateComments
{
  return self->_supportsPrivateComments;
}

- (void)setSupportsPrivateComments:(BOOL)a3
{
  self->_supportsPrivateComments = a3;
}

- (BOOL)supportsClearingPrivateComments
{
  return self->_supportsClearingPrivateComments;
}

- (void)setSupportsClearingPrivateComments:(BOOL)a3
{
  self->_supportsClearingPrivateComments = a3;
}

- (BOOL)supportsLikenessPropagation
{
  return self->_supportsLikenessPropagation;
}

- (void)setSupportsLikenessPropagation:(BOOL)a3
{
  self->_supportsLikenessPropagation = a3;
}

- (BOOL)supportsSharing
{
  return self->_supportsSharing;
}

- (void)setSupportsSharing:(BOOL)a3
{
  self->_supportsSharing = a3;
}

- (BOOL)supportsSharingNoScheduling
{
  return self->_supportsSharingNoScheduling;
}

- (void)setSupportsSharingNoScheduling:(BOOL)a3
{
  self->_supportsSharingNoScheduling = a3;
}

- (BOOL)supportsCalendarProxy
{
  return self->_supportsCalendarProxy;
}

- (void)setSupportsCalendarProxy:(BOOL)a3
{
  self->_supportsCalendarProxy = a3;
}

- (BOOL)supportsInboxAvailability
{
  return self->_supportsInboxAvailability;
}

- (void)setSupportsInboxAvailability:(BOOL)a3
{
  self->_supportsInboxAvailability = a3;
}

- (BOOL)supportsPrivateEvents
{
  return self->_supportsPrivateEvents;
}

- (void)setSupportsPrivateEvents:(BOOL)a3
{
  self->_supportsPrivateEvents = a3;
}

- (BOOL)supportsSubscriptionCalendars
{
  return self->_supportsSubscriptionCalendars;
}

- (void)setSupportsSubscriptionCalendars:(BOOL)a3
{
  self->_supportsSubscriptionCalendars = a3;
}

- (BOOL)supportsManagedSubscriptionCalendars
{
  return self->_supportsManagedSubscriptionCalendars;
}

- (void)setSupportsManagedSubscriptionCalendars:(BOOL)a3
{
  self->_supportsManagedSubscriptionCalendars = a3;
}

- (BOOL)supportsSubscriptionMirroring
{
  return self->_supportsSubscriptionMirroring;
}

- (void)setSupportsSubscriptionMirroring:(BOOL)a3
{
  self->_supportsSubscriptionMirroring = a3;
}

- (BOOL)supportsParticipantRoles
{
  return self->_supportsParticipantRoles;
}

- (void)setSupportsParticipantRoles:(BOOL)a3
{
  self->_supportsParticipantRoles = a3;
}

- (BOOL)supportsPrincipalPropertySearch
{
  return self->_supportsPrincipalPropertySearch;
}

- (void)setSupportsPrincipalPropertySearch:(BOOL)a3
{
  self->_supportsPrincipalPropertySearch = a3;
}

- (BOOL)supportsExtendedCalendarQuery
{
  return self->_supportsExtendedCalendarQuery;
}

- (void)setSupportsExtendedCalendarQuery:(BOOL)a3
{
  self->_supportsExtendedCalendarQuery = a3;
}

- (BOOL)supportsRequestCompression
{
  return self->_supportsRequestCompression;
}

- (void)setSupportsRequestCompression:(BOOL)a3
{
  self->_supportsRequestCompression = a3;
}

- (BOOL)supportsManagedAttachments
{
  return self->_supportsManagedAttachments;
}

- (void)setSupportsManagedAttachments:(BOOL)a3
{
  self->_supportsManagedAttachments = a3;
}

- (BOOL)supportsCheckForValidEmail
{
  return self->_supportsCheckForValidEmail;
}

- (void)setSupportsCheckForValidEmail:(BOOL)a3
{
  self->_supportsCheckForValidEmail = a3;
}

- (BOOL)supportsChecksumming
{
  return self->_supportsChecksumming;
}

- (void)setSupportsChecksumming:(BOOL)a3
{
  self->_supportsChecksumming = a3;
}

- (BOOL)supportsCalendarHomeSync
{
  return self->_supportsCalendarHomeSync;
}

- (void)setSupportsCalendarHomeSync:(BOOL)a3
{
  self->_supportsCalendarHomeSync = a3;
}

- (NSString)supportedCalendarComponentSets
{
  return self->_supportedCalendarComponentSets;
}

- (void)setSupportedCalendarComponentSets:(id)a3
{
}

- (BOOL)supportsCalendarNoTimezone
{
  return self->_supportsCalendarNoTimezone;
}

- (void)setSupportsCalendarNoTimezone:(BOOL)a3
{
  self->_supportsCalendarNoTimezone = a3;
}

- (BOOL)supportsCalendarRecurrenceSplit
{
  return self->_supportsCalendarRecurrenceSplit;
}

- (void)setSupportsCalendarRecurrenceSplit:(BOOL)a3
{
  self->_supportsCalendarRecurrenceSplit = a3;
}

- (BOOL)alwaysSupportsFreebusyOnOutbox
{
  return self->_alwaysSupportsFreebusyOnOutbox;
}

- (void)setAlwaysSupportsFreebusyOnOutbox:(BOOL)a3
{
  self->_alwaysSupportsFreebusyOnOutbox = a3;
}

- (BOOL)supportsCalendarAudit
{
  return self->_supportsCalendarAudit;
}

- (void)setSupportsCalendarAudit:(BOOL)a3
{
  self->_supportsCalendarAudit = a3;
}

- (BOOL)supportsTelephone
{
  return self->_supportsTelephone;
}

- (void)setSupportsTelephone:(BOOL)a3
{
  self->_supportsTelephone = a3;
}

- (BOOL)supportsDefaultAlarms
{
  return self->_supportsDefaultAlarms;
}

- (void)setSupportsDefaultAlarms:(BOOL)a3
{
  self->_supportsDefaultAlarms = a3;
}

- (BOOL)expandPropertyReportIsUnreliable
{
  return self->_expandPropertyReportIsUnreliable;
}

- (void)setExpandPropertyReportIsUnreliable:(BOOL)a3
{
  self->_expandPropertyReportIsUnreliable = a3;
}

- (NSSet)complianceClasses
{
  return self->_complianceClasses;
}

- (void)setComplianceClasses:(id)a3
{
}

- (NSString)serverHeader
{
  return self->_serverHeader;
}

- (void)setServerHeader:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverHeader, 0);
  objc_storeStrong((id *)&self->_complianceClasses, 0);
  objc_storeStrong((id *)&self->_supportedCalendarComponentSets, 0);
}

@end