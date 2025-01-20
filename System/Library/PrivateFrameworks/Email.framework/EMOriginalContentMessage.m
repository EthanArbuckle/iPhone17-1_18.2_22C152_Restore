@interface EMOriginalContentMessage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (ECEmailAddressConvertible)sender;
- (ECMessageFlags)flags;
- (EMOriginalContentMessage)initWithCoder:(id)a3;
- (EMOriginalContentMessage)initWithSearchableMessageID:(id)a3 bodyText:(id)a4 sender:(id)a5 date:(id)a6;
- (EMOriginalContentMessage)initWithSearchableMessageID:(id)a3 bodyText:(id)a4 subject:(id)a5 sender:(id)a6 toList:(id)a7 ccList:(id)a8 flags:(id)a9 date:(id)a10;
- (EMSearchableMessageID)searchableMessageID;
- (NSArray)ccList;
- (NSArray)toList;
- (NSDate)date;
- (NSString)bodyText;
- (NSString)ef_publicDescription;
- (NSString)subject;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EMOriginalContentMessage

- (EMOriginalContentMessage)initWithSearchableMessageID:(id)a3 bodyText:(id)a4 sender:(id)a5 date:(id)a6
{
  return [(EMOriginalContentMessage *)self initWithSearchableMessageID:a3 bodyText:a4 subject:0 sender:a5 toList:0 ccList:0 flags:0 date:a6];
}

- (EMOriginalContentMessage)initWithSearchableMessageID:(id)a3 bodyText:(id)a4 subject:(id)a5 sender:(id)a6 toList:(id)a7 ccList:(id)a8 flags:(id)a9 date:(id)a10
{
  id v28 = a3;
  id v27 = a4;
  id v29 = a5;
  id v26 = a6;
  id v25 = a7;
  id v24 = a8;
  id v23 = a9;
  id v17 = a10;
  v30.receiver = self;
  v30.super_class = (Class)EMOriginalContentMessage;
  v18 = [(EMOriginalContentMessage *)&v30 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_searchableMessageID, a3);
    objc_storeStrong((id *)&v19->_bodyText, a4);
    uint64_t v20 = [v29 copy];
    subject = v19->_subject;
    v19->_subject = (NSString *)v20;

    objc_storeStrong((id *)&v19->_sender, a6);
    objc_storeStrong((id *)&v19->_date, a10);
    objc_storeStrong((id *)&v19->_toList, a7);
    objc_storeStrong((id *)&v19->_ccList, a8);
    objc_storeStrong((id *)&v19->_flags, a9);
  }

  return v19;
}

