@interface CSItemSummary
+ (BOOL)supportsSecureCoding;
- (CSItemSummary)initWithAttachmentQuery:(id)a3 attachmentScope:(int64_t)a4;
- (CSItemSummary)initWithCoder:(id)a3;
- (CSItemSummary)initWithDateFrom:(id)a3 dateTo:(id)a4;
- (CSItemSummary)initWithItemSummary:(id)a3 newContactScope:(int64_t)a4;
- (CSItemSummary)initWithItemSummaryType:(id)a3;
- (CSItemSummary)initWithName:(id)a3 contactIdentifier:(id)a4 alternateNames:(id)a5 phoneNumbers:(id)a6 emailAddresses:(id)a7 allEmailAddresses:(id)a8 contactScope:(int64_t)a9;
- (CSItemSummary)initWithName:(id)a3 contactIdentifier:(id)a4 alternateNames:(id)a5 phoneNumbers:(id)a6 emailAddresses:(id)a7 allEmailAddresses:(id)a8 nameComponents:(id)a9 contactScope:(int64_t)a10;
- (CSItemSummary)initWithName:(id)a3 contactIdentifier:(id)a4 alternateNames:(id)a5 phoneNumbers:(id)a6 emailAddresses:(id)a7 contactScope:(int64_t)a8;
- (CSItemSummary)initWithSenderContainsQuery:(id)a3 senderContainsSearchString:(id)a4 senderContainsScope:(int64_t)a5;
- (CSItemSummary)initWithStatus:(int64_t)a3;
- (CSItemSummary)initWithTextQuery:(id)a3 textScope:(int64_t)a4;
- (CSSearchableItem)sourceItem;
- (NSString)type;
- (id)allEmailAddresses;
- (id)alternateNames;
- (id)attachmentQuery;
- (id)contactIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dateFrom;
- (id)dateTo;
- (id)emailAddresses;
- (id)name;
- (id)nameComponents;
- (id)phoneNumbers;
- (id)senderContainsQuery;
- (id)senderContainsSearchString;
- (id)textQuery;
- (int64_t)attachmentScope;
- (int64_t)contactScope;
- (int64_t)senderContainsScope;
- (int64_t)statusValue;
- (int64_t)textScope;
- (void)encodeWithCoder:(id)a3;
- (void)setNameComponents:(id)a3;
@end

@implementation CSItemSummary

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CSItemSummary)initWithItemSummaryType:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSItemSummary;
  v6 = [(CSItemSummary *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_type, a3);
  }

  return v7;
}

- (CSItemSummary)initWithItemSummary:(id)a3 newContactScope:(int64_t)a4
{
  id v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CSItemSummary;
  v7 = [(CSItemSummary *)&v30 init];
  v8 = v7;
  if (v7)
  {
    type = v7->_type;
    v7->_type = (NSString *)@"contact";

    uint64_t v10 = [v6 name];
    name = v8->_name;
    v8->_name = (NSString *)v10;

    uint64_t v12 = [v6 contactIdentifier];
    contactIdentifier = v8->_contactIdentifier;
    v8->_contactIdentifier = (NSString *)v12;

    v14 = [v6 alternateNames];
    uint64_t v15 = [v14 copy];
    alternateNames = v8->_alternateNames;
    v8->_alternateNames = (NSArray *)v15;

    v17 = [v6 phoneNumbers];
    uint64_t v18 = [v17 copy];
    phoneNumbers = v8->_phoneNumbers;
    v8->_phoneNumbers = (NSArray *)v18;

    v20 = [v6 emailAddresses];
    uint64_t v21 = [v20 copy];
    emailAddresses = v8->_emailAddresses;
    v8->_emailAddresses = (NSArray *)v21;

    v23 = [v6 allEmailAddresses];
    uint64_t v24 = [v23 copy];
    allEmailAddresses = v8->_allEmailAddresses;
    v8->_allEmailAddresses = (NSArray *)v24;

    v26 = [v6 nameComponents];
    uint64_t v27 = [v26 copy];
    nameComponents = v8->_nameComponents;
    v8->_nameComponents = (NSPersonNameComponents *)v27;

    v8->_contactScope = a4;
  }

  return v8;
}

