uint64_t sub_264C(uint64_t a1)
{
  if (*(char *)(a1 + 39) < 0) {
    operator delete(*(void **)(a1 + 16));
  }
  return a1;
}

atomic_uint **TI::CP::ContinuousPathTestCase::ContinuousPathTestCase(atomic_uint **a1, atomic_uint **a2, uint64_t a3, const KB::String *a4, uint64_t a5, const KB::String *a6)
{
  v11 = *a2;
  *a1 = *a2;
  if (v11) {
    atomic_fetch_add(v11, 1u);
  }
  sub_51FC(a1 + 1, a3);
  sub_5318(a1 + 4, a3 + 24);
  KB::String::String((KB::String *)(a1 + 7), a4);
  sub_53F8((uint64_t)(a1 + 11), a5);
  KB::String::String((KB::String *)(a1 + 24), a6);
  return a1;
}

TI::CP::ContinuousPathTestResult *TI::CP::ContinuousPathTestResult::ContinuousPathTestResult(TI::CP::ContinuousPathTestResult *this, int a2, const KB::String *a3, const KB::CandidateCollection *a4, int a5, char a6)
{
  *(_DWORD *)this = a2;
  KB::String::String((TI::CP::ContinuousPathTestResult *)((char *)this + 8), a3);
  sub_56D8((void *)this + 5, (uint64_t *)a4);
  *((_DWORD *)this + 36) = a5;
  *((void *)this + 24) = 0;
  *((void *)this + 23) = 0;
  *((void *)this + 22) = (char *)this + 184;
  *(int64x2_t *)((char *)this + 200) = vdupq_n_s64(0xFFF0000000000000);
  *((unsigned char *)this + 216) = a6;
  *(_DWORD *)((char *)this + 217) = 0;
  return this;
}

{
  *(_DWORD *)this = a2;
  KB::String::String((TI::CP::ContinuousPathTestResult *)((char *)this + 8), a3);
  sub_56D8((void *)this + 5, (uint64_t *)a4);
  *((_DWORD *)this + 36) = a5;
  *((void *)this + 24) = 0;
  *((void *)this + 23) = 0;
  *((void *)this + 22) = (char *)this + 184;
  *(int64x2_t *)((char *)this + 200) = vdupq_n_s64(0xFFF0000000000000);
  *((unsigned char *)this + 216) = a6;
  *(_DWORD *)((char *)this + 217) = 0;
  return this;
}

void TI::CP::TestCaseConverter::create_testcase_converter(TI::CP::TestCaseConverter *this, NSString *a2)
{
  v2 = this;
  KB::String::String((KB::String *)v11);
  KB::String::String((KB::String *)&v12);
  KB::String::String((KB::String *)&v13);
  KB::String::String((KB::String *)&v14);
  KB::String::String((KB::String *)v15);
  UIKeyboardStaticUnigramsFile();
  v3 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string((uint64_t *)__p, v3, v4);
  KB::String::operator=();
  KB::String::~String((KB::String *)__p);

  v5 = +[TIInputMode inputModeWithIdentifier:v2];
  UIKeyboardDeltaLexiconPathForInputMode();
  v6 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string((uint64_t *)__p, v6, v7);
  KB::String::operator=();
  KB::String::~String((KB::String *)__p);

  v8 = v2;
  [(TI::CP::TestCaseConverter *)v8 UTF8String];
  v15[8] = TILexiconIDForLocaleIdentifier();
  v15[10] = 1065353216;
  __createAndLoadLanguageModel(&v9, (NSString *)v8, 0, 0);
  operator new();
}

char *TI::CP::TestCaseConverter::TestCaseConverter(char *__dst, long long *a2, void *a3, int a4)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_6010(__dst, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v8 = *a2;
    *((void *)__dst + 2) = *((void *)a2 + 2);
    *(_OWORD *)__dst = v8;
  }
  *((void *)__dst + 3) = *a3;
  uint64_t v9 = a3[1];
  *((void *)__dst + 4) = v9;
  if (v9) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
  }
  *(_OWORD *)(__dst + 40) = 0u;
  v10 = (unsigned int **)(__dst + 40);
  *((void *)__dst + 9) = 0;
  *(_OWORD *)(__dst + 56) = 0u;
  *((_DWORD *)__dst + 20) = 1065353216;
  if (a4)
  {
    if (*((char *)a2 + 23) >= 0) {
      v11 = a2;
    }
    else {
      v11 = *(void **)a2;
    }
    uint64_t v12 = +[NSString stringWithUTF8String:v11];
    __createAndLoadDictionaryContainer((uint64_t *)&v18, v12, 0);
    uint64_t v13 = (uint64_t)v18;
    v18 = 0;
    uint64_t v14 = *v10;
    *v10 = (unsigned int *)v13;
    if (v14)
    {
      sub_78C8(v14);
      v15 = v18;
      if (v18) {
LABEL_12:
      }
        sub_78C8(v15);
    }
  }
  else
  {
    if (*((char *)a2 + 23) >= 0) {
      v17 = a2;
    }
    else {
      v17 = *(void **)a2;
    }
    uint64_t v12 = +[NSString stringWithUTF8String:v17];
    TI::CP::createAndLoadStaticDictionaryContainer((TI::CP *)v12, &v18);
    v15 = *v10;
    *v10 = v18;
    if (v15) {
      goto LABEL_12;
    }
  }

  return __dst;
}

void TI::CP::createAndLoadStaticDictionaryContainer(TI::CP *this@<X0>, void *a2@<X8>)
{
  v4 = this;
  KB::String::String((KB::String *)v20);
  KB::String::String((KB::String *)v21);
  KB::String::String((KB::String *)v22);
  KB::String::String((KB::String *)v23);
  KB::String::String((KB::String *)v24);
  UIKeyboardStaticUnigramsFile();
  v5 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v14, v5, v6);
  KB::String::operator=();
  KB::String::~String((KB::String *)v14);

  v7 = v4;
  [(TI::CP *)v7 UTF8String];

  LODWORD(v25) = TILexiconIDForLocaleIdentifier();
  KB::String::String((KB::String *)v14, (const KB::String *)v20);
  KB::String::String((KB::String *)v15, (const KB::String *)v21);
  KB::String::String((KB::String *)v16, (const KB::String *)v22);
  KB::String::String((KB::String *)v17, (const KB::String *)v23);
  KB::String::String((KB::String *)v18, (const KB::String *)v24);
  v18[4] = v25;
  int v19 = v26;
  long long v8 = (char *)operator new(0xB0uLL);
  uint64_t v9 = v8 + 176;
  v11[0] = v8;
  v11[2] = v8 + 176;
  sub_6E78((uint64_t)v8, (uint64_t)v14);
  v11[1] = v9;
  KB::DictionaryContainer::create_multilexicon();
  uint64_t v10 = v12;
  uint64_t v12 = 0;
  uint64_t v13 = (void **)v11;
  *a2 = v10;
  sub_6EE4(&v13);
  KB::String::~String((KB::String *)v18);
  KB::String::~String((KB::String *)v17);
  KB::String::~String((KB::String *)v16);
  KB::String::~String((KB::String *)v15);
  KB::String::~String((KB::String *)v14);
  KB::String::~String((KB::String *)v24);
  KB::String::~String((KB::String *)v23);
  KB::String::~String((KB::String *)v22);
  KB::String::~String((KB::String *)v21);
  KB::String::~String((KB::String *)v20);
}

void *TI::CP::TestCaseConverter::TestCaseConverter(void *__dst, long long *a2, void *a3, atomic_uint **a4)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_6010(__dst, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v7 = *a2;
    __dst[2] = *((void *)a2 + 2);
    *(_OWORD *)__dst = v7;
  }
  uint64_t v8 = a3[1];
  __dst[3] = *a3;
  __dst[4] = v8;
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v9 = *a4;
  __dst[5] = *a4;
  if (v9) {
    atomic_fetch_add(v9, 1u);
  }
  *((_OWORD *)__dst + 3) = 0u;
  *((_OWORD *)__dst + 4) = 0u;
  *((_DWORD *)__dst + 20) = 1065353216;
  return __dst;
}

id TI::CP::TestCaseConverter::set_layouts(uint64_t a1, void *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_2E64;
  v3[3] = &unk_10520;
  v3[4] = a1;
  return [a2 enumerateObjectsUsingBlock:v3];
}

unsigned int *sub_2E64(uint64_t a1, void *a2, unsigned int a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(unsigned int **)(v4 + 40);
  v11 = v5;
  if (v5) {
    atomic_fetch_add((atomic_uint *volatile)v5, 1u);
  }
  id v6 = a2;
  TI::CP::create_layout(v6, &v11);
  KB::String::String((KB::String *)v14, a3);
  uint64_t v13 = v14;
  long long v7 = sub_791C(v4 + 48, v14, &std::piecewise_construct);
  uint64_t v8 = (unsigned int *)v7[6];
  uint64_t v9 = v12;
  uint64_t v12 = 0;
  v7[6] = v9;

  if (v8) {
    sub_753C(v8);
  }
  KB::String::~String((KB::String *)v14);
  if (v12) {
    sub_753C(v12);
  }
  result = v11;
  if (v11) {
    return sub_78C8(v11);
  }
  return result;
}

void *TI::CP::create_layout(void *a1, unsigned int **a2)
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x4812000000;
  v6[3] = sub_44E8;
  v6[4] = sub_4510;
  v6[5] = "";
  memset(v7, 0, sizeof(v7));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3321888768;
  v4[2] = sub_4518;
  v4[3] = &unk_10570;
  v2 = *a2;
  v5 = v2;
  if (v2) {
    atomic_fetch_add((atomic_uint *volatile)v2, 1u);
  }
  v4[4] = v6;
  [a1 enumerateKeysUsingBlock:v4];
  TI::Favonius::KeyboardLayout::create();
  if (v5) {
    sub_78C8(v5);
  }
  _Block_object_dispose(v6, 8);
  return sub_868C(v7);
}

void TI::CP::TestCaseConverter::compute_linguistic_context_and_stem(TI::CP::TestCaseConverter *this@<X0>, NSString *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x4012000000;
  v29 = sub_60AC;
  v30 = (void (*)(uint64_t))nullsub_1;
  v31 = "";
  long long v32 = xmmword_ECA0;
  v5 = a2;
  id v6 = [(NSString *)v5 length];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = (void **)3221225472;
  v39[2] = (void **)sub_60BC;
  v39[3] = (void **)&unk_105A8;
  v39[4] = (void **)&v26;
  -[NSString enumerateSubstringsInRange:options:usingBlock:](v5, "enumerateSubstringsInRange:options:usingBlock:", 0, v6, 771, v39);

  uint64_t v7 = v27[6];
  uint64_t v8 = v27[7];
  _Block_object_dispose(&v26, 8);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL || v8 + v7 != [(NSString *)v5 length])
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v9 = -[NSString substringWithRange:](v5, "substringWithRange:", v7, v8);
    uint64_t v10 = [v9 lowercaseString];
    unsigned __int8 v11 = [&off_10BB0 containsObject:v10];

    if (v11)
    {
      uint64_t v12 = 0;
    }
    else
    {
      uint64_t v12 = v9;
      uint64_t v13 = [(NSString *)v5 substringToIndex:v7];

      v5 = (NSString *)v13;
    }
  }
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x9812000000;
  v29 = sub_350C;
  v30 = sub_3518;
  v31 = "";
  long long v32 = 0u;
  long long __p = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v36);
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v37);
  memset(v38, 0, sizeof(v38));
  if (*((void *)this + 3))
  {
    uint64_t v23 = a3;
    v15 = v5;
    v16 = [(NSString *)v15 UTF8String];
    v17 = this;
    if (*((char *)this + 23) < 0) {
      v17 = *(TI::CP::TestCaseConverter **)this;
    }
    v18 = +[NSString stringWithUTF8String:v17];
    int v19 = +[NSLocale localeWithLocaleIdentifier:v18];

    TILexiconIDForLocaleIdentifier();
    if ([(NSString *)v15 length])
    {
      LMStreamTokenizerCreate();
      strlen(v16);
      id v24 = v19;
      uint64_t v25 = v15;
      LMStreamTokenizerPushBytes();
      LMStreamTokenizerRelease();
    }
    else
    {
      KB::String::String((KB::String *)v39, (const char *)&unk_EE1E);
      KB::LanguageModelContext::append();
      KB::String::~String((KB::String *)v39);
    }
    uint64_t v22 = (uint64_t)(v27 + 6);
    KB::utf8_string((uint64_t *)v39, v12, v20);
    sub_53F8(v23, v22);
    KB::String::String();
    KB::String::~String((KB::String *)v39);
  }
  else
  {
    uint64_t v21 = (uint64_t)(v27 + 6);
    KB::utf8_string((uint64_t *)v39, v12, v14);
    sub_53F8(a3, v21);
    KB::String::String();
    KB::String::~String((KB::String *)v39);
  }
  _Block_object_dispose(&v26, 8);
  v39[0] = (void **)v38;
  sub_6170(v39);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v37);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v36);
  if ((void)__p)
  {
    *((void *)&__p + 1) = __p;
    operator delete((void *)__p);
  }
  if (*((void *)&v32 + 1)) {
    sub_6214(*((std::__shared_weak_count **)&v32 + 1));
  }
}

uint64_t sub_350C(uint64_t a1, uint64_t a2)
{
  return sub_60D4(a1 + 48, a2 + 48);
}

void sub_3518(uint64_t a1)
{
  uint64_t v4 = (void **)(a1 + 128);
  sub_6170(&v4);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)(a1 + 120));
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)(a1 + 112));
  v2 = *(void **)(a1 + 64);
  if (v2)
  {
    *(void *)(a1 + 72) = v2;
    operator delete(v2);
  }
  v3 = *(std::__shared_weak_count **)(a1 + 56);
  if (v3) {
    sub_6214(v3);
  }
}

void sub_357C(uint64_t a1, NSString *a2, uint64_t a3, int a4)
{
  if (a4)
  {
    LODWORD(v5) = a4;
  }
  else
  {
    id v6 = [objc_alloc((Class)NSString) initWithBytes:a2 length:a3 encoding:4];
    KB::String::String((KB::String *)v7);
    unint64_t v5 = (unint64_t)KB::LanguageModel::find_token_id_for_word() >> 32;
    KB::String::~String((KB::String *)v7);
  }
  if (v5 != 2)
  {
    KB::utf8_string(v7, *(KB **)(a1 + 40), a2);
    KB::LanguageModelContext::append();
    KB::String::~String((KB::String *)v7);
  }
}

void TI::CP::TestCaseConverter::convert(TI::CP::TestCaseConverter *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v5 = a2;
  id v6 = [v5 originalWord];
  KB::String::String((KB::String *)v59, [v6 layoutID]);

  uint64_t v8 = (atomic_uint *)sub_7C24((void *)a1 + 6, v59, v7)[6];
  if (v8) {
    atomic_fetch_add(v8, 1u);
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v9 = [v5 alignedTouches];
  id v10 = [v9 countByEnumeratingWithState:&v41 objects:v58 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v42;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        [v14 location];
        CGFloat v16 = v15;
        CGFloat v18 = v17;
        [v14 timestamp];
        double v20 = v19;
        v60.x = v16;
        v60.y = v18;
        TI::CP::Path::append((TI::CP::Path *)&v45, v60, v20, 0.0, -1.0, 0.0);
      }
      id v11 = [v9 countByEnumeratingWithState:&v41 objects:v58 count:16];
    }
    while (v11);
  }

  uint64_t v21 = [v5 expectedString];
  KB::utf8_string(v57, v21, v22);

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  *(_OWORD *)long long v35 = 0u;
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v38);
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v39);
  memset(v40, 0, 24);
  KB::String::String((KB::String *)v56);
  uint64_t v23 = [v5 originalWord];
  id v24 = [v23 inputStem];

  if (v24)
  {
    uint64_t v25 = [v5 originalWord];
    uint64_t v26 = [v25 inputStem];
    TI::CP::TestCaseConverter::compute_linguistic_context_and_stem(a1, v26, (uint64_t)&v49);
    sub_6288((uint64_t)&v34, &v49);
    KB::String::operator=();
    KB::String::~String((KB::String *)&v55);
    v48 = (void **)&v54;
    sub_6170(&v48);
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v53);
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v52);
    if (__p)
    {
      v51 = __p;
      operator delete(__p);
    }
    if (*((void *)&v49 + 1)) {
      sub_6214(*((std::__shared_weak_count **)&v49 + 1));
    }
  }
  v33 = v8;
  if (v8)
  {
    atomic_fetch_add(v8, 1u);
    v27 = (unsigned int *)v33;
    TI::CP::ContinuousPathTestCase::ContinuousPathTestCase((atomic_uint **)a3, &v33, (uint64_t)&v45, (const KB::String *)v57, (uint64_t)&v34, (const KB::String *)v56);
    if (v27) {
      sub_753C(v27);
    }
  }
  else
  {
    TI::CP::ContinuousPathTestCase::ContinuousPathTestCase((atomic_uint **)a3, &v33, (uint64_t)&v45, (const KB::String *)v57, (uint64_t)&v34, (const KB::String *)v56);
  }
  uint64_t v28 = [v5 alignedTouches];
  id v29 = [v28 count];

  if (v29)
  {
    v30 = [v5 alignedTouches];
    v31 = [v30 objectAtIndexedSubscript:0];
    [v31 timestamp];
    *(void *)(a3 + 224) = v32;
  }
  KB::String::~String((KB::String *)v56);
  *(void *)&long long v49 = v40;
  sub_6170((void ***)&v49);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v39);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v38);
  if (v35[0])
  {
    v35[1] = v35[0];
    operator delete(v35[0]);
  }
  if (*((void *)&v34 + 1)) {
    sub_6214(*((std::__shared_weak_count **)&v34 + 1));
  }
  KB::String::~String((KB::String *)v57);
  if (*((void *)&v46 + 1))
  {
    *(void *)&long long v47 = *((void *)&v46 + 1);
    operator delete(*((void **)&v46 + 1));
  }
  if ((void)v45)
  {
    *((void *)&v45 + 1) = v45;
    operator delete((void *)v45);
  }
  if (v8) {
    sub_753C((unsigned int *)v8);
  }
  KB::String::~String((KB::String *)v59);
}

