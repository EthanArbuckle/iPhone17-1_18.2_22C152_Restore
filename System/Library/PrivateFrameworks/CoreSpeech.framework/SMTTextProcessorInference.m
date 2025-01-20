@interface SMTTextProcessorInference
- (SMTTextProcessorInference)init;
- (SMTTextProcessorInference)initWithLength:(unint64_t)a3 vocab:(id)a4 BOS:(unint64_t)a5;
- (SMTTextProcessorInference)initWithVocab:(id)a3;
- (id)textSequence;
- (void)addText:(id)a3;
- (void)resetWithBOS:(unint64_t)a3;
@end

@implementation SMTTextProcessorInference

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vocab, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (id)textSequence
{
  return self->_text;
}

- (void)addText:(id)a3
{
  unint64_t v4 = [(SMTKaldiVocab *)self->_vocab indexForWord:a3];
  id v5 = [(NSMutableArray *)self->_text objectAtIndexedSubscript:0];
  [v5 addWordWithInputId:v4];
}

- (void)resetWithBOS:(unint64_t)a3
{
  id v4 = [(NSMutableArray *)self->_text objectAtIndexedSubscript:0];
  [v4 resetWithBOS:a3];
}

- (SMTTextProcessorInference)initWithLength:(unint64_t)a3 vocab:(id)a4 BOS:(unint64_t)a5
{
  v7 = [(SMTTextProcessorInference *)self initWithVocab:a4];
  if (v7)
  {
    v8 = [[SMTTextSequenceInference alloc] initWithLength:a3 BOS:a5];
    [(NSMutableArray *)v7->_text addObject:v8];
  }
  return v7;
}

- (SMTTextProcessorInference)initWithVocab:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SMTTextProcessorInference;
  v6 = [(SMTTextProcessorInference *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_vocab, a3);
    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    text = v7->_text;
    v7->_text = v8;
  }
  return v7;
}

- (SMTTextProcessorInference)init
{
  return 0;
}

@end