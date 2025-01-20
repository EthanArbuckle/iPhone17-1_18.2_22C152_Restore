@interface NLLexiconEntry
+ (id)entryWithString:(id)a3 tokenID:(unsigned int)a4 flags:(unint64_t)a5 probability:(double)a6;
- (NLLexiconEntry)initWithString:(id)a3 tokenID:(unsigned int)a4 flags:(unint64_t)a5 probability:(double)a6;
- (NSString)string;
- (double)probability;
- (id)probabilityInfo;
- (unint64_t)flags;
- (unsigned)tokenID;
@end

@implementation NLLexiconEntry

- (NLLexiconEntry)initWithString:(id)a3 tokenID:(unsigned int)a4 flags:(unint64_t)a5 probability:(double)a6
{
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NLLexiconEntry;
  v11 = [(NLLexiconEntry *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    string = v11->_string;
    v11->_string = (NSString *)v12;

    v11->_tokenID = a4;
    v11->_flags = a5;
    v11->_probability = a6;
  }

  return v11;
}

+ (id)entryWithString:(id)a3 tokenID:(unsigned int)a4 flags:(unint64_t)a5 probability:(double)a6
{
  uint64_t v8 = *(void *)&a4;
  id v9 = a3;
  id v10 = [[NLLexiconEntry alloc] initWithString:v9 tokenID:v8 flags:a5 probability:a6];

  return v10;
}

- (NSString)string
{
  return self->_string;
}

- (unsigned)tokenID
{
  return self->_tokenID;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (double)probability
{
  return self->_probability;
}

- (id)probabilityInfo
{
  v3 = [NLProbabilityInfo alloc];
  [(NLLexiconEntry *)self probability];
  v4 = -[NLProbabilityInfo initWithLog10Probability:flags:](v3, "initWithLog10Probability:flags:", 0);

  return v4;
}

- (void).cxx_destruct
{
}

@end