double TI::CP::TestResultsSummarizer::TestResultsSummarizer(TI::CP::TestResultsSummarizer *this, char a2, char a3, char a4)
{
  double result = 0.0;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((void *)this + 14) = 0;
  *((void *)this + 15) = 0;
  *((void *)this + 13) = 0;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *((void *)this + 23) = 0;
  *((_DWORD *)this + 48) = 1065353216;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 232) = 0u;
  *(_OWORD *)((char *)this + 248) = 0u;
  *((void *)this + 33) = 0;
  *((void *)this + 35) = 0xC010000000000000;
  *((void *)this + 36) = 0x4008000000000000;
  *((void *)this + 37) = 0;
  *((_DWORD *)this + 76) = 0;
  *((unsigned char *)this + 96) = a2;
  *((unsigned char *)this + 128) = a3;
  *((unsigned char *)this + 97) = a4;
  return result;
}

{
  double result;

  double result = 0.0;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((void *)this + 14) = 0;
  *((void *)this + 15) = 0;
  *((void *)this + 13) = 0;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *((void *)this + 23) = 0;
  *((_DWORD *)this + 48) = 1065353216;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 232) = 0u;
  *(_OWORD *)((char *)this + 248) = 0u;
  *((void *)this + 33) = 0;
  *((void *)this + 35) = 0xC010000000000000;
  *((void *)this + 36) = 0x4008000000000000;
  *((void *)this + 37) = 0;
  *((_DWORD *)this + 76) = 0;
  *((unsigned char *)this + 96) = a2;
  *((unsigned char *)this + 128) = a3;
  *((unsigned char *)this + 97) = a4;
  return result;
}

void TI::CP::TestResultsSummarizer::add_result(TI::CP::TestResultsSummarizer *this, const TI::CP::ContinuousPathTestResult *a2)
{
  ++*((_DWORD *)this + 23);
  int v4 = *((_DWORD *)a2 + 36);
  if (v4 == -1)
  {
    ++*((_DWORD *)this + 21);
  }
  else if (v4)
  {
    if (v4 > 3)
    {
      if (v4 > 0x27) {
        ++*((_DWORD *)this + 22);
      }
      else {
        ++*((_DWORD *)this + 20);
      }
    }
    else
    {
      ++*((_DWORD *)this + 19);
    }
  }
  else
  {
    ++*((_DWORD *)this + 18);
  }
  double v5 = *((double *)a2 + 19);
  *((double *)this + 15) = v5 + *((double *)this + 15);
  if ((*((void *)a2 + 20) & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL) {
    *((double *)this + 13) = v5 - *((double *)a2 + 20) + *((double *)this + 13);
  }
  if ((*((void *)a2 + 21) & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL) {
    *((double *)this + 14) = v5 - *((double *)a2 + 21) + *((double *)this + 14);
  }
  if (*((unsigned char *)this + 128) && *((_DWORD *)a2 + 36)) {
    sub_3E60((uint64_t *)this + 17, (uint64_t)a2);
  }
  if (*((unsigned char *)a2 + 217)) {
    ++*((_DWORD *)this + 76);
  }
  if (*((unsigned char *)a2 + 219)) {
    ++*((_DWORD *)this + 75);
  }
  if (*((unsigned char *)a2 + 218)) {
    ++*((_DWORD *)this + 74);
  }
  if (v4 == -1) {
    double v6 = *((double *)this + 35);
  }
  else {
    double v6 = *((double *)this + 35) * ((double)v4 / (*((double *)this + 36) + (double)v4));
  }
  *((double *)this + 34) = v6 + *((double *)this + 34);
  int v7 = *((_DWORD *)a2 + 36);
  uint64_t v9 = (char *)*((void *)this + 32);
  unint64_t v8 = *((void *)this + 33);
  if ((unint64_t)v9 >= v8)
  {
    id v11 = (char *)*((void *)this + 31);
    uint64_t v12 = (v9 - v11) >> 2;
    unint64_t v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 62) {
      abort();
    }
    uint64_t v14 = v8 - (void)v11;
    if (v14 >> 1 > v13) {
      unint64_t v13 = v14 >> 1;
    }
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v15 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v15 = v13;
    }
    if (v15)
    {
      CGFloat v16 = (char *)sub_53C0((uint64_t)this + 264, v15);
      id v11 = (char *)*((void *)this + 31);
      uint64_t v9 = (char *)*((void *)this + 32);
    }
    else
    {
      CGFloat v16 = 0;
    }
    double v17 = &v16[4 * v12];
    CGFloat v18 = &v16[4 * v15];
    *(_DWORD *)double v17 = v7;
    id v10 = v17 + 4;
    while (v9 != v11)
    {
      int v19 = *((_DWORD *)v9 - 1);
      v9 -= 4;
      *((_DWORD *)v17 - 1) = v19;
      v17 -= 4;
    }
    *((void *)this + 31) = v17;
    *((void *)this + 32) = v10;
    *((void *)this + 33) = v18;
    if (v11) {
      operator delete(v11);
    }
  }
  else
  {
    *(_DWORD *)uint64_t v9 = v7;
    id v10 = v9 + 4;
  }
  *((void *)this + 32) = v10;
  if (*((unsigned char *)this + 97))
  {
    unsigned int v20 = *((_DWORD *)a2 + 36);
    if (v20 <= 3)
    {
      id v21 = *(id *)(*((void *)a2 + 5) + 1000 * v20 + 984);
      uint64_t v22 = [v21 allKeys];
      if ([v22 count] == (char *)&dword_0 + 1)
      {
        if (!*((_DWORD *)a2 + 36))
        {
          sub_3E60((uint64_t *)this + 25, (uint64_t)a2);
          id v23 = [v22 firstObject];
          sub_5F60(__p, (char *)[v23 UTF8String]);
          v27 = __p;
          id v24 = sub_7D3C((uint64_t)this + 160, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v27);
          sub_3E60((uint64_t *)v24 + 5, (uint64_t)a2);
          if (v26 < 0) {
            operator delete(__p[0]);
          }
        }
        sub_3E60((uint64_t *)this + 28, (uint64_t)a2);
      }
    }
  }
}

uint64_t sub_3E60(uint64_t *a1, uint64_t a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    uint64_t v10 = 0x34F72C234F72C235 * ((uint64_t)(v7 - *a1) >> 3);
    if ((unint64_t)(v10 + 1) > 0x11A7B9611A7B961) {
      abort();
    }
    unint64_t v11 = 0x34F72C234F72C235 * ((uint64_t)(v5 - *a1) >> 3);
    uint64_t v12 = 2 * v11;
    if (2 * v11 <= v10 + 1) {
      uint64_t v12 = v10 + 1;
    }
    if (v11 >= 0x8D3DCB08D3DCB0) {
      unint64_t v13 = 0x11A7B9611A7B961;
    }
    else {
      unint64_t v13 = v12;
    }
    uint64_t v19 = v4;
    if (v13) {
      uint64_t v14 = (char *)sub_6B64(v4, v13);
    }
    else {
      uint64_t v14 = 0;
    }
    unint64_t v15 = v14;
    CGFloat v16 = &v14[232 * v10];
    CGFloat v18 = &v14[232 * v13];
    sub_63AC((uint64_t)v16, a2);
    double v17 = v16 + 232;
    sub_6AD0(a1, &v15);
    uint64_t v9 = a1[1];
    uint64_t result = sub_6CCC((uint64_t)&v15);
  }
  else
  {
    uint64_t result = sub_63AC(*(void *)(v4 - 8), a2);
    uint64_t v9 = v7 + 232;
  }
  a1[1] = v9;
  return result;
}

uint64_t TI::CP::TestResultsSummarizer::summarize_results(uint64_t a1, const char *a2, const char *a3)
{
  v3 = a3;
  uint64_t v4 = a2;
  unsigned int v6 = *(_DWORD *)(a1 + 72);
  unsigned int v7 = *(_DWORD *)(a1 + 92);
  double v8 = (double)v7;
  unsigned int v9 = *(_DWORD *)(a1 + 76) + v6;
  unsigned int v10 = *(_DWORD *)(a1 + 80) + v9;
  *(_DWORD *)(a1 + 76) = v9;
  *(_DWORD *)(a1 + 80) = v10;
  unint64_t v11 = a3;
  if (a3[23] < 0) {
    unint64_t v11 = *(const char **)a3;
  }
  double v12 = (double)v9;
  unint64_t v13 = a2;
  if (a2[23] < 0) {
    unint64_t v13 = *(const char **)a2;
  }
  double v14 = v12 * 100.0;
  printf("%s %s top candidate hit rate: %f%%, %g%% (%d/%d)\n", v11, v13, (double)v6 * 100.0 / v8, 100.0 - (double)v6 * 100.0 / v8, v6, v7);
  unint64_t v15 = v3;
  if (v3[23] < 0) {
    unint64_t v15 = *(const char **)v3;
  }
  CGFloat v16 = v4;
  if (v4[23] < 0) {
    CGFloat v16 = *(const char **)v4;
  }
  printf("%s %s top-4 candidate hit rate: %f%%, %g%% (%d/%d)\n", v15, v16, v14 / v8, 100.0 - v14 / v8, *(_DWORD *)(a1 + 76), *(_DWORD *)(a1 + 92));
  double v17 = v3;
  if (v3[23] < 0) {
    double v17 = *(const char **)v3;
  }
  CGFloat v18 = v4;
  if (v4[23] < 0) {
    CGFloat v18 = *(const char **)v4;
  }
  printf("%s %s top-40 candidate hit rate: %f%%, %g%% (%d/%d)\n", v17, v18, (double)v10 * 100.0 / v8, 100.0 - (double)v10 * 100.0 / v8, *(_DWORD *)(a1 + 80), *(_DWORD *)(a1 + 92));
  if (*(unsigned char *)(a1 + 96))
  {
    printf("top1 path saved: %g/%g (%g%% of total)\n", *(double *)(a1 + 104), *(double *)(a1 + 120), *(double *)(a1 + 104) * 100.0 / *(double *)(a1 + 120));
    printf("top3 path saved: %g/%g (%g%% of total)\n", *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 112) * 100.0 / *(double *)(a1 + 120));
  }
  if (*(unsigned char *)(a1 + 128))
  {
    puts("Failing cases:");
    uint64_t v20 = *(void *)(a1 + 136);
    for (uint64_t i = *(void *)(a1 + 144); v20 != i; v20 += 232)
    {
      uint64_t v22 = *(KB::Candidate **)(v20 + 40);
      if (v22 == *(KB::Candidate **)(v20 + 48)) {
        KB::String::String((KB::String *)&v35, "(null)");
      }
      else {
        KB::Candidate::capitalized_string(&v35, v22);
      }
      if (*(_WORD *)(v20 + 8))
      {
        id v23 = *(const char **)(v20 + 16);
        if (!v23) {
          id v23 = (const char *)(v20 + 24);
        }
      }
      else
      {
        id v23 = (const char *)&unk_EE1E;
      }
      id v24 = v36;
      if (!v36) {
        id v24 = (const char *)&v37;
      }
      if ((_WORD)v35) {
        uint64_t v25 = v24;
      }
      else {
        uint64_t v25 = (const char *)&unk_EE1E;
      }
      printf("[%d] expected='%s' observed='%s'\n", *(_DWORD *)v20, v23, v25);
      KB::String::~String((KB::String *)&v35);
    }
    putchar(10);
  }
  unsigned int v26 = *(_DWORD *)(a1 + 304);
  LODWORD(v19) = *(_DWORD *)(a1 + 92);
  double v27 = (double)v19;
  unsigned int v28 = *(_DWORD *)(a1 + 296);
  if (v3[23] < 0) {
    v3 = *(const char **)v3;
  }
  double v29 = (double)v26 * 100.0 / v27;
  double v30 = (double)v28 * 100.0 / v27;
  double v31 = (double)*(unsigned int *)(a1 + 300) * 100.0 / v27;
  if (v4[23] < 0) {
    uint64_t v4 = *(const char **)v4;
  }
  uint64_t result = printf("%s %s Confidence hit rate: %f%% (%d), false-low-conf: %f%% (%d), false-high-conf: %f%% (%d))\n", v3, v4, v29, v26, v30, v28, v31, *(_DWORD *)(a1 + 300));
  if (*(unsigned char *)(a1 + 97))
  {
    for (j = *(uint64_t **)(a1 + 176); j; j = (uint64_t *)*j)
    {
      long long v34 = (const char *)(j + 2);
      if (*((char *)j + 39) < 0) {
        long long v34 = *(const char **)v34;
      }
      printf("algo: %s, helped: %lu\n", v34, 0x34F72C234F72C235 * ((j[6] - j[5]) >> 3));
    }
    printf("base recognizer index matches top1: %lu\n", 0x34F72C234F72C235 * ((uint64_t)(*(void *)(a1 + 56) - *(void *)(a1 + 48)) >> 3));
    printf("base recognizer index is higher than top1: %lu\n", 0x34F72C234F72C235 * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3));
    return printf("top1 not in base recognizer: %lu\n", 0x34F72C234F72C235 * ((uint64_t)(*(void *)(a1 + 32) - *(void *)(a1 + 24)) >> 3));
  }
  return result;
}

uint64_t TI::CP::TestResultsSummarizer::dump_match_indices(TI::CP::TestResultsSummarizer *this)
{
  v1 = (unsigned int *)*((void *)this + 31);
  v2 = (unsigned int *)*((void *)this + 32);
  while (v1 != v2)
  {
    unsigned int v4 = *v1++;
    unsigned int v3 = v4;
    int v5 = v4 + 48;
    if (v4 >= 0xA) {
      int v5 = 62;
    }
    if (v3 == -1) {
      int v6 = 109;
    }
    else {
      int v6 = v5;
    }
    putchar(v6);
  }

  return putchar(10);
}

double TI::CP::TestResultsSummarizer::calculate_total_rank_score(TI::CP::TestResultsSummarizer *this, double a2, double a3)
{
  LODWORD(a3) = *((_DWORD *)this + 23);
  return *((double *)this + 34) / (double)*(unint64_t *)&a3;
}

uint64_t TI::CP::get_touch_stage()
{
  if (TI::CP::operator==()) {
    return 0;
  }
  if (TI::CP::operator==()) {
    return 2;
  }
  return 1;
}

unsigned int *TI::CP::make_candidate_refinery(atomic_uint **a1, uint64_t a2)
{
  int v5 = *a1;
  if (*a1) {
    atomic_fetch_add(v5, 1u);
  }
  v2 = *(std::__shared_weak_count **)(a2 + 8);
  unsigned int v4 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  KB::NgramCandidateRefinery::create();
  if (v4) {
    sub_6214(v4);
  }
  uint64_t result = (unsigned int *)v5;
  if (v5) {
    return sub_78C8((unsigned int *)v5);
  }
  return result;
}

void *sub_44E8(void *result, void *a2)
{
  result[6] = 0;
  result[7] = 0;
  result[8] = 0;
  uint64_t v2 = a2[7];
  result[6] = a2[6];
  result[7] = v2;
  a2[6] = 0;
  a2[7] = 0;
  uint64_t v3 = result[8];
  result[8] = a2[8];
  a2[8] = v3;
  return result;
}

void *sub_4510(uint64_t a1)
{
  return sub_868C((void *)(a1 + 48));
}

void sub_4518(uint64_t a1, const char *a2)
{
  KB::String::String((KB::String *)v11, a2);
  KB::CollatorWrapper::sortkey_for_string(v10, (KB::CollatorWrapper *)(*(void *)(*(void *)(a1 + 40) + 8) + 72), (const KB::String *)v11);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  TI::Favonius::LayoutKey::create();
  int v5 = v3 + 6;
  unint64_t v4 = v3[6];
  if (v4 != v3[8])
  {
    uint64_t v8 = v3[7];
    goto LABEL_10;
  }
  unint64_t v6 = v4 + (v4 >> 1);
  if (v4 < 0x100) {
    unint64_t v6 = 2 * v4;
  }
  if (v6 <= v4 + 1) {
    unint64_t v7 = v4 + 1;
  }
  else {
    unint64_t v7 = v6;
  }
  sub_86F0(v3 + 6, v7);
  uint64_t v8 = v3[7];
  if (v8)
  {
    unint64_t v4 = *v5;
LABEL_10:
    *(void *)(v8 + 8 * v4) = v9;
    unint64_t *v5 = v4 + 1;
    goto LABEL_11;
  }
  if (v9) {
    sub_7714(v9);
  }
LABEL_11:
  if (LOWORD(v10[0]) >= 0xFu && v10[1]) {
    operator delete[]();
  }
  KB::String::~String((KB::String *)v11);
}

uint64_t sub_4678(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(atomic_uint **)(a2 + 40);
  *(void *)(result + 40) = v2;
  if (v2) {
    atomic_fetch_add(v2, 1u);
  }
  return result;
}

unsigned int *sub_4690(uint64_t a1)
{
  uint64_t result = *(unsigned int **)(a1 + 40);
  if (result) {
    return sub_78C8(result);
  }
  return result;
}

void TI::CP::createAndLoadDictionaryContainerMultiLexicon(TI::CP *this@<X0>, NSString *a2@<X1>, NSString *a3@<X2>, float a4@<S0>, void ***a5@<X8>)
{
  uint64_t v9 = this;
  unsigned int v10 = a2;
  double v17 = a3;
  if (v17)
  {
    UIKeyboardDynamicDictionaryFile();
    unint64_t v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    UIKeyboardDynamicDictionaryFile();
    double v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v12 = 0;
    unint64_t v11 = 0;
  }
  TI::CP::getLexiconInfo(v9, v11, 1.0 - a4, (uint64_t)v37);
  TI::CP::getLexiconInfo((TI::CP *)v10, v12, a4, (uint64_t)v31);
  KB::String::String((KB::String *)v19, (const KB::String *)v37);
  KB::String::String((KB::String *)&v20, (const KB::String *)v38);
  KB::String::String((KB::String *)&v21, (const KB::String *)v39);
  KB::String::String((KB::String *)&v22, (const KB::String *)v40);
  KB::String::String((KB::String *)v23, (const KB::String *)v41);
  v23[4] = v41[4];
  int v24 = v42;
  KB::String::String((KB::String *)&v25, (const KB::String *)v31);
  KB::String::String((KB::String *)&v26, (const KB::String *)v32);
  KB::String::String((KB::String *)&v27, (const KB::String *)v33);
  KB::String::String((KB::String *)&v28, (const KB::String *)v34);
  KB::String::String((KB::String *)v29, (const KB::String *)v35);
  v29[4] = v35[4];
  int v30 = v36;
  unint64_t v13 = (char *)operator new(0x160uLL);
  uint64_t v14 = 0;
  v18[0] = v13;
  v18[2] = v13 + 352;
  do
  {
    sub_6E78((uint64_t)&v13[v14 * 8], (uint64_t)&v19[v14]);
    v14 += 22;
  }
  while (v14 != 44);
  v18[1] = v13 + 352;
  uint64_t v15 = 44;
  do
  {
    KB::String::~String((KB::String *)&v19[v15 - 6]);
    KB::String::~String((KB::String *)&v19[v15 - 10]);
    KB::String::~String((KB::String *)&v19[v15 - 14]);
    KB::String::~String((KB::String *)&v19[v15 - 18]);
    KB::String::~String((KB::String *)&v19[v15 - 22]);
    v15 -= 22;
  }
  while (v15 * 8);
  KB::DictionaryContainer::create_multilexicon();
  *a5 = v19[0];
  v19[0] = (void **)v18;
  sub_6EE4(v19);
  KB::String::~String((KB::String *)v35);
  KB::String::~String((KB::String *)v34);
  KB::String::~String((KB::String *)v33);
  KB::String::~String((KB::String *)v32);
  KB::String::~String((KB::String *)v31);
  KB::String::~String((KB::String *)v41);
  KB::String::~String((KB::String *)v40);
  KB::String::~String((KB::String *)v39);
  KB::String::~String((KB::String *)v38);
  KB::String::~String((KB::String *)v37);
}

