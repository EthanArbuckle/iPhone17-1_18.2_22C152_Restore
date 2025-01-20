@interface LNLocalizedStringResourceDialog(CATSupport)
- (id)localeXML;
- (uint64_t)parametersXML;
- (void)getResultWithCompletionHandler:()CATSupport;
@end

@implementation LNLocalizedStringResourceDialog(CATSupport)

- (uint64_t)parametersXML
{
  return [NSString stringWithFormat:@"<cat xmlns=\"urn:apple:names:siri:cat:1.0\">\n<parameters>\n</parameters>\n</cat>\n"];
}

- (id)localeXML
{
  v2 = [a1 fullString];
  v3 = [a1 localeIdentifier];
  v4 = [v2 localizedStringForLocaleIdentifier:v3];
  v5 = objc_msgSend(v4, "ln_stringByEscapingForXML");

  v6 = [a1 supportingString];
  v7 = [a1 localeIdentifier];
  v8 = [v6 localizedStringForLocaleIdentifier:v7];
  v9 = objc_msgSend(v8, "ln_stringByEscapingForXML");

  if (v9)
  {
    id v10 = [NSString stringWithFormat:@"<full>%@</full><supporting>%@</supporting>", v5, v9];
  }
  else
  {
    id v10 = v5;
  }
  v11 = v10;
  v12 = NSString;
  v13 = [a1 localeIdentifier];
  v14 = [v12 stringWithFormat:@"<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<cat xmlns=\"urn:apple:names:siri:cat:1.0\" locale=\"%@\">\n<all>\n<dialog>%@</dialog>\n</all>\n</cat>\n", v13, v11];

  return v14;
}

- (void)getResultWithCompletionHandler:()CATSupport
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"LNLocalizedStringResourceDialog+CATSupport.m", 25, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  v22 = @"locale";
  v6 = [a1 localeIdentifier];
  v23[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];

  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2050000000;
  v8 = (void *)getCATClass_softClass_6699;
  uint64_t v21 = getCATClass_softClass_6699;
  if (!getCATClass_softClass_6699)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __getCATClass_block_invoke_6700;
    v17[3] = &unk_1E5B39E50;
    v17[4] = &v18;
    __getCATClass_block_invoke_6700((uint64_t)v17);
    v8 = (void *)v19[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v18, 8);
  id v10 = [a1 parametersXML];
  v11 = [a1 localeXML];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__LNLocalizedStringResourceDialog_CATSupport__getResultWithCompletionHandler___block_invoke;
  v15[3] = &unk_1E5B39218;
  id v16 = v5;
  id v12 = v5;
  LODWORD(v14) = 0;
  [v9 execute:0 paramsXML:v10 localeXML:v11 parameters:MEMORY[0x1E4F1CC08] globals:v7 callback:0 options:v14 completion:v15];
}

@end