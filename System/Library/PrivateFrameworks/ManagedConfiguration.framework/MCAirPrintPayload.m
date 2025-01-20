@interface MCAirPrintPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (MCAirPrintPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSMutableArray)ippAddresses;
- (id)payloadDescriptionKeyValueSections;
- (id)restrictions;
- (id)stubDictionary;
- (id)subtitle1Description;
- (id)subtitle1Label;
- (id)verboseDescription;
- (unint64_t)airPrintCount;
- (void)setAirPrintCount:(unint64_t)a3;
- (void)setIppAddresses:(id)a3;
@end

@implementation MCAirPrintPayload

+ (id)typeStrings
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.airprint";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"AIRPRINT_SINGULAR", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"AIRPRINT_PLURAL", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCAirPrintPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v64.receiver = self;
  v64.super_class = (Class)MCAirPrintPayload;
  v10 = [(MCPayload *)&v64 initWithDictionary:v8 profile:v9 outError:a5];
  if (!v10) {
    goto LABEL_55;
  }
  id v53 = v9;
  if ([v9 isStub])
  {
    id v58 = 0;
    id v11 = +[MCProfile removeOptionalObjectInDictionary:v8 key:@"AirPrintCount" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v58];
    id v12 = v58;
    if (v12)
    {
      id v13 = v12;
    }
    else
    {
      v10->_airPrintCount = [v11 unsignedIntegerValue];
      id v57 = 0;
      v33 = [v8 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"IPPAddresses" isRequired:0 outError:&v57];
      id v13 = v57;
      uint64_t v34 = [v33 mutableCopy];
      ippAddresses = v10->_ippAddresses;
      v10->_ippAddresses = (NSMutableArray *)v34;
    }
    goto LABEL_45;
  }
  uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
  v15 = v10->_ippAddresses;
  v10->_ippAddresses = (NSMutableArray *)v14;

  id v63 = 0;
  v16 = +[MCProfile removeRequiredObjectInDictionary:v8 key:@"AirPrint" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" missingDataCode:2002 missingDataErrorString:@"ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v63];
  id v13 = v63;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v11 = v16;
  uint64_t v54 = [v11 countByEnumeratingWithState:&v59 objects:v69 count:16];
  if (!v54) {
    goto LABEL_37;
  }
  uint64_t v55 = *(void *)v60;
  v50 = a5;
  id v51 = v8;
  id obj = v11;
  while (2)
  {
    uint64_t v17 = 0;
    do
    {
      if (*(void *)v60 != v55) {
        objc_enumerationMutation(obj);
      }
      v18 = *(void **)(*((void *)&v59 + 1) + 8 * v17);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        +[MCPayload badFieldTypeErrorWithField:@"AirPrint"];
        v19 = v13;
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_43;
      }
      v19 = [v18 objectForKeyedSubscript:@"IPAddress"];
      if (!v19 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        uint64_t v36 = +[MCPayload badFieldTypeErrorWithField:@"IPAddress"];

LABEL_41:
        id v13 = (id)v36;
LABEL_43:

LABEL_44:
        id v11 = obj;

        goto LABEL_45;
      }
      v20 = [v18 objectForKeyedSubscript:@"ResourcePath"];
      if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        uint64_t v36 = +[MCPayload badFieldTypeErrorWithField:@"ResourcePath"];

        goto LABEL_41;
      }
      v21 = [v18 objectForKeyedSubscript:@"Port"];
      if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v25 = v10;
        v26 = a5;
        id v27 = v8;
        uint64_t v28 = +[MCPayload badFieldTypeErrorWithField:@"Port"];
        v29 = v13;
        int v30 = 6;
      }
      else
      {
        v56 = [v18 objectForKeyedSubscript:@"ForceTLS"];
        if (v56 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          v25 = v10;
          v26 = a5;
          id v27 = v8;
          uint64_t v28 = +[MCPayload badFieldTypeErrorWithField:@"ForceTLS"];
          id v22 = v13;
          int v30 = 6;
        }
        else
        {
          id v22 = objc_alloc_init(MEMORY[0x1E4F29088]);
          [v22 setHost:v19];
          if ([v21 integerValue] >= 1) {
            [v22 setPort:v21];
          }
          if ([v56 BOOLValue]) {
            v23 = @"ipps";
          }
          else {
            v23 = @"ipp";
          }
          [v22 setScheme:v23];
          if ([v20 rangeOfString:@"/" options:8] == 0x7FFFFFFFFFFFFFFFLL)
          {
            v24 = [NSString stringWithFormat:@"/%@", v20];
            [v22 setPath:v24];
          }
          else
          {
            [v22 setPath:v20];
          }
          v31 = [v22 URL];
          v32 = [v31 absoluteString];

          if (v32)
          {
            uint64_t v28 = (uint64_t)v13;
            [(NSMutableArray *)v10->_ippAddresses addObject:v32];
            int v30 = 0;
          }
          else
          {
            uint64_t v28 = +[MCPayload badFieldTypeErrorWithField:@"AirPrint"];

            int v30 = 6;
          }

          v25 = v10;
          v26 = v50;
          id v27 = v51;
        }

        v29 = v56;
      }

      if (v30)
      {
        id v13 = (id)v28;
        id v8 = v27;
        a5 = v26;
        v10 = v25;
        goto LABEL_44;
      }
      ++v17;
      id v13 = (id)v28;
      id v8 = v27;
      a5 = v26;
      v10 = v25;
    }
    while (v54 != v17);
    id v11 = obj;
    uint64_t v54 = [obj countByEnumeratingWithState:&v59 objects:v69 count:16];
    if (v54) {
      continue;
    }
    break;
  }
