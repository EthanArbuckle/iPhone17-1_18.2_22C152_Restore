@interface SGMatchedDetailsReader
- (BOOL)matchAtPhraseIndex:(int64_t)a3 columnIndex:(int64_t)a4;
- (SGMatchedDetailsReader)initWithMatchedDetails:(id)a3;
- (int64_t)columnCount;
- (int64_t)phraseCount;
@end

@implementation SGMatchedDetailsReader

- (void).cxx_destruct
{
}

- (int64_t)columnCount
{
  return self->_columnCount;
}

- (int64_t)phraseCount
{
  return self->_phraseCount;
}

- (SGMatchedDetailsReader)initWithMatchedDetails:(id)a3
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SGMatchedDetailsReader;
  v7 = [(SGMatchedDetailsReader *)&v16 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_matchDetails, a3);
    v8->_uint64_t arrayCount = (unint64_t)[v6 length] >> 2;
    v8->_phraseMatches = 0;
    v8->_phraseCount = 0;
    v8->_uint64_t columnCount = 0;
    v9 = (unsigned int *)[v6 bytes];
    uint64_t arrayCount = v8->_arrayCount;
    uint64_t v11 = arrayCount - 2;
    if (arrayCount < 2)
    {
      uint64_t columnCount = v8->_columnCount;
      uint64_t v11 = v8->_arrayCount;
    }
    else
    {
      uint64_t columnCount = v9[1];
      v8->_phraseCount = *v9;
      v8->_uint64_t columnCount = columnCount;
      v8->_uint64_t arrayCount = v11;
      v8->_phraseMatches = v9 + 2;
    }
    if (columnCount >= 32)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, v8, @"SGMatchedDetails.m", 73, @"The code currently assumes the column count will be <32. If you need more columns, adjust this class" object file lineNumber description];

      uint64_t v11 = v8->_arrayCount;
    }
    if (v11 != v8->_phraseCount)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, v8, @"SGMatchedDetails.m", 74, @"Invalid parameter not satisfying: %@", @"_arrayCount == _phraseCount" object file lineNumber description];
    }
  }

  return v8;
}

- (BOOL)matchAtPhraseIndex:(int64_t)a3 columnIndex:(int64_t)a4
{
  if (self->_arrayCount <= a3 || self->_phraseCount <= a3 || self->_columnCount <= a4) {
    LOBYTE(v4) = 0;
  }
  else {
    return (self->_phraseMatches[a3] >> a4) & 1;
  }
  return v4;
}

@end