void TI::CP::getLexiconInfo(TI::CP *this@<X0>, NSString *a2@<X1>, float a3@<S0>, uint64_t a4@<X8>)
{
  uint64_t v8 = a2;
  uint64_t v9 = this;
  unigramsFilePathForInputMode();
  unint64_t v19 = (KB *)objc_claimAutoreleasedReturnValue();
  deltaUnigramsFilePathForInputMode();
  unsigned int v10 = (KB *)objc_claimAutoreleasedReturnValue();
  phrasesFilePathForInputMode();
  unint64_t v11 = (KB *)objc_claimAutoreleasedReturnValue();
  dynamicFilePathForInputMode();
  double v12 = (KB *)objc_claimAutoreleasedReturnValue();

  unint64_t v13 = v9;
  [(TI::CP *)v13 UTF8String];
  LODWORD(v9) = TILexiconIDForLocaleIdentifier();
  KB::utf8_string(v13, v14);

  KB::utf8_string(v19, v15);
  KB::utf8_string(v10, v16);
  KB::utf8_string(v11, v17);
  KB::utf8_string(v12, v18);
  *(_DWORD *)(a4 + 160) = v9;
  *(unsigned char *)(a4 + 164) = 0;
  *(float *)(a4 + 168) = a3;
}

void TI::CP::createAndLoadLanguageModelContainer(TI::CP *this, NSString *a2, NSString *a3, float a4, NSString *a5)
{
  unint64_t v7 = this;
  uint64_t v8 = a2;
  TI::CP::createAndLoadLanguageModel(v7, a3, (NSString *)((char *)&dword_0 + 1));
}

void TI::CP::createAndLoadLanguageModel(TI::CP *this, NSString *a2, NSString *a3)
{
  unint64_t v4 = a2;
  int v5 = this;
  uint64_t v6 = +[NSLocale localeWithLocaleIdentifier:v5];
  unint64_t v7 = +[TIInputMode inputModeWithIdentifier:v5];
  uint64_t v8 = v6;
  +[NSArray arrayWithObjects:&v8 count:1];
  objc_claimAutoreleasedReturnValue();
  [v7 doesSupportInlineCompletion];
  KB::LanguageModelConfig::LanguageModelConfig();
  operator new();
}

void sub_4FBC()
{
}

void TI::CP::createAndLoadDictionaryContainer(TI::CP *this@<X0>, NSString *a2@<X1>, void *a3@<X8>)
{
  int v5 = this;
  if (a2)
  {
    UIKeyboardDynamicDictionaryFile();
    uint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v6 = 0;
  }
  unint64_t v11 = v6;
  TI::CP::getLexiconInfo(v5, v6, 1.0, (uint64_t)v21);
  KB::String::String((KB::String *)v15, (const KB::String *)v21);
  KB::String::String((KB::String *)v16, (const KB::String *)v22);
  KB::String::String((KB::String *)v17, (const KB::String *)v23);
  KB::String::String((KB::String *)v18, (const KB::String *)v24);
  KB::String::String((KB::String *)v19, (const KB::String *)v25);
  v19[4] = v25[4];
  int v20 = v26;
  unint64_t v7 = (char *)operator new(0xB0uLL);
  uint64_t v8 = v7 + 176;
  v12[0] = v7;
  v12[2] = v7 + 176;
  sub_6E78((uint64_t)v7, (uint64_t)v15);
  v12[1] = v8;
  KB::DictionaryContainer::create_multilexicon();
  uint64_t v9 = v13;
  uint64_t v13 = 0;
  uint64_t v14 = (void **)v12;
  *a3 = v9;
  sub_6EE4(&v14);
  KB::String::~String((KB::String *)v19);
  KB::String::~String((KB::String *)v18);
  KB::String::~String((KB::String *)v17);
  KB::String::~String((KB::String *)v16);
  KB::String::~String((KB::String *)v15);
  KB::String::~String((KB::String *)v25);
  KB::String::~String((KB::String *)v24);
  KB::String::~String((KB::String *)v23);
  KB::String::~String((KB::String *)v22);
  KB::String::~String((KB::String *)v21);
}

void *sub_51FC(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  unint64_t v4 = *(const void **)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  int64_t v5 = v3 - *(void *)a2;
  if (v3 != *(void *)a2)
  {
    sub_5270(a1, 0xAAAAAAAAAAAAAAABLL * (v5 >> 4));
    uint64_t v6 = (char *)a1[1];
    memmove(v6, v4, v5);
    a1[1] = &v6[v5];
  }
  return a1;
}

char *sub_5270(void *a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    abort();
  }
  uint64_t result = (char *)sub_52C0((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[48 * v4];
  return result;
}

void *sub_52C0(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    sub_5308();
  }
  return operator new(48 * a2);
}

void sub_5308()
{
}

void *sub_5318(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  uint64_t v4 = *(const void **)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  int64_t v5 = v3 - *(void *)a2;
  if (v3 != *(void *)a2)
  {
    sub_5380(a1, v5 >> 2);
    uint64_t v6 = (char *)a1[1];
    memmove(v6, v4, v5);
    a1[1] = &v6[v5];
  }
  return a1;
}

char *sub_5380(void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    abort();
  }
  uint64_t result = (char *)sub_53C0((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *sub_53C0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_5308();
  }
  return operator new(4 * a2);
}

uint64_t sub_53F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  sub_5494((void *)(a1 + 16), a2 + 16);
  long long v5 = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = v5;
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)(a1 + 64), (const language_modeling::v1::LinguisticContext *)(a2 + 64));
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)(a1 + 72), (const language_modeling::v1::LinguisticContext *)(a2 + 72));
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 80) = 0;
  sub_5574((char *)(a1 + 80), *(long long **)(a2 + 80), *(long long **)(a2 + 88), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 88) - *(void *)(a2 + 80)) >> 3));
  return a1;
}

void *sub_5494(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  uint64_t v4 = *(const void **)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  int64_t v5 = v3 - *(void *)a2;
  if (v3 != *(void *)a2)
  {
    sub_54FC(a1, v5 >> 3);
    uint64_t v6 = (char *)a1[1];
    memmove(v6, v4, v5);
    a1[1] = &v6[v5];
  }
  return a1;
}

char *sub_54FC(void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    abort();
  }
  uint64_t result = (char *)sub_553C((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *sub_553C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_5308();
  }
  return operator new(8 * a2);
}

char *sub_5574(char *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    sub_55CC(result, a4);
    uint64_t result = sub_5664((int)v6 + 16, a2, a3, *((char **)v6 + 1));
    *((void *)v6 + 1) = result;
  }
  return result;
}

char *sub_55CC(void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    abort();
  }
  uint64_t result = (char *)sub_561C((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *sub_561C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_5308();
  }
  return operator new(24 * a2);
}

char *sub_5664(int a1, long long *a2, long long *a3, char *__dst)
{
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        sub_6010(__dst, *(void **)v6, *((void *)v6 + 1));
      }
      else
      {
        long long v7 = *v6;
        *((void *)__dst + 2) = *((void *)v6 + 2);
        *(_OWORD *)__dst = v7;
      }
      uint64_t v6 = (long long *)((char *)v6 + 24);
      __dst += 24;
    }
    while (v6 != a3);
  }
  return __dst;
}

void *sub_56D8(void *a1, uint64_t *a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  sub_57A0(a1, *a2, a2[1], 0x1CAC083126E978D5 * ((a2[1] - *a2) >> 3));
  a1[3] = 0;
  a1[4] = 0;
  a1[5] = 0;
  sub_57A0(a1 + 3, a2[3], a2[4], 0x1CAC083126E978D5 * ((a2[4] - a2[3]) >> 3));
  a1[6] = 0;
  a1[7] = 0;
  a1[8] = 0;
  sub_57A0(a1 + 6, a2[6], a2[7], 0x1CAC083126E978D5 * ((a2[7] - a2[6]) >> 3));
  a1[9] = 0;
  a1[10] = 0;
  a1[11] = 0;
  sub_57A0(a1 + 9, a2[9], a2[10], 0x1CAC083126E978D5 * ((a2[10] - a2[9]) >> 3));
  a1[12] = a2[12];
  return a1;
}

void *sub_57A0(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    sub_5804(result, a4);
    uint64_t result = (void *)v6[1];
    while (a2 != a3)
    {
      uint64_t v7 = sub_58A4((uint64_t)result, a2);
      a2 += 1000;
      uint64_t result = (void *)(v7 + 1000);
    }
    v6[1] = result;
  }
  return result;
}

char *sub_5804(void *a1, unint64_t a2)
{
  if (a2 >= 0x4189374BC6A7F0) {
    abort();
  }
  uint64_t result = (char *)sub_5858((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[1000 * v4];
  return result;
}

void *sub_5858(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x4189374BC6A7F0) {
    sub_5308();
  }
  return operator new(1000 * a2);
}

uint64_t sub_58A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5984((void *)a1, (void *)a2);
  long long v5 = *(_OWORD *)(a2 + 744);
  long long v6 = *(_OWORD *)(a2 + 760);
  v4[97] = *(void *)(a2 + 776);
  *(_OWORD *)(v4 + 93) = v5;
  *(_OWORD *)(v4 + 95) = v6;
  sub_53F8((uint64_t)(v4 + 98), a2 + 784);
  KB::String::String((KB::String *)(a1 + 888), (const KB::String *)(a2 + 888));
  uint64_t v7 = (unsigned char *)(a1 + 920);
  if (*(char *)(a2 + 943) < 0)
  {
    sub_6010(v7, *(void **)(a2 + 920), *(void *)(a2 + 928));
  }
  else
  {
    long long v8 = *(_OWORD *)(a2 + 920);
    *(void *)(a1 + 936) = *(void *)(a2 + 936);
    *(_OWORD *)uint64_t v7 = v8;
  }
  KB::ByteString::copy();
  *(_OWORD *)(a1 + 960) = *(_OWORD *)(a2 + 960);
  uint64_t v9 = *(const void **)(a2 + 976);
  *(void *)(a1 + 976) = v9;
  if (v9)
  {
    CFRetain(v9);
    *(void *)(a1 + 976) = v9;
  }
  unsigned int v10 = *(const void **)(a2 + 984);
  *(void *)(a1 + 984) = v10;
  if (v10)
  {
    CFRetain(v10);
    *(void *)(a1 + 984) = v10;
  }
  *(_DWORD *)(a1 + 992) = *(_DWORD *)(a2 + 992);
  return a1;
}

void *sub_5984(void *a1, void *a2)
{
  unint64_t v4 = a2[2];
  long long v5 = a1 + 3;
  *a1 = *a2;
  a1[1] = v5;
  a1[2] = 3;
  if (v4 < 4 || (a1[2] = v4, long long v5 = malloc_type_malloc(240 * v4, 0x10B2040DF775671uLL), (a1[1] = v5) != 0))
  {
    uint64_t v6 = *a2;
    if (*a2)
    {
      uint64_t v7 = a2[1];
      uint64_t v8 = 240 * v6;
      do
      {
        long long v5 = (void *)(sub_5A28((uint64_t)v5, v7) + 240);
        v7 += 240;
        v8 -= 240;
      }
      while (v8);
    }
  }
  return a1;
}

uint64_t sub_5A28(uint64_t a1, uint64_t a2)
{
  KB::String::String((KB::String *)a1, (const KB::String *)a2);
  KB::ByteString::copy();
  uint64_t v4 = *(void *)(a2 + 48);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(void *)(a1 + 48) = v4;
  KB::String::String((KB::String *)(a1 + 64), (const KB::String *)(a2 + 64));
  long long v5 = *(_OWORD *)(a2 + 96);
  long long v6 = *(_OWORD *)(a2 + 112);
  long long v7 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v7;
  *(_OWORD *)(a1 + 96) = v5;
  *(_OWORD *)(a1 + 112) = v6;
  KB::String::String((KB::String *)(a1 + 160), (const KB::String *)(a2 + 160));
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  sub_5AAC(a1 + 200, a2 + 200);
  return a1;
}

uint64_t sub_5AAC(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  sub_5B0C(a1, *(void *)(a2 + 8));
  for (uint64_t i = *(void **)(a2 + 16); i; uint64_t i = (void *)*i)
    sub_5D58(a1, i + 2, i + 2);
  return a1;
}

void sub_5B0C(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      sub_5BFC(a1, prime);
    }
  }
}