LABEL_37:

  v10->_airPrintCount = [(NSMutableArray *)v10->_ippAddresses count];
LABEL_45:

  if (v13)
  {
    v37 = [(MCPayload *)v10 malformedPayloadErrorWithError:v13];
    v38 = v37;
    if (a5) {
      *a5 = v37;
    }
    v39 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v40 = v39;
      id v41 = v13;
      id v42 = v8;
      v43 = objc_opt_class();
      id v44 = v43;
      v45 = [v38 MCVerboseDescription];
      *(_DWORD *)buf = 138543618;
      v66 = v43;
      id v8 = v42;
      id v13 = v41;
      __int16 v67 = 2114;
      id v68 = v45;
      _os_log_impl(&dword_1A13F0000, v40, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
    }
    v10 = 0;
  }
  if ([v8 count])
  {
    v46 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v47 = v46;
      v48 = [(MCPayload *)v10 friendlyName];
      *(_DWORD *)buf = 138543618;
      v66 = v48;
      __int16 v67 = 2114;
      id v68 = v8;
      _os_log_impl(&dword_1A13F0000, v47, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
    }
  }

  id v9 = v53;
LABEL_55:

  return v10;
}

- (id)stubDictionary
{
  v8.receiver = self;
  v8.super_class = (Class)MCAirPrintPayload;
  uint64_t v3 = [(MCPayload *)&v8 stubDictionary];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[MCAirPrintPayload airPrintCount](self, "airPrintCount"));
  [v3 setObject:v4 forKeyedSubscript:@"AirPrintCount"];

  uint64_t v5 = [(MCAirPrintPayload *)self ippAddresses];

  if (v5)
  {
    uint64_t v6 = [(MCAirPrintPayload *)self ippAddresses];
    [v3 setObject:v6 forKeyedSubscript:@"IPPAddresses"];
  }
  return v3;
}

- (id)subtitle1Label
{
  if ([(MCAirPrintPayload *)self airPrintCount]) {
    MCLocalizedFormat(@"AIRPRINT_TITLE_COLON", v2, v3, v4, v5, v6, v7, v8, vars0);
  }
  else {
  id v9 = MCLocalizedString(@"AIRPRINT_COUNT_NONE");
  }
  return v9;
}