- (CSItemSummary)initWithName:(id)a3 contactIdentifier:(id)a4 alternateNames:(id)a5 phoneNumbers:(id)a6 emailAddresses:(id)a7 contactScope:(int64_t)a8
{
  return [(CSItemSummary *)self initWithName:a3 contactIdentifier:a4 alternateNames:a5 phoneNumbers:a6 emailAddresses:a7 allEmailAddresses:a7 contactScope:a8];
}

- (CSItemSummary)initWithName:(id)a3 contactIdentifier:(id)a4 alternateNames:(id)a5 phoneNumbers:(id)a6 emailAddresses:(id)a7 allEmailAddresses:(id)a8 contactScope:(int64_t)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  v35.receiver = self;
  v35.super_class = (Class)CSItemSummary;
  v22 = [(CSItemSummary *)&v35 init];
  v23 = v22;
  if (v22)
  {
    type = v22->_type;
    v22->_type = (NSString *)@"contact";

    objc_storeStrong((id *)&v23->_name, a3);
    uint64_t v25 = [v18 copy];
    alternateNames = v23->_alternateNames;
    v23->_alternateNames = (NSArray *)v25;

    objc_storeStrong((id *)&v23->_contactIdentifier, a4);
    uint64_t v27 = [v19 copy];
    phoneNumbers = v23->_phoneNumbers;
    v23->_phoneNumbers = (NSArray *)v27;

    uint64_t v29 = [v20 copy];
    emailAddresses = v23->_emailAddresses;
    v23->_emailAddresses = (NSArray *)v29;

    uint64_t v31 = [v21 copy];
    allEmailAddresses = v23->_allEmailAddresses;
    v23->_allEmailAddresses = (NSArray *)v31;

    v23->_contactScope = a9;
    nameComponents = v23->_nameComponents;
    v23->_nameComponents = 0;
  }
  return v23;
}

- (CSItemSummary)initWithName:(id)a3 contactIdentifier:(id)a4 alternateNames:(id)a5 phoneNumbers:(id)a6 emailAddresses:(id)a7 allEmailAddresses:(id)a8 nameComponents:(id)a9 contactScope:(int64_t)a10
{
  id v37 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  v38.receiver = self;
  v38.super_class = (Class)CSItemSummary;
  v23 = [(CSItemSummary *)&v38 init];
  uint64_t v24 = v23;
  if (v23)
  {
    type = v23->_type;
    v23->_type = (NSString *)@"contact";

    objc_storeStrong((id *)&v24->_name, a3);
    uint64_t v26 = [v18 copy];
    alternateNames = v24->_alternateNames;
    v24->_alternateNames = (NSArray *)v26;

    objc_storeStrong((id *)&v24->_contactIdentifier, a4);
    uint64_t v28 = [v19 copy];
    phoneNumbers = v24->_phoneNumbers;
    v24->_phoneNumbers = (NSArray *)v28;

    uint64_t v30 = [v20 copy];
    emailAddresses = v24->_emailAddresses;
    v24->_emailAddresses = (NSArray *)v30;

    uint64_t v32 = [v21 copy];
    allEmailAddresses = v24->_allEmailAddresses;
    v24->_allEmailAddresses = (NSArray *)v32;

    v24->_contactScope = a10;
    uint64_t v34 = [v22 copy];
    nameComponents = v24->_nameComponents;
    v24->_nameComponents = (NSPersonNameComponents *)v34;
  }
  return v24;
}

