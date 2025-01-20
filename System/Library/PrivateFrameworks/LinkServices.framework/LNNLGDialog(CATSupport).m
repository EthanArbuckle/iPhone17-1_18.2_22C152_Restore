@interface LNNLGDialog(CATSupport)
- (id)localeXML;
- (uint64_t)parametersXML;
- (void)getResultWithCompletionHandler:()CATSupport;
@end

@implementation LNNLGDialog(CATSupport)

- (uint64_t)parametersXML
{
  return [NSString stringWithFormat:@"<cat xmlns=\"urn:apple:names:siri:cat:1.0\">\n<parameters>\n</parameters>\n</cat>\n"];
}

- (id)localeXML
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v32 = [MEMORY[0x1E4F1CA48] array];
  v2 = [a1 fallbackDialog];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v4 = [a1 fallbackDialog];
  v5 = v4;
  if (isKindOfClass)
  {
    v6 = [v4 fullString];
    v7 = [a1 localeIdentifier];
    v8 = [v6 localizedStringForLocaleIdentifier:v7];
    v30 = objc_msgSend(v8, "ln_stringByEscapingForXML");
  }
  else
  {
    v30 = [v4 identifier];
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = [a1 nlgParams];
  uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v14 = [v13 type];
        v15 = [v13 title];
        v16 = a1;
        v17 = [a1 localeIdentifier];
        v18 = [v15 localizedStringForLocaleIdentifier:v17];
        v19 = objc_msgSend(v18, "ln_stringByEscapingForXML");

        v20 = [v13 format];
        v21 = [v13 value];

        if (v21)
        {
          v22 = [v13 value];
        }
        else
        {
          v22 = 0;
        }
        v23 = [NSString stringWithFormat:@"type: %@, title: %@, value: %@, format: %@", v14, v19, v22, v20];
        [v32 addObject:v23];

        a1 = v16;
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v10);
  }

  v24 = [v32 componentsJoinedByString:@","];
  v25 = objc_msgSend(v24, "ln_stringByEscapingForXML");

  v26 = NSString;
  v27 = [a1 localeIdentifier];
  v28 = [v26 stringWithFormat:@"<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<cat xmlns=\"urn:apple:names:siri:cat:1.0\" locale=\"%@\">\n<all>\n<dialog>nlgParams: %@</dialog>\n<dialog>fallback: %@</dialog>\n</all>\n</cat>\n", v27, v25, v30];

  return v28;
}

- (void)getResultWithCompletionHandler:()CATSupport
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"LNNLGDialog+CATSupport.m", 28, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  v22 = @"locale";
  v6 = [a1 localeIdentifier];
  v23[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];

  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2050000000;
  v8 = (void *)getCATClass_softClass_5444;
  uint64_t v21 = getCATClass_softClass_5444;
  if (!getCATClass_softClass_5444)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __getCATClass_block_invoke_5445;
    v17[3] = &unk_1E5B39E50;
    v17[4] = &v18;
    __getCATClass_block_invoke_5445((uint64_t)v17);
    v8 = (void *)v19[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v18, 8);
  uint64_t v10 = [a1 parametersXML];
  uint64_t v11 = [a1 localeXML];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__LNNLGDialog_CATSupport__getResultWithCompletionHandler___block_invoke;
  v15[3] = &unk_1E5B39218;
  id v16 = v5;
  id v12 = v5;
  LODWORD(v14) = 0;
  [v9 execute:0 paramsXML:v10 localeXML:v11 parameters:MEMORY[0x1E4F1CC08] globals:v7 callback:0 options:v14 completion:v15];
}

@end