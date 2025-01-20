@interface PatternExecutionResult
- (NSArray)dialog;
- (NSData)visual;
- (NSDictionary)meta;
- (NSNumber)printSupportingDialog;
- (NSString)patternId;
- (NSString)responseMode;
- (PatternVisualInfo)visualInfo;
- (id)visualToJsonDictionary;
- (id)visualToString;
- (unint64_t)patternType;
- (void)append:(id)a3;
- (void)setDialog:(id)a3;
- (void)setMeta:(id)a3;
- (void)setPatternId:(id)a3;
- (void)setPatternType:(unint64_t)a3;
- (void)setPrintSupportingDialog:(id)a3;
- (void)setResponseMode:(id)a3;
- (void)setVisual:(id)a3;
- (void)setVisualInfo:(id)a3;
@end

@implementation PatternExecutionResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualInfo, 0);
  objc_storeStrong((id *)&self->_printSupportingDialog, 0);
  objc_storeStrong((id *)&self->_responseMode, 0);
  objc_storeStrong((id *)&self->_visual, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_meta, 0);
  objc_storeStrong((id *)&self->_patternId, 0);
}

- (void)setVisualInfo:(id)a3
{
}

- (PatternVisualInfo)visualInfo
{
  return self->_visualInfo;
}

- (void)setPatternType:(unint64_t)a3
{
  self->_patternType = a3;
}

- (unint64_t)patternType
{
  return self->_patternType;
}

- (void)setPrintSupportingDialog:(id)a3
{
}

- (NSNumber)printSupportingDialog
{
  return self->_printSupportingDialog;
}

- (void)setResponseMode:(id)a3
{
}

- (NSString)responseMode
{
  return self->_responseMode;
}

- (void)setVisual:(id)a3
{
}

- (NSData)visual
{
  return self->_visual;
}

- (void)setDialog:(id)a3
{
}

- (NSArray)dialog
{
  return self->_dialog;
}

- (void)setMeta:(id)a3
{
}

- (NSDictionary)meta
{
  return self->_meta;
}

- (void)setPatternId:(id)a3
{
}

- (NSString)patternId
{
  return self->_patternId;
}

- (void)append:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 dialog];

    if (v6)
    {
      v7 = [(PatternExecutionResult *)self dialog];
      if (v7)
      {
        v8 = [(PatternExecutionResult *)self dialog];
        v9 = (void *)[v8 mutableCopy];
      }
      else
      {
        v9 = objc_opt_new();
      }

      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      v10 = [v5 dialog];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v10);
            }
            [v9 addObject:*(void *)(*((void *)&v19 + 1) + 8 * i)];
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v11);
      }

      [(PatternExecutionResult *)self setDialog:v9];
    }
    v14 = [v5 visual];
    BOOL v15 = v14 == 0;

    if (!v15)
    {
      v16 = [v5 visual];
      std::string::basic_string[abi:ne180100]<0>(__p, "");
      AppendVisualResultToPatternExecutionResult(self, v16, (uint64_t)__p);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
    }
  }
}

- (id)visualToJsonDictionary
{
  v2 = [(PatternExecutionResult *)self visualToString];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 dataUsingEncoding:4];
    id v7 = 0;
    v5 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:4 error:&v7];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)visualToString
{
  v3 = [(PatternExecutionResult *)self visual];

  if (v3)
  {
    id v4 = [(PatternExecutionResult *)self visual];
    v5 = [v4 base64EncodedStringWithOptions:0];

    id v6 = v5;
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v6 UTF8String]);
    siri::dialogengine::JsonFromResponseMessage((std::string::size_type)__p, v11);
    if (v10 < 0) {
      operator delete(__p[0]);
    }
    if (v12 >= 0) {
      id v7 = v11;
    }
    else {
      id v7 = (void **)v11[0];
    }
    v3 = [NSString stringWithUTF8String:v7];
    if (v12 < 0) {
      operator delete(v11[0]);
    }
  }
  return v3;
}

@end