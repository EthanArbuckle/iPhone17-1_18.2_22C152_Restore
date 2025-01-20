@interface TextProcessorTrain
- (TextProcessorTrain)init;
- (TextProcessorTrain)initWithVocab:(id)a3;
- (id)textSequence;
- (int64_t)numberTokens;
- (unint64_t)numberSamples;
- (void)addText:(id)a3;
- (void)addText:(id)a3 length:(unint64_t)a4;
- (void)addTokenizedText:(id)a3 length:(unint64_t)a4;
- (void)shuffleSamples;
@end

@implementation TextProcessorTrain

- (TextProcessorTrain)init
{
  return 0;
}

- (TextProcessorTrain)initWithVocab:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TextProcessorTrain;
  v6 = [(TextProcessorTrain *)&v10 init];
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    text = v6->_text;
    v6->_text = v7;

    objc_storeStrong((id *)&v6->_vocab, a3);
    v6->_numValidTokens = 0;
  }

  return v6;
}

- (void)addText:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v6 = [v4 componentsSeparatedByCharactersInSet:v5];

  v7 = objc_alloc_init(TextSequenceTrain);
  unint64_t v8 = [(_EARLMTKaldiVocab *)self->_vocab endOfSentenceIndex];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[TextSequenceTrain addWordWithInputId:](v7, "addWordWithInputId:", -[_EARLMTKaldiVocab indexForWord:](self->_vocab, "indexForWord:", *(void *)(*((void *)&v14 + 1) + 8 * v13), (void)v14));
        ++self->_numValidTokens;
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }

  [(TextSequenceTrain *)v7 addWordWithInputId:v8];
  [(NSMutableArray *)self->_text addObject:v7];
}

- (void)addText:(id)a3 length:(unint64_t)a4
{
  id v24 = a3;
  v6 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v7 = [v24 componentsSeparatedByCharactersInSet:v6];

  unint64_t v8 = [(_EARLMTKaldiVocab *)self->_vocab endOfSentenceIndex];
  unint64_t v9 = [(_EARLMTKaldiVocab *)self->_vocab beginOfSentenceIndex];
  uint64_t v10 = [v7 count];
  if (a4 && v10)
  {
    text = self->_text;
    uint64_t v12 = [[TextSequenceTrain alloc] initWithLength:a4];
    [(NSMutableArray *)text addObject:v12];

    uint64_t v13 = [(NSMutableArray *)self->_text objectAtIndexedSubscript:[(NSMutableArray *)self->_text count] - 1];
    [v13 addWordWithInputId:v9];

    if ([v7 count])
    {
      unint64_t v14 = 0;
      unint64_t v15 = 1;
      do
      {
        vocab = self->_vocab;
        long long v17 = [v7 objectAtIndexedSubscript:v14];
        uint64_t v18 = [(_EARLMTKaldiVocab *)vocab indexForWord:v17];

        uint64_t v19 = [(NSMutableArray *)self->_text objectAtIndexedSubscript:[(NSMutableArray *)self->_text count] - 1];
        [v19 addWordWithInputId:v18];

        ++self->_numValidTokens;
        if (++v15 == a4)
        {
          unint64_t v15 = a4;
          if (v14 != [v7 count] - 1)
          {
            v20 = self->_text;
            v21 = [[TextSequenceTrain alloc] initWithLength:a4];
            [(NSMutableArray *)v20 addObject:v21];

            unint64_t v15 = 0;
          }
        }
        ++v14;
      }
      while (v14 < [v7 count]);
    }
    else
    {
      unint64_t v15 = 1;
    }
    unint64_t v22 = a4 - v15;
    if (a4 > v15)
    {
      do
      {
        v23 = [(NSMutableArray *)self->_text objectAtIndexedSubscript:[(NSMutableArray *)self->_text count] - 1];
        [v23 addWordWithInputId:v8];

        --v22;
      }
      while (v22);
    }
  }
}

- (void)addTokenizedText:(id)a3 length:(unint64_t)a4
{
  id v28 = a3;
  uint64_t v6 = [v28 count];
  if (a4 && v6)
  {
    unint64_t v7 = [(_EARLMTKaldiVocab *)self->_vocab endOfSentenceIndex];
    unint64_t v8 = [(_EARLMTKaldiVocab *)self->_vocab beginOfSentenceIndex];
    text = self->_text;
    uint64_t v10 = [[TextSequenceTrain alloc] initWithLength:a4];
    [(NSMutableArray *)text addObject:v10];

    vocab = self->_vocab;
    uint64_t v12 = [v28 objectAtIndexedSubscript:0];
    uint64_t v13 = [(_EARLMTKaldiVocab *)vocab indexForWord:v12];

    unint64_t v14 = [(NSMutableArray *)self->_text objectAtIndexedSubscript:[(NSMutableArray *)self->_text count] - 1];
    unint64_t v15 = 1;
    [v14 addWordWithInputId:v8 target:v13 mask:1];

    if ([v28 count])
    {
      unint64_t v16 = 0;
      unint64_t v15 = 1;
      do
      {
        long long v17 = self->_vocab;
        uint64_t v18 = [v28 objectAtIndexedSubscript:v16];
        uint64_t v19 = [(_EARLMTKaldiVocab *)v17 indexForWord:v18];

        uint64_t v20 = v7;
        if (v16 < [v28 count] - 1)
        {
          v21 = self->_vocab;
          unint64_t v22 = [v28 objectAtIndexedSubscript:v16 + 1];
          uint64_t v20 = [(_EARLMTKaldiVocab *)v21 indexForWord:v22];
        }
        v23 = [(NSMutableArray *)self->_text objectAtIndexedSubscript:[(NSMutableArray *)self->_text count] - 1];
        [v23 addWordWithInputId:v19 target:v20 mask:1];

        ++self->_numValidTokens;
        if (++v15 == a4)
        {
          unint64_t v15 = a4;
          if (v16 != [v28 count] - 1)
          {
            id v24 = self->_text;
            v25 = [[TextSequenceTrain alloc] initWithLength:a4];
            [(NSMutableArray *)v24 addObject:v25];

            unint64_t v15 = 0;
          }
        }
        ++v16;
      }
      while (v16 < [v28 count]);
    }
    unint64_t v26 = a4 - v15;
    if (a4 > v15)
    {
      do
      {
        v27 = [(NSMutableArray *)self->_text objectAtIndexedSubscript:[(NSMutableArray *)self->_text count] - 1];
        [v27 addWordWithInputId:v7 target:v7 mask:0];

        --v26;
      }
      while (v26);
    }
  }
}

- (void)shuffleSamples
{
  if ([(NSMutableArray *)self->_text count])
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    do
    {
      [(NSMutableArray *)self->_text exchangeObjectAtIndex:v4 withObjectAtIndex:arc4random() % (unint64_t)([(NSMutableArray *)self->_text count] + v3) + v4];
      ++v4;
      --v3;
    }
    while (v4 < [(NSMutableArray *)self->_text count]);
  }
}

- (id)textSequence
{
  return self->_text;
}

- (unint64_t)numberSamples
{
  return [(NSMutableArray *)self->_text count];
}

- (int64_t)numberTokens
{
  return *self->_numValidTokens;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vocab, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end