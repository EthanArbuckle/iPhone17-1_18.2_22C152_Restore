@interface CNPropertyGroupPhoneItem
+ (id)emptyValueForLabel:(id)a3;
- (CNPhoneNumber)phoneNumber;
- (id)bestLabel:(id)a3;
- (id)defaultActionURL;
- (id)displayStringForValue:(id)a3;
- (id)normalizedValue;
- (id)valueForDisplayString:(id)a3;
@end

@implementation CNPropertyGroupPhoneItem

- (id)valueForDisplayString:(id)a3
{
  return (id)[MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:a3];
}

- (id)displayStringForValue:(id)a3
{
  v3 = [(CNPropertyGroupItem *)self labeledValue];
  v4 = [v3 value];

  v5 = [v4 formattedStringValue];

  return v5;
}

- (id)bestLabel:(id)a3
{
  v4 = (CNPropertyGroupPhoneItem *)a3;
  v17.receiver = self;
  v17.super_class = (Class)CNPropertyGroupPhoneItem;
  v5 = [(CNPropertyGroupItem *)&v17 bestLabel:v4];
  v6 = (void *)*MEMORY[0x1E4F1B758];
  v7 = [(CNPropertyGroupItem *)v4 labeledValue];
  v8 = [v7 label];
  uint64_t v9 = [v6 compare:v8 options:1];

  if (v9)
  {
    v10 = [(CNPropertyGroupItem *)self labeledValue];
    v11 = [v10 label];
    uint64_t v12 = [v6 compare:v11 options:1];

    if (v12)
    {
      id v13 = v5;
      goto LABEL_7;
    }
    v14 = self;
  }
  else
  {
    v14 = v4;
  }
  v15 = [(CNPropertyGroupItem *)v14 labeledValue];
  id v13 = [v15 label];

LABEL_7:

  return v13;
}

- (id)defaultActionURL
{
  if (![(CNPropertyGroupItem *)self allowsPhone])
  {
    v11 = 0;
    goto LABEL_9;
  }
  id v3 = objc_alloc(MEMORY[0x1E4F5A600]);
  v4 = [(CNPropertyGroupPhoneItem *)self phoneNumber];
  uint64_t v5 = [v4 stringValue];
  v6 = (void *)[v3 initWithStringValue:v5 type:2];

  v7 = [(CNPropertyGroupItem *)self delegate];
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    goto LABEL_7;
  }
  v8 = [(CNPropertyGroupItem *)self delegate];
  uint64_t v9 = [v8 geminiDataSource];
  v10 = [v9 channelIdentifier];

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {

LABEL_7:
    v15 = (void *)MEMORY[0x1E4F1CB10];
    v16 = [(CNPropertyGroupItem *)self contactProperty];
    objc_super v17 = [v16 sourceContact];
    v11 = objc_msgSend(v15, "_cnui_telephonyURLWithHandle:contact:preferDefaultApp:", v6, v17, 1);

    goto LABEL_8;
  }
  uint64_t v12 = (void *)MEMORY[0x1E4F1CB10];
  id v13 = [(CNPropertyGroupItem *)self contactProperty];
  v14 = [v13 sourceContact];
  v11 = objc_msgSend(v12, "_cnui_telephonyURLWithHandle:contact:channelIdentifier:preferDefaultApp:", v6, v14, v10, 1);

  if (!v11) {
    goto LABEL_7;
  }
LABEL_8:

LABEL_9:

  return v11;
}

- (id)normalizedValue
{
  v2 = [(CNPropertyGroupPhoneItem *)self phoneNumber];
  id v3 = [v2 stringValue];

  return v3;
}

- (CNPhoneNumber)phoneNumber
{
  v2 = [(CNPropertyGroupItem *)self labeledValue];
  id v3 = [v2 value];

  return (CNPhoneNumber *)v3;
}

+ (id)emptyValueForLabel:(id)a3
{
  return (id)[MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:&stru_1ED8AC728];
}

@end