- (CSItemSummary)initWithDateFrom:(id)a3 dateTo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CSItemSummary;
  objc_super v9 = [(CSItemSummary *)&v13 init];
  uint64_t v10 = v9;
  if (v9)
  {
    type = v9->_type;
    v9->_type = (NSString *)@"date";

    objc_storeStrong((id *)&v10->_dateFrom, a3);
    objc_storeStrong((id *)&v10->_dateTo, a4);
  }

  return v10;
}

- (CSItemSummary)initWithTextQuery:(id)a3 textScope:(int64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CSItemSummary;
  id v8 = [(CSItemSummary *)&v12 init];
  objc_super v9 = v8;
  if (v8)
  {
    type = v8->_type;
    v8->_type = (NSString *)@"text";

    objc_storeStrong((id *)&v9->_textQuery, a3);
    v9->_textScope = a4;
  }

  return v9;
}

- (CSItemSummary)initWithStatus:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CSItemSummary;
  v4 = [(CSItemSummary *)&v8 init];
  id v5 = v4;
  if (v4)
  {
    type = v4->_type;
    v4->_type = (NSString *)@"status";

    v5->_statusValue = a3;
  }
  return v5;
}

- (CSItemSummary)initWithAttachmentQuery:(id)a3 attachmentScope:(int64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CSItemSummary;
  objc_super v8 = [(CSItemSummary *)&v12 init];
  objc_super v9 = v8;
  if (v8)
  {
    type = v8->_type;
    v8->_type = (NSString *)@"attachment";

    objc_storeStrong((id *)&v9->_attachmentQuery, a3);
    v9->_attachmentScope = a4;
  }

  return v9;
}

- (CSItemSummary)initWithSenderContainsQuery:(id)a3 senderContainsSearchString:(id)a4 senderContainsScope:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CSItemSummary;
  v11 = [(CSItemSummary *)&v15 init];
  objc_super v12 = v11;
  if (v11)
  {
    type = v11->_type;
    v11->_type = (NSString *)@"sender";

    objc_storeStrong((id *)&v12->_senderContainsQuery, a3);
    v12->_senderContainsScope = a5;
    objc_storeStrong((id *)&v12->_senderContainsSearchString, a4);
  }

  return v12;
}

