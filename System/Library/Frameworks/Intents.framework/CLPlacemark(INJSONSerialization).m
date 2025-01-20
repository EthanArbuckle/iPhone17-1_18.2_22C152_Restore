@interface CLPlacemark(INJSONSerialization)
+ (id)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:;
- (id)_intents_encodeWithJSONEncoder:()INJSONSerialization codableDescription:;
@end

@implementation CLPlacemark(INJSONSerialization)

- (id)_intents_encodeWithJSONEncoder:()INJSONSerialization codableDescription:
{
  v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  v6 = [v4 dictionary];
  v7 = [v5 configuration];

  v8 = (void *)[v7 copy];
  [v8 setLocationIncludesTimestamp:0];
  v9 = [[INJSONEncoder alloc] initWithConfiguration:v8];
  v10 = [a1 location];
  v11 = [(INJSONEncoder *)v9 encodeObject:v10];
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v11, @"location");

  v12 = [a1 name];
  v13 = [(INJSONEncoder *)v9 encodeObject:v12];
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v13, @"name");

  v14 = [a1 postalAddress];
  v15 = [v14 dictionaryRepresentation];
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v15, @"postalAddress");

  return v6;
}

+ (id)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v10 = objc_opt_class();
    v11 = [v9 objectForKeyedSubscript:@"location"];
    v12 = [v7 decodeObjectOfClass:v10 from:v11];

    if (v12)
    {
      uint64_t v13 = objc_opt_class();
      v14 = [v9 objectForKeyedSubscript:@"name"];
      uint64_t v15 = [v7 decodeObjectOfClass:v13 from:v14];
      v16 = (void *)v15;
      v17 = &stru_1EDA6DB28;
      if (v15) {
        v17 = (__CFString *)v15;
      }
      v18 = v17;

      v19 = [v9 objectForKeyedSubscript:@"postalAddress"];
      if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v20 = (void *)MEMORY[0x1E4F1E630];
        uint64_t v27 = 0;
        v28 = &v27;
        uint64_t v29 = 0x2050000000;
        v21 = (void *)getCNPostalAddressClass_softClass_110967;
        uint64_t v30 = getCNPostalAddressClass_softClass_110967;
        if (!getCNPostalAddressClass_softClass_110967)
        {
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __getCNPostalAddressClass_block_invoke_110968;
          v26[3] = &unk_1E5520EB8;
          v26[4] = &v27;
          __getCNPostalAddressClass_block_invoke_110968((uint64_t)v26);
          v21 = (void *)v28[3];
        }
        id v22 = v21;
        _Block_object_dispose(&v27, 8);
        v23 = [v22 postalAddressWithDictionaryRepresentation:v19];
        v24 = [v20 placemarkWithLocation:v12 name:v18 postalAddress:v23];
      }
      else
      {

        v24 = [MEMORY[0x1E4F1E630] placemarkWithLocation:v12 name:v18 postalAddress:0];
      }
    }
    else
    {
      v24 = 0;
    }
  }
  else
  {

    v24 = 0;
  }

  return v24;
}

@end