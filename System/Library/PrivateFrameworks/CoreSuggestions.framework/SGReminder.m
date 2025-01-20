@interface SGReminder
+ (BOOL)supportsSecureCoding;
+ (id)describeReminderDueLocationTrigger:(unsigned __int8)a3;
+ (id)describeReminderDueLocationType:(unsigned __int8)a3;
+ (id)describeReminderStatus:(unsigned __int8)a3;
- (BOOL)isAllDay;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToReminder:(id)a3;
- (NSDate)creationDate;
- (NSDateComponents)dueDateComponents;
- (NSString)contactIdentifier;
- (NSString)opaqueKey;
- (NSString)title;
- (NSString)uniqueKey;
- (NSURL)sourceURL;
- (SGLocation)dueLocation;
- (SGReminder)initWithCoder:(id)a3;
- (SGReminder)initWithRecordId:(id)a3 origin:(id)a4 title:(id)a5 dueDateComponents:(id)a6 dueLocationType:(unsigned __int8)a7 dueLocation:(id)a8 dueLocationTrigger:(unsigned __int8)a9 sourceURL:(id)a10 reminderStatus:(unsigned __int8)a11 opaqueKey:(id)a12 uniqueKey:(id)a13 contactIdentifier:(id)a14 creationDate:(id)a15;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)loggingIdentifier;
- (unint64_t)hash;
- (unsigned)dueLocationTrigger;
- (unsigned)dueLocationType;
- (unsigned)reminderStatus;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGReminder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueKey, 0);
  objc_storeStrong((id *)&self->_opaqueKey, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_dueLocation, 0);
  objc_storeStrong((id *)&self->_dueDateComponents, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (unsigned)reminderStatus
{
  return self->_reminderStatus;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSString)uniqueKey
{
  return self->_uniqueKey;
}

- (NSString)opaqueKey
{
  return self->_opaqueKey;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (unsigned)dueLocationTrigger
{
  return self->_dueLocationTrigger;
}

- (SGLocation)dueLocation
{
  return self->_dueLocation;
}

- (unsigned)dueLocationType
{
  return self->_dueLocationType;
}

- (NSDateComponents)dueDateComponents
{
  return self->_dueDateComponents;
}

- (NSString)title
{
  return self->_title;
}

- (id)loggingIdentifier
{
  p_opaqueKey = &self->_opaqueKey;
  if (self->_opaqueKey || (p_opaqueKey = &self->_uniqueKey, self->_uniqueKey)) {
    v3 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%tu", -[NSString hash](*p_opaqueKey, "hash"));
  }
  else {
    v3 = &stru_1EF915628;
  }
  if ((unint64_t)[(__CFString *)v3 length] > 0xC)
  {
    -[__CFString substringWithRange:](v3, "substringWithRange:", 0, 12);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = objc_opt_new();
  v4 = @"SGEntityTypePseudoReminder";
  [v3 setObject:@"SGEntityTypePseudoReminder" forKeyedSubscript:@"type"];

  [v3 setObject:self->_title forKeyedSubscript:@"title"];
  v5 = [(NSDateComponents *)self->_dueDateComponents date];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F28D48];
    v7 = [(NSDateComponents *)self->_dueDateComponents timeZone];
    v8 = [v6 stringFromDate:v5 timeZone:v7 formatOptions:1907];
    [v3 setObject:v8 forKeyedSubscript:@"dueDate"];
  }
  if (self->_dueLocationType)
  {
    v9 = [(id)objc_opt_class() describeReminderDueLocationType:self->_dueLocationType];
    [v3 setObject:v9 forKeyedSubscript:@"dueLocationType"];
  }
  v10 = [(SGLocation *)self->_dueLocation label];
  [v3 setObject:v10 forKeyedSubscript:@"dueLocation"];

  if (self->_dueLocationTrigger)
  {
    v11 = [(id)objc_opt_class() describeReminderDueLocationTrigger:self->_dueLocationTrigger];
    [v3 setObject:v11 forKeyedSubscript:@"dueLocationTrigger"];
  }
  v12 = [(id)objc_opt_class() describeReminderStatus:self->_reminderStatus];
  [v3 setObject:v12 forKeyedSubscript:@"SGReminderStatus"];

  return v3;
}

- (BOOL)isEqualToReminder:(id)a3
{
  v4 = (id *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_31;
  }
  title = self->_title;
  v7 = (NSString *)v4[4];
  if (title == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = title;
    char v10 = [(NSString *)v9 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_31;
    }
  }
  dueDateComponents = self->_dueDateComponents;
  v12 = (NSDateComponents *)v5[5];
  if (dueDateComponents == v12)
  {
  }
  else
  {
    v13 = v12;
    v14 = dueDateComponents;
    char v15 = [(NSDateComponents *)v14 isEqual:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_31;
    }
  }
  int dueLocationType = self->_dueLocationType;
  if (dueLocationType != [v5 dueLocationType]) {
    goto LABEL_31;
  }
  dueLocation = self->_dueLocation;
  v18 = (SGLocation *)v5[6];
  if (dueLocation == v18)
  {
  }
  else
  {
    v19 = v18;
    v20 = dueLocation;
    BOOL v21 = [(SGLocation *)v20 isEqual:v19];

    if (!v21) {
      goto LABEL_31;
    }
  }
  int dueLocationTrigger = self->_dueLocationTrigger;
  if (dueLocationTrigger != [v5 dueLocationTrigger]) {
    goto LABEL_31;
  }
  sourceURL = self->_sourceURL;
  v24 = (NSURL *)v5[7];
  if (sourceURL == v24)
  {
  }
  else
  {
    v25 = v24;
    v26 = sourceURL;
    char v27 = [(NSURL *)v26 isEqual:v25];

    if ((v27 & 1) == 0) {
      goto LABEL_31;
    }
  }
  int reminderStatus = self->_reminderStatus;
  if (reminderStatus != [v5 reminderStatus])
  {
LABEL_31:
    char v44 = 0;
    goto LABEL_32;
  }
  opaqueKey = self->_opaqueKey;
  v30 = (NSString *)v5[9];
  if (opaqueKey == v30)
  {
  }
  else
  {
    v31 = v30;
    v32 = opaqueKey;
    char v33 = [(NSString *)v32 isEqual:v31];

    if ((v33 & 1) == 0) {
      goto LABEL_31;
    }
  }
  uniqueKey = self->_uniqueKey;
  v35 = (NSString *)v5[10];
  if (uniqueKey == v35)
  {
  }
  else
  {
    v36 = v35;
    v37 = uniqueKey;
    char v38 = [(NSString *)v37 isEqual:v36];

    if ((v38 & 1) == 0) {
      goto LABEL_31;
    }
  }
  contactIdentifier = self->_contactIdentifier;
  v40 = (NSString *)v5[11];
  if (contactIdentifier == v40)
  {
  }
  else
  {
    v41 = v40;
    v42 = contactIdentifier;
    char v43 = [(NSString *)v42 isEqual:v41];

    if ((v43 & 1) == 0) {
      goto LABEL_31;
    }
  }
  v46 = self->_creationDate;
  v47 = v46;
  if (v46 == v5[8]) {
    char v44 = 1;
  }
  else {
    char v44 = -[NSDate isEqual:](v46, "isEqual:");
  }

LABEL_32:
  return v44;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGReminder *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGReminder *)self isEqualToReminder:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL v6 = [(SGObject *)self recordId];
  v7 = [(SGObject *)self origin];
  title = self->_title;
  v9 = (void *)[(NSDateComponents *)self->_dueDateComponents copyWithZone:a3];
  uint64_t dueLocationType = self->_dueLocationType;
  id v11 = [(SGLocation *)self->_dueLocation copyWithZone:a3];
  unsigned __int8 dueLocationTrigger = self->_dueLocationTrigger;
  v13 = (void *)[(NSURL *)self->_sourceURL copyWithZone:a3];
  LOBYTE(v17) = self->_reminderStatus;
  LOBYTE(v16) = dueLocationTrigger;
  v14 = (void *)[v5 initWithRecordId:v6 origin:v7 title:title dueDateComponents:v9 dueLocationType:dueLocationType dueLocation:v11 dueLocationTrigger:v16 sourceURL:v13 reminderStatus:v17 opaqueKey:self->_opaqueKey uniqueKey:self->_uniqueKey contactIdentifier:self->_contactIdentifier creationDate:self->_creationDate];

  return v14;
}

