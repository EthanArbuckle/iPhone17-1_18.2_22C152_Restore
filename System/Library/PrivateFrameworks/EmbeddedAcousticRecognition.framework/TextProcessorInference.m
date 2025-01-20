@interface TextProcessorInference
- (TextProcessorInference)init;
- (TextProcessorInference)initWithLength:(unint64_t)a3 vocab:(id)a4 BOS:(unint64_t)a5;
- (TextProcessorInference)initWithVocab:(id)a3;
- (id)textSequence;
- (void)addText:(id)a3;
- (void)resetWithBOS:(unint64_t)a3;
@end

@implementation TextProcessorInference

- (TextProcessorInference)init
{
  return 0;
}

- (TextProcessorInference)initWithVocab:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TextProcessorInference;
  v6 = [(TextProcessorInference *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_vocab, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    text = v7->_text;
    v7->_text = v8;
  }
  return v7;
}

- (TextProcessorInference)initWithLength:(unint64_t)a3 vocab:(id)a4 BOS:(unint64_t)a5
{
  v7 = [(TextProcessorInference *)self initWithVocab:a4];
  if (v7)
  {
    v8 = [[TextSequenceInference alloc] initWithLength:a3 BOS:a5];
    [(NSMutableArray *)v7->_text addObject:v8];
  }
  return v7;
}

- (void)resetWithBOS:(unint64_t)a3
{
  id v4 = [(NSMutableArray *)self->_text objectAtIndexedSubscript:0];
  [v4 resetWithBOS:a3];
}

- (void)addText:(id)a3
{
  unint64_t v4 = [(_EARLMTKaldiVocab *)self->_vocab indexForWord:a3];
  id v5 = [(NSMutableArray *)self->_text objectAtIndexedSubscript:0];
  [v5 addWordWithInputId:v4];
}

- (id)textSequence
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vocab, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end