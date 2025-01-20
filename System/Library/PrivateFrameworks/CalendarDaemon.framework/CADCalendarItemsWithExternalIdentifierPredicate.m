@interface CADCalendarItemsWithExternalIdentifierPredicate
+ (BOOL)supportsSecureCoding;
- (CADCalendarItemsWithExternalIdentifierPredicate)initWithCoder:(id)a3;
- (CADCalendarItemsWithExternalIdentifierPredicate)initWithExternalIdentifier:(id)a3;
- (CADCalendarItemsWithExternalIdentifierPredicate)initWithExternalIdentifier:(id)a3 entityType:(int)a4;
- (NSString)externalIdentifier;
- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3;
- (id)predicateFormat;
- (int)entityType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CADCalendarItemsWithExternalIdentifierPredicate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CADCalendarItemsWithExternalIdentifierPredicate)initWithExternalIdentifier:(id)a3 entityType:(int)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CADCalendarItemsWithExternalIdentifierPredicate;
  v7 = [(CADCalendarItemsWithExternalIdentifierPredicate *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    externalIdentifier = v7->_externalIdentifier;
    v7->_externalIdentifier = (NSString *)v8;

    v7->_entityType = a4;
    [(CADEventPredicate *)v7 setExcludeSkippedReminders:0];
  }

  return v7;
}

- (CADCalendarItemsWithExternalIdentifierPredicate)initWithExternalIdentifier:(id)a3
{
  return [(CADCalendarItemsWithExternalIdentifierPredicate *)self initWithExternalIdentifier:a3 entityType:101];
}

- (CADCalendarItemsWithExternalIdentifierPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CADCalendarItemsWithExternalIdentifierPredicate;
  v5 = [(CADEventPredicate *)&v10 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalIdentifier"];
    uint64_t v7 = [v6 copy];
    externalIdentifier = v5->_externalIdentifier;
    v5->_externalIdentifier = (NSString *)v7;

    v5->_entityType = [v4 decodeIntegerForKey:@"entityType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CADCalendarItemsWithExternalIdentifierPredicate;
  id v4 = a3;
  [(CADEventPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_externalIdentifier, @"externalIdentifier", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_entityType forKey:@"entityType"];
}

- (id)predicateFormat
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"%@(externalIdentifier: %@, entityType: %d)", v5, self->_externalIdentifier, self->_entityType];

  return v6;
}

- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3
{
  id v4 = [(CADCalendarItemsWithExternalIdentifierPredicate *)self externalIdentifier];
  CFArrayRef v5 = (const __CFArray *)CalDatabaseCopyCalendarItemsWithUniqueIdentifier();

  if (v5) {
    CFIndex Count = CFArrayGetCount(v5);
  }
  else {
    CFIndex Count = 0;
  }
  uint64_t AuxilliaryDatabaseID = CalDatabaseGetAuxilliaryDatabaseID();
  uint64_t v8 = [(EKPredicate *)self calendarRowIDsForDatabaseID:AuxilliaryDatabaseID];
  v9 = [(EKPredicate *)self restrictedCalendarRowIDsForDatabaseID:AuxilliaryDatabaseID];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:Count];
  if (Count >= 1)
  {
    for (CFIndex i = 0; Count != i; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v5, i);
      if (![v9 count])
      {
        v12 = [(EKPredicate *)self calendars];

        if (!v12) {
          goto LABEL_15;
        }
      }
      uint64_t v13 = CalCalendarItemCopyCalendar();
      if (v13)
      {
        v14 = (const void *)v13;
        v15 = [MEMORY[0x1E4F28ED0] numberWithInt:CalCalendarGetUID()];
        CFRelease(v14);
        if (([v9 containsObject:v15] & 1) == 0
          && (!v8 || ([v8 containsObject:v15] & 1) != 0))
        {

LABEL_15:
          if (CalEntityIsOfType())
          {
            if (CalEntityIsOfType())
            {
              v16 = (const void *)CalEventOccurrenceCreateForInitialOccurrence();
              [v18 addObject:v16];
              CFRelease(v16);
            }
            else if (CalEntityIsOfType())
            {
              [v18 addObject:ValueAtIndex];
            }
          }
          continue;
        }
      }
      else if (!v8)
      {
        goto LABEL_15;
      }
    }
  }
  if (v5) {
    CFRelease(v5);
  }

  return v18;
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (int)entityType
{
  return self->_entityType;
}

- (void).cxx_destruct
{
}

@end