- (SGReminder)initWithCoder:(id)a3
{
  id v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)SGReminder;
  BOOL v6 = [(SGObject *)&v35 initWithCoder:v5];
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    v8 = [v5 decodeObjectOfClasses:v7 forKey:@"title"];

    if (v8)
    {
      v9 = v8;
      title = v6->_title;
      v6->_title = v9;
    }
    else
    {
      title = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(title, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"SGReminder.m", 102, @"nonnull property %s *%s was null when decoded", "NSString", "title");
    }

    id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v12 = [v5 decodeObjectOfClasses:v11 forKey:@"dueDateComponents"];
    dueDateComponents = v6->_dueDateComponents;
    v6->_dueDateComponents = (NSDateComponents *)v12;

    v6->_uint64_t dueLocationType = [v5 decodeInt64ForKey:@"dueLocationType"];
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v15 = [v5 decodeObjectOfClasses:v14 forKey:@"dueLocation"];
    dueLocation = v6->_dueLocation;
    v6->_dueLocation = (SGLocation *)v15;

    v6->_unsigned __int8 dueLocationTrigger = [v5 decodeInt64ForKey:@"dueLocationTrigger"];
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    v18 = [v5 decodeObjectOfClasses:v17 forKey:@"sourceURL"];

    if (v18)
    {
      v19 = v18;
      sourceURL = v6->_sourceURL;
      v6->_sourceURL = v19;
    }
    else
    {
      sourceURL = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(sourceURL, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"SGReminder.m", 107, @"nonnull property %s *%s was null when decoded", "NSURL", "sourceURL");
    }

    v6->_int reminderStatus = [v5 decodeInt64ForKey:@"reminderStatus"];
    BOOL v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v22 = [v5 decodeObjectOfClasses:v21 forKey:@"opaqueKey"];
    opaqueKey = v6->_opaqueKey;
    v6->_opaqueKey = (NSString *)v22;

    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v25 = [v5 decodeObjectOfClasses:v24 forKey:@"uniqueKey"];
    uniqueKey = v6->_uniqueKey;
    v6->_uniqueKey = (NSString *)v25;

    char v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v28 = [v5 decodeObjectOfClasses:v27 forKey:@"contactIdentifier"];
    contactIdentifier = v6->_contactIdentifier;
    v6->_contactIdentifier = (NSString *)v28;

    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    v31 = [v5 decodeObjectOfClasses:v30 forKey:@"creationDate"];

    if (v31)
    {
      v32 = v31;
      creationDate = v6->_creationDate;
      v6->_creationDate = v32;
    }
    else
    {
      creationDate = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(creationDate, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"SGReminder.m", 112, @"nonnull property %s *%s was null when decoded", "NSDate", "creationDate");
    }
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SGReminder;
  id v4 = a3;
  [(SGObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_title, @"title", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_dueDateComponents forKey:@"dueDateComponents"];
  [v4 encodeInt64:self->_dueLocationType forKey:@"dueLocationType"];
  [v4 encodeObject:self->_dueLocation forKey:@"dueLocation"];
  [v4 encodeInt64:self->_dueLocationTrigger forKey:@"dueLocationTrigger"];
  [v4 encodeObject:self->_sourceURL forKey:@"sourceURL"];
  [v4 encodeInt64:self->_reminderStatus forKey:@"reminderStatus"];
  [v4 encodeObject:self->_opaqueKey forKey:@"opaqueKey"];
  [v4 encodeObject:self->_uniqueKey forKey:@"uniqueKey"];
  [v4 encodeObject:self->_contactIdentifier forKey:@"contactIdentifier"];
  [v4 encodeObject:self->_creationDate forKey:@"creationDate"];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  NSUInteger v4 = [(NSString *)self->_opaqueKey hash] - v3 + 32 * v3;
  return [(NSString *)self->_uniqueKey hash] - v4 + 32 * v4;
}

