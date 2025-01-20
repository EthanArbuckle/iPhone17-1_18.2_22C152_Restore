@interface EMGeneratedSummary
+ (BOOL)supportsSecureCoding;
+ (int64_t)consideredUrgentHourLimit;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUrgentForDate:(id)a3;
- (BOOL)urgent;
- (EMCollectionItemID)messageItemID;
- (EMGeneratedSummary)initWithCoder:(id)a3;
- (EMGeneratedSummary)initWithTopLine:(id)a3 synopsis:(id)a4 urgent:(BOOL)a5;
- (EMGeneratedSummary)initWithTopLine:(id)a3 synopsis:(id)a4 urgent:(BOOL)a5 messageItemID:(id)a6;
- (NSAttributedString)synopsis;
- (NSAttributedString)topLine;
- (NSString)debugDescription;
- (NSString)ef_publicDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EMGeneratedSummary

+ (int64_t)consideredUrgentHourLimit
{
  if (consideredUrgentHourLimit_onceToken != -1) {
    dispatch_once(&consideredUrgentHourLimit_onceToken, &__block_literal_global_15);
  }
  return consideredUrgentHourLimit_urgentHourLimit;
}

void __47__EMGeneratedSummary_consideredUrgentHourLimit__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [v3 valueForKey:@"MessageConsideredUrgentHourLimit"];
  v1 = v0;
  if (v0) {
    uint64_t v2 = [v0 integerValue];
  }
  else {
    uint64_t v2 = 72;
  }
  consideredUrgentHourLimit_urgentHourLimit = v2;
}

- (EMGeneratedSummary)initWithTopLine:(id)a3 synopsis:(id)a4 urgent:(BOOL)a5
{
  return [(EMGeneratedSummary *)self initWithTopLine:a3 synopsis:a4 urgent:a5 messageItemID:0];
}

- (EMGeneratedSummary)initWithTopLine:(id)a3 synopsis:(id)a4 urgent:(BOOL)a5 messageItemID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)EMGeneratedSummary;
  v14 = [(EMGeneratedSummary *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_topLine, a3);
    objc_storeStrong((id *)&v15->_synopsis, a4);
    v15->_urgent = a5;
    objc_storeStrong((id *)&v15->_messageItemID, a6);
  }

  return v15;
}

- (NSString)debugDescription
{
  id v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(EMGeneratedSummary *)self topLine];
  v7 = [(EMGeneratedSummary *)self synopsis];
  BOOL v8 = [(EMGeneratedSummary *)self urgent];
  v9 = [(EMGeneratedSummary *)self messageItemID];
  v10 = [v3 stringWithFormat:@"<%@: %p>\n\ttopLine:%@\n\tsynopsis:%@\n\turgent: %d\n\tmessageItemID: %@", v5, self, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (EMGeneratedSummary *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(EMGeneratedSummary *)self topLine];
      v7 = [(EMGeneratedSummary *)v5 topLine];
      if (EFObjectsAreEqual())
      {
        BOOL v8 = [(EMGeneratedSummary *)self synopsis];
        v9 = [(EMGeneratedSummary *)v5 synopsis];
        if (EFObjectsAreEqual()
          && (BOOL v10 = [(EMGeneratedSummary *)self urgent], v10 == [(EMGeneratedSummary *)v5 urgent]))
        {
          id v12 = [(EMGeneratedSummary *)self messageItemID];
          id v13 = [(EMGeneratedSummary *)v5 messageItemID];
          char v11 = EFObjectsAreEqual();
        }
        else
        {
          char v11 = 0;
        }
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (BOOL)isUrgentForDate:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1C9C8], "ef_dateHoursAgo:", +[EMGeneratedSummary consideredUrgentHourLimit](EMGeneratedSummary, "consideredUrgentHourLimit"));
  if ([(EMGeneratedSummary *)self urgent]) {
    char v6 = objc_msgSend(v4, "ef_isLaterThanDate:", v5);
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  id v3 = [(EMGeneratedSummary *)self topLine];

  if (v3)
  {
    id v4 = [(EMGeneratedSummary *)self topLine];
    uint64_t v5 = [v4 hash] + 33;
  }
  else
  {
    uint64_t v5 = 1;
  }
  char v6 = [(EMGeneratedSummary *)self synopsis];

  if (v6)
  {
    v7 = [(EMGeneratedSummary *)self synopsis];
    uint64_t v5 = [v7 hash] + 33 * v5;
  }
  unint64_t v8 = 33 * v5 + [(EMGeneratedSummary *)self urgent];
  v9 = [(EMGeneratedSummary *)self messageItemID];

  if (v9)
  {
    BOOL v10 = [(EMGeneratedSummary *)self messageItemID];
    unint64_t v8 = [v10 hash] + 33 * v8;
  }
  return v8;
}

- (NSString)ef_publicDescription
{
  id v3 = (void *)MEMORY[0x1E4F60E00];
  id v4 = [(EMGeneratedSummary *)self topLine];
  uint64_t v5 = [v4 string];
  char v6 = objc_msgSend(v3, "ec_partiallyRedactedStringForSubjectOrSummary:", v5);

  v7 = NSString;
  BOOL v8 = [(EMGeneratedSummary *)self urgent];
  v9 = [(EMGeneratedSummary *)self messageItemID];
  BOOL v10 = [v7 stringWithFormat:@"t:%@, u:%d, m:%@", v6, v8, v9];

  return (NSString *)v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMGeneratedSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_topLine"];
  char v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_synopsis"];
  uint64_t v7 = [v4 decodeBoolForKey:@"EFPropertyKey_urgent"];
  BOOL v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_messageItemID"];
  v9 = [(EMGeneratedSummary *)self initWithTopLine:v5 synopsis:v6 urgent:v7 messageItemID:v8];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(EMGeneratedSummary *)self topLine];
  [v7 encodeObject:v4 forKey:@"EFPropertyKey_topLine"];

  uint64_t v5 = [(EMGeneratedSummary *)self synopsis];
  [v7 encodeObject:v5 forKey:@"EFPropertyKey_synopsis"];

  objc_msgSend(v7, "encodeBool:forKey:", -[EMGeneratedSummary urgent](self, "urgent"), @"EFPropertyKey_urgent");
  char v6 = [(EMGeneratedSummary *)self messageItemID];
  [v7 encodeObject:v6 forKey:@"EFPropertyKey_messageItemID"];
}

- (NSAttributedString)topLine
{
  return self->_topLine;
}

- (NSAttributedString)synopsis
{
  return self->_synopsis;
}

- (BOOL)urgent
{
  return self->_urgent;
}

- (EMCollectionItemID)messageItemID
{
  return self->_messageItemID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageItemID, 0);
  objc_storeStrong((id *)&self->_synopsis, 0);
  objc_storeStrong((id *)&self->_topLine, 0);
}

@end