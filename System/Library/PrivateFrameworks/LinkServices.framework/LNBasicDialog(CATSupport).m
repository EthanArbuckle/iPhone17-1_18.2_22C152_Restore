@interface LNBasicDialog(CATSupport)
- (id)localeXML;
- (id)parameterDefinitions;
- (id)parameters;
- (id)parametersXML;
- (void)getResultWithCompletionHandler:()CATSupport;
@end

@implementation LNBasicDialog(CATSupport)

- (id)parameters
{
  v2 = [a1 fullString];
  v3 = [v2 parametersForCAT];
  v4 = [a1 supportingString];
  uint64_t v5 = [v4 parametersForCAT];
  v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = MEMORY[0x1E4F1CC08];
  }
  v8 = objc_msgSend(v3, "if_dictionaryByAddingEntriesFromDictionary:", v7);

  return v8;
}

- (id)parameterDefinitions
{
  v2 = [a1 fullString];
  v3 = [v2 parameterDefinitions];
  v4 = [a1 supportingString];
  uint64_t v5 = [v4 parameterDefinitions];
  v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = MEMORY[0x1E4F1CBF0];
  }
  v8 = [v3 arrayByAddingObjectsFromArray:v7];

  return v8;
}

- (id)parametersXML
{
  v1 = NSString;
  v2 = [a1 parameterDefinitions];
  v3 = [v2 componentsJoinedByString:@"\n"];
  v4 = [v1 stringWithFormat:@"<cat xmlns=\"urn:apple:names:siri:cat:1.0\">\n<parameters>\n%@\n</parameters>\n</cat>\n", v3];

  return v4;
}

- (id)localeXML
{
  v2 = [a1 fullString];
  v3 = [v2 localizedKeyWithParameters];

  v4 = [a1 supportingString];
  uint64_t v5 = [v4 localizedKeyWithParameters];

  if (v5)
  {
    id v6 = [NSString stringWithFormat:@"<full>%@</full><supporting>%@</supporting>", v3, v5];
  }
  else
  {
    id v6 = v3;
  }
  uint64_t v7 = v6;
  v8 = NSString;
  v9 = [a1 localeIdentifier];
  v10 = [v8 stringWithFormat:@"<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<cat xmlns=\"urn:apple:names:siri:cat:1.0\" locale=\"%@\">\n<all>\n<dialog>%@</dialog>\n</all>\n</cat>\n", v9, v7];

  return v10;
}

- (void)getResultWithCompletionHandler:()CATSupport
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"LNBasicDialog+CATSupport.m", 25, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  v23 = @"locale";
  id v6 = [a1 localeIdentifier];
  v24[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];

  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2050000000;
  v8 = (void *)getCATClass_softClass;
  uint64_t v22 = getCATClass_softClass;
  if (!getCATClass_softClass)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __getCATClass_block_invoke;
    v18[3] = &unk_1E5B39E50;
    v18[4] = &v19;
    __getCATClass_block_invoke((uint64_t)v18);
    v8 = (void *)v20[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v19, 8);
  v10 = [a1 parametersXML];
  v11 = [a1 localeXML];
  v12 = [a1 parameters];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __60__LNBasicDialog_CATSupport__getResultWithCompletionHandler___block_invoke;
  v16[3] = &unk_1E5B39218;
  id v17 = v5;
  id v13 = v5;
  LODWORD(v15) = 0;
  [v9 execute:0 paramsXML:v10 localeXML:v11 parameters:v12 globals:v7 callback:0 options:v15 completion:v16];
}

@end