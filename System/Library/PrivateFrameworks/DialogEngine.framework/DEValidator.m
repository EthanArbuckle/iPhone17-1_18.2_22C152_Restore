@interface DEValidator
- (NSString)templateDir;
- (id)jsonToResult:(id)a3;
- (id)validate:(id)a3 locale:(id)a4;
- (id)validateFile:(id)a3 locale:(id)a4;
- (id)validateString:(id)a3 localeString:(id)a4;
- (id)validateWithParams:(id)a3 locale:(id)a4;
- (void)setTemplateDir:(id)a3;
@end

@implementation DEValidator

- (void).cxx_destruct
{
}

- (void)setTemplateDir:(id)a3
{
}

- (NSString)templateDir
{
  return self->_templateDir;
}

- (id)validateWithParams:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(DEValidator *)self templateDir];

  if (v8)
  {
    v9 = NSString;
    v10 = [(DEValidator *)self templateDir];
    v11 = [v9 stringWithFormat:@"{ \"templateDir\": \"%@\" }", v10];
  }
  else
  {
    v11 = @"{}";
  }
  CATValidateWithStrings((char *)-[__CFString UTF8String](v11, "UTF8String"), (char *)[objc_retainAutorelease(v6) UTF8String], (char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
}

- (id)validate:(id)a3 locale:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v6 = [(DEValidator *)self templateDir];

  if (v6)
  {
    id v7 = NSString;
    v8 = [(DEValidator *)self templateDir];
    v9 = [v7 stringWithFormat:@"{ \"templateDir\": \"%@\" }", v8];
  }
  else
  {
    v9 = @"{}";
  }
  CATValidateWithStrings((char *)-[__CFString UTF8String](v9, "UTF8String"), (char *)[objc_retainAutorelease(v11) UTF8String], (char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
}

- (id)validateFile:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15[0] = 0;
  v15[1] = 0;
  v14 = v15;
  v8 = [(DEValidator *)self templateDir];

  if (v8)
  {
    v9 = [(DEValidator *)self templateDir];
    std::string::basic_string[abi:ne180100]<0>(v12, v9);
    siri::dialogengine::CreateJSONStringVal();
  }
  if (v6)
  {
    std::string::basic_string[abi:ne180100]<0>(v12, (char *)[v6 UTF8String]);
    siri::dialogengine::CreateJSONStringVal();
  }
  if (v7)
  {
    std::string::basic_string[abi:ne180100]<0>(v12, (char *)[v7 UTF8String]);
    siri::dialogengine::CreateJSONStringVal();
  }
  siri::dialogengine::ConstructJSONString(&v14, v12);
  if (v13 >= 0) {
    v10 = (char *)v12;
  }
  else {
    v10 = (char *)v12[0];
  }
  CATValidateWithStrings(v10, 0, 0);
}

- (id)validateString:(id)a3 localeString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15[0] = 0;
  v15[1] = 0;
  v14 = v15;
  v8 = [(DEValidator *)self templateDir];

  if (v8)
  {
    v9 = [(DEValidator *)self templateDir];
    std::string::basic_string[abi:ne180100]<0>(v12, v9);
    siri::dialogengine::CreateJSONStringVal();
  }
  siri::dialogengine::ConstructJSONString(&v14, v12);
  if (v13 >= 0) {
    v10 = (char *)v12;
  }
  else {
    v10 = (char *)v12[0];
  }
  CATValidateWithStrings(v10, (char *)[v6 UTF8String], (char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
}

- (id)jsonToResult:(id)a3
{
  v3 = [a3 dataUsingEncoding:4];
  id v14 = 0;
  v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v3 options:0 error:&v14];
  id v5 = v14;
  id v6 = objc_opt_new();
  id v7 = v6;
  if (v4)
  {
    v8 = [v4 valueForKey:@"status"];
    [v7 setStatus:v8];

    v9 = [v4 valueForKey:@"errors"];
    v10 = DictionaryToValidationResult(v9);
    [v7 setErrors:v10];

    id v11 = [v4 objectForKey:@"warnings"];
    id v12 = DictionaryToValidationResult(v11);
    [v7 setWarnings:v12];
  }
  else
  {
    [v6 setStatus:DEValidationResultStatusError];
  }

  return v7;
}

@end