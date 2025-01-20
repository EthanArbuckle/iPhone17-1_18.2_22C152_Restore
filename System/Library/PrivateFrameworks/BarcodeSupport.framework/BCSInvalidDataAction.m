@interface BCSInvalidDataAction
- (BCSInvalidDataAction)initWithData:(id)a3 codePayload:(id)a4;
- (BOOL)isInvalidDataAction;
- (id)actionIconSystemImageName;
- (id)actionPickerItems;
- (id)localizedDefaultActionDescription;
@end

@implementation BCSInvalidDataAction

- (BCSInvalidDataAction)initWithData:(id)a3 codePayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15.receiver = self;
    v15.super_class = (Class)BCSInvalidDataAction;
    v8 = [(BCSAction *)&v15 initWithData:v6 codePayload:v7];
  }
  else
  {
    v9 = -[BCSInvalidParsedData initWithInvalidDataType:invalidContents:]([BCSInvalidParsedData alloc], "initWithInvalidDataType:invalidContents:", [v6 type], 0);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [v6 url];
      v11 = [v10 scheme];
      [(BCSInvalidParsedData *)v9 setInvalidURLScheme:v11];

      v12 = [v10 absoluteString];
      [(BCSInvalidParsedData *)v9 setInvalidContents:v12];
    }
    v14.receiver = self;
    v14.super_class = (Class)BCSInvalidDataAction;
    v8 = [(BCSAction *)&v14 initWithData:v9 codePayload:v7];
  }
  return v8;
}

- (id)localizedDefaultActionDescription
{
  v2 = [(BCSAction *)self codePayload];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[v2 version] >= 4) {
    v3 = @"This code is not compatible with this version of iOS";
  }
  else {
    v3 = @"No usable data found";
  }
  v4 = _BCSLocalizedString(v3, &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);

  return v4;
}

- (id)actionIconSystemImageName
{
  v3 = [(BCSAction *)self codePayload];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = @"appclip";
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BCSInvalidDataAction;
    v5 = [(BCSAction *)&v7 actionIconSystemImageName];
  }
  return v5;
}

- (id)actionPickerItems
{
  v10[1] = *MEMORY[0x263EF8340];
  v3 = [(BCSAction *)self data];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(BCSAction *)self data];
    id v6 = [v5 invalidContents];

    if ([v6 length])
    {
      objc_super v7 = [[BCSCopyActionPickerItem alloc] initWithAction:self textToCopy:v6];
      v10[0] = v7;
      v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)isInvalidDataAction
{
  return 1;
}

@end