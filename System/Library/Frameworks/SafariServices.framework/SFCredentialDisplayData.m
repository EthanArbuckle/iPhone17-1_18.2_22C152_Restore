@interface SFCredentialDisplayData
+ (id)descriptionForPasswordWithUser:(id)a3 creationDate:(id)a4;
- (NSDate)creationDate;
- (NSString)detail;
- (SFCredentialDisplayData)initWithMatch:(id)a3 detail:(id)a4 creationDate:(id)a5;
- (WBSSavedAccountMatch)match;
@end

@implementation SFCredentialDisplayData

+ (id)descriptionForPasswordWithUser:(id)a3 creationDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    id v7 = v5;
LABEL_3:
    v8 = v7;
    goto LABEL_6;
  }
  if (!v6)
  {
    _WBSLocalizedString();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v9 setTimeStyle:0];
  [v9 setDateStyle:1];
  [v9 setDoesRelativeDateFormatting:1];
  [v9 setFormattingContext:1];
  v10 = NSString;
  v11 = _WBSLocalizedString();
  v12 = [v9 stringFromDate:v6];
  v8 = objc_msgSend(v10, "stringWithFormat:", v11, v12);

LABEL_6:

  return v8;
}

- (SFCredentialDisplayData)initWithMatch:(id)a3 detail:(id)a4 creationDate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SFCredentialDisplayData;
  v12 = [(SFCredentialDisplayData *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_match, a3);
    uint64_t v14 = [v10 copy];
    detail = v13->_detail;
    v13->_detail = (NSString *)v14;

    objc_storeStrong((id *)&v13->_creationDate, a5);
    v16 = v13;
  }

  return v13;
}

- (WBSSavedAccountMatch)match
{
  return self->_match;
}

- (NSString)detail
{
  return self->_detail;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_detail, 0);

  objc_storeStrong((id *)&self->_match, 0);
}

@end