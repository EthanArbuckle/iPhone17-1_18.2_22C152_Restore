@interface _EARWordPart
- (NSSet)pronunciations;
- (NSString)orthography;
- (NSString)phoneticOrthography;
- (NSString)tagName;
- (_EARWordPart)initWithOrthography:(id)a3 pronunciations:(id)a4 tag:(int64_t)a5;
- (_EARWordPart)initWithOrthography:(id)a3 pronunciations:(id)a4 tagName:(id)a5 frequency:(unint64_t)a6;
- (_EARWordPart)initWithOrthography:(id)a3 pronunciations:(id)a4 tagName:(id)a5 frequency:(unint64_t)a6 phoneticOrthography:(id)a7;
- (int64_t)tag;
- (unint64_t)frequency;
@end

@implementation _EARWordPart

- (_EARWordPart)initWithOrthography:(id)a3 pronunciations:(id)a4 tag:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_EARWordPart;
  v10 = [(_EARWordPart *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    orthography = v10->_orthography;
    v10->_orthography = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    pronunciations = v10->_pronunciations;
    v10->_pronunciations = (NSSet *)v13;

    tagName = v10->_tagName;
    v10->_tagName = 0;

    v10->_tag = a5;
    v10->_frequency = 1;
  }

  return v10;
}

- (_EARWordPart)initWithOrthography:(id)a3 pronunciations:(id)a4 tagName:(id)a5 frequency:(unint64_t)a6
{
  return [(_EARWordPart *)self initWithOrthography:a3 pronunciations:a4 tagName:a5 frequency:a6 phoneticOrthography:0];
}

- (_EARWordPart)initWithOrthography:(id)a3 pronunciations:(id)a4 tagName:(id)a5 frequency:(unint64_t)a6 phoneticOrthography:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)_EARWordPart;
  v16 = [(_EARWordPart *)&v26 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    orthography = v16->_orthography;
    v16->_orthography = (NSString *)v17;

    if (v13)
    {
      uint64_t v19 = [v13 copy];
    }
    else
    {
      uint64_t v19 = [MEMORY[0x1E4F1CAD0] set];
    }
    pronunciations = v16->_pronunciations;
    v16->_pronunciations = (NSSet *)v19;

    v16->_tag = 0;
    uint64_t v21 = [v14 copy];
    tagName = v16->_tagName;
    v16->_tagName = (NSString *)v21;

    v16->_frequency = a6;
    uint64_t v23 = [v15 copy];
    phoneticOrthography = v16->_phoneticOrthography;
    v16->_phoneticOrthography = (NSString *)v23;
  }
  return v16;
}

- (NSString)tagName
{
  tagName = self->_tagName;
  if (tagName)
  {
    v3 = tagName;
  }
  else
  {
    unint64_t v4 = self->_tag - 1;
    if (v4 > 6) {
      v5 = "";
    }
    else {
      v5 = off_1E5FFE258[v4];
    }
    v3 = [NSString stringWithUTF8String:v5];
  }
  return v3;
}

- (NSString)orthography
{
  return self->_orthography;
}

- (int64_t)tag
{
  return self->_tag;
}

- (unint64_t)frequency
{
  return self->_frequency;
}

- (NSSet)pronunciations
{
  return self->_pronunciations;
}

- (NSString)phoneticOrthography
{
  return self->_phoneticOrthography;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneticOrthography, 0);
  objc_storeStrong((id *)&self->_pronunciations, 0);
  objc_storeStrong((id *)&self->_orthography, 0);
  objc_storeStrong((id *)&self->_tagName, 0);
}

@end