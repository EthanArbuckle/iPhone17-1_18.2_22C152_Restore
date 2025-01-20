@interface _CNAssistedDataDetectorsHandleStringClassificationStrategy
- (_CNAssistedDataDetectorsHandleStringClassificationStrategy)init;
- (_CNAssistedDataDetectorsHandleStringClassificationStrategy)initWithStrategy:(id)a3;
- (unint64_t)classificationOfHandleString:(id)a3;
- (void)makeAssistingStrategyIfNecessary;
@end

@implementation _CNAssistedDataDetectorsHandleStringClassificationStrategy

- (_CNAssistedDataDetectorsHandleStringClassificationStrategy)init
{
  v3 = objc_alloc_init(_CNDataDetectorsHandleStringClassificationStrategy);
  v4 = [(_CNAssistedDataDetectorsHandleStringClassificationStrategy *)self initWithStrategy:v3];

  return v4;
}

- (_CNAssistedDataDetectorsHandleStringClassificationStrategy)initWithStrategy:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CNAssistedDataDetectorsHandleStringClassificationStrategy;
  v6 = [(_CNAssistedDataDetectorsHandleStringClassificationStrategy *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_strategy, a3);
    assistingStrategy = v7->_assistingStrategy;
    v7->_assistingStrategy = 0;

    v9 = v7;
  }

  return v7;
}

- (unint64_t)classificationOfHandleString:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(_CNHandleStringClassificationStrategy *)self->_strategy classificationOfHandleString:v4];
  if (!v5)
  {
    [(_CNAssistedDataDetectorsHandleStringClassificationStrategy *)self makeAssistingStrategyIfNecessary];
    unint64_t v5 = [(_CNHandleStringClassificationStrategy *)self->_assistingStrategy classificationOfHandleString:v4];
  }

  return v5;
}

- (void)makeAssistingStrategyIfNecessary
{
  if (!self->_assistingStrategy)
  {
    v3 = objc_alloc_init(_CNRegExHandleStringClassificationStrategy);
    assistingStrategy = self->_assistingStrategy;
    self->_assistingStrategy = (_CNHandleStringClassificationStrategy *)v3;
    MEMORY[0x1F41817F8](v3, assistingStrategy);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistingStrategy, 0);

  objc_storeStrong((id *)&self->_strategy, 0);
}

@end