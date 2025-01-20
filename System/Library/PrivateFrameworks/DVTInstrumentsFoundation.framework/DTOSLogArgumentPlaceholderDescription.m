@interface DTOSLogArgumentPlaceholderDescription
- (DTOSLogArgumentPlaceholderDescription)initWithPlaceholderToken:(id)a3;
- (NSString)placeholderKey;
- (NSString)placeholderObjectValue;
- (NSString)placeholderToken;
- (int64_t)placeholderKind;
- (unint64_t)hash;
@end

@implementation DTOSLogArgumentPlaceholderDescription

- (DTOSLogArgumentPlaceholderDescription)initWithPlaceholderToken:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)DTOSLogArgumentPlaceholderDescription;
  v6 = [(DTOSLogArgumentPlaceholderDescription *)&v28 init];
  objc_storeStrong((id *)&v6->_placeholderToken, a3);
  v7 = [(NSString *)v6->_placeholderToken componentsSeparatedByString:@":"];
  if (![v7 count])
  {
    v6->_placeholderKind = 0;
    placeholderKey = v6->_placeholderKey;
    v6->_placeholderKey = (NSString *)&stru_26E517620;

    v14 = (NSString *)v5;
LABEL_13:
    placeholderObjectValue = v6->_placeholderObjectValue;
    v6->_placeholderObjectValue = v14;
    goto LABEL_24;
  }
  if ([v7 count] == 1)
  {
    v8 = v6->_placeholderKey;
    v6->_placeholderKey = (NSString *)@"builtin";

    id v9 = [v7 objectAtIndexedSubscript:0];
    if (qword_268707F08 != -1) {
      dispatch_once(&qword_268707F08, &unk_26E515F50);
    }
    placeholderObjectValue = [(id)qword_268707F00 objectForKeyedSubscript:v9];

    if (placeholderObjectValue)
    {
      v6->_placeholderKind = 1;
      v11 = placeholderObjectValue;
      v12 = v6->_placeholderObjectValue;
      v6->_placeholderObjectValue = v11;
    }
    else
    {
      v12 = [(NSString *)v6->_placeholderToken componentsSeparatedByString:@"="];
      if ([v12 count] == 2
        && ([v12 objectAtIndexedSubscript:0],
            v20 = objc_claimAutoreleasedReturnValue(),
            int v21 = [v20 isEqualToString:@"name"],
            v20,
            v21))
      {
        v6->_placeholderKind = 2;
        uint64_t v22 = [v12 objectAtIndexedSubscript:1];
      }
      else
      {
        v6->_placeholderKind = 0;
        uint64_t v22 = [v7 objectAtIndexedSubscript:0];
      }
      v26 = v6->_placeholderObjectValue;
      v6->_placeholderObjectValue = (NSString *)v22;
    }
    goto LABEL_24;
  }
  if ([v7 count] != 2)
  {
    v6->_placeholderKind = 0;
    uint64_t v18 = [v7 objectAtIndexedSubscript:0];
    v19 = v6->_placeholderKey;
    v6->_placeholderKey = (NSString *)v18;

    v14 = [v7 objectAtIndexedSubscript:1];
    goto LABEL_13;
  }
  placeholderObjectValue = [v7 objectAtIndexedSubscript:0];
  if ([placeholderObjectValue isEqualToString:@"xcode"]
    && ([v7 objectAtIndexedSubscript:1],
        v15 = objc_claimAutoreleasedReturnValue(),
        int v16 = XREngineeringTypeIDForMnemonic(),
        v15,
        v16))
  {
    v6->_placeholderKind = 1;
    objc_storeStrong((id *)&v6->_placeholderKey, placeholderObjectValue);
    uint64_t v17 = [v7 objectAtIndexedSubscript:1];
  }
  else
  {
    int v23 = [placeholderObjectValue isEqualToString:@"name"];
    uint64_t v24 = 2;
    if (!v23) {
      uint64_t v24 = 0;
    }
    v6->_placeholderKind = v24;
    objc_storeStrong((id *)&v6->_placeholderKey, placeholderObjectValue);
    uint64_t v17 = [v7 objectAtIndexedSubscript:1];
  }
  v25 = v6->_placeholderObjectValue;
  v6->_placeholderObjectValue = (NSString *)v17;

LABEL_24:
  return v6;
}

- (unint64_t)hash
{
  return MEMORY[0x270F9A6D0](self->_placeholderToken, sel_hash);
}

- (int64_t)placeholderKind
{
  return self->_placeholderKind;
}

- (NSString)placeholderToken
{
  return self->_placeholderToken;
}

- (NSString)placeholderKey
{
  return self->_placeholderKey;
}

- (NSString)placeholderObjectValue
{
  return self->_placeholderObjectValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderObjectValue, 0);
  objc_storeStrong((id *)&self->_placeholderKey, 0);
  objc_storeStrong((id *)&self->_placeholderToken, 0);
}

@end