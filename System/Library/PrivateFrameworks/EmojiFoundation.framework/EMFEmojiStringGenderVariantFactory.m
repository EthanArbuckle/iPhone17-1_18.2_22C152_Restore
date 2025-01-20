@interface EMFEmojiStringGenderVariantFactory
- (EMFEmojiStringGenderVariantFactory)initWithSourceString:(id)a3 gender:(int)a4;
- (NSString)sourceString;
- (id)stringForGenderVariant:(int)a3;
- (int)gender;
- (void)setSourceString:(id)a3;
@end

@implementation EMFEmojiStringGenderVariantFactory

- (EMFEmojiStringGenderVariantFactory)initWithSourceString:(id)a3 gender:(int)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EMFEmojiStringGenderVariantFactory;
  v7 = [(EMFEmojiStringGenderVariantFactory *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    sourceString = v7->_sourceString;
    v7->_sourceString = (NSString *)v8;

    v7->_gender = a4;
  }

  return v7;
}

- (id)stringForGenderVariant:(int)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([(NSString *)self->_sourceString length] >= 0x11)
  {
    v5 = [(EMFEmojiStringGenderVariantFactory *)self sourceString];
    goto LABEL_47;
  }
  memset(v29, 0, sizeof(v29));
  id v6 = [(EMFEmojiStringGenderVariantFactory *)self sourceString];
  CFIndex Length = CFStringGetLength(v6);
  if (Length < 1)
  {

    goto LABEL_25;
  }
  CFIndex v8 = Length;
  int v28 = a3;
  CFIndex v9 = 0;
  uint64_t v10 = 0;
  do
  {
    int CharacterAtIndex = CFStringGetCharacterAtIndex(v6, v9);
    CFIndex v12 = v9 + 1;
    if ((CharacterAtIndex & 0xFC00) == 0xD800 && v12 < v8)
    {
      int v14 = CFStringGetCharacterAtIndex(v6, v9 + 1);
      if ((v14 & 0xFC00) != 0xDC00)
      {
        ++v9;
        continue;
      }
      int CharacterAtIndex = v14 + (CharacterAtIndex << 10) - 56613888;
    }
    else
    {
      CFIndex v12 = v9;
    }
    *((_DWORD *)v29 + v10++) = CharacterAtIndex;
    CFIndex v9 = v12 + 1;
  }
  while (v9 < v8 && v9 != 16);
  if (v9 < v8) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = v10;
  }
  int v16 = v29[0];

  a3 = v28;
  if ((v16 - 128104) < 2 || v16 == 129489)
  {
    if ((v28 - 1) > 2) {
      int v17 = 0;
    }
    else {
      int v17 = dword_1B8CA7708[v28 - 1];
    }
    LODWORD(v29[0]) = v17;
    goto LABEL_43;
  }
LABEL_25:
  int v18 = DWORD1(v29[0]);
  if (DWORD1(v29[0]) == 65039) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = 1;
  }
  if (a3 != 3)
  {
    *((_DWORD *)v29 + v15) = 8205;
    if (a3 == 2) {
      int v19 = 9792;
    }
    else {
      int v19 = 0;
    }
    if (a3 == 1) {
      int v19 = 9794;
    }
    BOOL v20 = v18 == 65039;
    uint64_t v21 = 8;
    if (v20) {
      uint64_t v21 = 12;
    }
    *(_DWORD *)((unint64_t)v29 | v21) = v19;
    uint64_t v22 = 16;
    if (!v20) {
      uint64_t v22 = 12;
    }
    *(_DWORD *)((char *)v29 + v22) = 65039;
    if (v20) {
      uint64_t v15 = 5;
    }
    else {
      uint64_t v15 = 4;
    }
  }
LABEL_43:
  v23 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v29 length:4 * v15];
  v24 = (void *)[[NSString alloc] initWithData:v23 encoding:2617245952];
  v25 = v24;
  if (v24)
  {
    id v26 = v24;
  }
  else
  {
    id v26 = [(EMFEmojiStringGenderVariantFactory *)self sourceString];
  }
  v5 = v26;

LABEL_47:
  return v5;
}

- (NSString)sourceString
{
  return self->_sourceString;
}

- (void)setSourceString:(id)a3
{
}

- (int)gender
{
  return self->_gender;
}

- (void).cxx_destruct
{
}

@end