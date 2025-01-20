@interface Wordlist
- (NSMutableDictionary)words;
- (Wordlist)initWithPathToStopwords:(id)a3 pathToAuxiliary:(id)a4;
- (void)setWords:(id)a3;
@end

@implementation Wordlist

- (Wordlist)initWithPathToStopwords:(id)a3 pathToAuxiliary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)Wordlist;
  v8 = [(Wordlist *)&v13 init];
  if (v8
    && (uint64_t v9 = objc_opt_new(),
        words = v8->_words,
        v8->_words = (NSMutableDictionary *)v9,
        words,
        sub_1002B68A0((uint64_t)v8, v7, &off_1004B1E08),
        sub_1002B68A0((uint64_t)v8, v6, &off_1004B1E20),
        ![(NSMutableDictionary *)v8->_words count]))
  {
    v11 = 0;
  }
  else
  {
    v11 = v8;
  }

  return v11;
}

- (NSMutableDictionary)words
{
  return self->_words;
}

- (void)setWords:(id)a3
{
}

- (void).cxx_destruct
{
}

@end