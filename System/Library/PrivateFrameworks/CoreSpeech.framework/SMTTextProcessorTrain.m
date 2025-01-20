@interface SMTTextProcessorTrain
- (SMTTextProcessorTrain)init;
- (SMTTextProcessorTrain)initWithVocab:(id)a3;
- (id)textSequence;
- (int64_t)numberTokens;
- (unint64_t)numberSamples;
- (void)addText:(id)a3;
- (void)addText:(id)a3 length:(unint64_t)a4;
- (void)addTokenizedText:(id)a3 length:(unint64_t)a4;
- (void)shuffleSamples;
@end

@implementation SMTTextProcessorTrain

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vocab, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (int64_t)numberTokens
{
  return *self->_numValidTokens;
}

- (unint64_t)numberSamples
{
  return (unint64_t)[(NSMutableArray *)self->_text count];
}

- (id)textSequence
{
  return self->_text;
}

- (void)shuffleSamples
{
  if ([(NSMutableArray *)self->_text count])
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    do
    {
      [(NSMutableArray *)self->_text exchangeObjectAtIndex:v4 withObjectAtIndex:arc4random() % ((unint64_t)[(NSMutableArray *)self->_text count] + v3) + v4];
      ++v4;
      --v3;
    }
    while (v4 < (unint64_t)[(NSMutableArray *)self->_text count]);
  }
}

- (void)addTokenizedText:(id)a3 length:(unint64_t)a4
{
  id v29 = a3;
  id v6 = [v29 count];
  if (a4 && v6)
  {
    unint64_t v7 = [(SMTKaldiVocab *)self->_vocab endOfSentenceIndex];
    unint64_t v8 = [(SMTKaldiVocab *)self->_vocab beginOfSentenceIndex];
    text = self->_text;
    v10 = [[SMTTextSequenceTrain alloc] initWithLength:a4];
    [(NSMutableArray *)text addObject:v10];

    vocab = self->_vocab;
    v12 = [v29 objectAtIndexedSubscript:0];
    id v13 = [(SMTKaldiVocab *)vocab indexForWord:v12];

    v14 = [(NSMutableArray *)self->_text objectAtIndexedSubscript:(char *)[(NSMutableArray *)self->_text count] - 1];
    unint64_t v15 = 1;
    [v14 addWordWithInputId:v8 target:v13 mask:1];

    if ([v29 count])
    {
      unint64_t v16 = 1;
      unint64_t v15 = 1;
      do
      {
        v17 = self->_vocab;
        v18 = [v29 objectAtIndexedSubscript:v16 - 1];
        id v19 = [(SMTKaldiVocab *)v17 indexForWord:v18];

        id v20 = (id)v7;
        if ((char *)(v16 - 1) < (char *)[v29 count] - 1)
        {
          v21 = self->_vocab;
          v22 = [v29 objectAtIndexedSubscript:v16];
          id v20 = [(SMTKaldiVocab *)v21 indexForWord:v22];
        }
        v23 = [(NSMutableArray *)self->_text objectAtIndexedSubscript:(char *)[(NSMutableArray *)self->_text count] - 1];
        [v23 addWordWithInputId:v19 target:v20 mask:1];

        ++self->_numValidTokens;
        if (++v15 == a4)
        {
          unint64_t v15 = a4;
          if ((unsigned char *)(v16 - 1) != (char *)[v29 count] - 1)
          {
            v24 = self->_text;
            v25 = [[SMTTextSequenceTrain alloc] initWithLength:a4];
            [(NSMutableArray *)v24 addObject:v25];

            unint64_t v15 = 0;
          }
        }
      }
      while (v16++ < (unint64_t)[v29 count]);
    }
    unint64_t v27 = a4 - v15;
    if (a4 > v15)
    {
      do
      {
        v28 = [(NSMutableArray *)self->_text objectAtIndexedSubscript:(char *)[(NSMutableArray *)self->_text count] - 1];
        [v28 addWordWithInputId:v7 target:v7 mask:0];

        --v27;
      }
      while (v27);
    }
  }
}

- (void)addText:(id)a3 length:(unint64_t)a4
{
  id v24 = a3;
  id v6 = +[NSCharacterSet whitespaceCharacterSet];
  unint64_t v7 = [v24 componentsSeparatedByCharactersInSet:v6];

  unint64_t v8 = [(SMTKaldiVocab *)self->_vocab endOfSentenceIndex];
  unint64_t v9 = [(SMTKaldiVocab *)self->_vocab beginOfSentenceIndex];
  id v10 = [v7 count];
  if (a4 && v10)
  {
    text = self->_text;
    v12 = [[SMTTextSequenceTrain alloc] initWithLength:a4];
    [(NSMutableArray *)text addObject:v12];

    id v13 = [(NSMutableArray *)self->_text objectAtIndexedSubscript:(char *)[(NSMutableArray *)self->_text count] - 1];
    [v13 addWordWithInputId:v9];

    if ([v7 count])
    {
      v14 = 0;
      unint64_t v15 = 1;
      do
      {
        vocab = self->_vocab;
        v17 = [v7 objectAtIndexedSubscript:v14];
        id v18 = [(SMTKaldiVocab *)vocab indexForWord:v17];

        id v19 = [(NSMutableArray *)self->_text objectAtIndexedSubscript:(char *)[(NSMutableArray *)self->_text count] - 1];
        [v19 addWordWithInputId:v18];

        ++self->_numValidTokens;
        if (++v15 == a4)
        {
          unint64_t v15 = a4;
          if (v14 != (char *)[v7 count] - 1)
          {
            id v20 = self->_text;
            v21 = [[SMTTextSequenceTrain alloc] initWithLength:a4];
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
        v23 = [(NSMutableArray *)self->_text objectAtIndexedSubscript:(char *)[(NSMutableArray *)self->_text count] - 1];
        [v23 addWordWithInputId:v8];

        --v22;
      }
      while (v22);
    }
  }
}

- (void)addText:(id)a3
{
  id v4 = a3;
  v5 = +[NSCharacterSet whitespaceCharacterSet];
  id v6 = [v4 componentsSeparatedByCharactersInSet:v5];

  unint64_t v7 = objc_alloc_init(SMTTextSequenceTrain);
  unint64_t v8 = [(SMTKaldiVocab *)self->_vocab endOfSentenceIndex];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[SMTTextSequenceTrain addWordWithInputId:](v7, "addWordWithInputId:", -[SMTKaldiVocab indexForWord:](self->_vocab, "indexForWord:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v13), (void)v14));
        ++self->_numValidTokens;
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }

  [(SMTTextSequenceTrain *)v7 addWordWithInputId:v8];
  [(NSMutableArray *)self->_text addObject:v7];
}

- (SMTTextProcessorTrain)initWithVocab:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SMTTextProcessorTrain;
  id v6 = [(SMTTextProcessorTrain *)&v10 init];
  if (v6)
  {
    unint64_t v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    text = v6->_text;
    v6->_text = v7;

    objc_storeStrong((id *)&v6->_vocab, a3);
    v6->_numValidTokens = 0;
  }

  return v6;
}

- (SMTTextProcessorTrain)init
{
  return 0;
}

@end