- (CSItemSummary)initWithCoder:(id)a3
{
  v52[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)CSItemSummary;
  id v5 = [(CSItemSummary *)&v48 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactIdentifier"];
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v8;

    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    v52[0] = objc_opt_class();
    v52[1] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
    objc_super v12 = [v10 setWithArray:v11];
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"alternateNames"];
    alternateNames = v5->_alternateNames;
    v5->_alternateNames = (NSArray *)v13;

    objc_super v15 = (void *)MEMORY[0x1E4F1CAD0];
    v51[0] = objc_opt_class();
    v51[1] = objc_opt_class();
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
    id v17 = [v15 setWithArray:v16];
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"phoneNumbers"];
    phoneNumbers = v5->_phoneNumbers;
    v5->_phoneNumbers = (NSArray *)v18;

    id v20 = (void *)MEMORY[0x1E4F1CAD0];
    v50[0] = objc_opt_class();
    v50[1] = objc_opt_class();
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
    id v22 = [v20 setWithArray:v21];
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"emailAddresses"];
    emailAddresses = v5->_emailAddresses;
    v5->_emailAddresses = (NSArray *)v23;

    uint64_t v25 = (void *)MEMORY[0x1E4F1CAD0];
    v49[0] = objc_opt_class();
    v49[1] = objc_opt_class();
    uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
    uint64_t v27 = [v25 setWithArray:v26];
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"allEmailAddresses"];
    allEmailAddresses = v5->_allEmailAddresses;
    v5->_allEmailAddresses = (NSArray *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nameComponents"];
    nameComponents = v5->_nameComponents;
    v5->_nameComponents = (NSPersonNameComponents *)v30;

    v5->_contactScope = [v4 decodeIntegerForKey:@"contactScope"];
    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateFrom"];
    dateFrom = v5->_dateFrom;
    v5->_dateFrom = (NSDate *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateTo"];
    dateTo = v5->_dateTo;
    v5->_dateTo = (NSDate *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textQuery"];
    textQuery = v5->_textQuery;
    v5->_textQuery = (NSString *)v36;

    v5->_textScope = [v4 decodeIntegerForKey:@"textScope"];
    v5->_statusValue = [v4 decodeIntegerForKey:@"statusValue"];
    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attachmentQuery"];
    attachmentQuery = v5->_attachmentQuery;
    v5->_attachmentQuery = (NSString *)v38;

    v5->_attachmentScope = [v4 decodeIntegerForKey:@"attachmentScope"];
    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"senderContainsQuery"];
    senderContainsQuery = v5->_senderContainsQuery;
    v5->_senderContainsQuery = (NSString *)v40;

    v5->_senderContainsScope = [v4 decodeIntegerForKey:@"senderContainsScope"];
    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"senderContainsSearchString"];
    senderContainsSearchString = v5->_senderContainsSearchString;
    v5->_senderContainsSearchString = (NSString *)v42;

    v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v45 = @"contact";
    if ([v44 isEqualToString:@"contact"]
      || (v45 = @"date", [v44 isEqualToString:@"date"])
      || (v45 = @"text", [v44 isEqualToString:@"text"])
      || (v45 = @"status", [v44 isEqualToString:@"status"])
      || (v45 = @"attachment", [v44 isEqualToString:@"attachment"])
      || (v45 = @"sender", [v44 isEqualToString:@"sender"]))
    {
      type = v5->_type;
      v5->_type = (NSString *)v45;
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(CSItemSummary *)self type];

  if (v4 == @"contact")
  {
    id v12 = objc_alloc((Class)objc_opt_class());
    uint64_t v13 = [(CSItemSummary *)self name];
    v14 = [(CSItemSummary *)self contactIdentifier];
    objc_super v15 = [(CSItemSummary *)self alternateNames];
    id v16 = [(CSItemSummary *)self phoneNumbers];
    id v17 = [(CSItemSummary *)self emailAddresses];
    uint64_t v18 = [(CSItemSummary *)self allEmailAddresses];
    id v19 = objc_msgSend(v12, "initWithName:contactIdentifier:alternateNames:phoneNumbers:emailAddresses:allEmailAddresses:contactScope:", v13, v14, v15, v16, v17, v18, -[CSItemSummary contactScope](self, "contactScope"));

    return v19;
  }
  id v5 = [(CSItemSummary *)self type];

  if (v5 == @"date")
  {
    id v20 = objc_alloc((Class)objc_opt_class());
    id v21 = [(CSItemSummary *)self dateFrom];
    id v22 = [(CSItemSummary *)self dateTo];
    v11 = (void *)[v20 initWithDateFrom:v21 dateTo:v22];

    return v11;
  }
  uint64_t v6 = [(CSItemSummary *)self type];

  if (v6 == @"text")
  {
    id v24 = objc_alloc((Class)objc_opt_class());
    uint64_t v25 = [(CSItemSummary *)self textQuery];
    uint64_t v26 = objc_msgSend(v24, "initWithTextQuery:textScope:", v25, -[CSItemSummary textScope](self, "textScope"));
LABEL_15:
    id v19 = (void *)v26;

    return v19;
  }
  id v7 = [(CSItemSummary *)self type];

  if (v7 != @"status")
  {
    uint64_t v8 = [(CSItemSummary *)self type];

    id v9 = objc_alloc((Class)objc_opt_class());
    if (v8 != @"attachment")
    {
      id v10 = [(CSItemSummary *)self type];
      v11 = (void *)[v9 initWithItemSummaryType:v10];

      return v11;
    }
    uint64_t v25 = [(CSItemSummary *)self attachmentQuery];
    uint64_t v26 = objc_msgSend(v9, "initWithAttachmentQuery:attachmentScope:", v25, -[CSItemSummary attachmentScope](self, "attachmentScope"));
    goto LABEL_15;
  }
  id v27 = objc_alloc((Class)objc_opt_class());
  int64_t v28 = [(CSItemSummary *)self statusValue];

  return (id)[v27 initWithStatus:v28];
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_contactIdentifier forKey:@"contactIdentifier"];
  [v5 encodeObject:self->_alternateNames forKey:@"alternateNames"];
  [v5 encodeObject:self->_phoneNumbers forKey:@"phoneNumbers"];
  [v5 encodeObject:self->_emailAddresses forKey:@"emailAddresses"];
  [v5 encodeObject:self->_allEmailAddresses forKey:@"allEmailAddresses"];
  [v5 encodeInteger:self->_contactScope forKey:@"contactScope"];
  [v5 encodeObject:self->_nameComponents forKey:@"nameComponents"];
  [v5 encodeObject:self->_dateFrom forKey:@"dateFrom"];
  [v5 encodeObject:self->_dateTo forKey:@"dateTo"];
  [v5 encodeObject:self->_textQuery forKey:@"textQuery"];
  [v5 encodeInteger:self->_textScope forKey:@"textScope"];
  [v5 encodeInteger:self->_statusValue forKey:@"statusValue"];
  [v5 encodeObject:self->_attachmentQuery forKey:@"attachmentQuery"];
  [v5 encodeInteger:self->_attachmentScope forKey:@"attachmentScope"];
  [v5 encodeObject:self->_senderContainsQuery forKey:@"senderContainsQuery"];
  [v5 encodeInteger:self->_senderContainsScope forKey:@"senderContainsScope"];
  [v5 encodeObject:self->_senderContainsSearchString forKey:@"senderContainsSearchString"];
  id v6 = [(CSItemSummary *)self type];
  [v5 encodeObject:v6 forKey:@"type"];
}

