@interface LNSpeakableStringDialog(CATSupport)
- (id)localeXML;
- (uint64_t)parametersXML;
- (void)getResultWithCompletionHandler:()CATSupport;
@end

@implementation LNSpeakableStringDialog(CATSupport)

- (uint64_t)parametersXML
{
  return [NSString stringWithFormat:@"<cat xmlns=\"urn:apple:names:siri:cat:1.0\">\n<parameters>\n</parameters>\n</cat>\n"];
}

- (id)localeXML
{
  v2 = [a1 fullSpeakableString];
  v3 = [v2 printed];
  v4 = [a1 localeIdentifier];
  v5 = [v3 localizedStringForLocaleIdentifier:v4];
  v6 = objc_msgSend(v5, "ln_stringByEscapingForXML");

  v7 = [a1 fullSpeakableString];
  v8 = [v7 spoken];
  v9 = [a1 localeIdentifier];
  v10 = [v8 localizedStringForLocaleIdentifier:v9];
  v11 = objc_msgSend(v10, "ln_stringByEscapingForXML");

  v12 = [a1 supportingSpeakableString];
  v13 = [v12 printed];
  v14 = [a1 localeIdentifier];
  v15 = [v13 localizedStringForLocaleIdentifier:v14];
  v16 = objc_msgSend(v15, "ln_stringByEscapingForXML");

  v17 = [a1 supportingSpeakableString];
  v18 = [v17 spoken];
  v19 = [a1 localeIdentifier];
  v20 = [v18 localizedStringForLocaleIdentifier:v19];
  v21 = objc_msgSend(v20, "ln_stringByEscapingForXML");

  if (v16) {
    [NSString stringWithFormat:@"<full><print>%@</print><speak>%@</speak></full><supporting><print>%@</print><speak>%@</speak></supporting>", v6, v11, v16, v21];
  }
  else {
  v22 = [NSString stringWithFormat:@"<print>%@</print><speak>%@</speak>", v6, v11, v27, v28];
  }
  v23 = NSString;
  v24 = [a1 localeIdentifier];
  v25 = [v23 stringWithFormat:@"<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<cat xmlns=\"urn:apple:names:siri:cat:1.0\" locale=\"%@\">\n<all>\n<dialog>%@</dialog>\n</all>\n</cat>\n", v24, v22];

  return v25;
}

- (void)getResultWithCompletionHandler:()CATSupport
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"LNSpeakableStringDialog+CATSupport.m", 24, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  v22 = @"locale";
  v6 = [a1 localeIdentifier];
  v23[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];

  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2050000000;
  v8 = (void *)getCATClass_softClass_632;
  uint64_t v21 = getCATClass_softClass_632;
  if (!getCATClass_softClass_632)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __getCATClass_block_invoke_633;
    v17[3] = &unk_1E5B39E50;
    v17[4] = &v18;
    __getCATClass_block_invoke_633((uint64_t)v17);
    v8 = (void *)v19[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v18, 8);
  v10 = [a1 parametersXML];
  v11 = [a1 localeXML];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__LNSpeakableStringDialog_CATSupport__getResultWithCompletionHandler___block_invoke;
  v15[3] = &unk_1E5B39218;
  id v16 = v5;
  id v12 = v5;
  LODWORD(v14) = 0;
  [v9 execute:0 paramsXML:v10 localeXML:v11 parameters:MEMORY[0x1E4F1CC08] globals:v7 callback:0 options:v14 completion:v15];
}

@end