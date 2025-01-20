@interface AFUITestInput
+ (id)_baseRequestOptions;
- (AFUITestInput)initWithRecordedSpeechURL:(id)a3;
- (AFUITestInput)initWithText:(id)a3;
- (SASRequestOptions)requestOptions;
- (id)_initWithRequestOptions:(id)a3;
@end

@implementation AFUITestInput

+ (id)_baseRequestOptions
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F6C730]) initWithRequestSource:15 uiPresentationIdentifier:@"com.apple.siri.Compact"];

  return v2;
}

- (id)_initWithRequestOptions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFUITestInput;
  v6 = [(AFUITestInput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_requestOptions, a3);
  }

  return v7;
}

- (AFUITestInput)initWithText:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _baseRequestOptions];
  [v5 setText:v4];

  v6 = [(AFUITestInput *)self _initWithRequestOptions:v5];
  return v6;
}

- (AFUITestInput)initWithRecordedSpeechURL:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _baseRequestOptions];
  [v5 setSpeechFileURL:v4];

  v6 = [(AFUITestInput *)self _initWithRequestOptions:v5];
  return v6;
}

- (SASRequestOptions)requestOptions
{
  return self->_requestOptions;
}

- (void).cxx_destruct
{
}

@end