- (NSString)type
{
  return self->_type;
}

- (id)name
{
  return self->_name;
}

- (id)alternateNames
{
  return self->_alternateNames;
}

- (id)emailAddresses
{
  return self->_emailAddresses;
}

- (id)allEmailAddresses
{
  return self->_allEmailAddresses;
}

- (id)nameComponents
{
  return self->_nameComponents;
}

- (void)setNameComponents:(id)a3
{
}

- (id)phoneNumbers
{
  return self->_phoneNumbers;
}

- (id)contactIdentifier
{
  return self->_contactIdentifier;
}

- (int64_t)contactScope
{
  return self->_contactScope;
}

- (id)dateFrom
{
  return self->_dateFrom;
}

- (id)dateTo
{
  return self->_dateTo;
}

- (id)textQuery
{
  return self->_textQuery;
}

- (int64_t)textScope
{
  return self->_textScope;
}

- (int64_t)statusValue
{
  return self->_statusValue;
}

- (id)attachmentQuery
{
  return self->_attachmentQuery;
}

- (int64_t)attachmentScope
{
  return self->_attachmentScope;
}

- (id)senderContainsQuery
{
  return self->_senderContainsQuery;
}

- (id)senderContainsSearchString
{
  return self->_senderContainsSearchString;
}

- (int64_t)senderContainsScope
{
  return self->_senderContainsScope;
}

- (CSSearchableItem)sourceItem
{
  return self->_sourceItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceItem, 0);
  objc_storeStrong((id *)&self->_senderContainsSearchString, 0);
  objc_storeStrong((id *)&self->_senderContainsQuery, 0);
  objc_storeStrong((id *)&self->_attachmentQuery, 0);
  objc_storeStrong((id *)&self->_textQuery, 0);
  objc_storeStrong((id *)&self->_dateTo, 0);
  objc_storeStrong((id *)&self->_dateFrom, 0);
  objc_storeStrong((id *)&self->_allEmailAddresses, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_alternateNames, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end