- (EMOriginalContentMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)EMOriginalContentMessage;
  v5 = [(EMOriginalContentMessage *)&v34 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_searchableMessageID"];
    searchableMessageID = v5->_searchableMessageID;
    v5->_searchableMessageID = (EMSearchableMessageID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_bodyText"];
    bodyText = v5->_bodyText;
    v5->_bodyText = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_subject"];
    subject = v5->_subject;
    v5->_subject = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"EFPropertyKey_sender"];
    sender = v5->_sender;
    v5->_sender = (ECEmailAddressConvertible *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_date"];
    date = v5->_date;
    v5->_date = (NSDate *)v17;

    v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v19, "setWithObjects:", v20, v21, objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"EFPropertyKey_toList"];
    toList = v5->_toList;
    v5->_toList = (NSArray *)v23;

    id v25 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    id v28 = objc_msgSend(v25, "setWithObjects:", v26, v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"EFPropertyKey_ccList"];
    ccList = v5->_ccList;
    v5->_ccList = (NSArray *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_flags"];
    flags = v5->_flags;
    v5->_flags = (ECMessageFlags *)v31;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  id v4 = [(EMOriginalContentMessage *)self searchableMessageID];
  [v12 encodeObject:v4 forKey:@"EFPropertyKey_searchableMessageID"];

  v5 = [(EMOriginalContentMessage *)self bodyText];
  [v12 encodeObject:v5 forKey:@"EFPropertyKey_bodyText"];

  uint64_t v6 = [(EMOriginalContentMessage *)self subject];
  [v12 encodeObject:v6 forKey:@"EFPropertyKey_subject"];

  v7 = [(EMOriginalContentMessage *)self sender];
  [v12 encodeObject:v7 forKey:@"EFPropertyKey_sender"];

  uint64_t v8 = [(EMOriginalContentMessage *)self date];
  [v12 encodeObject:v8 forKey:@"EFPropertyKey_date"];

  v9 = [(EMOriginalContentMessage *)self toList];
  [v12 encodeObject:v9 forKey:@"EFPropertyKey_toList"];

  uint64_t v10 = [(EMOriginalContentMessage *)self ccList];
  [v12 encodeObject:v10 forKey:@"EFPropertyKey_ccList"];

  v11 = [(EMOriginalContentMessage *)self flags];
  [v12 encodeObject:v11 forKey:@"EFPropertyKey_flags"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)ef_publicDescription
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F60D58] currentDevice];
  int v4 = [v3 isInternal];

  if (v4)
  {
    uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F60808]) initWithStyle:2];
    v5 = NSString;
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v28 = NSStringFromClass(v6);
    uint64_t v27 = [(EMOriginalContentMessage *)self searchableMessageID];
    v7 = (void *)MEMORY[0x1E4F60E00];
    id v24 = [(EMOriginalContentMessage *)self bodyText];
    uint64_t v26 = objc_msgSend(v7, "ec_partiallyRedactedStringForSubjectOrSummary:");
    uint64_t v8 = (void *)MEMORY[0x1E4F60E00];
    uint64_t v23 = [(EMOriginalContentMessage *)self subject];
    id v25 = objc_msgSend(v8, "ec_partiallyRedactedStringForSubjectOrSummary:");
    v22 = [(EMOriginalContentMessage *)self sender];
    v30[0] = v22;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    uint64_t v10 = [v29 stringFromEmailAddressList:v9];
    v11 = [(EMOriginalContentMessage *)self toList];
    id v12 = [v29 stringFromEmailAddressList:v11];
    uint64_t v13 = [(EMOriginalContentMessage *)self ccList];
    v14 = [v29 stringFromEmailAddressList:v13];
    uint64_t v15 = [(EMOriginalContentMessage *)self flags];
    v16 = [(EMOriginalContentMessage *)self date];
    uint64_t v17 = [v5 stringWithFormat:@"<%@: %p>\n\tsearchableMessageID:%@\n\tbodyText:%@\n\tsubject:%@\n\tsender:%@\n\tto:%@\n\tcc:%@\n\tflags:%@\n\tdate:%@", v28, self, v27, v26, v25, v10, v12, v14, v15, v16];
  }
  else
  {
    v18 = NSString;
    v19 = (objc_class *)objc_opt_class();
    uint64_t v20 = NSStringFromClass(v19);
    uint64_t v17 = [v18 stringWithFormat:@"<%@: %p>", v20, self];
  }
  return (NSString *)v17;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (EMOriginalContentMessage *)a3;
  if (v4 == self)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(EMOriginalContentMessage *)self searchableMessageID];
      v7 = [(EMOriginalContentMessage *)v5 searchableMessageID];
      if (EFObjectsAreEqual())
      {
        uint64_t v8 = [(EMOriginalContentMessage *)self bodyText];
        v9 = [(EMOriginalContentMessage *)v5 bodyText];
        if (EFStringsAreEqual())
        {
          uint64_t v10 = [(EMOriginalContentMessage *)self subject];
          v11 = [(EMOriginalContentMessage *)v5 subject];
          if (EFStringsAreEqual())
          {
            uint64_t v23 = [(EMOriginalContentMessage *)self sender];
            id v12 = [(EMOriginalContentMessage *)v5 sender];
            if (EFObjectsAreEqual())
            {
              v22 = [(EMOriginalContentMessage *)self date];
              uint64_t v21 = [(EMOriginalContentMessage *)v5 date];
              if (EFObjectsAreEqual())
              {
                uint64_t v20 = [(EMOriginalContentMessage *)self toList];
                v19 = [(EMOriginalContentMessage *)v5 toList];
                if (EFObjectsAreEqual())
                {
                  v18 = [(EMOriginalContentMessage *)self ccList];
                  uint64_t v17 = [(EMOriginalContentMessage *)v5 ccList];
                  if (EFObjectsAreEqual())
                  {
                    v16 = [(EMOriginalContentMessage *)self flags];
                    uint64_t v15 = [(EMOriginalContentMessage *)v5 flags];
                    char v13 = EFObjectsAreEqual();
                  }
                  else
                  {
                    char v13 = 0;
                  }
                }
                else
                {
                  char v13 = 0;
                }
              }
              else
              {
                char v13 = 0;
              }
            }
            else
            {
              char v13 = 0;
            }
          }
          else
          {
            char v13 = 0;
          }
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = [(EMOriginalContentMessage *)self searchableMessageID];
  uint64_t v4 = [v3 hash];

  v5 = [(EMOriginalContentMessage *)self bodyText];
  uint64_t v6 = [v5 hash];

  v7 = [(EMOriginalContentMessage *)self subject];
  uint64_t v8 = [v7 hash];

  v9 = [(EMOriginalContentMessage *)self sender];
  uint64_t v10 = [v9 hash];

  v11 = [(EMOriginalContentMessage *)self date];
  uint64_t v12 = [v11 hash];

  char v13 = [(EMOriginalContentMessage *)self toList];
  uint64_t v14 = [v13 hash];

  uint64_t v15 = [(EMOriginalContentMessage *)self ccList];
  uint64_t v16 = [v15 hash];

  uint64_t v17 = [(EMOriginalContentMessage *)self flags];
  unint64_t v18 = 33 * (33 * (33 * (33 * (33 * (33 * (33 * v4 + v6) + v8) + v10) + v12) + v14) + v16)
      + [v17 hash]
      + 0x147747C7101;

  return v18;
}

- (EMSearchableMessageID)searchableMessageID
{
  return self->_searchableMessageID;
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (NSString)subject
{
  return self->_subject;
}

- (ECEmailAddressConvertible)sender
{
  return self->_sender;
}

- (NSArray)toList
{
  return self->_toList;
}

- (NSArray)ccList
{
  return self->_ccList;
}

- (NSDate)date
{
  return self->_date;
}

- (ECMessageFlags)flags
{
  return self->_flags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_ccList, 0);
  objc_storeStrong((id *)&self->_toList, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_searchableMessageID, 0);
}

@end