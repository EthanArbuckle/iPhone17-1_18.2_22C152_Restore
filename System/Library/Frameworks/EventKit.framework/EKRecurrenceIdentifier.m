@interface EKRecurrenceIdentifier
+ (BOOL)_splitIdentifier:(id)a3 intoLocalUID:(id *)a4 recurrenceDate:(id *)a5;
+ (const)_dateFormatStripTime:(BOOL)a3 stripTimeZone:(BOOL)a4;
+ (id)_recurrenceIdentifierWithRecurrenceDate:(id)a3 localUID:(id)a4 stripTime:(BOOL)a5 stripTimeZone:(BOOL)a6;
+ (id)_recurrenceStringForDate:(id)a3 stripTime:(BOOL)a4 stripTimeZone:(BOOL)a5;
+ (id)localUIDForIdentifierString:(id)a3;
+ (id)recurrenceIdentifierWithLocalUID:(id)a3 recurrenceDate:(id)a4;
+ (id)recurrenceIdentifierWithString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)recurrenceDate;
- (NSString)identifierString;
- (NSString)localUID;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setIdentifierString:(id)a3;
- (void)setLocalUID:(id)a3;
- (void)setRecurrenceDate:(id)a3;
@end

@implementation EKRecurrenceIdentifier

- (NSString)identifierString
{
  identifierString = self->_identifierString;
  if (!identifierString)
  {
    v4 = objc_opt_class();
    v5 = [(EKRecurrenceIdentifier *)self recurrenceDate];
    v6 = [(EKRecurrenceIdentifier *)self localUID];
    v7 = [v4 _recurrenceIdentifierWithRecurrenceDate:v5 localUID:v6 stripTime:0 stripTimeZone:0];
    v8 = self->_identifierString;
    self->_identifierString = v7;

    identifierString = self->_identifierString;
  }

  return identifierString;
}

- (NSDate)recurrenceDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)localUID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

+ (id)recurrenceIdentifierWithLocalUID:(id)a3 recurrenceDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    v7 = objc_opt_new();
    [v7 setLocalUID:v5];
    [v7 setRecurrenceDate:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setRecurrenceDate:(id)a3
{
}

- (void)setLocalUID:(id)a3
{
}

+ (id)_recurrenceIdentifierWithRecurrenceDate:(id)a3 localUID:(id)a4 stripTime:(BOOL)a5 stripTimeZone:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v12 = v11;
  if (v11 && (unint64_t)[v11 length] <= 0x32)
  {
    id v13 = v12;
    v14 = v13;
    if (v10)
    {
      id v15 = v13;
      v16 = (const char *)[v15 UTF8String];
      size_t v17 = strlen(v16);
      [v10 timeIntervalSince1970];
      time_t v23 = (uint64_t)v18;
      memset(&v22, 0, sizeof(v22));
      gmtime_r(&v23, &v22);
      strftime_l(v21, 0x20uLL, (const char *)[a1 _dateFormatStripTime:v7 stripTimeZone:v6], &v22, 0);
      v19 = &v21[-((v17 + 49) & 0xFFFFFFFFFFFFFFF0)];
      strcpy(v19, v21);
      if ([v15 length])
      {
        *(_WORD *)&v19[strlen(v19)] = 47;
        strcat(v19, v16);
      }
      v14 = [NSString stringWithUTF8String:v19];
    }
  }
  else
  {
    NSLog(&cfstr_UidIsOfUnexpec.isa, v12);
    v14 = 0;
  }

  return v14;
}

+ (const)_dateFormatStripTime:(BOOL)a3 stripTimeZone:(BOOL)a4
{
  if (!a4 || a3) {
    v4 = "%Y%m%d";
  }
  else {
    v4 = "%Y%m%dT%H%M%S";
  }
  if (a3 || a4) {
    return v4;
  }
  else {
    return "%Y%m%dT%H%M%SZ";
  }
}

+ (id)recurrenceIdentifierWithString:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  [v5 setIdentifierString:v4];
  id v13 = 0;
  id v14 = 0;
  int v6 = [a1 _splitIdentifier:v4 intoLocalUID:&v14 recurrenceDate:&v13];

  id v7 = v14;
  id v8 = v13;
  if (v6)
  {
    [v5 setLocalUID:v7];
    [v5 setRecurrenceDate:v8];
  }
  v9 = [v5 localUID];
  if (v9) {
    id v10 = v5;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  return v11;
}