void sub_5BFC(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_5308();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      unint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            void *v7 = *v11;
            void *v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            unint64_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          unint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    unsigned int v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void *sub_5D58(uint64_t a1, unint64_t *a2, void *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    uint8x8_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      for (uint64_t i = *v9; i; uint64_t i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6) {
            return i;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v3) {
            break;
          }
        }
      }
    }
  }
  uint64_t i = operator new(0x18uLL);
  void *i = 0;
  i[1] = v6;
  i[2] = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    sub_5B0C(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v18 = *(void *)a1;
  unint64_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    void *i = *v19;
LABEL_38:
    *unint64_t v19 = i;
    goto LABEL_39;
  }
  void *i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*i)
  {
    unint64_t v20 = *(void *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }
    else
    {
      v20 &= v7 - 1;
    }
    unint64_t v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void *sub_5F60(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    unint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    unint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void *sub_6010(unsigned char *__dst, void *__src, unint64_t a3)
{
  size_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      abort();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    void *v5 = v8;
    size_t v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

__n128 sub_60AC(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  return result;
}

uint64_t sub_60BC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v7 = *(void *)(*(void *)(result + 32) + 8);
  *(void *)(v7 + 48) = a3;
  *(void *)(v7 + 56) = a4;
  *a7 = 1;
  return result;
}

uint64_t sub_60D4(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0;
  long long v4 = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = v4;
  language_modeling::v1::LinguisticContext::LinguisticContext();
  language_modeling::v1::LinguisticContext::LinguisticContext();
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = 0;
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a2 + 80) = 0;
  *(void *)(a2 + 88) = 0;
  *(void *)(a2 + 96) = 0;
  return a1;
}

void sub_6170(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_61C4((uint64_t *)v2);
    unint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_61C4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  a1[1] = v2;
}

void sub_6214(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

uint64_t sub_6288(uint64_t a1, long long *a2)
{
  long long v4 = *a2;
  *(void *)a2 = 0;
  *((void *)a2 + 1) = 0;
  size_t v5 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v4;
  if (v5) {
    sub_6214(v5);
  }
  sub_631C(a1 + 16, (__n128 *)a2 + 1);
  long long v6 = *(long long *)((char *)a2 + 40);
  *(void *)(a1 + 56) = *((void *)a2 + 7);
  *(_OWORD *)(a1 + 40) = v6;
  language_modeling::v1::LinguisticContext::operator=();
  language_modeling::v1::LinguisticContext::operator=();
  sub_6370((uint64_t *)(a1 + 80));
  *(_OWORD *)(a1 + 80) = a2[5];
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *((void *)a2 + 10) = 0;
  *((void *)a2 + 11) = 0;
  *((void *)a2 + 12) = 0;
  return a1;
}

__n128 sub_631C(uint64_t a1, __n128 *a2)
{
  long long v4 = *(void **)a1;
  if (v4)
  {
    *(void *)(a1 + 8) = v4;
    operator delete(v4);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
  }
  __n128 result = *a2;
  *(__n128 *)a1 = *a2;
  *(void *)(a1 + 16) = a2[1].n128_u64[0];
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  a2[1].n128_u64[0] = 0;
  return result;
}

void sub_6370(uint64_t *a1)
{
  if (*a1)
  {
    sub_61C4(a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

uint64_t sub_63AC(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  KB::String::String((KB::String *)(a1 + 8), (const KB::String *)(a2 + 8));
  sub_56D8((void *)(a1 + 40), (uint64_t *)(a2 + 40));
  long long v4 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 160) = v4;
  *(void *)(a1 + 184) = 0;
  *(void *)(a1 + 192) = 0;
  *(void *)(a1 + 176) = a1 + 184;
  sub_6424((uint64_t *)(a1 + 176), *(void **)(a2 + 176), (void *)(a2 + 184));
  long long v5 = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 212) = *(_OWORD *)(a2 + 212);
  *(_OWORD *)(a1 + 200) = v5;
  return a1;
}

uint64_t *sub_6424(uint64_t *result, void *a2, void *a3)
{
  if (a2 != a3)
  {
    long long v4 = a2;
    long long v5 = (uint64_t **)result;
    long long v6 = result + 1;
    do
    {
      __n128 result = sub_64B0(v5, v6, (uint64_t)(v4 + 4), (const KB::String *)(v4 + 4));
      uint64_t v7 = (void *)v4[1];
      if (v7)
      {
        do
        {
          uint64_t v8 = v7;
          uint64_t v7 = (void *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          uint64_t v8 = (void *)v4[2];
          BOOL v9 = *v8 == (void)v4;
          long long v4 = v8;
        }
        while (!v9);
      }
      long long v4 = v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *sub_64B0(uint64_t **a1, void *a2, uint64_t a3, const KB::String *a4)
{
  long long v6 = (uint64_t **)sub_6564(a1, a2, &v13, &v12, a3);
  uint64_t v7 = *v6;
  if (!*v6)
  {
    uint64_t v8 = v6;
    uint64_t v7 = (uint64_t *)operator new(0x70uLL);
    v10[1] = (uint64_t)(a1 + 1);
    sub_6848((KB::String *)(v7 + 4), a4);
    char v11 = 1;
    sub_6744(a1, v13, v8, v7);
    v10[0] = 0;
    sub_6A24(v10, 0);
  }
  return v7;
}

void *sub_6564(void *a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  BOOL v9 = a1 + 1;
  if (a1 + 1 == a2
    || (*(void *)(a5 + 8) ? (char v11 = *(const char **)(a5 + 8)) : (char v11 = (const char *)(a5 + 16)),
        a2[5] ? (uint64_t v12 = (const char *)a2[5]) : (uint64_t v12 = (const char *)(a2 + 6)),
        strcmp(v11, v12) < 0))
  {
    uint64_t v13 = *a2;
    if ((void *)*a1 == a2)
    {
      unint64_t v15 = a2;
LABEL_29:
      if (v13)
      {
        *a3 = v15;
        return v15 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v13)
    {
      BOOL v14 = (void *)*a2;
      do
      {
        unint64_t v15 = v14;
        BOOL v14 = (void *)v14[1];
      }
      while (v14);
    }
    else
    {
      uint64_t v18 = a2;
      do
      {
        unint64_t v15 = (void *)v18[2];
        BOOL v19 = *v15 == (void)v18;
        uint64_t v18 = v15;
      }
      while (v19);
    }
    if (v15[5]) {
      unint64_t v20 = (const char *)v15[5];
    }
    else {
      unint64_t v20 = (const char *)(v15 + 6);
    }
    if (*(void *)(a5 + 8)) {
      uint64_t v21 = *(const char **)(a5 + 8);
    }
    else {
      uint64_t v21 = (const char *)(a5 + 16);
    }
    if (strcmp(v20, v21) < 0) {
      goto LABEL_29;
    }
  }
  else
  {
    if ((strcmp(v12, v11) & 0x80000000) == 0)
    {
      *a3 = a2;
      *a4 = a2;
      return a4;
    }
    uint64_t v16 = a2[1];
    if (v16)
    {
      size_t v17 = (void *)a2[1];
      do
      {
        a4 = v17;
        size_t v17 = (void *)*v17;
      }
      while (v17);
    }
    else
    {
      uint64_t v22 = a2;
      do
      {
        a4 = (void *)v22[2];
        BOOL v19 = *a4 == (void)v22;
        uint64_t v22 = a4;
      }
      while (!v19);
    }
    if (a4 == v9 || (a4[5] ? (id v23 = (const char *)a4[5]) : (id v23 = (const char *)(a4 + 6)), strcmp(v11, v23) < 0))
    {
      if (v16)
      {
        *a3 = a4;
      }
      else
      {
        *a3 = a2;
        return a2 + 1;
      }
      return a4;
    }
  }

  return sub_679C((uint64_t)a1, a3, a5);
}

uint64_t *sub_6744(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  long long v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  __n128 result = sub_688C(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

void *sub_679C(uint64_t a1, void *a2, uint64_t a3)
{
  long long v5 = (void *)(a1 + 8);
  long long v4 = *(void **)(a1 + 8);
  if (v4)
  {
    if (*(void *)(a3 + 8)) {
      long long v6 = *(const char **)(a3 + 8);
    }
    else {
      long long v6 = (const char *)(a3 + 16);
    }
    do
    {
      while (1)
      {
        uint64_t v7 = v4;
        uint64_t v8 = (void *)v4[5];
        BOOL v9 = (const char *)(v8 ? v8 : v7 + 6);
        if ((strcmp(v6, v9) & 0x80000000) == 0) {
          break;
        }
        long long v4 = (void *)*v7;
        long long v5 = v7;
        if (!*v7) {
          goto LABEL_15;
        }
      }
      if ((strcmp(v9, v6) & 0x80000000) == 0) {
        break;
      }
      long long v5 = v7 + 1;
      long long v4 = (void *)v7[1];
    }
    while (v4);
  }
  else
  {
    uint64_t v7 = (void *)(a1 + 8);
  }
LABEL_15:
  *a2 = v7;
  return v5;
}

KB::String *sub_6848(KB::String *a1, const KB::String *a2)
{
  uint64_t v4 = KB::String::String(a1, a2);
  sub_51FC((void *)(v4 + 32), (uint64_t)a2 + 32);
  sub_5318((void *)a1 + 7, (uint64_t)a2 + 56);
  return a1;
}

uint64_t *sub_688C(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      unint64_t v3 = (uint64_t *)v2[2];
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            BOOL v9 = (uint64_t **)a2[2];
          }
          else
          {
            BOOL v9 = (uint64_t **)v2[1];
            unsigned int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              uint64_t v10[2] = (uint64_t)v2;
              unint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *BOOL v9 = v2;
            v2[2] = (uint64_t)v9;
            unint64_t v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (int v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            unint64_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          unint64_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void sub_6A24(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  *a1 = a2;
  if (v2)
  {
    if (*((unsigned char *)a1 + 16)) {
      sub_6A7C((KB::String *)(v2 + 32));
    }
    operator delete((void *)v2);
  }
}

void sub_6A7C(KB::String *this)
{
  uint64_t v2 = (void *)*((void *)this + 7);
  if (v2)
  {
    *((void *)this + 8) = v2;
    operator delete(v2);
  }
  unint64_t v3 = (void *)*((void *)this + 4);
  if (v3)
  {
    *((void *)this + 5) = v3;
    operator delete(v3);
  }

  KB::String::~String(this);
}

uint64_t *sub_6AD0(uint64_t *result, void *a2)
{
  unint64_t v3 = result;
  uint64_t v5 = *result;
  uint64_t v4 = result[1];
  uint64_t v6 = a2[1];
  while (v4 != v5)
  {
    v6 -= 232;
    v4 -= 232;
    __n128 result = (uint64_t *)sub_6BB0(v6, v4);
  }
  a2[1] = v6;
  uint64_t v7 = *v3;
  uint64_t *v3 = v6;
  a2[1] = v7;
  uint64_t v8 = v3[1];
  v3[1] = a2[2];
  a2[2] = v8;
  uint64_t v9 = v3[2];
  v3[2] = a2[3];
  a2[3] = v9;
  *a2 = a2[1];
  return result;
}

void *sub_6B64(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x11A7B9611A7B962) {
    sub_5308();
  }
  return operator new(232 * a2);
}

uint64_t sub_6BB0(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  KB::String::String();
  sub_6C40((void *)(a1 + 40), a2 + 40);
  long long v4 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 160) = v4;
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  uint64_t v5 = (void *)(a2 + 184);
  uint64_t v6 = *(void *)(a2 + 184);
  *(void *)(a1 + 184) = v6;
  uint64_t v7 = a1 + 184;
  uint64_t v8 = *(void *)(a2 + 192);
  *(void *)(a1 + 192) = v8;
  if (v8)
  {
    *(void *)(v6 + 16) = v7;
    *(void *)(a2 + 176) = v5;
    void *v5 = 0;
    *(void *)(a2 + 192) = 0;
  }
  else
  {
    *(void *)(a1 + 176) = v7;
  }
  long long v9 = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 212) = *(_OWORD *)(a2 + 212);
  *(_OWORD *)(a1 + 200) = v9;
  return a1;
}

__n128 sub_6C40(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  a1[2] = *(void *)(a2 + 16);
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  a1[3] = 0;
  a1[4] = 0;
  a1[5] = 0;
  *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 24);
  a1[5] = *(void *)(a2 + 40);
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  a1[6] = 0;
  a1[7] = 0;
  a1[8] = 0;
  *((_OWORD *)a1 + 3) = *(_OWORD *)(a2 + 48);
  a1[8] = *(void *)(a2 + 64);
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  a1[9] = 0;
  a1[10] = 0;
  a1[11] = 0;
  __n128 result = *(__n128 *)(a2 + 72);
  *(__n128 *)(a1 + 9) = result;
  a1[11] = *(void *)(a2 + 88);
  *(void *)(a2 + 72) = 0;
  *(void *)(a2 + 80) = 0;
  *(void *)(a2 + 88) = 0;
  a1[12] = *(void *)(a2 + 96);
  return result;
}

uint64_t sub_6CCC(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 232;
    sub_6D1C(i - 232);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_6D1C(uint64_t a1)
{
  sub_6D98(a1 + 176, *(void **)(a1 + 184));
  uint64_t v2 = (void **)(a1 + 112);
  sub_6DF4(&v2);
  uint64_t v2 = (void **)(a1 + 88);
  sub_6DF4(&v2);
  uint64_t v2 = (void **)(a1 + 64);
  sub_6DF4(&v2);
  uint64_t v2 = (void **)(a1 + 40);
  sub_6DF4(&v2);
  KB::String::~String((KB::String *)(a1 + 8));
}

void sub_6D98(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_6D98(a1, *a2);
    sub_6D98(a1, a2[1]);
    sub_6A7C((KB::String *)(a2 + 4));
    operator delete(a2);
  }
}

void sub_6DF4(void ***a1)
{
  v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    long long v4 = (char *)v1[1];
    uint64_t v5 = v2;
    if (v4 != v2)
    {
      do
        KB::Candidate::~Candidate((KB::Candidate *)(v4 - 1000));
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t sub_6E78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = KB::String::String((KB::String *)a1, (const KB::String *)a2);
  KB::String::String((KB::String *)(v4 + 32), (const KB::String *)(a2 + 32));
  KB::String::String((KB::String *)(a1 + 64), (const KB::String *)(a2 + 64));
  KB::String::String((KB::String *)(a1 + 96), (const KB::String *)(a2 + 96));
  KB::String::String((KB::String *)(a1 + 128), (const KB::String *)(a2 + 128));
  uint64_t v5 = *(void *)(a2 + 160);
  *(_DWORD *)(a1 + 168) = *(_DWORD *)(a2 + 168);
  *(void *)(a1 + 160) = v5;
  return a1;
}

void sub_6EE4(void ***a1)
{
  v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 176;
        sub_6F68(v4);
      }
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_6F68(uint64_t a1)
{
  KB::String::~String((KB::String *)(a1 + 128));
  KB::String::~String((KB::String *)(a1 + 96));
  KB::String::~String((KB::String *)(a1 + 64));
  KB::String::~String((KB::String *)(a1 + 32));

  KB::String::~String((KB::String *)a1);
}

uint64_t sub_6FBC(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  sub_5B0C(a1, *(void *)(a2 + 8));
  for (uint64_t i = *(unsigned int **)(a2 + 16); i; uint64_t i = *(unsigned int **)i)
    sub_701C(a1, i + 4, (void *)i + 2);
  return a1;
}

void *sub_701C(uint64_t a1, unsigned int *a2, void *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    long long v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      unsigned int v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == v6) {
              return v10;
            }
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3) {
              break;
            }
          }
          unsigned int v10 = (void *)*v10;
        }
        while (v10);
      }
    }
  }
  unsigned int v10 = operator new(0x18uLL);
  *unsigned int v10 = 0;
  v10[1] = v6;
  uint64_t v10[2] = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    sub_5B0C(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v18 = *(void *)a1;
  BOOL v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    *unsigned int v10 = *v19;
LABEL_38:
    *BOOL v19 = v10;
    goto LABEL_39;
  }
  *unsigned int v10 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    unint64_t v20 = *(void *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }
    else
    {
      v20 &= v7 - 1;
    }
    BOOL v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v10;
}

void *sub_7228(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a2 != a3)
  {
    uint64_t v6 = a2 + 16;
    do
    {
      uint64_t v7 = *(void *)(v6 - 8);
      uint64_t v8 = v6 - 16;
      *a4 = *(void *)(v6 - 16);
      a4[1] = v7;
      if (v7) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
      }
      sub_6FBC((uint64_t)(a4 + 2), v6);
      a4 += 7;
      v6 += 56;
    }
    while (v8 + 56 != a3);
  }
  return a4;
}

uint64_t sub_72A8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void sub_72F4(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_7374(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v4 = (std::__shared_weak_count *)a2[1];
    if (!v4 || v4->__shared_owners_ == -1)
    {
      uint64_t v5 = *(std::__shared_weak_count **)(a1 + 8);
      if (v5)
      {
        atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
        atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        uint64_t v4 = (std::__shared_weak_count *)a2[1];
      }
      *a2 = a3;
      a2[1] = v5;
      if (v4) {
        std::__shared_weak_count::__release_weak(v4);
      }
      if (v5)
      {
        sub_6214(v5);
      }
    }
  }
}

void sub_7400(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_7438(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void sub_746C(void ***a1)
{
  v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 56;
        sub_74F0(v4);
      }
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_74F0(uint64_t a1)
{
  sub_72A8(a1 + 16);
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    sub_6214(v2);
  }
}

unsigned int *sub_753C(unsigned int *result)
{
  v1 = result;
  unsigned int v2 = atomic_load(result);
  if (v2 == 1)
  {
    KB::String::~String((KB::String *)(result + 52));
    sub_75D4((uint64_t)(v1 + 44), *((void **)v1 + 23));
    sub_75D4((uint64_t)(v1 + 38), *((void **)v1 + 20));
    sub_7628((uint64_t)(v1 + 18));
    sub_77A8((uint64_t)(v1 + 8));
    unint64_t v3 = (void **)(v1 + 2);
    sub_782C(&v3);
    operator delete();
  }
  atomic_fetch_add((atomic_uint *volatile)result, 0xFFFFFFFF);
  return result;
}

void sub_75D4(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_75D4(a1, *a2);
    sub_75D4(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t sub_7628(uint64_t a1)
{
  sub_7664(a1, *(unsigned __int16 **)(a1 + 16));
  unsigned int v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_7664(uint64_t a1, unsigned __int16 *a2)
{
  if (a2)
  {
    unsigned int v2 = a2;
    do
    {
      unint64_t v3 = *(unsigned __int16 **)v2;
      sub_76A8(v2 + 8);
      operator delete(v2);
      unsigned int v2 = v3;
    }
    while (v3);
  }
}

uint64_t sub_76A8(unsigned __int16 *a1)
{
  uint64_t result = *((void *)a1 + 2);
  if (result) {
    uint64_t result = sub_7714(result);
  }
  if (*a1 >= 0xFu)
  {
    uint64_t result = *((void *)a1 + 1);
    if (result)
    {
      operator delete[]();
    }
  }
  return result;
}

uint64_t sub_7714(uint64_t result)
{
  unsigned int v1 = atomic_load((unsigned int *)result);
  if (v1 == 1)
  {
    if (*(unsigned __int16 *)(result + 40) >= 0xFu && *(void *)(result + 48)) {
      operator delete[]();
    }
    KB::String::~String((KB::String *)(result + 8));
    operator delete();
  }
  atomic_fetch_add((atomic_uint *volatile)result, 0xFFFFFFFF);
  return result;
}

uint64_t sub_77A8(uint64_t a1)
{
  sub_77E4(a1, *(void **)(a1 + 16));
  unsigned int v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_77E4(int a1, void *__p)
{
  if (__p)
  {
    unsigned int v2 = __p;
    do
    {
      unint64_t v3 = (void *)*v2;
      uint64_t v4 = v2[3];
      if (v4) {
        sub_7714(v4);
      }
      operator delete(v2);
      unsigned int v2 = v3;
    }
    while (v3);
  }
}

void sub_782C(void ***a1)
{
  unsigned int v2 = *a1;
  if (*v2)
  {
    sub_7880(v2);
    unint64_t v3 = **a1;
    operator delete(v3);
  }
}

void *sub_7880(void *result)
{
  unsigned int v1 = result;
  uint64_t v2 = *result;
  for (uint64_t i = result[1]; i != v2; i -= 8)
  {
    uint64_t v4 = *(void **)(i - 8);
    uint64_t result = v4;
    if (v4) {
      uint64_t result = (void *)sub_7714((uint64_t)result);
    }
  }
  v1[1] = v2;
  return result;
}

unsigned int *sub_78C8(unsigned int *result)
{
  unsigned int v1 = atomic_load(result);
  if (v1 == 1)
  {
    KB::DictionaryContainer::~DictionaryContainer((KB::DictionaryContainer *)result);
    operator delete();
  }
  atomic_fetch_add((atomic_uint *volatile)result, 0xFFFFFFFF);
  return result;
}

void *sub_791C(uint64_t a1, void *a2, unsigned int a3)
{
  if (a2[1]) {
    uint64_t v6 = (KB::String *)a2[1];
  }
  else {
    uint64_t v6 = (KB::String *)(a2 + 2);
  }
  unsigned int v7 = KB::String::hash(v6, (const char *)*(unsigned __int16 *)a2, a3);
  unint64_t v8 = v7;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    unint64_t v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = v7;
      if (v9 <= v7) {
        unint64_t v3 = v7 % v9;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v7;
    }
    float v12 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v12)
    {
      for (uint64_t i = *v12; i; uint64_t i = (void *)*i)
      {
        unint64_t v14 = i[1];
        if (v14 == v8)
        {
          if (i + 2 == a2 || (KB::String::equal((KB::String *)(i + 2), (const KB::String *)a2) & 1) != 0) {
            return i;
          }
        }
        else
        {
          if (v11 > 1)
          {
            if (v14 >= v9) {
              v14 %= v9;
            }
          }
          else
          {
            v14 &= v9 - 1;
          }
          if (v14 != v3) {
            break;
          }
        }
      }
    }
  }
  unint64_t v15 = (void *)(a1 + 16);
  uint64_t i = operator new(0x38uLL);
  v26[0] = (uint64_t)i;
  v26[1] = a1 + 16;
  void *i = 0;
  i[1] = v8;
  KB::String::String();
  i[6] = 0;
  char v27 = 1;
  float v16 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v17 = *(float *)(a1 + 32);
  if (!v9 || (float)(v17 * (float)v9) < v16)
  {
    BOOL v18 = 1;
    if (v9 >= 3) {
      BOOL v18 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v9);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v19;
    }
    sub_5B0C(a1, v21);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v9 <= v8) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }
  uint64_t v22 = *(void *)a1;
  id v23 = *(void **)(*(void *)a1 + 8 * v3);
  if (v23)
  {
    void *i = *v23;
LABEL_42:
    *id v23 = i;
    goto LABEL_43;
  }
  void *i = *v15;
  void *v15 = i;
  *(void *)(v22 + 8 * v3) = v15;
  if (*i)
  {
    unint64_t v24 = *(void *)(*i + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v24 >= v9) {
        v24 %= v9;
      }
    }
    else
    {
      v24 &= v9 - 1;
    }
    id v23 = (void *)(*(void *)a1 + 8 * v24);
    goto LABEL_42;
  }
LABEL_43:
  v26[0] = 0;
  ++*(void *)(a1 + 24);
  sub_7B8C(v26, 0);
  return i;
}

void sub_7B8C(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  *a1 = a2;
  if (v2)
  {
    if (*((unsigned char *)a1 + 16)) {
      sub_7BE4((KB::String *)(v2 + 16));
    }
    operator delete((void *)v2);
  }
}

void sub_7BE4(KB::String *this)
{
  uint64_t v2 = (unsigned int *)*((void *)this + 4);
  if (v2) {
    sub_753C(v2);
  }

  KB::String::~String(this);
}

