@interface CKVocabularySandbox
+ (id)loadWithSandboxId:(id)a3 error:(id *)a4;
+ (id)sandboxWithProfile:(id)a3 locale:(id)a4 error:(id *)a5;
+ (id)sandboxWithRawSpeechProfile:(id)a3 error:(id *)a4;
+ (id)sandboxWithRawSpeechProfile:(id)a3 rawSpeechProfileMetadata:(id)a4 error:(id *)a5;
- (CKVocabularySandbox)init;
- (CKVocabularySandbox)initWithSandbox:(id)a3;
- (SEMSandbox)sandbox;
- (id)sandboxId;
- (id)save;
- (id)searcher;
- (id)searcherForUserId:(id)a3;
- (void)reset;
@end

@implementation CKVocabularySandbox

+ (id)sandboxWithProfile:(id)a3 locale:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [getSEMSandboxClass() sandboxWithKVProfile:v8 locale:v7 error:a5];

  v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSandbox:v9];
  return v10;
}

+ (id)sandboxWithRawSpeechProfile:(id)a3 rawSpeechProfileMetadata:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = [getSEMSandboxClass() sandboxWithRawSpeechProfile:v6 error:a5];

  id v8 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSandbox:v7];
  return v8;
}

+ (id)sandboxWithRawSpeechProfile:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [getSEMSandboxClass() sandboxWithRawSpeechProfile:v5 error:a4];

  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSandbox:v6];
  return v7;
}

- (void).cxx_destruct
{
}

- (SEMSandbox)sandbox
{
  return self->_sandbox;
}

- (id)sandboxId
{
  return (id)[(SEMSandbox *)self->_sandbox sandboxId];
}

- (id)save
{
  return (id)[(SEMSandbox *)self->_sandbox save];
}

- (void)reset
{
}

- (CKVocabularySandbox)initWithSandbox:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKVocabularySandbox;
  id v6 = [(CKVocabularySandbox *)&v10 init];
  id v7 = v6;
  if (v6 && (objc_storeStrong((id *)&v6->_sandbox, a3), !v7->_sandbox)) {
    id v8 = 0;
  }
  else {
    id v8 = v7;
  }

  return v8;
}

- (CKVocabularySandbox)init
{
  id v3 = objc_alloc_init((Class)getSEMSandboxClass_1240());
  v4 = [(CKVocabularySandbox *)self initWithSandbox:v3];

  return v4;
}

+ (id)loadWithSandboxId:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [getSEMSandboxClass_1240() loadWithSandboxId:v5 error:a4];

  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSandbox:v6];
  return v7;
}

- (id)searcherForUserId:(id)a3
{
  id v4 = a3;
  id v5 = [CKVocabularySandboxSearcher alloc];
  id v6 = [(CKVocabularySandbox *)self sandbox];
  id v7 = [(CKVocabularySandboxSearcher *)v5 initWithSandbox:v6 userId:v4 prewarm:1];

  return v7;
}

- (id)searcher
{
  id v3 = [CKVocabularySandboxSearcher alloc];
  id v4 = [(CKVocabularySandbox *)self sandbox];
  id v5 = [(CKVocabularySandboxSearcher *)v3 initWithSandbox:v4 userId:0 prewarm:0];

  return v5;
}

@end