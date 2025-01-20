@interface CNUnifiedComposeRecipient
- (BOOL)isEqual:(id)a3;
- (BOOL)showsChevronButton;
- (CNUnifiedComposeRecipient)initWithChildren:(id)a3 defaultChild:(id)a4;
- (id)children;
@end

@implementation CNUnifiedComposeRecipient

- (CNUnifiedComposeRecipient)initWithChildren:(id)a3 defaultChild:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [v7 firstObject];
  }
  v11 = v10;
  v12 = [v9 inputAddress];
  v25.receiver = self;
  v25.super_class = (Class)CNUnifiedComposeRecipient;
  v13 = -[CNComposeRecipient initWithContact:address:kind:](&v25, sel_initWithContact_address_kind_, 0, v12, [v9 kind]);

  if (v13)
  {
    v14 = [v11 autocompleteResult];
    [(CNComposeRecipient *)v13 setAutocompleteResult:v14];
    v15 = [v11 displayString];
    [(CNComposeRecipient *)v13 setDisplayString:v15];

    v16 = [v11 nameComponents];
    [(CNComposeRecipient *)v13 setNameComponents:v16];

    v17 = [v14 value];
    v18 = [v17 identifier];
    [(CNComposeRecipient *)v13 setValueIdentifier:v18];

    v19 = [v14 value];
    v20 = [v19 label];
    [(CNComposeRecipient *)v13 setUnlocalizedLabel:v20];

    v21 = [v14 identifier];

    if (v21)
    {
      v22 = [v14 identifier];
      [(CNComposeRecipient *)v13 setContactIdentifier:v22];
    }
    v23 = [v11 originContext];
    [(CNComposeRecipient *)v13 setOriginContext:v23];

    objc_storeStrong((id *)&v13->_children, a3);
    -[CNComposeRecipient setIsMemberOfGroup:](v13, "setIsMemberOfGroup:", [v11 isMemberOfGroup]);
  }
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 children];
    id v7 = [(CNUnifiedComposeRecipient *)self children];
    if ([v6 isEqualToArray:v7])
    {
      v10.receiver = self;
      v10.super_class = (Class)CNUnifiedComposeRecipient;
      BOOL v8 = [(CNComposeRecipient *)&v10 isEqual:v5];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)children
{
  return self->_children;
}

- (BOOL)showsChevronButton
{
  v2 = [(CNUnifiedComposeRecipient *)self children];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (void).cxx_destruct
{
}

@end