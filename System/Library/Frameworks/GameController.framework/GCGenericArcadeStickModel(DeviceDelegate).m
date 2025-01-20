@interface GCGenericArcadeStickModel(DeviceDelegate)
- (_GCControllerInputComponentDescription)logicalDevice:()DeviceDelegate makeControllerInputDescriptionWithIdentifier:bindings:;
@end

@implementation GCGenericArcadeStickModel(DeviceDelegate)

- (_GCControllerInputComponentDescription)logicalDevice:()DeviceDelegate makeControllerInputDescriptionWithIdentifier:bindings:
{
  id v7 = a4;
  id v8 = a5;
  v9 = [a1 physicalInput];
  if (v9)
  {
    id v39 = v8;
    id v40 = v7;
    v38 = v9;
    v10 = [v9 elements];
    v11 = objc_opt_new();
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = v10;
    uint64_t v12 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (!v12) {
      goto LABEL_20;
    }
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v43;
    while (1)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v43 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = v16;
          v18 = objc_opt_new();
          v19 = [v17 identifier];
          [v18 setIdentifier:v19];

          v20 = [v17 names];
          v21 = +[NSSet setWithArray:v20];
          [v18 setAliases:v21];

          v22 = [v17 localizedNameKey];
          [v18 setLocalizedName:v22];

          v23 = [v17 symbolName];
          if (v23)
          {
            v24 = [v17 symbolName];
            v25 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", v24);
            [v18 setSymbol:v25];
          }
          else
          {
            [v18 setSymbol:0];
          }

          v34 = [v17 isAnalog];
          objc_msgSend(v18, "setAnalog:", objc_msgSend(v34, "BOOLValue"));

          objc_msgSend(v18, "setEventPressedValueField:", objc_msgSend(v17, "sourceExtendedEventFieldIndex"));
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          id v26 = v16;
          v18 = objc_opt_new();
          v27 = [v26 identifier];
          [v18 setIdentifier:v27];

          v28 = [v26 names];
          v29 = +[NSSet setWithArray:v28];
          [v18 setAliases:v29];

          v30 = [v26 localizedNameKey];
          [v18 setLocalizedName:v30];

          v31 = [v26 symbolName];
          if (v31)
          {
            v32 = [v26 symbolName];
            v33 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", v32);
            [v18 setSymbol:v33];
          }
          else
          {
            [v18 setSymbol:0];
          }

          [v18 setAnalog:0];
          objc_msgSend(v18, "setEventUpValueField:", objc_msgSend(v26, "sourceUpExtendedEventFieldIndex"));
          objc_msgSend(v18, "setEventRightValueField:", objc_msgSend(v26, "sourceRightExtendedEventFieldIndex"));
          objc_msgSend(v18, "setEventDownValueField:", objc_msgSend(v26, "sourceDownExtendedEventFieldIndex"));
          objc_msgSend(v18, "setEventLeftValueField:", objc_msgSend(v26, "sourceLeftExtendedEventFieldIndex"));
        }
        [v11 addObject:v18];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (!v13)
      {
LABEL_20:

        v35 = objc_opt_new();
        [v35 setElements:v11];
        id v8 = v39;
        id v7 = v40;
        v36 = [[_GCControllerInputComponentDescription alloc] initWithIdentifier:v40 controllerInputs:v35 bindings:v39];

        v9 = v38;
        goto LABEL_22;
      }
    }
  }
  v36 = 0;
LABEL_22:

  return v36;
}

@end