- (id)subtitle1Description
{
  uint64_t v2 = [(MCAirPrintPayload *)self airPrintCount];
  return MCLocalizedFormat(@"AIRPRINT_COUNT", v3, v4, v5, v6, v7, v8, v9, v2);
}

- (id)verboseDescription
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)MCAirPrintPayload;
  uint64_t v3 = [(MCPayload *)&v16 verboseDescription];
  uint64_t v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(MCAirPrintPayload *)self ippAddresses];

  if (v5)
  {
    [v4 appendString:@"AirPrint paths:\n"];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = [(MCAirPrintPayload *)self ippAddresses];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          [v4 appendFormat:@"  %@\n", *(void *)(*((void *)&v12 + 1) + 8 * i)];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[MCAirPrintPayload airPrintCount](self, "airPrintCount"));
    [v4 appendFormat:@"AirPrint devices: %@\n", v6];
  }

  return v4;
}

- (id)payloadDescriptionKeyValueSections
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(MCAirPrintPayload *)self ippAddresses];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    v31 = v3;
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v7 = [(MCAirPrintPayload *)self ippAddresses];
    uint64_t v8 = objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));

    uint64_t v9 = (void *)v8;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = [(MCAirPrintPayload *)self ippAddresses];
    uint64_t v10 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    v33 = (void *)v8;
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v35 != v12) {
            objc_enumerationMutation(obj);
          }
          long long v14 = [MEMORY[0x1E4F1CB10] URLWithString:*(void *)(*((void *)&v34 + 1) + 8 * i)];
          long long v15 = [v14 scheme];
          objc_super v16 = [v14 port];
          uint64_t v17 = [v14 host];
          uint64_t v18 = [v14 path];
          v19 = (void *)v18;
          v20 = NSString;
          if (v16)
          {
            v21 = [NSString stringWithFormat:@":%@", v16];
            id v22 = [v20 stringWithFormat:@"%@://%@%@%@", v15, v17, v21, v19];

            uint64_t v9 = v33;
          }
          else
          {
            id v22 = [NSString stringWithFormat:@"%@://%@%@%@", v15, v17, &stru_1EF4AAAF8, v18];
          }
          [v9 addObject:v22];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v11);
    }

    v23 = MCLocalizedString(@"AIRPRINT_PATHS");
    v24 = +[MCKeyValueSection sectionWithLocalizedArray:v9 title:v23 footer:0];

    uint64_t v3 = v31;
    if (v24) {
      [v31 addObject:v24];
    }
    v25 = v33;
  }
  else
  {
    v25 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", -[MCAirPrintPayload airPrintCount](self, "airPrintCount"));
    v26 = [MCKeyValue alloc];
    id v27 = MCLocalizedString(@"AIRPRINT_DEVICES");
    v24 = [(MCKeyValue *)v26 initWithLocalizedString:v25 localizedKey:v27];

    v38 = v24;
    uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
    v29 = +[MCKeyValueSection sectionWithKeyValues:v28];
    [v3 addObject:v29];
  }
  if (![v3 count])
  {

    uint64_t v3 = 0;
  }
  return v3;
}

- (id)restrictions
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:v4 forKeyedSubscript:@"union"];
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  [v4 setObject:v5 forKeyedSubscript:@"knownAirPrintTargets"];
  uint64_t v6 = [(MCAirPrintPayload *)self ippAddresses];

  if (v6)
  {
    uint64_t v7 = [(MCAirPrintPayload *)self ippAddresses];
    [v5 setObject:v7 forKeyedSubscript:@"values"];
  }
  return v3;
}

- (unint64_t)airPrintCount
{
  return self->_airPrintCount;
}

- (void)setAirPrintCount:(unint64_t)a3
{
  self->_airPrintCount = a3;
}

- (NSMutableArray)ippAddresses
{
  return self->_ippAddresses;
}

- (void)setIppAddresses:(id)a3
{
}

- (void).cxx_destruct
{
}

@end