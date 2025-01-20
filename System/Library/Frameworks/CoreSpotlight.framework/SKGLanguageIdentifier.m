@interface SKGLanguageIdentifier
+ (id)sharedIdentifier;
- (id)languageFromString:(id)a3 normalizedChunkBlock:(id)a4;
@end

@implementation SKGLanguageIdentifier

+ (id)sharedIdentifier
{
  if (qword_1000F8CF0 != -1) {
    dispatch_once(&qword_1000F8CF0, &stru_1000D9DC0);
  }
  v2 = (void *)qword_1000F8CE8;

  return v2;
}

- (id)languageFromString:(id)a3 normalizedChunkBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  memset(v25, 0, 240);
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  v24 = v25;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  v7 = (char *)[v5 length];
  v8 = v7;
  if ((unint64_t)(v7 - 16) > 0x53)
  {
    if ((unint64_t)v7 >= 0x65)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100034A60;
      v16[3] = &unk_1000D9DE8;
      id v17 = v6;
      v18 = &v21;
      v19 = v20;
      objc_msgSend(v5, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, 1, v16);
    }
  }
  else
  {
    unsigned int v9 = SILanguagesGuessLanguageInString();
    ++*(_DWORD *)(v22[3] + 4 * v9);
  }
  int v10 = 0;
  unsigned int v11 = 1;
  for (uint64_t i = 2; i != 59; ++i)
  {
    if (v25[i] > v10)
    {
      unsigned int v11 = i;
      int v10 = v25[i];
    }
  }
  if (v11 <= 1) {
    Language = 0;
  }
  else {
    Language = (void *)SILanguagesGetLanguage();
  }
  id v14 = Language;
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v21, 8);

  return v14;
}

@end