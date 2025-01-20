@interface _MLNLPFrameworkHandle
+ (id)sharedHandle;
- (BOOL)isValid;
- (_MLNLPFrameworkHandle)init;
- (id)predictLabelForWordString:(void *)a3 inputString:(id)a4 error:(id *)a5;
- (id)predictLabelsForSentenceString:(void *)a3 inputString:(id)a4 error:(id *)a5;
- (id)predictTokensLabelsLocationsLengthsForString:(void *)a3 inputString:(id)a4 error:(id *)a5;
- (id)predictVectorForString:(void *)a3 inputString:(id)a4 error:(id *)a5;
- (void)NLPClassifierModelCopyPredictedLabelForTextImpl;
- (void)NLPClassifierModelCreateWithDataImpl;
- (void)NLPClassifierModelGetCurrentRevisionImpl;
- (void)NLPClassifierModelGetRevisionImpl;
- (void)NLPClassifierModelIsRevisionSupportedImpl;
- (void)NLPEmbeddingModelCopyVectorForStringImpl;
- (void)NLPEmbeddingModelCreateWithDataImpl;
- (void)NLPEmbeddingModelGetCurrentRevisionImpl;
- (void)NLPEmbeddingModelGetRevisionImpl;
- (void)NLPEmbeddingModelIsRevisionSupportedImpl;
- (void)NLPGazetteerModelCopyLabelForStringImpl;
- (void)NLPGazetteerModelCreateWithDataImpl;
- (void)NLPGazetteerModelGetCurrentRevisionImpl;
- (void)NLPGazetteerModelGetRevisionImpl;
- (void)NLPGazetteerModelIsRevisionSupportedImpl;
- (void)NLPSequenceModelCopyPredictedTokensAndLabelsForTextImpl;
- (void)NLPSequenceModelCreateWithDataImpl;
- (void)NLPSequenceModelGetCurrentRevisionImpl;
- (void)NLPSequenceModelGetRevisionImpl;
- (void)NLPSequenceModelIsRevisionSupportedImpl;
- (void)initializeEmbeddingModelWithData:(id)a3 error:(id *)a4;
- (void)initializeGazetteerModelWithData:(id)a3 error:(id *)a4;
- (void)initializeSentenceClassifierModelWithData:(id)a3 error:(id *)a4;
- (void)initializeWordTaggingModelWithData:(id)a3 error:(id *)a4;
@end

@implementation _MLNLPFrameworkHandle

- (void)NLPEmbeddingModelGetCurrentRevisionImpl
{
  return self->_NLPEmbeddingModelGetCurrentRevisionImpl;
}

- (void)NLPEmbeddingModelIsRevisionSupportedImpl
{
  return self->_NLPEmbeddingModelIsRevisionSupportedImpl;
}

- (void)NLPEmbeddingModelGetRevisionImpl
{
  return self->_NLPEmbeddingModelGetRevisionImpl;
}

- (void)NLPEmbeddingModelCreateWithDataImpl
{
  return self->_NLPEmbeddingModelCreateWithDataImpl;
}

- (void)NLPEmbeddingModelCopyVectorForStringImpl
{
  return self->_NLPEmbeddingModelCopyVectorForStringImpl;
}

- (void)NLPGazetteerModelGetCurrentRevisionImpl
{
  return self->_NLPGazetteerModelGetCurrentRevisionImpl;
}

- (void)NLPGazetteerModelIsRevisionSupportedImpl
{
  return self->_NLPGazetteerModelIsRevisionSupportedImpl;
}

- (void)NLPGazetteerModelGetRevisionImpl
{
  return self->_NLPGazetteerModelGetRevisionImpl;
}

- (void)NLPGazetteerModelCreateWithDataImpl
{
  return self->_NLPGazetteerModelCreateWithDataImpl;
}

- (void)NLPGazetteerModelCopyLabelForStringImpl
{
  return self->_NLPGazetteerModelCopyLabelForStringImpl;
}

- (void)NLPClassifierModelGetCurrentRevisionImpl
{
  return self->_NLPClassifierModelGetCurrentRevisionImpl;
}

- (void)NLPClassifierModelIsRevisionSupportedImpl
{
  return self->_NLPClassifierModelIsRevisionSupportedImpl;
}

- (void)NLPClassifierModelGetRevisionImpl
{
  return self->_NLPClassifierModelGetRevisionImpl;
}