void *sub_7C24(void *a1, void *a2, unsigned int a3)
{
  if (a2[1]) {
    uint64_t v5 = (KB::String *)a2[1];
  }
  else {
    uint64_t v5 = (KB::String *)(a2 + 2);
  }
  unsigned int v6 = KB::String::hash(v5, (const char *)*(unsigned __int16 *)a2, a3);
  unint64_t v7 = a1[1];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v6;
  uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
  v9.i16[0] = vaddlv_u8(v9);
  unint64_t v10 = v9.u32[0];
  if (v9.u32[0] > 1uLL)
  {
    unint64_t v11 = v6;
    if (v7 <= v6) {
      unint64_t v11 = v6 % v7;
    }
  }
  else
  {
    unint64_t v11 = (v7 - 1) & v6;
  }
  float v12 = *(void **)(*a1 + 8 * v11);
  if (!v12) {
    return 0;
  }
  float v13 = (void *)*v12;
  if (*v12)
  {
    do
    {
      unint64_t v14 = v13[1];
      if (v14 == v8)
      {
        if (v13 + 2 == a2 || (KB::String::equal((KB::String *)(v13 + 2), (const KB::String *)a2) & 1) != 0) {
          return v13;
        }
      }
      else
      {
        if (v10 > 1)
        {
          if (v14 >= v7) {
            v14 %= v7;
          }
        }
        else
        {
          v14 &= v7 - 1;
        }
        if (v14 != v11) {
          return 0;
        }
      }
      float v13 = (void *)*v13;
    }
    while (v13);
  }
  return v13;
}

unsigned __int8 *sub_7D3C(uint64_t a1, uint64_t a2, uint64_t a3, long long **a4)
{
  unsigned int v6 = (unsigned __int8 *)a2;
  unint64_t v8 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v9 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v9 = v8;
  }
  unint64_t v10 = sub_8054((uint64_t)v27, (uint64_t *)a2, v9);
  unint64_t v11 = v10;
  unint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    unint64_t v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v4 = v10;
      if (v10 >= v12) {
        unint64_t v4 = v10 % v12;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v10;
    }
    unint64_t v15 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v15)
    {
      for (uint64_t i = *v15; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v17 = *((void *)i + 1);
        if (v17 == v11)
        {
          if (sub_84C0(a1 + 32, i + 16, v6)) {
            return i;
          }
        }
        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12) {
              v17 %= v12;
            }
          }
          else
          {
            v17 &= v12 - 1;
          }
          if (v17 != v4) {
            break;
          }
        }
      }
    }
  }
  sub_7FCC(a1, v11, a4, (uint64_t)v27);
  float v18 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v19 = *(float *)(a1 + 32);
  if (!v12 || (float)(v19 * (float)v12) < v18)
  {
    BOOL v20 = 1;
    if (v12 >= 3) {
      BOOL v20 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v21 = v20 | (2 * v12);
    unint64_t v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22) {
      size_t v23 = v22;
    }
    else {
      size_t v23 = v21;
    }
    sub_5B0C(a1, v23);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        unint64_t v4 = v11 % v12;
      }
      else {
        unint64_t v4 = v11;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v11;
    }
  }
  unint64_t v24 = *(void **)(*(void *)a1 + 8 * v4);
  if (v24)
  {
    *(void *)v27[0] = *v24;
    *unint64_t v24 = v27[0];
  }
  else
  {
    *(void *)v27[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v27[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v27[0])
    {
      unint64_t v25 = *(void *)(*(void *)v27[0] + 8);
      if ((v12 & (v12 - 1)) != 0)
      {
        if (v25 >= v12) {
          v25 %= v12;
        }
      }
      else
      {
        v25 &= v12 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v25) = v27[0];
    }
  }
  uint64_t i = (unsigned __int8 *)v27[0];
  v27[0] = 0;
  ++*(void *)(a1 + 24);
  sub_8568((uint64_t)v27, 0);
  return i;
}

unsigned char *sub_7FCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = operator new(0x40uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  void *v8 = 0;
  v8[1] = a2;
  uint64_t result = v8 + 2;
  unint64_t v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    uint64_t result = sub_6010(result, *(void **)v10, *((void *)v10 + 1));
  }
  else
  {
    long long v11 = *v10;
    v8[4] = *((void *)v10 + 2);
    *(_OWORD *)uint64_t result = v11;
  }
  v8[5] = 0;
  v8[6] = 0;
  v8[7] = 0;
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

unint64_t sub_8054(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v11 = v7 + v9;
      unint64_t v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      unint64_t v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      unint64_t v14 = v8 + a3 + v7 + v4;
      uint64_t v15 = v14 + v5;
      unint64_t v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      uint64_t v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v18 = v17 + v6 + v9;
      uint64_t v19 = __ROR8__(v18, 44);
      uint64_t v20 = v18 + v10;
      uint64_t v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      uint64_t v23 = *a2;
      unint64_t v22 = a2 + 4;
      unint64_t v24 = v23 - 0x4B6D499041670D8DLL * v5;
      uint64_t v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v26 = *(v22 - 3);
        uint64_t v27 = v24 + v15 + v11 + v26;
        uint64_t v28 = v22[2];
        uint64_t v29 = v22[3];
        uint64_t v30 = v22[1];
        unint64_t v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        uint64_t v31 = v13 + v20;
        uint64_t v32 = *(v22 - 2);
        uint64_t v33 = *(v22 - 1);
        uint64_t v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        uint64_t v35 = v34 + v20 + v33;
        uint64_t v36 = v34 + v26 + v32;
        uint64_t v15 = v36 + v33;
        uint64_t v37 = __ROR8__(v36, 44) + v34;
        unint64_t v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        unint64_t v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        unint64_t v16 = v37 + __ROR8__(v35 + v38, 21);
        unint64_t v39 = v24 + v21 + *v22;
        uint64_t v20 = v39 + v30 + v28 + v29;
        uint64_t v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        unint64_t v13 = v38;
        v25 += 64;
      }
      while (v25);
      unint64_t v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      unint64_t v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return sub_8400(a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return sub_8354(a2, a3);
  }
  else
  {
    return sub_825C(a2, a3);
  }
}