- (id)description
{
  id v3 = [NSString alloc];
  title = self->_title;
  objc_super v5 = [(NSDateComponents *)self->_dueDateComponents date];
  BOOL v6 = (void *)[v3 initWithFormat:@"<SGReminder '%@' dueDate: %@>", title, v5];

  return v6;
}

- (BOOL)isAllDay
{
  dueDateComponents = self->_dueDateComponents;
  if (dueDateComponents) {
    LOBYTE(dueDateComponents) = [(NSDateComponents *)dueDateComponents hour] == 0x7FFFFFFFFFFFFFFFLL
  }
                             && [(NSDateComponents *)self->_dueDateComponents minute] == 0x7FFFFFFFFFFFFFFFLL
                             && [(NSDateComponents *)self->_dueDateComponents second] == 0x7FFFFFFFFFFFFFFFLL
                             && [(NSDateComponents *)self->_dueDateComponents nanosecond] == 0x7FFFFFFFFFFFFFFFLL;
  return (char)dueDateComponents;
}

- (SGReminder)initWithRecordId:(id)a3 origin:(id)a4 title:(id)a5 dueDateComponents:(id)a6 dueLocationType:(unsigned __int8)a7 dueLocation:(id)a8 dueLocationTrigger:(unsigned __int8)a9 sourceURL:(id)a10 reminderStatus:(unsigned __int8)a11 opaqueKey:(id)a12 uniqueKey:(id)a13 contactIdentifier:(id)a14 creationDate:(id)a15
{
  id v33 = a5;
  id obj = a6;
  id v32 = a6;
  id v31 = a8;
  id v30 = a10;
  id v29 = a12;
  id v20 = a13;
  id v21 = a14;
  id v22 = a15;
  v34.receiver = self;
  v34.super_class = (Class)SGReminder;
  v23 = [(SGObject *)&v34 initWithRecordId:a3 origin:a4];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_title, a5);
    objc_storeStrong((id *)&v24->_dueDateComponents, obj);
    v24->_uint64_t dueLocationType = a7;
    objc_storeStrong((id *)&v24->_dueLocation, a8);
    v24->_unsigned __int8 dueLocationTrigger = a9;
    objc_storeStrong((id *)&v24->_sourceURL, a10);
    v24->_int reminderStatus = a11;
    objc_storeStrong((id *)&v24->_opaqueKey, a12);
    objc_storeStrong((id *)&v24->_uniqueKey, a13);
    objc_storeStrong((id *)&v24->_contactIdentifier, a14);
    objc_storeStrong((id *)&v24->_creationDate, a15);
  }

  return v24;
}

+ (id)describeReminderDueLocationType:(unsigned __int8)a3
{
  if ((a3 - 1) > 3u) {
    return @"ReminderDueLocationTypeUnknown";
  }
  else {
    return off_1E5B8E1E0[(a3 - 1)];
  }
}

+ (id)describeReminderDueLocationTrigger:(unsigned __int8)a3
{
  id v3 = @"ReminderDueLocationTriggerUnknown";
  if (a3 == 1) {
    id v3 = @"ReminderDueLocationTriggerEnter";
  }
  if (a3 == 2) {
    return @"ReminderDueLocationTriggerLeave";
  }
  else {
    return v3;
  }
}

+ (id)describeReminderStatus:(unsigned __int8)a3
{
  if ((a3 - 1) > 2) {
    return @"ReminderStatusUnknown";
  }
  else {
    return off_1E5B8E1C8[(a3 - 1)];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end