@interface IAStringDetails
+ (id)getDetailsForString:(id)a3;
+ (id)sharedPunctuationCharacterSet;
+ (unint64_t)emojiCountForText:(id)a3;
+ (unint64_t)normalizedTextLength:(id)a3;
+ (unint64_t)punctuationCountForText:(id)a3;
- (unint64_t)characters;
- (unint64_t)emojiCharacters;
- (unint64_t)punctuationCharacters;
- (void)setCharacters:(unint64_t)a3;
- (void)setEmojiCharacters:(unint64_t)a3;
- (void)setPunctuationCharacters:(unint64_t)a3;
@end

@implementation IAStringDetails

+ (id)sharedPunctuationCharacterSet
{
  if (qword_26B2300E8 != -1) {
    dispatch_once(&qword_26B2300E8, &unk_2702E38E8);
  }
  v2 = (void *)qword_26B2300F0;
  return v2;
}

+ (unint64_t)emojiCountForText:(id)a3
{
  id v3 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  if (objc_msgSend_length(v3, v4, v5, v6) && objc_msgSend__containsEmoji(v3, v7, v8, v9))
  {
    uint64_t v13 = objc_msgSend_length(v3, v10, v11, v12);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = sub_252A01BE0;
    v17[3] = &unk_265387CB8;
    v17[4] = &v18;
    objc_msgSend__enumerateEmojiTokensInRange_block_(v3, v14, 0, v13, v17);
  }
  unint64_t v15 = v19[3];
  _Block_object_dispose(&v18, 8);

  return v15;
}

+ (unint64_t)normalizedTextLength:(id)a3
{
  id v3 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  if (objc_msgSend_length(v3, v4, v5, v6) && objc_msgSend__containsEmoji(v3, v7, v8, v9))
  {
    uint64_t v10 = objc_msgSend_length(v3, v7, v8, v9);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = sub_252A01D40;
    v18[3] = &unk_265387CE0;
    v18[4] = &v23;
    v18[5] = &v19;
    objc_msgSend__enumerateEmojiTokensInRange_block_(v3, v11, 0, v10, v18);
    uint64_t v15 = objc_msgSend_length(v3, v12, v13, v14);
    unint64_t v16 = v15 - v20[3] + v24[3];
  }
  else
  {
    unint64_t v16 = objc_msgSend_length(v3, v7, v8, v9);
  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v16;
}

+ (unint64_t)punctuationCountForText:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_length(v3, v4, v5, v6))
  {
    uint64_t v10 = objc_msgSend_length(v3, v7, v8, v9);
    uint64_t v13 = objc_msgSend_stringWithString_(MEMORY[0x263F089D8], v11, (uint64_t)v3, v12);
    uint64_t v14 = objc_opt_class();
    uint64_t v18 = objc_msgSend_sharedPunctuationCharacterSet(v14, v15, v16, v17);
    objc_msgSend__removeCharactersFromSet_(v13, v19, v18, v20);
    unint64_t v24 = v10 - objc_msgSend_length(v13, v21, v22, v23);
  }
  else
  {
    unint64_t v24 = 0;
  }

  return v24;
}

+ (id)getDetailsForString:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(IAStringDetails);
  uint64_t v7 = objc_msgSend_normalizedTextLength_(IAStringDetails, v5, (uint64_t)v3, v6);
  objc_msgSend_setCharacters_(v4, v8, v7, v9);
  uint64_t v12 = objc_msgSend_emojiCountForText_(IAStringDetails, v10, (uint64_t)v3, v11);
  objc_msgSend_setEmojiCharacters_(v4, v13, v12, v14);
  uint64_t v17 = objc_msgSend_punctuationCountForText_(IAStringDetails, v15, (uint64_t)v3, v16);

  objc_msgSend_setPunctuationCharacters_(v4, v18, v17, v19);
  return v4;
}

- (unint64_t)characters
{
  return self->_characters;
}

- (void)setCharacters:(unint64_t)a3
{
  self->_characters = a3;
}

- (unint64_t)emojiCharacters
{
  return self->_emojiCharacters;
}

- (void)setEmojiCharacters:(unint64_t)a3
{
  self->_emojiCharacters = a3;
}

- (unint64_t)punctuationCharacters
{
  return self->_punctuationCharacters;
}

- (void)setPunctuationCharacters:(unint64_t)a3
{
  self->_punctuationCharacters = a3;
}

@end