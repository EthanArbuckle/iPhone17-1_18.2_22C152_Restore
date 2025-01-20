@interface CNPropertyGroupURLAddressItem
- (id)_urlWithUserString:(id)a3;
- (id)defaultActionURL;
- (id)displayStringForValue:(id)a3;
@end

@implementation CNPropertyGroupURLAddressItem

- (id)_urlWithUserString:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    v4 = (void *)MEMORY[0x18C137580]();
    v5 = objc_msgSend(MEMORY[0x1E4F1CB10], "_web_URLWithUserTypedString:", v3);
    v6 = [v5 scheme];

    if (!v6)
    {
      v7 = (void *)MEMORY[0x1E4F1CB10];
      v8 = [NSString stringWithFormat:@"http://%@", v3];
      uint64_t v9 = objc_msgSend(v7, "_web_URLWithUserTypedString:", v8);

      v5 = (void *)v9;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)defaultActionURL
{
  id v3 = [(CNPropertyGroupItem *)self labeledValue];
  v4 = [v3 value];
  v5 = [(CNPropertyGroupURLAddressItem *)self _urlWithUserString:v4];

  return v5;
}

- (id)displayStringForValue:(id)a3
{
  id v3 = [(CNPropertyGroupURLAddressItem *)self _urlWithUserString:a3];
  v4 = objc_msgSend(v3, "_web_userVisibleString");

  return v4;
}

@end