+ (id)localUIDForIdentifierString:(id)a3
{
  id v8 = 0;
  int v3 = [a1 _splitIdentifier:a3 intoLocalUID:&v8 recurrenceDate:0];
  id v4 = v8;
  id v5 = v4;
  id v6 = 0;
  if (v3) {
    id v6 = v4;
  }

  return v6;
}

+ (BOOL)_splitIdentifier:(id)a3 intoLocalUID:(id *)a4 recurrenceDate:(id *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = v8;
  if (!((unint64_t)a4 | (unint64_t)a5)) {
    goto LABEL_15;
  }
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  if (![v8 length])
  {
    BOOL v16 = 0;
    goto LABEL_16;
  }
  id v10 = v9;
  id v11 = (char *)[v10 UTF8String];
  v12 = strchr(v11, 47);
  if (!v12 || (int64_t v13 = v12 - v11, v12 - v11 == -1))
  {
    if (a4) {
      *a4 = v10;
    }
    goto LABEL_15;
  }
  if (!a4)
  {
    if (a5) {
      goto LABEL_18;
    }
LABEL_15:
    BOOL v16 = 1;
    goto LABEL_16;
  }
  id v14 = [NSString stringWithUTF8String:v12 + 1];
  *a4 = v14;
  if (!a5)
  {
    BOOL v15 = v14 == 0;
    goto LABEL_24;
  }
LABEL_18:
  strlcpy((char *)&v19 - ((v13 + 16) & 0xFFFFFFFFFFFFFFF0), v11, v13 + 1);
  if (strcmp((const char *)&v19 - ((v13 + 16) & 0xFFFFFFFFFFFFFFF0), "(null)"))
  {
    strptime_l((const char *)&v19 - ((v13 + 16) & 0xFFFFFFFFFFFFFFF0), (const char *)objc_msgSend(a1, "_dateFormatStripTime:stripTimeZone:", 0, 0, 0, 0, 0, 0, 0, 0, 0, v20), &v19, 0);
    *a5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)timegm(&v19)];
  }
  if (!a4 || (id v18 = *a4, v16 = *a4 != 0, v18))
  {
    BOOL v15 = *a5 == 0;
LABEL_24:
    BOOL v16 = !v15;
  }
LABEL_16:

  return v16;
}

+ (id)_recurrenceStringForDate:(id)a3 stripTime:(BOOL)a4 stripTimeZone:(BOOL)a5
{
  return (id)[a1 _recurrenceIdentifierWithRecurrenceDate:a3 localUID:&stru_1EF932508 stripTime:a4 stripTimeZone:a5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(EKRecurrenceIdentifier *)self localUID];
  [v4 setLocalUID:v5];

  id v6 = [(EKRecurrenceIdentifier *)self recurrenceDate];
  [v4 setRecurrenceDate:v6];

  id v7 = [(EKRecurrenceIdentifier *)self identifierString];
  [v4 setIdentifierString:v7];

  return v4;
}

- (unint64_t)hash
{
  int v3 = [(EKRecurrenceIdentifier *)self localUID];
  uint64_t v4 = [v3 hash];
  id v5 = [(EKRecurrenceIdentifier *)self recurrenceDate];
  unint64_t v6 = v4 + 13 * [v5 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (EKRecurrenceIdentifier *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self != v5)
    {
      unint64_t v6 = [(EKRecurrenceIdentifier *)self localUID];
      id v7 = [(EKRecurrenceIdentifier *)v5 localUID];
      if (![v6 isEqualToString:v7])
      {
        char v11 = 0;
LABEL_14:

        goto LABEL_15;
      }
      id v8 = [(EKRecurrenceIdentifier *)self recurrenceDate];
      if (v8
        || ([(EKRecurrenceIdentifier *)v5 recurrenceDate],
            (int v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v9 = [(EKRecurrenceIdentifier *)self recurrenceDate];
        id v10 = [(EKRecurrenceIdentifier *)v5 recurrenceDate];
        char v11 = [v9 isEqual:v10];

        if (v8)
        {
LABEL_13:

          goto LABEL_14;
        }
      }
      else
      {
        char v11 = 1;
      }

      goto LABEL_13;
    }
    char v11 = 1;
  }
  else
  {
    char v11 = 0;
  }
LABEL_15:

  return v11;
}

- (void)setIdentifierString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierString, 0);
  objc_storeStrong((id *)&self->_recurrenceDate, 0);

  objc_storeStrong((id *)&self->_localUID, 0);
}

@end