- (void)NLPClassifierModelCreateWithDataImpl
{
  return self->_NLPClassifierModelCreateWithDataImpl;
}

- (void)NLPClassifierModelCopyPredictedLabelForTextImpl
{
  return self->_NLPClassifierModelCopyPredictedLabelForTextImpl;
}

- (void)NLPSequenceModelGetCurrentRevisionImpl
{
  return self->_NLPSequenceModelGetCurrentRevisionImpl;
}

- (void)NLPSequenceModelIsRevisionSupportedImpl
{
  return self->_NLPSequenceModelIsRevisionSupportedImpl;
}

- (void)NLPSequenceModelGetRevisionImpl
{
  return self->_NLPSequenceModelGetRevisionImpl;
}

- (void)NLPSequenceModelCreateWithDataImpl
{
  return self->_NLPSequenceModelCreateWithDataImpl;
}

- (void)NLPSequenceModelCopyPredictedTokensAndLabelsForTextImpl
{
  return self->_NLPSequenceModelCopyPredictedTokensAndLabelsForTextImpl;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (id)predictVectorForString:(void *)a3 inputString:(id)a4 error:(id *)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = ((uint64_t (*)(void *))self->_NLPEmbeddingModelGetRevisionImpl)(a3);
  if (((unsigned int (*)(void))self->_NLPEmbeddingModelIsRevisionSupportedImpl)())
  {
    v10 = (void *)((uint64_t (*)(void *, id))self->_NLPEmbeddingModelCopyVectorForStringImpl)(a3, v8);
  }
  else
  {
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"Model revision %ld not supported by NaturalLanguage framwork on this OS version (support revision %ld).", v9, ((uint64_t (*)(void))self->_NLPEmbeddingModelGetCurrentRevisionImpl)());
    v12 = (void *)v11;
    if (a5)
    {
      v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F28568];
      v17[0] = v11;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      *a5 = [v13 errorWithDomain:@"com.apple" code:0 userInfo:v14];
    }
    v10 = 0;
  }

  return v10;
}

- (id)predictLabelForWordString:(void *)a3 inputString:(id)a4 error:(id *)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = ((uint64_t (*)(void *))self->_NLPGazetteerModelGetRevisionImpl)(a3);
  if (((unsigned int (*)(void))self->_NLPGazetteerModelIsRevisionSupportedImpl)())
  {
    v10 = (void *)((uint64_t (*)(void *, id))self->_NLPGazetteerModelCopyLabelForStringImpl)(a3, v8);
  }
  else
  {
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"Model revision %ld not supported by NaturalLanguage framwork on this OS version (support revision %ld).", v9, ((uint64_t (*)(void))self->_NLPGazetteerModelGetCurrentRevisionImpl)());
    v12 = (void *)v11;
    if (a5)
    {
      v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F28568];
      v17[0] = v11;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      *a5 = [v13 errorWithDomain:@"com.apple" code:0 userInfo:v14];
    }
    v10 = 0;
  }

  return v10;
}

- (id)predictLabelsForSentenceString:(void *)a3 inputString:(id)a4 error:(id *)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = ((uint64_t (*)(void *))self->_NLPClassifierModelGetRevisionImpl)(a3);
  if (((unsigned int (*)(void))self->_NLPClassifierModelIsRevisionSupportedImpl)())
  {
    v10 = (void *)((uint64_t (*)(void *, id))self->_NLPClassifierModelCopyPredictedLabelForTextImpl)(a3, v8);
  }
  else
  {
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"Model revision %ld not supported by NaturalLanguage framwork on this OS version (support revision %ld).", v9, ((uint64_t (*)(void))self->_NLPClassifierModelGetCurrentRevisionImpl)());
    v12 = (void *)v11;
    if (a5)
    {
      v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F28568];
      v17[0] = v11;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      *a5 = [v13 errorWithDomain:@"com.apple" code:0 userInfo:v14];
    }
    v10 = 0;
  }

  return v10;
}

