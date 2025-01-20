@interface CLPlacemark(Readable)
- (id)_intents_defaultReadableDescription;
- (id)_intents_readableTitleWithLocalizer:()Readable metadata:;
@end

@implementation CLPlacemark(Readable)

- (id)_intents_readableTitleWithLocalizer:()Readable metadata:
{
  id v6 = a3;
  id v7 = a4;
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v9 = 0;
    goto LABEL_8;
  }
  uint64_t v8 = [v7 type];
  if (v8 == 2)
  {
    uint64_t v10 = [a1 locality];
    goto LABEL_10;
  }
  if (v8 == 1)
  {
    v12 = [a1 formattedAddressLines];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      v14 = [a1 formattedAddressLines];
      v11 = [v14 firstObject];
    }
    else
    {
      id CNPostalAddressFormatterClass = getCNPostalAddressFormatterClass();
      v16 = [a1 postalAddress];
      v11 = [CNPostalAddressFormatterClass singleLineStringFromPostalAddress:v16 addCountryName:0];
    }
    goto LABEL_14;
  }
  v9 = v7;
  if (v8)
  {
LABEL_8:
    v11 = objc_msgSend(a1, "_intents_defaultReadableDescription");
    goto LABEL_15;
  }
  uint64_t v10 = objc_msgSend(a1, "_intents_defaultReadableDescription");
LABEL_10:
  v11 = (void *)v10;
LABEL_14:
  v9 = v7;
LABEL_15:

  return v11;
}

- (id)_intents_defaultReadableDescription
{
  v2 = [a1 name];

  if (v2)
  {
    v3 = [a1 name];
  }
  else
  {
    v4 = [a1 formattedAddressLines];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      id v6 = [a1 formattedAddressLines];
      v3 = [v6 firstObject];
    }
    else
    {
      id CNPostalAddressFormatterClass = getCNPostalAddressFormatterClass();
      uint64_t v8 = [a1 postalAddress];
      v3 = [CNPostalAddressFormatterClass singleLineStringFromPostalAddress:v8 addCountryName:0];
    }
  }

  return v3;
}

@end