unint64_t sub_825C(_DWORD *a1, unint64_t a2)
{
  if (a2 < 9)
  {
    if (a2 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        unint64_t v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      uint64_t v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    uint64_t v3 = *(void *)((char *)a1 + a2 - 8);
    uint64_t v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t sub_8354(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = 0xB492B66FBE98F273 * *a1;
  uint64_t v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  unint64_t v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8);
  unint64_t v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(void *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t sub_8400(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)((char *)a1 + a2 - 16);
  uint64_t v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = __ROR8__(v3 + v4, 52);
  uint64_t v7 = v3 + a1[1];
  uint64_t v8 = __ROR8__(v7, 7);
  uint64_t v9 = v7 + v5;
  uint64_t v10 = *(void *)((char *)a1 + a2 - 32) + v5;
  uint64_t v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  uint64_t v12 = *(void *)((char *)a1 + a2 - 24) + v10 + v2;
  unint64_t v13 = 0xC3A5C85C97CB3127 * (v12 + *(void *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(void *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(void *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t sub_84C0(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = a2[23];
  if ((v4 & 0x80u) == 0) {
    uint64_t v5 = a2[23];
  }
  else {
    uint64_t v5 = *((void *)a2 + 1);
  }
  uint64_t v6 = a3[23];
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0) {
    uint64_t v6 = *((void *)a3 + 1);
  }
  if (v5 != v6) {
    return 0;
  }
  if (v7 < 0) {
    uint64_t v3 = *(unsigned __int8 **)a3;
  }
  if ((v4 & 0x80) != 0) {
    return memcmp(*(const void **)a2, v3, *((void *)a2 + 1)) == 0;
  }
  if (!a2[23]) {
    return 1;
  }
  uint64_t v8 = v4 - 1;
  do
  {
    int v10 = *a2++;
    int v9 = v10;
    int v12 = *v3++;
    int v11 = v12;
    BOOL v14 = v8-- != 0;
    uint64_t result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

void sub_8568(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      sub_85C0((uint64_t)v2 + 16);
    }
    operator delete(v2);
  }
}

void sub_85C0(uint64_t a1)
{
  uint64_t v2 = (void **)(a1 + 24);
  sub_8608(&v2);
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_8608(void ***a1)
{
  unsigned int v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 232;
        sub_6D1C(v4);
      }
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *sub_868C(void *a1)
{
  if (*a1)
  {
    uint64_t v2 = (uint64_t *)a1[1];
    uint64_t v3 = 8 * *a1;
    do
    {
      if (*v2) {
        sub_7714(*v2);
      }
      ++v2;
      v3 -= 8;
    }
    while (v3);
    *a1 = 0;
  }
  uint64_t v4 = (void *)a1[1];
  a1[1] = 0;
  a1[2] = 0;
  free(v4);
  return a1;
}

void sub_86F0(void *a1, unint64_t a2)
{
  if (a1[2] < a2)
  {
    uint64_t v3 = (void **)(a1 + 1);
    uint64_t v2 = (void *)a1[1];
    uint64_t v4 = *a1;
    a1[2] = a2;
    uint64_t v5 = malloc_type_malloc(8 * a2, 0x2004093837F09uLL);
    unsigned __int8 *v3 = v5;
    if (v5)
    {
      memcpy(v5, v2, 8 * v4);
      uint64_t v6 = *v3;
    }
    else
    {
      uint64_t v6 = 0;
    }
    if (v6 == v2)
    {
      unsigned __int8 *v3 = 0;
      v3[1] = 0;
    }
    free(v2);
  }
}

void sub_8798(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_881C(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_8854(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void sub_8888()
{
  __cxa_atexit((void (*)(void *))sub_264C, &unk_14758, &dword_0);
}

uint64_t sub_9574(uint64_t *a1, uint64_t a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    unint64_t v10 = 0xEEEEEEEEEEEEEEEFLL * ((uint64_t)(v7 - *a1) >> 4);
    if (v10 + 1 > 0x111111111111111) {
      abort();
    }
    unint64_t v11 = 0xEEEEEEEEEEEEEEEFLL * ((uint64_t)(v5 - *a1) >> 4);
    uint64_t v12 = 2 * v11;
    if (2 * v11 <= v10 + 1) {
      uint64_t v12 = v10 + 1;
    }
    if (v11 >= 0x88888888888888) {
      unint64_t v13 = 0x111111111111111;
    }
    else {
      unint64_t v13 = v12;
    }
    uint64_t v19 = v4;
    if (v13) {
      BOOL v14 = (char *)sub_9F74(v4, v13);
    }
    else {
      BOOL v14 = 0;
    }
    uint64_t v15 = v14;
    unint64_t v16 = &v14[240 * v10];
    uint64_t v18 = &v14[240 * v13];
    sub_9E58((uint64_t)v16, a2);
    uint64_t v17 = v16 + 240;
    sub_9EE0(a1, &v15);
    uint64_t v9 = a1[1];
    uint64_t result = sub_A060((uint64_t)&v15);
  }
  else
  {
    uint64_t result = sub_9E58(*(void *)(v4 - 8), a2);
    uint64_t v9 = v7 + 240;
  }
  a1[1] = v9;
  return result;
}

uint64_t sub_9AD8(uint64_t a1)
{
  *(void *)a1 = off_10660;
  *(unsigned char *)(a1 + 8) = 0;
  sub_9B70(a1 + 16);
  *(_DWORD *)(a1 + 40) = 0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = xmmword_ED60;
  *(_DWORD *)(a1 + 144) = 1028443341;
  *(void *)(a1 + 148) = 0x300000000;
  *(unsigned char *)(a1 + 160) = 1;
  *(void *)(a1 + 168) = 0;
  *(void *)(a1 + 176) = 0xF00000002;
  return a1;
}

const void **sub_9B70@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 1050253722;
  CFRetain(@"shapestore.db");
  *(void *)(a1 + 16) = @"shapestore.db";
  uint64_t v2 = (const void **)(a1 + 16);
  CFStringRef v3 = (const __CFString *)TI_KB_USER_DIRECTORY();
  *(v2 - 1) = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, v3, kCFURLPOSIXPathStyle, 1u);

  return sub_9BF8(v2, @"shapestore.db");
}

const void **sub_9BF8(const void **a1, CFTypeRef cf)
{
  CFTypeRef v3 = *a1;
  if (v3 != cf)
  {
    if (cf)
    {
      CFRetain(cf);
      CFTypeRef v3 = *a1;
    }
    if (v3) {
      CFRelease(v3);
    }
    *a1 = cf;
  }
  return a1;
}

void sub_9C48(void **a1)
{
  unsigned int v1 = *a1;
  if (*a1)
  {
    uint64_t v3 = (uint64_t)a1[1];
    uint64_t v4 = *a1;
    if ((void *)v3 != v1)
    {
      do
      {
        v3 -= 232;
        sub_6D1C(v3);
      }
      while ((void *)v3 != v1);
      uint64_t v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void sub_9CB0(void ***a1)
{
  unsigned int v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    unint64_t v5 = v2;
    if ((void *)v4 != v2)
    {
      do
        uint64_t v4 = sub_A0B0(v4 - 240);
      while ((void *)v4 != v2);
      unint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t sub_9D34(uint64_t a1)
{
  *(void *)a1 = off_10660;
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 120);
  if (v2) {
    sub_6214(v2);
  }
  uint64_t v3 = *(unsigned int **)(a1 + 104);
  if (v3)
  {
    unsigned int v4 = atomic_load(v3 + 2);
    if (v4 == 1) {
      (*(void (**)(unsigned int *))(*(void *)v3 + 8))(v3);
    }
    else {
      atomic_fetch_add((atomic_uint *volatile)v3 + 2, 0xFFFFFFFF);
    }
  }
  unint64_t v5 = *(unsigned int **)(a1 + 96);
  if (v5)
  {
    unsigned int v6 = atomic_load(v5 + 2);
    if (v6 == 1) {
      (*(void (**)(unsigned int *))(*(void *)v5 + 40))(v5);
    }
    else {
      atomic_fetch_add((atomic_uint *volatile)v5 + 2, 0xFFFFFFFF);
    }
  }
  unint64_t v7 = *(std::__shared_weak_count **)(a1 + 88);
  if (v7) {
    sub_6214(v7);
  }
  uint64_t v8 = *(unsigned int **)(a1 + 72);
  if (v8) {
    sub_78C8(v8);
  }
  if (*(char *)(a1 + 71) < 0) {
    operator delete(*(void **)(a1 + 48));
  }
  uint64_t v9 = *(const void **)(a1 + 32);
  if (v9) {
    CFRelease(v9);
  }
  *(void *)(a1 + 32) = 0;
  unint64_t v10 = *(const void **)(a1 + 24);
  if (v10) {
    CFRelease(v10);
  }
  *(void *)(a1 + 24) = 0;
  return a1;
}

uint64_t sub_9E58(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(atomic_uint **)a2;
  *(void *)a1 = *(void *)a2;
  if (v4) {
    atomic_fetch_add(v4, 1u);
  }
  sub_51FC((void *)(a1 + 8), a2 + 8);
  sub_5318((void *)(a1 + 32), a2 + 32);
  KB::String::String((KB::String *)(a1 + 56), (const KB::String *)(a2 + 56));
  sub_53F8(a1 + 88, a2 + 88);
  KB::String::String((KB::String *)(a1 + 192), (const KB::String *)(a2 + 192));
  uint64_t v5 = *(void *)(a2 + 224);
  *(_DWORD *)(a1 + 232) = *(_DWORD *)(a2 + 232);
  *(void *)(a1 + 224) = v5;
  return a1;
}

uint64_t *sub_9EE0(uint64_t *result, void *a2)
{
  uint64_t v3 = result;
  uint64_t v5 = (uint64_t *)*result;
  unsigned int v4 = (uint64_t *)result[1];
  uint64_t v6 = a2[1];
  while (v4 != v5)
  {
    v6 -= 240;
    v4 -= 30;
    uint64_t result = (uint64_t *)sub_9FBC(v6, v4);
  }
  a2[1] = v6;
  uint64_t v7 = *v3;
  uint64_t *v3 = v6;
  a2[1] = v7;
  uint64_t v8 = v3[1];
  v3[1] = a2[2];
  a2[2] = v8;
  uint64_t v9 = v3[2];
  v3[2] = a2[3];
  a2[3] = v9;
  *a2 = a2[1];
  return result;
}

void *sub_9F74(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x111111111111112) {
    sub_5308();
  }
  return operator new(240 * a2);
}

uint64_t sub_9FBC(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *a2 = 0;
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
  *(void *)(a1 + 24) = a2[3];
  a2[1] = 0;
  a2[2] = 0;
  a2[3] = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
  *(void *)(a1 + 48) = a2[6];
  a2[4] = 0;
  a2[5] = 0;
  a2[6] = 0;
  KB::String::String();
  sub_60D4(a1 + 88, (uint64_t)(a2 + 11));
  KB::String::String();
  uint64_t v5 = a2[28];
  *(_DWORD *)(a1 + 232) = *((_DWORD *)a2 + 58);
  *(void *)(a1 + 224) = v5;
  return a1;
}

uint64_t sub_A060(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 240;
    sub_A0B0(i - 240);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t sub_A0B0(uint64_t a1)
{
  KB::String::~String((KB::String *)(a1 + 192));
  uint64_t v7 = (void **)(a1 + 168);
  sub_6170(&v7);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)(a1 + 160));
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)(a1 + 152));
  uint64_t v2 = *(void **)(a1 + 104);
  if (v2)
  {
    *(void *)(a1 + 112) = v2;
    operator delete(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 96);
  if (v3) {
    sub_6214(v3);
  }
  KB::String::~String((KB::String *)(a1 + 56));
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4)
  {
    *(void *)(a1 + 40) = v4;
    operator delete(v4);
  }
  uint64_t v5 = *(void **)(a1 + 8);
  if (v5)
  {
    *(void *)(a1 + 16) = v5;
    operator delete(v5);
  }
  if (*(void *)a1) {
    sub_753C(*(unsigned int **)a1);
  }
  return a1;
}

void sub_A154(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_A1D0(a2 + 48);
    uint64_t v3 = *(unsigned int **)(a2 + 40);
    if (v3) {
      sub_78C8(v3);
    }
    uint64_t v4 = *(std::__shared_weak_count **)(a2 + 32);
    if (v4) {
      sub_6214(v4);
    }
    if (*(char *)(a2 + 23) < 0) {
      operator delete(*(void **)a2);
    }
    operator delete();
  }
}

uint64_t sub_A1D0(uint64_t a1)
{
  sub_A20C(a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_A20C(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      uint64_t v3 = (void *)*v2;
      sub_7BE4((KB::String *)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

void sub_A250()
{
  __cxa_atexit((void (*)(void *))sub_264C, &unk_14780, &dword_0);
}

TI::CP::CPEval *TI::CP::CPEval::CPEval(TI::CP::CPEval *this, NSString *a2)
{
  *(void *)this = off_10660;
  *((unsigned char *)this + 8) = 0;
  uint64_t v3 = (char *)this + 16;
  uint64_t v4 = a2;
  sub_9B70((uint64_t)v3);
  *((_DWORD *)this + 10) = 0;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = xmmword_ED60;
  *((_DWORD *)this + 36) = 1028443341;
  *(void *)((char *)this + 148) = 0x300000000;
  *((unsigned char *)this + 160) = 1;
  *((void *)this + 21) = 0;
  *((void *)this + 22) = 0xF00000002;
  (*(void (**)(TI::CP::CPEval *, NSString *, void, double))(*(void *)this + 16))(this, v4, 0, 0.0);

  return this;
}

TI::CP::CPEval *TI::CP::CPEval::CPEval(TI::CP::CPEval *this, NSString *a2, NSString *a3, double a4)
{
  *(void *)this = off_10660;
  *((unsigned char *)this + 8) = 0;
  uint64_t v7 = (char *)this + 16;
  uint64_t v8 = a3;
  uint64_t v9 = a2;
  sub_9B70((uint64_t)v7);
  *((_DWORD *)this + 10) = 0;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = xmmword_ED60;
  *((_DWORD *)this + 36) = 1028443341;
  *(void *)((char *)this + 148) = 0x300000000;
  *((unsigned char *)this + 160) = 1;
  *((void *)this + 21) = 0;
  *((void *)this + 22) = 0xF00000002;
  (*(void (**)(TI::CP::CPEval *, NSString *, NSString *, double))(*(void *)this + 16))(this, v9, v8, a4);

  return this;
}

void TI::CP::CPEval::load_language_resources(TI::CP::CPEval *this, NSString *a2, NSString *a3, double a4)
{
  uint64_t v7 = a2;
  uint64_t v8 = a3;
  uint64_t v9 = v7;
  sub_5F60(&v29, (char *)[(NSString *)v9 UTF8String]);
  unint64_t v10 = (void **)((char *)this + 48);
  if (*((char *)this + 71) < 0) {
    operator delete(*v10);
  }
  *(_OWORD *)unint64_t v10 = v29;
  *((void *)this + 8) = v30;
  if (v8)
  {
    float v11 = a4;
    TI::CP::createAndLoadDictionaryContainerMultiLexicon((TI::CP *)v9, v8, 0, v11, (void ***)&v29);
    BOOL v14 = (atomic_uint **)((char *)this + 72);
    unint64_t v13 = (unsigned int *)*((void *)this + 9);
    uint64_t v15 = v29;
    *(void *)&long long v29 = 0;
    *((void *)this + 9) = v15;
    if (v13)
    {
      sub_78C8(v13);
      if ((void)v29) {
        sub_78C8((unsigned int *)v29);
      }
    }
    if (*((unsigned char *)this + 160)) {
      TI::CP::createAndLoadLanguageModelContainer((TI::CP *)v9, v8, 0, v11, v12);
    }
  }
  else
  {
    __createAndLoadDictionaryContainer((uint64_t *)&v29, v9, 0);
    BOOL v14 = (atomic_uint **)((char *)this + 72);
    unint64_t v16 = (unsigned int *)*((void *)this + 9);
    uint64_t v17 = v29;
    *(void *)&long long v29 = 0;
    *((void *)this + 9) = v17;
    if (v16)
    {
      sub_78C8(v16);
      if ((void)v29) {
        sub_78C8((unsigned int *)v29);
      }
    }
    if (*((unsigned char *)this + 160)) {
      TI::CP::createAndLoadLanguageModel((TI::CP *)v9, 0, 0);
    }
  }
  sub_D094(v14, &v29);
  long long v18 = v29;
  long long v29 = 0uLL;
  uint64_t v19 = (std::__shared_weak_count *)*((void *)this + 15);
  *((_OWORD *)this + 7) = v18;
  if (v19)
  {
    sub_6214(v19);
    if (*((void *)&v29 + 1)) {
      sub_6214(*((std::__shared_weak_count **)&v29 + 1));
    }
  }
  TI::Favonius::UnigramTypingModel::create();
  uint64_t v20 = (unsigned int *)*((void *)this + 12);
  uint64_t v21 = v29;
  *(void *)&long long v29 = 0;
  *((void *)this + 12) = v21;
  if (v20)
  {
    unsigned int v22 = atomic_load(v20 + 2);
    if (v22 == 1) {
      (*(void (**)(unsigned int *))(*(void *)v20 + 40))(v20);
    }
    else {
      atomic_fetch_add((atomic_uint *volatile)v20 + 2, 0xFFFFFFFF);
    }
    if ((void)v29)
    {
      unsigned int v23 = atomic_load((unsigned int *)(v29 + 8));
      if (v23 == 1) {
        (*(void (**)(void))(*(void *)v29 + 40))(v29);
      }
      else {
        atomic_fetch_add((atomic_uint *volatile)(v29 + 8), 0xFFFFFFFF);
      }
    }
  }
  TI::Favonius::UnigramCandidateGenerator::create();
  unint64_t v24 = (unsigned int *)*((void *)this + 13);
  uint64_t v25 = v29;
  *(void *)&long long v29 = 0;
  *((void *)this + 13) = v25;
  if (v24)
  {
    unsigned int v26 = atomic_load(v24 + 2);
    if (v26 == 1) {
      (*(void (**)(unsigned int *))(*(void *)v24 + 8))(v24);
    }
    else {
      atomic_fetch_add((atomic_uint *volatile)v24 + 2, 0xFFFFFFFF);
    }
    if ((void)v29)
    {
      unsigned int v27 = atomic_load((unsigned int *)(v29 + 8));
      if (v27 == 1) {
        (*(void (**)(void))(*(void *)v29 + 8))(v29);
      }
      else {
        atomic_fetch_add((atomic_uint *volatile)(v29 + 8), 0xFFFFFFFF);
      }
    }
  }
  uint64_t v28 = (std::__shared_weak_count *)*((void *)this + 11);
  *((void *)this + 10) = 0;
  *((void *)this + 11) = 0;
  if (v28) {
    sub_6214(v28);
  }
}

id TI::CP::CPEval::is_match(TI::CP::CPEval *this, const KB::Candidate *a2, const KB::String *a3)
{
  sub_58A4((uint64_t)v20, (uint64_t)a2);
  if (*((_DWORD *)this + 39))
  {
    sub_D1B0((uint64_t)&v18);
    sub_AAB0(v20, &v18);
    KB::Candidate::~Candidate((KB::Candidate *)&v18);
  }
  int v5 = *((_DWORD *)this + 44);
  if (!v5)
  {
    KB::Candidate::capitalized_string((uint64_t *)&v18, (KB::Candidate *)v20);
    if (&v18 == (long long *)a3)
    {
      id v8 = &dword_0 + 1;
      goto LABEL_10;
    }
    uint64_t v7 = KB::String::equal(a3, (const KB::String *)&v18);
LABEL_9:
    id v8 = (id)v7;
LABEL_10:
    KB::String::~String((KB::String *)&v18);
    goto LABEL_23;
  }
  if (v5 != 1)
  {
    if (v5 != 2)
    {
      id v8 = 0;
      goto LABEL_23;
    }
    uint64_t v6 = (KB::CollatorWrapper *)(*(void *)(*((void *)this + 9) + 8) + 72);
    KB::Candidate::capitalized_string((uint64_t *)&v18, (KB::Candidate *)v20);
    uint64_t v7 = KB::CollatorWrapper::sortkey_equal_strings(v6, (const KB::String *)&v18, a3);
    goto LABEL_9;
  }
  uint64_t v9 = (char *)*((void *)a3 + 1);
  if (!v9) {
    uint64_t v9 = (char *)a3 + 16;
  }
  if (*(_WORD *)a3) {
    unint64_t v10 = v9;
  }
  else {
    unint64_t v10 = &unk_EE1E;
  }
  float v11 = +[NSString stringWithUTF8String:v10];
  uint64_t v12 = [v11 lowercaseString];

  KB::Candidate::capitalized_string((uint64_t *)&v18, (KB::Candidate *)v20);
  unint64_t v13 = (uint64_t *)*((void *)&v18 + 1);
  if (!*((void *)&v18 + 1)) {
    unint64_t v13 = &v19;
  }
  if ((_WORD)v18) {
    BOOL v14 = v13;
  }
  else {
    BOOL v14 = (uint64_t *)&unk_EE1E;
  }
  uint64_t v15 = +[NSString stringWithUTF8String:v14];
  unint64_t v16 = [v15 lowercaseString];

  KB::String::~String((KB::String *)&v18);
  id v8 = [v12 isEqualToString:v16];

LABEL_23:
  KB::Candidate::~Candidate((KB::Candidate *)v20);
  return v8;
}

uint64_t *sub_AAB0(uint64_t *a1, long long *a2)
{
  uint64_t v4 = *a1;
  *a1 = *(void *)a2;
  *(void *)a2 = v4;
  sub_D26C(a1 + 1, (void *)a2 + 1);
  long long v5 = *(long long *)((char *)a2 + 744);
  long long v6 = *(long long *)((char *)a2 + 760);
  a1[97] = *((void *)a2 + 97);
  *(_OWORD *)(a1 + 93) = v5;
  *(_OWORD *)(a1 + 95) = v6;
  sub_6288((uint64_t)(a1 + 98), a2 + 49);
  KB::String::operator=();
  uint64_t v7 = (void **)(a1 + 115);
  if (*((char *)a1 + 943) < 0) {
    operator delete(*v7);
  }
  long long v8 = *(long long *)((char *)a2 + 920);
  a1[117] = *((void *)a2 + 117);
  *(_OWORD *)uint64_t v7 = v8;
  *((unsigned char *)a2 + 943) = 0;
  *((unsigned char *)a2 + 920) = 0;
  KB::ByteString::operator=();
  *((_OWORD *)a1 + 60) = a2[60];
  uint64_t v9 = (const void *)a1[122];
  if (v9) {
    CFRelease(v9);
  }
  a1[122] = 0;
  uint64_t v10 = *((void *)a2 + 122);
  *((void *)a2 + 122) = 0;
  a1[122] = v10;
  float v11 = (const void *)a1[123];
  if (v11) {
    CFRelease(v11);
  }
  a1[123] = 0;
  uint64_t v12 = *((void *)a2 + 123);
  *((void *)a2 + 123) = 0;
  a1[123] = v12;
  *((_DWORD *)a1 + 248) = *((_DWORD *)a2 + 248);
  return a1;
}

uint64_t TI::CP::CPEval::match_index(TI::CP::CPEval *this, const KB::String *a2, const KB::Candidate **a3)
{
  long long v5 = *a3;
  long long v6 = a3[1];
  KB::String::String((KB::String *)v8, a2);
  uint64_t v9 = this;
  if (v5 != v6)
  {
    while ((TI::CP::CPEval::is_match(v9, v5, (const KB::String *)v8) & 1) == 0)
    {
      long long v5 = (const KB::Candidate *)((char *)v5 + 1000);
      if (v5 == v6)
      {
        long long v5 = v6;
        break;
      }
    }
  }
  KB::String::~String((KB::String *)v8);
  if (v5 == a3[1]) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 652835029 * ((unint64_t)(v5 - *a3) >> 3);
  }
}

const std::string *TI::CP::CPEval::create_recognizer_for_config@<X0>(const std::string *result@<X0>, int a2@<W1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = 0;
  switch(a2)
  {
    case 0:
      operator new();
    case 1:
      operator new();
    case 2:
      operator new();
    case 3:
      std::string::operator=((std::string *)(a3 + 104), result + 2);
      operator new();
    default:
      return result;
  }
}

void TI::CP::CPEval::evaluate_records(const std::string *a1@<X0>, uint64_t *a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(void *)a5 = 0;
  *(void *)(a5 + 8) = 0;
  *(void *)(a5 + 16) = 0;
  *(_DWORD *)(a5 + 24) = -1;
  long long v11 = *(_OWORD *)(a4 + 80);
  v32[4] = *(_OWORD *)(a4 + 64);
  v32[5] = v11;
  uint64_t v33 = *(void *)(a4 + 96);
  long long v12 = *(_OWORD *)(a4 + 16);
  v32[0] = *(_OWORD *)a4;
  v32[1] = v12;
  long long v13 = *(_OWORD *)(a4 + 48);
  v32[2] = *(_OWORD *)(a4 + 32);
  v32[3] = v13;
  if (*(char *)(a4 + 127) < 0)
  {
    sub_6010(&v34, *(void **)(a4 + 104), *(void *)(a4 + 112));
  }
  else
  {
    long long v34 = *(_OWORD *)(a4 + 104);
    uint64_t v35 = *(void *)(a4 + 120);
  }
  if (*(char *)(a4 + 151) < 0)
  {
    sub_6010(&__p, *(void **)(a4 + 128), *(void *)(a4 + 136));
  }
  else
  {
    long long __p = *(_OWORD *)(a4 + 128);
    uint64_t v37 = *(void *)(a4 + 144);
  }
  __int16 v38 = *(_WORD *)(a4 + 152);
  char v39 = *(unsigned char *)(a4 + 154);
  KB::String::String((KB::String *)v40, (const KB::String *)(a4 + 160));
  long long v14 = *(_OWORD *)(a4 + 336);
  v40[10] = *(_OWORD *)(a4 + 320);
  v40[11] = v14;
  uint64_t v41 = *(void *)(a4 + 352);
  long long v15 = *(_OWORD *)(a4 + 272);
  v40[6] = *(_OWORD *)(a4 + 256);
  v40[7] = v15;
  long long v16 = *(_OWORD *)(a4 + 304);
  v40[8] = *(_OWORD *)(a4 + 288);
  v40[9] = v16;
  long long v17 = *(_OWORD *)(a4 + 208);
  v40[2] = *(_OWORD *)(a4 + 192);
  v40[3] = v17;
  long long v18 = *(_OWORD *)(a4 + 240);
  void v40[4] = *(_OWORD *)(a4 + 224);
  v40[5] = v18;
  TI::CP::CPEval::create_recognizer_for_config(a1, a3, (uint64_t)v32, &v23);
  KB::String::~String((KB::String *)v40);
  if (SHIBYTE(v37) < 0) {
    operator delete((void *)__p);
  }
  if (SHIBYTE(v35) < 0) {
    operator delete((void *)v34);
  }
  uint64_t v19 = v23;
  if (v23)
  {
    uint64_t v20 = *a2;
    if (a2[1] != *a2)
    {
      uint64_t v21 = 0;
      unint64_t v22 = 0;
      do
      {
        TI::CP::CPEval::evaluate_test_case((uint64_t)a1, v20 + v21, v19, v22, (uint64_t)v25);
        sub_3E60((uint64_t *)a5, (uint64_t)v25);
        sub_6D98((uint64_t)v31, v31[1]);
        unint64_t v24 = (void **)&v30;
        sub_6DF4(&v24);
        unint64_t v24 = (void **)&v29;
        sub_6DF4(&v24);
        unint64_t v24 = (void **)&v28;
        sub_6DF4(&v24);
        unint64_t v24 = (void **)&v27;
        sub_6DF4(&v24);
        KB::String::~String((KB::String *)&v26);
        ++v22;
        uint64_t v20 = *a2;
        v21 += 240;
      }
      while (0xEEEEEEEEEEEEEEEFLL * ((a2[1] - *a2) >> 4) > v22);
    }
    if (a3 == 2) {
      *(_DWORD *)(a5 + 24) = TI::CP::ShapeStore::num_records((TI::CP::ShapeStore *)(v19 + 26));
    }
    (*(void (**)(void *))(*v19 + 8))(v19);
  }
}

void TI::CP::CPEval::evaluate_test_case(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  (*(void (**)(void *))(*a3 + 56))(a3);
  *(_DWORD *)(a1 + 156) = 0;
  if (*(unsigned char *)(a1 + 160))
  {
    (*(void (**)(void *, uint64_t))(*a3 + 120))(a3, a2 + 88);
  }
  else
  {
    uint64_t v37 = 0;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    *(_OWORD *)uint64_t v31 = 0u;
    *(_OWORD *)long long __p = 0u;
    language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v35);
    language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)((char *)&v35 + 8));
    long long v36 = 0uLL;
    uint64_t v37 = 0;
    (*(void (**)(void *, void **))(*a3 + 120))(a3, v31);
    __int16 v38 = (void **)&v36;
    sub_6170(&v38);
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)((char *)&v35 + 8));
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v35);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v31[1]) {
      sub_6214((std::__shared_weak_count *)v31[1]);
    }
  }
  uint64_t v9 = *(atomic_uint **)a2;
  uint64_t v30 = v9;
  if (v9) {
    atomic_fetch_add(v9, 1u);
  }
  sub_BAE4(a3, &v30);
  if (v30) {
    sub_753C((unsigned int *)v30);
  }
  if ((*(unsigned int (**)(void *))(*a3 + 16))(a3) == 2)
  {
    uint64_t v10 = *(char **)(a2 + 64);
    if (!v10) {
      uint64_t v10 = (char *)(a2 + 72);
    }
    if (*(_WORD *)(a2 + 56)) {
      long long v11 = v10;
    }
    else {
      long long v11 = (char *)&unk_EE1E;
    }
    sub_5F60(v31, v11);
    int v12 = TI::CP::ShapeStore::shape_count_for_word();
    if (SHIBYTE(__p[0]) < 0) {
      operator delete(v31[0]);
    }
    BOOL v27 = v12 > 0;
  }
  else
  {
    BOOL v27 = 0;
  }
  uint64_t v29 = a5;
  uint64_t v13 = *(void *)(a2 + 8);
  uint64_t v14 = *(void *)(a2 + 16) - v13;
  if (v14)
  {
    unint64_t v15 = 0;
    unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * (v14 >> 4);
    double v17 = INFINITY;
    unsigned int v18 = 1;
    double v19 = INFINITY;
    while (1)
    {
      if (v16 == v18) {
        unsigned int v20 = 2;
      }
      else {
        unsigned int v20 = 1;
      }
      if (v18 == 1) {
        uint64_t v21 = 0;
      }
      else {
        uint64_t v21 = v20;
      }
      (*(void (**)(void *, uint64_t, void, double, double, double, double))(*a3 + 32))(a3, v21, 0, *(double *)(v13 + 48 * v15), *(double *)(v13 + 48 * v15 + 8), *(double *)(v13 + 48 * v15 + 16), *(double *)(v13 + 48 * v15 + 24));
      if (!*(unsigned char *)(a1 + 8)) {
        goto LABEL_38;
      }
      HIDWORD(v37) = 0;
      *(_OWORD *)uint64_t v31 = 0u;
      *(_OWORD *)long long __p = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      (*(void (**)(void *, void **, void))(*a3 + 80))(a3, v31, *(unsigned int *)(a1 + 40));
      int matched = TI::CP::CPEval::match_index((TI::CP::CPEval *)a1, (const KB::String *)(a2 + 56), (const KB::Candidate **)v31);
      if (matched != -1)
      {
        if (!matched)
        {
          if (fabs(v17) == INFINITY) {
            double v17 = *(double *)(v13 + 48 * v15 + 32);
          }
LABEL_35:
          if (fabs(v19) == INFINITY) {
            double v19 = *(double *)(v13 + 48 * v15 + 32);
          }
          goto LABEL_37;
        }
        if (matched <= 2) {
          goto LABEL_35;
        }
      }
LABEL_37:
      __int16 v38 = (void **)&v35 + 1;
      sub_6DF4(&v38);
      __int16 v38 = (void **)&v34;
      sub_6DF4(&v38);
      __int16 v38 = &__p[1];
      sub_6DF4(&v38);
      __int16 v38 = v31;
      sub_6DF4(&v38);
LABEL_38:
      unint64_t v15 = v18;
      uint64_t v13 = *(void *)(a2 + 8);
      unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((*(void *)(a2 + 16) - v13) >> 4);
      ++v18;
      if (v16 <= v15) {
        goto LABEL_41;
      }
    }
  }
  double v19 = INFINITY;
  double v17 = INFINITY;
LABEL_41:
  HIDWORD(v37) = 0;
  *(_OWORD *)uint64_t v31 = 0u;
  *(_OWORD *)long long __p = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  (*(void (**)(void *, void **, void))(*a3 + 80))(a3, v31, *(unsigned int *)(a1 + 40));
  uint64_t v23 = *(void *)(a1 + 112);
  if (v23)
  {
    (*(void (**)(uint64_t, void **, void))(*(void *)v23 + 64))(v23, v31, 0);
    uint64_t v24 = *(void *)(a1 + 112);
    v39[0] = off_106E0;
    v39[3] = v39;
    (*(void (**)(uint64_t, void **, void *))(*(void *)v24 + 56))(v24, v31, v39);
    sub_D780(v39);
    KB::CandidateCollection::normalize_scores((KB::CandidateCollection *)v31);
  }
  TI::ConfidenceModel::update_confidence_for_candidates((TI::ConfidenceModel *)(a1 + 128), (KB::CandidateCollection *)v31);
  TI::CP::CPEval::compose_result_from_candidates((KB::DictionaryContainer **)a1, (const KB::Candidate **)v31, (const ContinuousPathTestCase *)a2, a4, v29);
  uint64_t v25 = *(void *)(a2 + 16);
  if (*(void *)(a2 + 8) == v25) {
    uint64_t v26 = 0;
  }
  else {
    uint64_t v26 = *(void *)(v25 - 16);
  }
  *(void *)(v29 + 152) = v26;
  *(double *)(v29 + 160) = v17;
  *(double *)(v29 + 168) = v19;
  *(unsigned char *)(v29 + 220) = v27;
  *(_DWORD *)(v29 + 224) = (*(uint64_t (**)(void *))(*a3 + 24))(a3);
  __int16 v38 = (void **)&v35 + 1;
  sub_6DF4(&v38);
  __int16 v38 = (void **)&v34;
  sub_6DF4(&v38);
  __int16 v38 = &__p[1];
  sub_6DF4(&v38);
  __int16 v38 = v31;
  sub_6DF4(&v38);
}

unsigned int *sub_BAE4(void *a1, atomic_uint **a2)
{
  uint64_t result = (unsigned int *)a1[1];
  uint64_t v4 = *a2;
  if (result != (unsigned int *)*a2)
  {
    if (v4)
    {
      atomic_fetch_add(v4, 1u);
      uint64_t result = (unsigned int *)a1[1];
    }
    a1[1] = v4;
    if (result) {
      sub_753C(result);
    }
    long long v5 = *(uint64_t (**)(void *))(*a1 + 152);
    return (unsigned int *)v5(a1);
  }
  return result;
}

void TI::CP::CPEval::compose_result_from_candidates(KB::DictionaryContainer **this@<X0>, const KB::Candidate **a2@<X1>, const ContinuousPathTestCase *a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v10 = (const KB::String *)((char *)a3 + 56);
  unsigned int matched = TI::CP::CPEval::match_index((TI::CP::CPEval *)this, (const KB::String *)((char *)a3 + 56), a2);
  int v12 = this[9];
  if (v12)
  {
    KB::DictionaryContainer::lookup(v12, v10);
    uint64_t v13 = v27;
    uint64_t v14 = v28;
    if (v27 == v28)
    {
      char v16 = 0;
    }
    else
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      uint64_t v23 = sub_BD98;
      uint64_t v24 = &unk_10678;
      uint64_t v25 = (TI::CP::CPEval *)this;
      uint64_t v26 = a3;
      unint64_t v15 = v22;
      do
      {
        char v16 = ((uint64_t (*)(void *, uint64_t))v23)(v15, v13);
        if (v16) {
          break;
        }
        v13 += 240;
      }
      while (v13 != v14);
    }
    uint64_t v29 = (void **)&v27;
    sub_D3D0(&v29);
  }
  else
  {
    char v16 = 1;
  }
  TI::CP::ContinuousPathTestResult::ContinuousPathTestResult((TI::CP::ContinuousPathTestResult *)a5, a4, v10, (const KB::CandidateCollection *)a2, matched, v16);
  if ((matched & 0x80000000) != 0)
  {
    if (*a2 != a2[1])
    {
      float v20 = expf(*((float *)*a2 + 186));
      *(double *)(a5 + 208) = logf(v20);
    }
    goto LABEL_16;
  }
  double v17 = *a2;
  float v18 = expf(*((float *)*a2 + 250 * matched + 186));
  *(double *)(a5 + 200) = logf(v18);
  if (matched)
  {
    float v19 = expf(*((float *)v17 + 186));
    *(double *)(a5 + 208) = logf(v19);
    if (matched <= 3) {
      goto LABEL_20;
    }
LABEL_16:
    if (*((_DWORD *)a2 + 24) != 2)
    {
      *(unsigned char *)(a5 + 219) = 1;
      return;
    }
    goto LABEL_22;
  }
  if ((unint64_t)(0x1CAC083126E978D5 * ((a2[1] - v17) >> 3)) >= 2)
  {
    float v21 = expf(*((float *)v17 + 436));
    *(double *)(a5 + 208) = logf(v21);
  }
LABEL_20:
  if (*((_DWORD *)a2 + 24) == 2)
  {
    *(unsigned char *)(a5 + 218) = 1;
    return;
  }
LABEL_22:
  *(unsigned char *)(a5 + 217) = 1;
}

id sub_BD98(uint64_t a1)
{
  uint64_t v2 = *(TI::CP::CPEval **)(a1 + 32);
  sub_D1B0((uint64_t)v5);
  id v3 = TI::CP::CPEval::is_match(v2, (const KB::Candidate *)v5, (const KB::String *)(*(void *)(a1 + 40) + 56));
  KB::Candidate::~Candidate((KB::Candidate *)v5);
  return v3;
}

void TI::CP::CPEval::evaluate_test_case_favonius(TI::CP::CPEval *this@<X0>, const ContinuousPathTestCase *a2@<X1>, TI::Favonius::FavoniusStrokeBuildManager *a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  (*(void (**)(TI::Favonius::FavoniusStrokeBuildManager *))(*(void *)a3 + 352))(a3);
  (*(void (**)(TI::Favonius::FavoniusStrokeBuildManager *))(*(void *)a3 + 144))(a3);
  *((_DWORD *)this + 39) = 1;
  uint64_t v8 = *((void *)a2 + 2) - *((void *)a2 + 1);
  if (v8)
  {
    unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 4);
    unsigned int v10 = 1;
    do
    {
      TI::Favonius::Touch::create();
      unint64_t v11 = v10;
      int v12 = v28[0];
      if (v10 == 1 || v9 != v10)
      {
        uint64_t v24 = v28[0];
        if (v28[0]) {
          atomic_fetch_add((atomic_uint *volatile)v28[0], 1u);
        }
        (*(void (**)(TI::Favonius::FavoniusStrokeBuildManager *, void ***, uint64_t, void))(*(void *)a3 + 24))(a3, &v24, 4294967294, 0);
        uint64_t v13 = (uint64_t)v24;
        if (!v24) {
          goto LABEL_13;
        }
      }
      else
      {
        uint64_t v23 = v28[0];
        if (v28[0]) {
          atomic_fetch_add((atomic_uint *volatile)v28[0], 1u);
        }
        (*(void (**)(TI::Favonius::FavoniusStrokeBuildManager *, void ***, uint64_t, void))(*(void *)a3 + 32))(a3, &v23, 4294967294, 0);
        uint64_t v13 = (uint64_t)v23;
        if (!v23) {
          goto LABEL_13;
        }
      }
      sub_D574(v13);
LABEL_13:
      if (v12) {
        sub_D574((uint64_t)v12);
      }
      unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 2) - *((void *)a2 + 1)) >> 4);
      ++v10;
    }
    while (v9 > v11);
  }
  KB::String::String((KB::String *)v30);
  uint64_t v14 = *((unsigned int *)this + 45);
  v29[0] = off_10728;
  v29[3] = v29;
  (*(void (**)(const KB::Candidate **__return_ptr, TI::Favonius::FavoniusStrokeBuildManager *, char *, char *, uint64_t, unsigned char *, uint64_t, void *, void))(*(void *)a3 + 72))(v19, a3, (char *)a2 + 192, (char *)a2 + 88, v14, v30, 5, v29, 0);
  sub_D900(v29);
  if (v19[1] != v19[0])
  {
    sub_58A4((uint64_t)v28, (uint64_t)v19[0]);
    KB::Candidate::capitalized_string(v27, (KB::Candidate *)v28);
    KB::String::String((KB::String *)v26);
    KB::String::String((KB::String *)v25);
    uint64_t v15 = KB::Candidate::string((KB::Candidate *)v28);
    (*(void (**)(void **__return_ptr, TI::Favonius::FavoniusStrokeBuildManager *, uint64_t *, unsigned char *, unsigned char *, void, uint64_t, uint64_t))(*(void *)a3 + 104))(__p, a3, v27, v26, v25, 0, v15, 1);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    KB::String::~String((KB::String *)v25);
    KB::String::~String((KB::String *)v26);
    KB::String::~String((KB::String *)v27);
    KB::Candidate::~Candidate((KB::Candidate *)v28);
  }
  TI::CP::CPEval::compose_result_from_candidates((KB::DictionaryContainer **)this, v19, a2, a4, a5);
  v28[0] = (void **)&v22;
  sub_6DF4(v28);
  v28[0] = (void **)&v21;
  sub_6DF4(v28);
  v28[0] = (void **)&v20;
  sub_6DF4(v28);
  v28[0] = (void **)v19;
  sub_6DF4(v28);
  KB::String::~String((KB::String *)v30);
}