- (id)predictTokensLabelsLocationsLengthsForString:(void *)a3 inputString:(id)a4 error:(id *)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = ((uint64_t (*)(void *))self->_NLPSequenceModelGetRevisionImpl)(a3);
  if (((unsigned int (*)(void))self->_NLPSequenceModelIsRevisionSupportedImpl)())
  {
    v10 = (void *)((uint64_t (*)(void *, id))self->_NLPSequenceModelCopyPredictedTokensAndLabelsForTextImpl)(a3, v8);
  }
  else
  {
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"Model revision %ld not supported by NaturalLanguage framwork on this OS version (support revision %ld).", v9, ((uint64_t (*)(void))self->_NLPSequenceModelGetCurrentRevisionImpl)());
    v12 = (void *)v11;
    if (a5)
    {
      v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F28568];
      v17[0] = v11;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      *a5 = [v13 errorWithDomain:@"com.apple" code:0 userInfo:v14];
    }
    v10 = 0;
  }

  return v10;
}

- (void)initializeEmbeddingModelWithData:(id)a3 error:(id *)a4
{
  id v7 = 0;
  result = (void *)((uint64_t (*)(id, id *))self->_NLPEmbeddingModelCreateWithDataImpl)(a3, &v7);
  if (v7)
  {
    if (a4)
    {
      id v6 = v7;
      result = 0;
      *a4 = v6;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)initializeGazetteerModelWithData:(id)a3 error:(id *)a4
{
  id v7 = 0;
  result = (void *)((uint64_t (*)(id, id *))self->_NLPGazetteerModelCreateWithDataImpl)(a3, &v7);
  if (v7)
  {
    if (a4)
    {
      id v6 = v7;
      result = 0;
      *a4 = v6;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)initializeSentenceClassifierModelWithData:(id)a3 error:(id *)a4
{
  id v7 = 0;
  result = (void *)((uint64_t (*)(id, id *))self->_NLPClassifierModelCreateWithDataImpl)(a3, &v7);
  if (v7)
  {
    if (a4)
    {
      id v6 = v7;
      result = 0;
      *a4 = v6;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)initializeWordTaggingModelWithData:(id)a3 error:(id *)a4
{
  id v7 = 0;
  result = (void *)((uint64_t (*)(id, id *))self->_NLPSequenceModelCreateWithDataImpl)(a3, &v7);
  if (v7)
  {
    if (a4)
    {
      id v6 = v7;
      result = 0;
      *a4 = v6;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (_MLNLPFrameworkHandle)init
{
  v11.receiver = self;
  v11.super_class = (Class)_MLNLPFrameworkHandle;
  v2 = [(_MLNLPFrameworkHandle *)&v11 init];
  if (v2)
  {
    v3 = dlopen("/System/Library/Frameworks/NaturalLanguage.framework/NaturalLanguage", 4);
    if (v3)
    {
      v4 = v3;
      v2->_NLPSequenceModelCopyPredictedTokensAndLabelsForTextImpl = dlsym(v3, "NLPSequenceModelCopyPredictedTokensAndLabelsForText");
      v2->_NLPSequenceModelCreateWithDataImpl = dlsym(v4, "NLPSequenceModelCreateWithData");
      v2->_NLPSequenceModelGetRevisionImpl = dlsym(v4, "NLPSequenceModelGetRevision");
      v2->_NLPSequenceModelIsRevisionSupportedImpl = dlsym(v4, "NLPSequenceModelIsRevisionSupported");
      v2->_NLPSequenceModelGetCurrentRevisionImpl = dlsym(v4, "NLPSequenceModelGetCurrentRevision");
      v2->_NLPClassifierModelCopyPredictedLabelForTextImpl = dlsym(v4, "NLPClassifierModelCopyPredictedLabelForText");
      v2->_NLPClassifierModelCreateWithDataImpl = dlsym(v4, "NLPClassifierModelCreateWithData");
      v2->_NLPClassifierModelGetRevisionImpl = dlsym(v4, "NLPClassifierModelGetRevision");
      v2->_NLPClassifierModelIsRevisionSupportedImpl = dlsym(v4, "NLPClassifierModelIsRevisionSupported");
      v2->_NLPClassifierModelGetCurrentRevisionImpl = dlsym(v4, "NLPClassifierModelGetCurrentRevision");
      v2->_NLPGazetteerModelCopyLabelForStringImpl = dlsym(v4, "NLPGazetteerModelCopyLabelForString");
      v2->_NLPGazetteerModelCreateWithDataImpl = dlsym(v4, "NLPGazetteerModelCreateWithData");
      v2->_NLPGazetteerModelGetRevisionImpl = dlsym(v4, "NLPGazetteerModelGetRevision");
      v2->_NLPGazetteerModelIsRevisionSupportedImpl = dlsym(v4, "NLPGazetteerModelIsRevisionSupported");
      v2->_NLPGazetteerModelGetCurrentRevisionImpl = dlsym(v4, "NLPGazetteerModelGetCurrentRevision");
      v2->_NLPEmbeddingModelCopyVectorForStringImpl = dlsym(v4, "NLPEmbeddingModelCopyVectorForString");
      v2->_NLPEmbeddingModelCreateWithDataImpl = dlsym(v4, "NLPEmbeddingModelCreateWithData");
      v2->_NLPEmbeddingModelGetRevisionImpl = dlsym(v4, "NLPEmbeddingModelGetRevision");
      v2->_NLPEmbeddingModelIsRevisionSupportedImpl = dlsym(v4, "NLPEmbeddingModelIsRevisionSupported");
      v2->_NLPEmbeddingModelGetCurrentRevisionImpl = dlsym(v4, "NLPEmbeddingModelGetCurrentRevision");
    }
    BOOL v5 = !v2->_NLPSequenceModelCopyPredictedTokensAndLabelsForTextImpl
      || !v2->_NLPSequenceModelCreateWithDataImpl
      || !v2->_NLPSequenceModelGetRevisionImpl
      || !v2->_NLPSequenceModelIsRevisionSupportedImpl
      || v2->_NLPSequenceModelGetCurrentRevisionImpl == 0;
    BOOL v6 = !v2->_NLPClassifierModelCopyPredictedLabelForTextImpl
      || !v2->_NLPClassifierModelCreateWithDataImpl
      || !v2->_NLPClassifierModelGetRevisionImpl
      || !v2->_NLPClassifierModelIsRevisionSupportedImpl
      || v2->_NLPClassifierModelGetCurrentRevisionImpl == 0;
    NLPGazetteerModelCopyLabelForStringImpl = v2->_NLPGazetteerModelCopyLabelForStringImpl;
    if (NLPGazetteerModelCopyLabelForStringImpl)
    {
      NLPGazetteerModelCopyLabelForStringImpl = v2->_NLPGazetteerModelCreateWithDataImpl;
      if (NLPGazetteerModelCopyLabelForStringImpl)
      {
        NLPGazetteerModelCopyLabelForStringImpl = v2->_NLPGazetteerModelGetRevisionImpl;
        if (NLPGazetteerModelCopyLabelForStringImpl)
        {
          NLPGazetteerModelCopyLabelForStringImpl = v2->_NLPGazetteerModelIsRevisionSupportedImpl;
          if (NLPGazetteerModelCopyLabelForStringImpl) {
            LOBYTE(NLPGazetteerModelCopyLabelForStringImpl) = v2->_NLPGazetteerModelGetCurrentRevisionImpl != 0;
          }
        }
      }
    }
    NLPEmbeddingModelCopyVectorForStringImpl = v2->_NLPEmbeddingModelCopyVectorForStringImpl;
    if (NLPEmbeddingModelCopyVectorForStringImpl)
    {
      NLPEmbeddingModelCopyVectorForStringImpl = v2->_NLPEmbeddingModelCreateWithDataImpl;
      if (NLPEmbeddingModelCopyVectorForStringImpl)
      {
        NLPEmbeddingModelCopyVectorForStringImpl = v2->_NLPEmbeddingModelGetRevisionImpl;
        if (NLPEmbeddingModelCopyVectorForStringImpl)
        {
          NLPEmbeddingModelCopyVectorForStringImpl = v2->_NLPEmbeddingModelIsRevisionSupportedImpl;
          if (NLPEmbeddingModelCopyVectorForStringImpl) {
            LOBYTE(NLPEmbeddingModelCopyVectorForStringImpl) = v2->_NLPEmbeddingModelGetCurrentRevisionImpl != 0;
          }
        }
      }
    }
    if (v5 || v6) {
      char v9 = 0;
    }
    else {
      char v9 = NLPGazetteerModelCopyLabelForStringImpl & NLPEmbeddingModelCopyVectorForStringImpl;
    }
    v2->_valid = v9;
  }
  return v2;
}

+ (id)sharedHandle
{
  if (sharedHandle_onceToken_22992 != -1) {
    dispatch_once(&sharedHandle_onceToken_22992, &__block_literal_global_22993);
  }
  v2 = (void *)sharedHandle_singleton_22994;

  return v2;
}

@end