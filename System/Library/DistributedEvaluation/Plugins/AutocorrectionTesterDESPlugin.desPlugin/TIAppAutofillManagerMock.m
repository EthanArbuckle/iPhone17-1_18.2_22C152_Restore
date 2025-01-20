@interface TIAppAutofillManagerMock
- (BOOL)hasOneTimeCode;
- (TIAppAutofillManagerMock)init;
- (TIKeyboardSecureCandidateRenderer)secureCandidateRenderer;
- (id)generateOneTimeCodeCandidatesWithRenderTraits:(id)a3 withKeyboardState:(id)a4;
- (void)generateAutofillFormCandidatesWithRenderTraits:(id)a3 withKeyboardState:(id)a4 completion:(id)a5;
- (void)generateAutofillFormSuggestedUsernameWithRenderTraits:(id)a3 withKeyboardState:(id)a4 completionHandler:(id)a5;
- (void)generateJustHMEAutofillFormSuggestionWithRenderTraits:(id)a3 withKeyboardState:(id)a4 applicationID:(id)a5 applicationBundleID:(id)a6 completionHandler:(id)a7;
- (void)shouldAcceptAutofill:(id)a3 withPayload:(id)a4 completion:(id)a5;
- (void)shouldAcceptOneTimeCode:(id)a3 completion:(id)a4;
@end

@implementation TIAppAutofillManagerMock

- (TIAppAutofillManagerMock)init
{
  v6.receiver = self;
  v6.super_class = (Class)TIAppAutofillManagerMock;
  v2 = [(TIAppAutofillManagerMock *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_hasOneTimeCode = 0;
    secureCandidateRenderer = v2->_secureCandidateRenderer;
    v2->_secureCandidateRenderer = 0;
  }
  return v3;
}

- (void)generateAutofillFormCandidatesWithRenderTraits:(id)a3 withKeyboardState:(id)a4 completion:(id)a5
{
  id v5 = a5;
  objc_super v6 = dispatch_get_global_queue(33, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_5444;
  v8[3] = &unk_8CD28;
  id v9 = v5;
  id v7 = v5;
  TIDispatchAsync(v6, v8);
}

- (void)generateAutofillFormSuggestedUsernameWithRenderTraits:(id)a3 withKeyboardState:(id)a4 completionHandler:(id)a5
{
}

- (void)generateJustHMEAutofillFormSuggestionWithRenderTraits:(id)a3 withKeyboardState:(id)a4 applicationID:(id)a5 applicationBundleID:(id)a6 completionHandler:(id)a7
{
}

- (void)shouldAcceptAutofill:(id)a3 withPayload:(id)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id, void))a5 + 2))(a5, 0);
  }
}

- (void)shouldAcceptOneTimeCode:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (id)generateOneTimeCodeCandidatesWithRenderTraits:(id)a3 withKeyboardState:(id)a4
{
  return &__NSArray0__struct;
}

- (BOOL)hasOneTimeCode
{
  return self->_hasOneTimeCode;
}

- (TIKeyboardSecureCandidateRenderer)secureCandidateRenderer
{
  return self->_secureCandidateRenderer;
}

- (void).cxx_destruct
{
}

@end