void TI::CP::CPEval::evaluate_test_case_input_manager(TI::CP::CPEval *this@<X0>, const ContinuousPathTestCase *a2@<X1>, TIInputManager *a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  *((_DWORD *)this + 39) = 2;
  TIInputManager::clear_continuous_path(a3);
  char v16 = *(unsigned int **)a2;
  if (*(void *)a2) {
    atomic_fetch_add(*(atomic_uint *volatile *)a2, 1u);
  }
  TIInputManager::set_key_layout();
  if (v16) {
    sub_753C(v16);
  }
  KB::String::String((KB::String *)v17);
  TIInputManager::set_input_context();
  KB::String::~String((KB::String *)v17);
  KB::String::String((KB::String *)v17, (const KB::String *)((char *)a2 + 192));
  TIInputManager::set_input(a3, (const KB::String *)v17);
  KB::String::~String((KB::String *)v17);
  uint64_t v7 = *((void *)a2 + 2) - *((void *)a2 + 1);
  if (v7)
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (v7 >> 4);
    unsigned int v9 = 1;
    int v10 = 5;
    do
    {
      if (v8 == v9) {
        int v11 = 5;
      }
      else {
        int v11 = v10;
      }
      if (v9 == 1) {
        int v10 = 1;
      }
      else {
        int v10 = v11;
      }
      TIInputManager::add_touch();
      unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 2) - *((void *)a2 + 1)) >> 4);
    }
    while (v8 > v9++);
  }
  TIInputManager::lookup();
  sub_D4C8((uint64_t)v17);
  TI::CP::CPEval::compose_result_from_candidates((KB::DictionaryContainer **)this, v18, a2, a4, a5);
  KB::Candidate::~Candidate((KB::Candidate *)v17);
  KB::String::~String((KB::String *)&v22);
  v17[0] = (void **)&v21;
  sub_6DF4(v17);
  v17[0] = (void **)&v20;
  sub_6DF4(v17);
  v17[0] = (void **)&v19;
  sub_6DF4(v17);
  v17[0] = (void **)v18;
  sub_6DF4(v17);
}

void TI::CP::CPEval::create_favonius(uint64_t a1, void *a2)
{
  id v2 = a2;
  operator new();
}

void TI::CP::CPEval::create_input_manager(uint64_t a1, void *a2)
{
  id v2 = a2;
  operator new();
}

char *TI::CP::CPEval::recognizer_description(uint64_t a1, unsigned int a2)
{
  if (a2 > 3) {
    return (char *)&unk_EE1E;
  }
  else {
    return (&off_10760)[a2];
  }
}

void sub_D05C(uint64_t a1)
{
  sub_9D34(a1);

  operator delete();
}

void *sub_D094@<X0>(atomic_uint **a1@<X1>, void *a2@<X8>)
{
  uint64_t result = operator new(0x28uLL);
  result[1] = 0;
  result[2] = 0;
  void *result = off_106A8;
  long long v5 = *a1;
  result[4] = v5;
  if (v5) {
    atomic_fetch_add(v5, 1u);
  }
  *a2 = result + 3;
  a2[1] = result;
  return result;
}

void sub_D114(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_106A8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_D134(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_106A8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_D188(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

uint64_t sub_D1B0(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = a1 + 24;
  *(void *)(a1 + 16) = 3;
  *(_OWORD *)(a1 + 744) = xmmword_EDC0;
  *(void *)(a1 + 760) = 0xFF8000003F800000;
  *(void *)(a1 + 840) = 0;
  *(_OWORD *)(a1 + 776) = 0u;
  *(_OWORD *)(a1 + 792) = 0u;
  *(_OWORD *)(a1 + 808) = 0u;
  *(_OWORD *)(a1 + 824) = 0u;
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)(a1 + 848));
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)(a1 + 856));
  *(void *)(a1 + 880) = 0;
  *(_OWORD *)(a1 + 864) = 0u;
  KB::String::String((KB::String *)(a1 + 888));
  *(_WORD *)(a1 + 944) = 0;
  *(void *)(a1 + 936) = 0;
  *(_OWORD *)(a1 + 920) = 0u;
  *(_DWORD *)(a1 + 960) = 0;
  *(unsigned char *)(a1 + 964) = 0;
  *(_OWORD *)(a1 + 976) = 0u;
  *(_DWORD *)(a1 + 992) = 0;
  KB::Candidate::append();
  return a1;
}

void *sub_D26C(void *result, void *a2)
{
  id v3 = result + 2;
  id v2 = (void *)*result;
  uint64_t v4 = a2 + 2;
  long long v5 = (void *)*a2;
  if ((void *)*result == result + 2)
  {
    if (v5 == v4)
    {
      for (uint64_t i = 0; i != 720; ++i)
      {
        char v11 = *((unsigned char *)v2 + i);
        *((unsigned char *)v2 + i) = *((unsigned char *)v4 + i);
        *((unsigned char *)v4 + i) = v11;
      }
    }
    else
    {
      uint64_t v6 = 0;
      void *result = v5;
      *a2 = v4;
      do
      {
        char v7 = *((unsigned char *)v2 + v6);
        *((unsigned char *)v2 + v6) = *((unsigned char *)v4 + v6);
        *((unsigned char *)v4 + v6++) = v7;
      }
      while (v6 != 720);
    }
  }
  else if (v5 == v4)
  {
    uint64_t v8 = 0;
    *a2 = v2;
    void *result = v3;
    do
    {
      char v9 = *((unsigned char *)v3 + v8);
      *((unsigned char *)v3 + v8) = *((unsigned char *)v5 + v8);
      *((unsigned char *)v5 + v8++) = v9;
    }
    while (v8 != 720);
  }
  else
  {
    void *result = v5;
    *a2 = v2;
  }
  uint64_t v12 = result[1];
  result[1] = a2[1];
  a2[1] = v12;
  return result;
}

uint64_t sub_D32C(uint64_t a1)
{
  *(void *)(a1 + 8) = 0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_DWORD *)(a1 + 112) = 7;
  *(void *)(a1 + 120) = 0x4028000000000000;
  *(_DWORD *)(a1 + 128) = 8;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  *(void *)(a1 + 200) = 0;
  id v2 = (TI::CP::ShapeStore *)TI::CP::ShapeStore::ShapeStore();
  *(_DWORD *)(a1 + 280) = 0;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_DWORD *)(a1 + 320) = 1065353216;
  *(unsigned char *)(a1 + 328) = 0;
  *(_DWORD *)(a1 + 280) = TI::CP::ShapeStore::num_records(v2);
  return a1;
}

void sub_D3D0(void ***a1)
{
  unsigned int v1 = *a1;
  id v2 = **a1;
  if (v2)
  {
    uint64_t v4 = v1[1];
    long long v5 = v2;
    if (v4 != v2)
    {
      do
        sub_D454((uint64_t)v4 - 240);
      while (v4 != v2);
      long long v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_D454(uint64_t a1)
{
  sub_72A8(a1 + 200);
  KB::String::~String((KB::String *)(a1 + 160));
  KB::String::~String((KB::String *)(a1 + 64));
  if (*(unsigned __int16 *)(a1 + 32) >= 0xFu && *(void *)(a1 + 40)) {
    operator delete[]();
  }

  KB::String::~String((KB::String *)a1);
}

uint64_t sub_D4C8(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = a1 + 24;
  *(void *)(a1 + 16) = 3;
  *(_OWORD *)(a1 + 744) = xmmword_EDC0;
  *(void *)(a1 + 760) = 0xFF8000003F800000;
  *(void *)(a1 + 840) = 0;
  *(_OWORD *)(a1 + 776) = 0u;
  *(_OWORD *)(a1 + 792) = 0u;
  *(_OWORD *)(a1 + 808) = 0u;
  *(_OWORD *)(a1 + 824) = 0u;
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)(a1 + 848));
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)(a1 + 856));
  *(void *)(a1 + 880) = 0;
  *(_OWORD *)(a1 + 864) = 0u;
  KB::String::String((KB::String *)(a1 + 888));
  *(_WORD *)(a1 + 944) = 0;
  *(void *)(a1 + 936) = 0;
  *(_OWORD *)(a1 + 920) = 0u;
  *(_DWORD *)(a1 + 960) = 0;
  *(unsigned char *)(a1 + 964) = 0;
  *(_OWORD *)(a1 + 976) = 0u;
  *(_DWORD *)(a1 + 992) = 0;
  return a1;
}

