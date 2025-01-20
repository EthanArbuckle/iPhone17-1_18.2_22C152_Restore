@interface CHSpellCheckerErrorModel
- (double)replacementErrorScoreForIntendedCharacter:(unsigned __int16)a3 actualCharacter:(unsigned __int16)a4;
- (double)transpositionErrorScoreForIntendedFirstCharacter:(unsigned __int16)a3 intendedSecondCharacter:(unsigned __int16)a4;
@end

@implementation CHSpellCheckerErrorModel

- (double)replacementErrorScoreForIntendedCharacter:(unsigned __int16)a3 actualCharacter:(unsigned __int16)a4
{
  v6 = (const char *)a4;
  unint64_t v8 = sub_1C4A9C420((uint64_t)self, (const char *)a3, a3, a4, v4, v5);
  unint64_t v13 = sub_1C4A9C420((uint64_t)self, v6, v9, v10, v11, v12);
  unint64_t v19 = objc_msgSend_count(&unk_1F203D0D0, v14, v15, v16, v17, v18);
  unint64_t v25 = objc_msgSend_count(&unk_1F203D0D0, v20, v21, v22, v23, v24);
  double v26 = 0.0;
  if (v8 < v19 && v13 < v25) {
    double v26 = (double)qword_1C4C3B680[65 * v8 + v13];
  }
  return v26 / -1000.0;
}

- (double)transpositionErrorScoreForIntendedFirstCharacter:(unsigned __int16)a3 intendedSecondCharacter:(unsigned __int16)a4
{
  return -100.0;
}

@end