uint64_t sub_D574(uint64_t result)
{
  unsigned int v1 = atomic_load((unsigned int *)result);
  if (v1 == 1)
  {
    id v2 = *(unsigned int **)(result + 56);
    if (v2) {
      sub_753C(v2);
    }
    operator delete();
  }
  atomic_fetch_add((atomic_uint *volatile)result, 0xFFFFFFFF);
  return result;
}

void sub_D5E8()
{
}

void *sub_D5FC()
{
  uint64_t result = operator new(0x10uLL);
  void *result = off_106E0;
  return result;
}

void sub_D634(uint64_t a1, void *a2)
{
  *a2 = off_106E0;
}

void sub_D65C(int a1, KB::Candidate *this, float *a3)
{
  float v4 = *a3;
  float v5 = *((float *)this + 187);
  float v6 = *((float *)this + 189);
  float v7 = *((float *)this + 190);
  uint64_t v8 = (char *)this + 764;
  uint64_t v16 = *(void *)((char *)this + 764);
  int v17 = *((_DWORD *)this + 193);
  if ((KB::Candidate::has_from_named_entities(this) & 1) != 0
    || KB::Candidate::has_from_supplemental_lexicon(this))
  {
    float v4 = v4 * 0.8;
  }
  float v9 = logf(v4);
  *((float *)this + 186) = v5 + (float)(v7 * (float)(v6 + v9));
  *((float *)this + 187) = v5;
  *((float *)this + 188) = v9;
  *((float *)this + 189) = v6;
  *((float *)this + 190) = v7;
  *(void *)uint64_t v8 = v16;
  *((_DWORD *)v8 + 2) = v17;
  KB::cf_mutable_dictionary((uint64_t *)&cf, v10);
  char v11 = (__CFDictionary *)cf;
  float v12 = expf(*((float *)this + 186));
  KB::cf_number((uint64_t *)&value, v13, v12);
  CFDictionarySetValue(v11, @"refinement_omega", value);
  if (value) {
    CFRelease(value);
  }
  KB::Candidate::add_sources_info(this, @"refinement", (const __CFDictionary *)cf);
  if (cf) {
    CFRelease(cf);
  }
}

void *sub_D780(void *a1)
{
  id v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void sub_D808()
{
}

void *sub_D81C()
{
  uint64_t result = operator new(0x10uLL);
  void *result = off_10728;
  return result;
}

void sub_D854(uint64_t a1, void *a2)
{
  *a2 = off_10728;
}

void sub_D87C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  id v3 = *(void **)a3;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)a3 = 0;
  sub_56D8(v4, a2);
  if (v3) {
    operator delete(v3);
  }
  uint64_t v8 = (void **)&v7;
  sub_6DF4(&v8);
  uint64_t v8 = (void **)&v6;
  sub_6DF4(&v8);
  uint64_t v8 = (void **)&v5;
  sub_6DF4(&v8);
  uint64_t v8 = (void **)v4;
  sub_6DF4(&v8);
}

void *sub_D900(void *a1)
{
  id v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void sub_D984()
{
  __cxa_atexit((void (*)(void *))sub_264C, &unk_14868, &dword_0);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return _CFURLCreateWithFileSystemPath(allocator, filePath, pathStyle, isDirectory);
}

uint64_t LMStreamTokenizerCreate()
{
  return _LMStreamTokenizerCreate();
}

uint64_t LMStreamTokenizerPushBytes()
{
  return _LMStreamTokenizerPushBytes();
}

uint64_t LMStreamTokenizerRelease()
{
  return _LMStreamTokenizerRelease();
}

uint64_t TILexiconIDForLocaleIdentifier()
{
  return _TILexiconIDForLocaleIdentifier();
}

uint64_t TI_KB_USER_DIRECTORY()
{
  return _TI_KB_USER_DIRECTORY();
}

uint64_t UIKeyboardDeltaLexiconPathForInputMode()
{
  return _UIKeyboardDeltaLexiconPathForInputMode();
}

uint64_t UIKeyboardDynamicDictionaryFile()
{
  return _UIKeyboardDynamicDictionaryFile();
}

uint64_t UIKeyboardStaticUnigramsFile()
{
  return _UIKeyboardStaticUnigramsFile();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t __createAndLoadLanguageModel(NSString *a1, NSString *a2, BOOL a3)
{
  return __createAndLoadLanguageModel(a1, a2, a3);
}

uint64_t __createAndLoadDictionaryContainer(NSString *a1, NSString *a2)
{
  return __createAndLoadDictionaryContainer(a1, a2);
}

uint64_t TIInputManager::set_key_layout()
{
  return TIInputManager::set_key_layout();
}

uint64_t TIInputManager::set_typing_model()
{
  return TIInputManager::set_typing_model();
}

uint64_t TIInputManager::set_input_context()
{
  return TIInputManager::set_input_context();
}

uint64_t TIInputManager::set_search_algorithm()
{
  return TIInputManager::set_search_algorithm();
}

uint64_t TIInputManager::clear_continuous_path(TIInputManager *this)
{
  return TIInputManager::clear_continuous_path(this);
}

uint64_t TIInputManager::set_locale_identifier(TIInputManager *a1, const KB::String *a2)
{
  return TIInputManager::set_locale_identifier(a1, a2);
}

uint64_t TIInputManager::set_uses_text_checker(TIInputManager *this, BOOL a2)
{
  return TIInputManager::set_uses_text_checker(this, a2);
}

uint64_t TIInputManager::set_candidate_refinery()
{
  return TIInputManager::set_candidate_refinery();
}

uint64_t TIInputManager::set_candidate_generator()
{
  return TIInputManager::set_candidate_generator();
}

uint64_t TIInputManager::lookup()
{
  return TIInputManager::lookup();
}

uint64_t TIInputManager::add_touch()
{
  return TIInputManager::add_touch();
}

uint64_t TIInputManager::set_input(TIInputManager *a1, const KB::String *a2)
{
  return TIInputManager::set_input(a1, a2);
}

uint64_t TIInputManager::TIInputManager()
{
  return TIInputManager::TIInputManager();
}

uint64_t language_modeling::v1::LinguisticContext::LinguisticContext()
{
  return language_modeling::v1::LinguisticContext::LinguisticContext();
}

uint64_t language_modeling::v1::LinguisticContext::LinguisticContext(language_modeling::v1::LinguisticContext *a1, const language_modeling::v1::LinguisticContext *a2)
{
  return language_modeling::v1::LinguisticContext::LinguisticContext(a1, a2);
}

uint64_t language_modeling::v1::LinguisticContext::LinguisticContext(language_modeling::v1::LinguisticContext *this)
{
  return language_modeling::v1::LinguisticContext::LinguisticContext(this);
}

void language_modeling::v1::LinguisticContext::~LinguisticContext(language_modeling::v1::LinguisticContext *this)
{
}

uint64_t language_modeling::v1::LinguisticContext::operator=()
{
  return language_modeling::v1::LinguisticContext::operator=();
}

uint64_t KB::ByteString::copy()
{
  return KB::ByteString::copy();
}

uint64_t KB::ByteString::operator=()
{
  return KB::ByteString::operator=();
}

uint64_t KB::std_string(KB *this, NSString *a2)
{
  return KB::std_string(this, a2);
}

uint64_t KB::utf8_string(KB *this, NSString *a2)
{
  return KB::utf8_string(this, a2);
}

uint64_t KB::LanguageModel::find_token_id_for_word()
{
  return KB::LanguageModel::find_token_id_for_word();
}

uint64_t KB::LanguageModelStr::LanguageModelStr()
{
  return KB::LanguageModelStr::LanguageModelStr();
}

uint64_t KB::CandidateCollection::normalize_scores(KB::CandidateCollection *this)
{
  return KB::CandidateCollection::normalize_scores(this);
}

uint64_t KB::DictionaryContainer::create_multilexicon()
{
  return KB::DictionaryContainer::create_multilexicon();
}

void KB::DictionaryContainer::~DictionaryContainer(KB::DictionaryContainer *this)
{
}

uint64_t KB::LanguageModelConfig::LanguageModelConfig()
{
  return KB::LanguageModelConfig::LanguageModelConfig();
}

uint64_t KB::LanguageModelContext::append()
{
  return KB::LanguageModelContext::append();
}

uint64_t KB::cf_mutable_dictionary(KB *this)
{
  return KB::cf_mutable_dictionary(this);
}

uint64_t KB::LanguageModelContainer::LanguageModelContainer()
{
  return KB::LanguageModelContainer::LanguageModelContainer();
}

uint64_t KB::NgramCandidateRefinery::create()
{
  return KB::NgramCandidateRefinery::create();
}

uint64_t KB::LanguageModelLexiconGroup::set_lexicon_weight(KB::LanguageModelLexiconGroup *this, unsigned int a2, float a3)
{
  return KB::LanguageModelLexiconGroup::set_lexicon_weight(this, a2, a3);
}

uint64_t KB::LanguageModelLexiconGroup::LanguageModelLexiconGroup()
{
  return KB::LanguageModelLexiconGroup::LanguageModelLexiconGroup();
}

uint64_t KB::String::hash(KB::String *this, const char *a2, unsigned int a3)
{
  return KB::String::hash(this, a2, a3);
}

uint64_t KB::String::String()
{
  return KB::String::String();
}

uint64_t KB::String::String(KB::String *this, const char *a2)
{
  return KB::String::String(this, a2);
}

uint64_t KB::String::String(KB::String *this, const KB::String *a2)
{
  return KB::String::String(this, a2);
}

uint64_t KB::String::String(KB::String *this, unsigned int a2)
{
  return KB::String::String(this, a2);
}

uint64_t KB::String::String(KB::String *this)
{
  return KB::String::String(this);
}

void KB::String::~String(KB::String *this)
{
}

uint64_t KB::String::operator=()
{
  return KB::String::operator=();
}

uint64_t KB::Candidate::add_sources_info(KB::Candidate *this, const __CFString *a2, const __CFDictionary *a3)
{
  return KB::Candidate::add_sources_info(this, a2, a3);
}

uint64_t KB::Candidate::append()
{
  return KB::Candidate::append();
}

void KB::Candidate::~Candidate(KB::Candidate *this)
{
}

uint64_t KB::cf_number(KB *this, double a2)
{
  return KB::cf_number(this, a2);
}

uint64_t TI::TIInputRecognizer::TIInputRecognizer()
{
  return TI::TIInputRecognizer::TIInputRecognizer();
}

uint64_t TI::CP::ShapeStore::num_records(TI::CP::ShapeStore *this)
{
  return TI::CP::ShapeStore::num_records(this);
}

uint64_t TI::CP::ShapeStore::shape_count_for_word()
{
  return TI::CP::ShapeStore::shape_count_for_word();
}

uint64_t TI::CP::ShapeStore::ShapeStore()
{
  return TI::CP::ShapeStore::ShapeStore();
}

uint64_t TI::CP::TIPathRecognizerEnsemble::TIPathRecognizerEnsemble()
{
  return TI::CP::TIPathRecognizerEnsemble::TIPathRecognizerEnsemble();
}

uint64_t TI::CP::Path::append(TI::CP::Path *this, CGPoint a2, double a3, double a4, double a5, double a6)
{
  return TI::CP::Path::append(this, a2, a3, a4, a5, a6);
}

uint64_t TI::CP::Search::Search()
{
  return TI::CP::Search::Search();
}

uint64_t TI::CP::operator==()
{
  return TI::CP::operator==();
}

uint64_t TI::Favonius::KeyboardLayout::create()
{
  return TI::Favonius::KeyboardLayout::create();
}

uint64_t TI::Favonius::UnigramTypingModel::create()
{
  return TI::Favonius::UnigramTypingModel::create();
}

uint64_t TI::Favonius::BeamSearchAlgorithm::create(TI::Favonius::BeamSearchAlgorithm *this, BOOL a2, double a3, double a4, unint64_t a5, unint64_t a6)
{
  return TI::Favonius::BeamSearchAlgorithm::create(this, a2, a3, a4, a5, a6);
}

uint64_t TI::Favonius::UnigramCandidateGenerator::create()
{
  return TI::Favonius::UnigramCandidateGenerator::create();
}

uint64_t TI::Favonius::FavoniusStrokeBuildManager::FavoniusStrokeBuildManager(TI::Favonius::FavoniusStrokeBuildManager *this)
{
  return TI::Favonius::FavoniusStrokeBuildManager::FavoniusStrokeBuildManager(this);
}

uint64_t TI::Favonius::Touch::create()
{
  return TI::Favonius::Touch::create();
}

uint64_t TI::Favonius::LayoutKey::create()
{
  return TI::Favonius::LayoutKey::create();
}

uint64_t KB::CollatorWrapper::sortkey_for_string(KB::CollatorWrapper *this, const KB::String *a2)
{
  return KB::CollatorWrapper::sortkey_for_string(this, a2);
}

uint64_t KB::CollatorWrapper::sortkey_equal_strings(KB::CollatorWrapper *this, const KB::String *a2, const KB::String *a3)
{
  return KB::CollatorWrapper::sortkey_equal_strings(this, a2, a3);
}

uint64_t KB::DictionaryContainer::lookup(KB::DictionaryContainer *this, const KB::String *a2)
{
  return KB::DictionaryContainer::lookup(this, a2);
}

uint64_t KB::String::equal(KB::String *this, const KB::String *a2)
{
  return KB::String::equal(this, a2);
}

uint64_t KB::Candidate::capitalized_string(KB::Candidate *this)
{
  return KB::Candidate::capitalized_string(this);
}

uint64_t KB::Candidate::has_from_named_entities(KB::Candidate *this)
{
  return KB::Candidate::has_from_named_entities(this);
}

uint64_t KB::Candidate::has_from_supplemental_lexicon(KB::Candidate *this)
{
  return KB::Candidate::has_from_supplemental_lexicon(this);
}

uint64_t KB::Candidate::string(KB::Candidate *this)
{
  return KB::Candidate::string(this);
}

uint64_t TI::ConfidenceModel::update_confidence_for_candidates(TI::ConfidenceModel *this, KB::CandidateCollection *a2)
{
  return TI::ConfidenceModel::update_confidence_for_candidates(this, a2);
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return std::string::operator=(this, __str);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

uint64_t deltaUnigramsFilePathForInputMode()
{
  return _deltaUnigramsFilePathForInputMode();
}

uint64_t dynamicFilePathForInputMode()
{
  return _dynamicFilePathForInputMode();
}

float expf(float a1)
{
  return _expf(a1);
}

void free(void *a1)
{
}

float logf(float a1)
{
  return _logf(a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t phrasesFilePathForInputMode()
{
  return _phrasesFilePathForInputMode();
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int putchar(int a1)
{
  return _putchar(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

uint64_t unigramsFilePathForInputMode()
{
  return _unigramsFilePathForInputMode();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_alignedEntries(void *a1, const char *a2, ...)
{
  return [a1 alignedEntries];
}

id objc_msgSend_alignedTouches(void *a1, const char *a2, ...)
{
  return [a1 alignedTouches];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allowsSpaceCorrections(void *a1, const char *a2, ...)
{
  return [a1 allowsSpaceCorrections];
}

id objc_msgSend_completionsShouldSharePrefix(void *a1, const char *a2, ...)
{
  return [a1 completionsShouldSharePrefix];
}

id objc_msgSend_continuousPathCompletesWords(void *a1, const char *a2, ...)
{
  return [a1 continuousPathCompletesWords];
}

id objc_msgSend_continuousPathDetectPause(void *a1, const char *a2, ...)
{
  return [a1 continuousPathDetectPause];
}

id objc_msgSend_continuousPathLanguageWeight(void *a1, const char *a2, ...)
{
  return [a1 continuousPathLanguageWeight];
}

id objc_msgSend_continuousPathParams(void *a1, const char *a2, ...)
{
  return [a1 continuousPathParams];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_cpConfidenceModelType(void *a1, const char *a2, ...)
{
  return [a1 cpConfidenceModelType];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_doesSupportInlineCompletion(void *a1, const char *a2, ...)
{
  return [a1 doesSupportInlineCompletion];
}

id objc_msgSend_dynamicResourcePath(void *a1, const char *a2, ...)
{
  return [a1 dynamicResourcePath];
}

id objc_msgSend_expectedString(void *a1, const char *a2, ...)
{
  return [a1 expectedString];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_highConfAlignedSubSegment(void *a1, const char *a2, ...)
{
  return [a1 highConfAlignedSubSegment];
}

id objc_msgSend_inSessionAlignmentConfidence(void *a1, const char *a2, ...)
{
  return [a1 inSessionAlignmentConfidence];
}

id objc_msgSend_inputStem(void *a1, const char *a2, ...)
{
  return [a1 inputStem];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isContinuousPathConversion(void *a1, const char *a2, ...)
{
  return [a1 isContinuousPathConversion];
}

id objc_msgSend_layoutID(void *a1, const char *a2, ...)
{
  return [a1 layoutID];
}

id objc_msgSend_layouts(void *a1, const char *a2, ...)
{
  return [a1 layouts];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_locale(void *a1, const char *a2, ...)
{
  return [a1 locale];
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localeIdentifier];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_originalWord(void *a1, const char *a2, ...)
{
  return [a1 originalWord];
}

id objc_msgSend_shapeStoreResourceDir(void *a1, const char *a2, ...)
{
  return [a1 shapeStoreResourceDir];
}

id objc_msgSend_success(void *a1, const char *a2, ...)
{
  return [a1 success];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_usesContinuousPathProgressiveCandidates(void *a1, const char *a2, ...)
{
  return [a1 usesContinuousPathProgressiveCandidates];
}

id objc_msgSend_usesContinuousPathRetrocorrection(void *a1, const char *a2, ...)
{
  return [a1 usesContinuousPathRetrocorrection];
}

id objc_msgSend_usesStemSuffixCorrectionFactor(void *a1, const char *a2, ...)
{
  return [a1 usesStemSuffixCorrectionFactor];
}

id objc_msgSend_usesTextChecker(void *a1, const char *a2, ...)
{
  return [a1 usesTextChecker];
}