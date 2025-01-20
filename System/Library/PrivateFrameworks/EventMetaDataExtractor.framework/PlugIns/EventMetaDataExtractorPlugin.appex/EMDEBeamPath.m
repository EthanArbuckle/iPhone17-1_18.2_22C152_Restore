@interface EMDEBeamPath
- (BOOL)capitaliseNextWord;
- (EMDEBeamPath)initWithState:(__CFArray *)a3 allowedWords:()basic_string<char;
- (__CFArray)state;
- (basic_string<char,)allowedWords;
- (basic_string<char,)currentPrediction;
- (basic_string<char,)currentWord;
- (float)averageScore;
- (float)score;
- (id).cxx_construct;
- (id)initChildBeamFrom:(id)a3 additionalToken:()pair<int state:(float>)a4 lengthPenalty:(__CFArray *)a5 validate:(float)a6;
- (id)initFinishedBeamFrom:(id)a3 additionalToken:()pair<int lengthPenalty:(float>)a4 validate:(float)a5;
- (unsigned)createBeamForPrefixBasedTokeniserFrom:(id)a3 additionalToken:()pair<int validate:(float>)a4;
- (unsigned)createBeamForSuffixBasedTokeniserFrom:(id)a3 additionalToken:()pair<int validate:(float>)a4;
- (vector<int,)tokens;
- (void)setState:(__CFArray *)a3;
@end

@implementation EMDEBeamPath

- (EMDEBeamPath)initWithState:(__CFArray *)a3 allowedWords:()basic_string<char
{
  v4 = self;
  if (a3)
  {
    v14.receiver = self;
    v14.super_class = (Class)EMDEBeamPath;
    v7 = [(EMDEBeamPath *)&v14 init];
    v8 = +[EMDEUtils config];
    v9 = [v8 objectForKeyedSubscript:@"EMDE_SEPARATOR_TOKEN"];
    unsigned int __src = [v9 intValue];
    sub_100011A78(v7 + 32, (char *)&__src, (uint64_t)&v14, 1uLL);

    std::string::assign((std::string *)(v7 + 56), "");
    std::string::assign((std::string *)(v7 + 80), "");
    *((void *)v7 + 3) = a3;
    *((_DWORD *)v7 + 3) = 0;
    *((_DWORD *)v7 + 4) = 0;
    std::string::operator=((std::string *)(v7 + 104), (const std::string *)a4);
    v7[8] = 0;
    v4 = v7;
    v10 = v4;
  }
  else
  {
    v11 = modelLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10008E888(v11);
    }

    v10 = 0;
  }

  return v10;
}

- (id)initFinishedBeamFrom:(id)a3 additionalToken:()pair<int lengthPenalty:(float>)a4 validate:(float)a5
{
  int v6 = a6;
  id v10 = a3;
  if (!v10)
  {
    v17 = modelLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10008E8CC(v17);
    }

    goto LABEL_52;
  }
  v51.receiver = self;
  v51.super_class = (Class)EMDEBeamPath;
  v11 = [(EMDEBeamPath *)&v51 init];
  self = (EMDEBeamPath *)v11;
  [v10 tokens];
  v12 = (void *)*((void *)v11 + 4);
  if (v12)
  {
    *((void *)v11 + 5) = v12;
    operator delete(v12);
    *((void *)v11 + 4) = 0;
    *((void *)v11 + 5) = 0;
    *((void *)v11 + 6) = 0;
  }
  unint64_t v14 = __p.__r_.__value_.__r.__words[2];
  size = (char *)__p.__r_.__value_.__l.__size_;
  *((void *)v11 + 6) = *((void *)&__p.__r_.__value_.__l + 2);
  v15 = (char *)__p.__r_.__value_.__r.__words[0];
  *((void *)v11 + 4) = __p.__r_.__value_.__r.__words[0];
  *((void *)v11 + 5) = size;
  if ((unint64_t)size >= v14)
  {
    uint64_t v18 = (size - v15) >> 2;
    unint64_t v19 = v18 + 1;
    if ((unint64_t)(v18 + 1) >> 62) {
      sub_100004204();
    }
    uint64_t v20 = v14 - (void)v15;
    if (v20 >> 1 > v19) {
      unint64_t v19 = v20 >> 1;
    }
    if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v21 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v21 = v19;
    }
    if (v21)
    {
      v22 = (char *)sub_10000A17C((uint64_t)(v11 + 48), v21);
      v15 = (char *)*((void *)v11 + 4);
      size = (char *)*((void *)v11 + 5);
    }
    else
    {
      v22 = 0;
    }
    v23 = (int *)&v22[4 * v18];
    v24 = &v22[4 * v21];
    int *v23 = a4.var0;
    v16 = v23 + 1;
    while (size != v15)
    {
      int v25 = *((_DWORD *)size - 1);
      size -= 4;
      *--v23 = v25;
    }
    *((void *)v11 + 4) = v23;
    *((void *)v11 + 5) = v16;
    *((void *)v11 + 6) = v24;
    if (v15) {
      operator delete(v15);
    }
  }
  else
  {
    *(_DWORD *)size = a4.var0;
    v16 = size + 4;
  }
  *((void *)v11 + 5) = v16;
  [v10 allowedWords];
  v26 = (std::string *)(v11 + 104);
  if (v11[127] < 0) {
    operator delete(v26->__r_.__value_.__l.__data_);
  }
  *(_OWORD *)&v26->__r_.__value_.__l.__data_ = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
  *((void *)v11 + 15) = *((void *)&__p.__r_.__value_.__l + 2);
  *((void *)v11 + 3) = 0;
  if (v6)
  {
    [v10 currentWord];
    unsigned int v27 = +[EMDEUtils validateAndUpdateAllowedWords:v11 + 104 forWord:&v48 isComplete:1];
    unsigned int v28 = v27;
    if ((v49 & 0x80000000) == 0)
    {
      if (v27) {
        goto LABEL_28;
      }
LABEL_52:
      v43 = 0;
      goto LABEL_53;
    }
    operator delete(v48);
    if (!v28) {
      goto LABEL_52;
    }
  }
LABEL_28:
  [v10 currentWord];
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::size_type v37 = __p.__r_.__value_.__l.__size_;
    operator delete(__p.__r_.__value_.__l.__data_);
    if (v37) {
      goto LABEL_30;
    }
LABEL_45:
    [v10 currentPrediction];
    v38 = (void **)(v11 + 56);
    if (*((char *)&self->_currentPrediction.__r_.__value_.var0.var1 + 23) < 0) {
      operator delete(*v38);
    }
    *(std::string *)v38 = __p;
    goto LABEL_48;
  }
  if (!*((unsigned char *)&__p.__r_.__value_.__s + 23)) {
    goto LABEL_45;
  }
LABEL_30:
  [v10 currentPrediction];
  v29 = std::string::append(&v47, " ");
  long long v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
  __p.__r_.__value_.__r.__words[2] = v29->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v30;
  v29->__r_.__value_.__l.__size_ = 0;
  v29->__r_.__value_.__r.__words[2] = 0;
  v29->__r_.__value_.__r.__words[0] = 0;
  [v10 currentWord];
  if ((v46 & 0x80u) == 0) {
    v31 = v45;
  }
  else {
    v31 = (void **)v45[0];
  }
  if ((v46 & 0x80u) == 0) {
    std::string::size_type v32 = v46;
  }
  else {
    std::string::size_type v32 = (std::string::size_type)v45[1];
  }
  v33 = std::string::append(&__p, (const std::string::value_type *)v31, v32);
  v34 = (char *)v33->__r_.__value_.__r.__words[0];
  v52[0] = v33->__r_.__value_.__l.__size_;
  *(void *)((char *)v52 + 7) = *(std::string::size_type *)((char *)&v33->__r_.__value_.__r.__words[1] + 7);
  char v35 = HIBYTE(v33->__r_.__value_.__r.__words[2]);
  v33->__r_.__value_.__l.__size_ = 0;
  v33->__r_.__value_.__r.__words[2] = 0;
  v33->__r_.__value_.__r.__words[0] = 0;
  if (*((char *)&self->_currentPrediction.__r_.__value_.var0.var1 + 23) < 0) {
    operator delete(self->_currentPrediction.__r_.__value_.var0.var1.__data_);
  }
  unint64_t v36 = v52[0];
  self->_currentPrediction.__r_.__value_.var0.var1.__data_ = v34;
  self->_currentPrediction.__r_.__value_.var0.var1.__size_ = v36;
  *(unint64_t *)((char *)&self->_currentPrediction.__r_.__value_.var0.var1.__size_ + 7) = *(void *)((char *)v52 + 7);
  *((unsigned char *)&self->_currentPrediction.__r_.__value_.var0.var1 + 23) = v35;
  if ((char)v46 < 0) {
    operator delete(v45[0]);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v47.__r_.__value_.__l.__data_);
  }
LABEL_48:
  [v10 score];
  float v40 = v39 + a4.var1;
  self->_score = v39 + a4.var1;
  [(EMDEBeamPath *)self tokens];
  v41 = (void *)__p.__r_.__value_.__r.__words[0];
  float v42 = v40
      / pow((double)(unint64_t)(((uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 2)- 1), a5);
  self->_averageScore = v42;
  if (v41)
  {
    __p.__r_.__value_.__l.__size_ = (std::string::size_type)v41;
    operator delete(v41);
  }
  std::string::assign(v26, "");
  self = self;
  v43 = self;
LABEL_53:

  return v43;
}

- (unsigned)createBeamForSuffixBasedTokeniserFrom:(id)a3 additionalToken:()pair<int validate:(float>)a4
{
  int v5 = a5;
  id v8 = a3;
  +[EMDEUtils getTokenForTokenID:a4];
  v9 = +[EMDEUtils config];
  id v10 = [v9 objectForKeyedSubscript:@"EMDE_TOKENISER_UPPERCASE_TOKEN_ID"];
  if (v10)
  {
    v11 = +[EMDEUtils config];
    v12 = [v11 objectForKeyedSubscript:@"EMDE_TOKENISER_UPPERCASE_TOKEN_ID"];
    BOOL v13 = [v12 intValue] == a4.var0;

    if (v13)
    {
      self->_capitaliseNextWord = 1;
      if (v8) {
        [v8 currentWord];
      }
      else {
        memset(&v47, 0, sizeof(v47));
      }
      p_std::string::size_type var0 = &self->_currentPrediction.__r_.var0;
      if (self->_currentWord.__r_.__value_.var0.var0.__data_[7] < 0) {
        operator delete(*(void **)p_var0);
      }
      *(_OWORD *)p_std::string::size_type var0 = *(_OWORD *)&v47.__r_.__value_.__l.__data_;
      self->_currentWord.__r_.__value_.var0.var1.__data_ = (char *)v47.__r_.__value_.__r.__words[2];
      LOBYTE(p_var0) = 1;
      goto LABEL_95;
    }
  }
  else
  {
  }
  if ([v8 capitaliseNextWord])
  {
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_str = &__str;
    }
    else {
      p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
    }
    std::string::value_type v15 = __toupper(p_str->__r_.__value_.__s.__data_[0]);
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v16 = &__str;
    }
    else {
      v16 = (std::string *)__str.__r_.__value_.__r.__words[0];
    }
    v16->__r_.__value_.__s.__data_[0] = v15;
  }
  LOBYTE(v17) = *((unsigned char *)&__str.__r_.__value_.__s + 23);
  if ((SHIBYTE(__str.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (*((unsigned char *)&__str.__r_.__value_.__s + 23))
    {
      std::string::size_type v18 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
      goto LABEL_18;
    }
LABEL_23:
    if (v8)
    {
      [v8 currentWord];
      LOBYTE(v17) = *((unsigned char *)&__str.__r_.__value_.__s + 23);
    }
    else
    {
      memset(&v47, 0, sizeof(v47));
    }
    if ((v17 & 0x80u) == 0) {
      uint64_t v20 = &__str;
    }
    else {
      uint64_t v20 = (std::string *)__str.__r_.__value_.__r.__words[0];
    }
    if ((v17 & 0x80u) == 0) {
      std::string::size_type size = v17;
    }
    else {
      std::string::size_type size = __str.__r_.__value_.__l.__size_;
    }
    v22 = std::string::append(&v47, (const std::string::value_type *)v20, size);
    uint64_t v23 = 0;
    goto LABEL_47;
  }
  std::string::size_type v18 = __str.__r_.__value_.__l.__size_;
  if (!__str.__r_.__value_.__l.__size_) {
    goto LABEL_23;
  }
LABEL_18:
  unint64_t v19 = (std::string *)__str.__r_.__value_.__r.__words[0];
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    unint64_t v19 = &__str;
  }
  if (v19->__r_.__value_.__s.__data_[v18 - 1] != 95) {
    goto LABEL_23;
  }
  if (v8)
  {
    [v8 currentWord];
    LOBYTE(v17) = *((unsigned char *)&__str.__r_.__value_.__s + 23);
  }
  else
  {
    memset(&v47, 0, sizeof(v47));
  }
  std::string::size_type v17 = v17;
  if ((v17 & 0x80u) != 0) {
    std::string::size_type v17 = __str.__r_.__value_.__l.__size_;
  }
  std::string::basic_string(&v46, &__str, 0, v17 - 1, (std::allocator<char> *)&v43);
  if ((v46.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v25 = &v46;
  }
  else {
    int v25 = (std::string *)v46.__r_.__value_.__r.__words[0];
  }
  if ((v46.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v26 = HIBYTE(v46.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v26 = v46.__r_.__value_.__l.__size_;
  }
  v22 = std::string::append(&v47, (const std::string::value_type *)v25, v26);
  uint64_t v23 = 1;
LABEL_47:
  std::string::size_type v27 = v22->__r_.__value_.__r.__words[0];
  *(void *)&long long __dst = v22->__r_.__value_.__l.__size_;
  *(void *)((char *)&__dst + 7) = *(std::string::size_type *)((char *)&v22->__r_.__value_.__r.__words[1] + 7);
  char v28 = HIBYTE(v22->__r_.__value_.__r.__words[2]);
  v22->__r_.__value_.__l.__size_ = 0;
  v22->__r_.__value_.__r.__words[2] = 0;
  v22->__r_.__value_.__r.__words[0] = 0;
  v29 = &self->_currentPrediction.__r_.var0;
  if (self->_currentWord.__r_.__value_.var0.var0.__data_[7] < 0) {
    operator delete(*(void **)v29);
  }
  self->_currentPrediction.std::string::size_type var0 = __dst;
  long long v30 = &self->_currentPrediction.var0;
  *(void *)&self->_currentPrediction.__r_.std::string::size_type var0 = v27;
  *(int64_t *)((char *)&self->_currentPrediction.var0 + 7) = *(void *)((char *)&__dst + 7);
  self->_currentWord.__r_.__value_.var0.var0.__data_[7] = v28;
  if ((v23 & 1) != 0 && SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v46.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v47.__r_.__value_.__l.__data_);
    if (v5)
    {
LABEL_54:
      if (self->_currentWord.__r_.__value_.var0.var0.__data_[7] < 0)
      {
        sub_1000302DC(__p, *(void **)v29, *v30);
      }
      else
      {
        *(_OWORD *)std::string __p = *(_OWORD *)v29;
        data = self->_currentWord.__r_.__value_.var0.var1.__data_;
      }
      LODWORD(p_var0) = +[EMDEUtils validateAndUpdateAllowedWords:&self->_currentWord.__r_.__value_.var0.var1.__size_ forWord:__p isComplete:v23];
      if (SHIBYTE(data) < 0) {
        operator delete(__p[0]);
      }
      goto LABEL_61;
    }
  }
  else if (v5)
  {
    goto LABEL_54;
  }
  LODWORD(p_var0) = 1;
LABEL_61:
  if (p_var0) {
    int v31 = v23;
  }
  else {
    int v31 = 0;
  }
  if (v31 == 1)
  {
    if (*((char *)&self->_currentPrediction.__r_.__value_.var0.var1 + 23) < 0) {
      unint64_t v32 = self->_currentPrediction.__r_.__value_.var0.var1.__size_;
    }
    else {
      unint64_t v32 = *((unsigned __int8 *)&self->_currentPrediction.__r_.__value_.var0.var1 + 23);
    }
    p_currentPrediction = &self->_currentPrediction;
    if (v32)
    {
      if (*((char *)&self->_currentPrediction.__r_.__value_.var0.var1 + 23) >= 0) {
        size_t v34 = *((unsigned __int8 *)&self->_currentPrediction.__r_.__value_.var0.var1 + 23);
      }
      else {
        size_t v34 = self->_currentPrediction.__r_.__value_.var0.var1.__size_;
      }
      char v35 = &v43;
      sub_10000DC74((uint64_t)&v43, v34 + 1);
      if ((v43.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        char v35 = (std::string *)v43.__r_.__value_.__r.__words[0];
      }
      if (v34)
      {
        if (*((char *)&self->_currentPrediction.__r_.__value_.var0.var1 + 23) >= 0) {
          unint64_t v36 = &self->_currentPrediction;
        }
        else {
          unint64_t v36 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)self->_currentPrediction.__r_.__value_.var0.var1.__data_;
        }
        memmove(v35, v36, v34);
      }
      *(_WORD *)((char *)&v35->__r_.__value_.__l.__data_ + v34) = 32;
      int v37 = self->_currentWord.__r_.__value_.var0.var0.__data_[7];
      if (v37 >= 0) {
        v38 = &self->_currentPrediction.__r_.var0;
      }
      else {
        v38 = *(int **)&self->_currentPrediction.__r_.var0;
      }
      if (v37 >= 0) {
        std::string::size_type var0 = self->_currentWord.__r_.__value_.var0.var0.__data_[7];
      }
      else {
        std::string::size_type var0 = self->_currentPrediction.var0;
      }
      float v40 = std::string::append(&v43, (const std::string::value_type *)v38, var0);
      long long v41 = *(_OWORD *)&v40->__r_.__value_.__l.__data_;
      v50 = (char *)v40->__r_.__value_.__r.__words[2];
      long long __dst = v41;
      v40->__r_.__value_.__l.__size_ = 0;
      v40->__r_.__value_.__r.__words[2] = 0;
      v40->__r_.__value_.__r.__words[0] = 0;
    }
    else if (self->_currentWord.__r_.__value_.var0.var0.__data_[7] < 0)
    {
      sub_1000302DC(&__dst, *(void **)v29, *v30);
    }
    else
    {
      long long __dst = *(_OWORD *)v29;
      v50 = self->_currentWord.__r_.__value_.var0.var1.__data_;
    }
    if (*((char *)&self->_currentPrediction.__r_.__value_.var0.var1 + 23) < 0) {
      operator delete(p_currentPrediction->__r_.__value_.var0.var1.__data_);
    }
    *(_OWORD *)p_currentPrediction->__r_.__value_.var0.var0.__data_ = __dst;
    *((void *)&self->_currentPrediction.__r_.__value_.var0.var1 + 2) = v50;
    HIBYTE(v50) = 0;
    LOBYTE(__dst) = 0;
    if (v32 && SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v43.__r_.__value_.__l.__data_);
    }
    std::string::assign((std::string *)&self->_currentPrediction.__r_.var0, "");
  }
LABEL_95:
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }

  return p_var0;
}

- (unsigned)createBeamForPrefixBasedTokeniserFrom:(id)a3 additionalToken:()pair<int validate:(float>)a4
{
  int v5 = a5;
  id v8 = a3;
  +[EMDEUtils getTokenForTokenID:a4];
  unsigned __int8 v9 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  if ((SHIBYTE(__str.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (*((unsigned char *)&__str.__r_.__value_.__s + 23))
    {
      p_str = &__str;
      goto LABEL_6;
    }
LABEL_10:
    if (v5)
    {
      if (v8)
      {
        [v8 currentWord];
        unsigned __int8 v9 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
      }
      else
      {
        memset(&v43, 0, sizeof(v43));
      }
      if ((v9 & 0x80u) == 0) {
        v12 = &__str;
      }
      else {
        v12 = (std::string *)__str.__r_.__value_.__r.__words[0];
      }
      if ((v9 & 0x80u) == 0) {
        std::string::size_type size = v9;
      }
      else {
        std::string::size_type size = __str.__r_.__value_.__l.__size_;
      }
      unint64_t v14 = std::string::append(&v43, (const std::string::value_type *)v12, size);
      long long v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
      std::string::size_type v39 = v14->__r_.__value_.__r.__words[2];
      *(_OWORD *)std::string __p = v15;
      v14->__r_.__value_.__l.__size_ = 0;
      v14->__r_.__value_.__r.__words[2] = 0;
      v14->__r_.__value_.__r.__words[0] = 0;
      unsigned int v11 = +[EMDEUtils validateAndUpdateAllowedWords:&self->_currentWord.__r_.__value_.var0.var1.__size_ forWord:__p isComplete:0];
      if (SHIBYTE(v39) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v43.__r_.__value_.__l.__data_);
        if (!v11) {
          goto LABEL_86;
        }
      }
      else if (!v11)
      {
        goto LABEL_86;
      }
    }
    else
    {
      LOBYTE(v11) = 1;
    }
    if (v8) {
      [v8 currentWord];
    }
    else {
      memset(&v43, 0, sizeof(v43));
    }
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v16 = &__str;
    }
    else {
      v16 = (std::string *)__str.__r_.__value_.__r.__words[0];
    }
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v17 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v17 = __str.__r_.__value_.__l.__size_;
    }
    std::string::size_type v18 = std::string::append(&v43, (const std::string::value_type *)v16, v17);
    std::string::size_type v19 = v18->__r_.__value_.__r.__words[0];
    v49.__r_.__value_.__r.__words[0] = v18->__r_.__value_.__l.__size_;
    *(std::string::size_type *)((char *)v49.__r_.__value_.__r.__words + 7) = *(std::string::size_type *)((char *)&v18->__r_.__value_.__r.__words[1] + 7);
    char v20 = HIBYTE(v18->__r_.__value_.__r.__words[2]);
    v18->__r_.__value_.__l.__size_ = 0;
    v18->__r_.__value_.__r.__words[2] = 0;
    v18->__r_.__value_.__r.__words[0] = 0;
    if (self->_currentWord.__r_.__value_.var0.var0.__data_[7] < 0) {
      operator delete(*(void **)&self->_currentPrediction.__r_.var0);
    }
    int64_t v21 = v49.__r_.__value_.__r.__words[0];
    *(void *)&self->_currentPrediction.__r_.std::string::size_type var0 = v19;
    self->_currentPrediction.std::string::size_type var0 = v21;
    *(int64_t *)((char *)&self->_currentPrediction.var0 + 7) = *(std::string::size_type *)((char *)v49.__r_.__value_.__r.__words
                                                                                                + 7);
    self->_currentWord.__r_.__value_.var0.var0.__data_[7] = v20;
    if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v43.__r_.__value_.__l.__data_);
    }
    goto LABEL_86;
  }
  if (!__str.__r_.__value_.__l.__size_) {
    goto LABEL_10;
  }
  p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
LABEL_6:
  if (p_str->__r_.__value_.__s.__data_[0] != 95) {
    goto LABEL_10;
  }
  if (!v5)
  {
    LOBYTE(v11) = 1;
    goto LABEL_47;
  }
  if (v8)
  {
    [v8 currentWord];
  }
  else
  {
    v45[0] = 0;
    v45[1] = 0;
    uint64_t v46 = 0;
  }
  unsigned int v22 = +[EMDEUtils validateAndUpdateAllowedWords:&self->_currentWord.__r_.__value_.var0.var1.__size_ forWord:v45 isComplete:1];
  unsigned int v23 = v22;
  if ((SHIBYTE(v46) & 0x80000000) == 0)
  {
    if (v22) {
      goto LABEL_44;
    }
LABEL_50:
    LOBYTE(v11) = 0;
    goto LABEL_86;
  }
  operator delete(v45[0]);
  if (!v23) {
    goto LABEL_50;
  }
LABEL_44:
  std::string::basic_string(&v44, &__str, 1uLL, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v43);
  unsigned int v11 = +[EMDEUtils validateAndUpdateAllowedWords:&self->_currentWord.__r_.__value_.var0.var1.__size_ forWord:&v44 isComplete:0];
  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v44.__r_.__value_.__l.__data_);
  }
  if (v11)
  {
LABEL_47:
    if (*((char *)&self->_currentPrediction.__r_.__value_.var0.var1 + 23) < 0) {
      unint64_t v24 = self->_currentPrediction.__r_.__value_.var0.var1.__size_;
    }
    else {
      unint64_t v24 = *((unsigned __int8 *)&self->_currentPrediction.__r_.__value_.var0.var1 + 23);
    }
    p_currentPrediction = &self->_currentPrediction;
    if (v24)
    {
      if (*((char *)&self->_currentPrediction.__r_.__value_.var0.var1 + 23) >= 0) {
        size_t v26 = *((unsigned __int8 *)&self->_currentPrediction.__r_.__value_.var0.var1 + 23);
      }
      else {
        size_t v26 = self->_currentPrediction.__r_.__value_.var0.var1.__size_;
      }
      std::string::size_type v27 = &v49;
      sub_10000DC74((uint64_t)&v49, v26 + 1);
      if ((v49.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string::size_type v27 = (std::string *)v49.__r_.__value_.__r.__words[0];
      }
      if (v26)
      {
        if (*((char *)&self->_currentPrediction.__r_.__value_.var0.var1 + 23) >= 0) {
          data = &self->_currentPrediction;
        }
        else {
          data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)self->_currentPrediction.__r_.__value_.var0.var1.__data_;
        }
        memmove(v27, data, v26);
      }
      *(_WORD *)((char *)&v27->__r_.__value_.__l.__data_ + v26) = 32;
      if (v8)
      {
        [v8 currentWord];
        unsigned int v29 = HIBYTE(v42);
        long long v30 = (void **)v40;
        std::string::size_type v31 = v41;
      }
      else
      {
        std::string::size_type v31 = 0;
        long long v30 = 0;
        unsigned int v29 = 0;
        float v40 = 0;
        std::string::size_type v41 = 0;
        uint64_t v42 = 0;
      }
      if ((v29 & 0x80u) == 0) {
        unint64_t v32 = &v40;
      }
      else {
        unint64_t v32 = v30;
      }
      if ((v29 & 0x80u) == 0) {
        std::string::size_type v33 = v29;
      }
      else {
        std::string::size_type v33 = v31;
      }
      size_t v34 = std::string::append(&v49, (const std::string::value_type *)v32, v33);
      long long v35 = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
      v43.__r_.__value_.__r.__words[2] = v34->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v43.__r_.__value_.__l.__data_ = v35;
    }
    else
    {
      if (v8)
      {
        [v8 currentWord];
LABEL_76:
        if (*((char *)&self->_currentPrediction.__r_.__value_.var0.var1 + 23) < 0) {
          operator delete(p_currentPrediction->__r_.__value_.var0.var1.__data_);
        }
        *(_OWORD *)p_currentPrediction->__r_.__value_.var0.var0.__data_ = *(_OWORD *)&v43.__r_.__value_.__l.__data_;
        *((void *)&self->_currentPrediction.__r_.__value_.var0.var1 + 2) = *((void *)&v43.__r_.__value_.__l + 2);
        *((unsigned char *)&v43.__r_.__value_.__s + 23) = 0;
        v43.__r_.__value_.__s.__data_[0] = 0;
        if (v24)
        {
          if (SHIBYTE(v42) < 0) {
            operator delete(v40);
          }
          if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v49.__r_.__value_.__l.__data_);
          }
        }
        std::string::basic_string(&v43, &__str, 1uLL, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v48);
        p_std::string::size_type var0 = &self->_currentPrediction.__r_.var0;
        if (self->_currentWord.__r_.__value_.var0.var0.__data_[7] < 0) {
          operator delete(*(void **)p_var0);
        }
        *(_OWORD *)p_std::string::size_type var0 = *(_OWORD *)&v43.__r_.__value_.__l.__data_;
        self->_currentWord.__r_.__value_.var0.var1.__data_ = (char *)v43.__r_.__value_.__r.__words[2];
        goto LABEL_86;
      }
      size_t v34 = &v43;
    }
    v34->__r_.__value_.__r.__words[0] = 0;
    v34->__r_.__value_.__l.__size_ = 0;
    v34->__r_.__value_.__r.__words[2] = 0;
    goto LABEL_76;
  }
LABEL_86:
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }

  return v11;
}

- (id)initChildBeamFrom:(id)a3 additionalToken:()pair<int state:(float>)a4 lengthPenalty:(__CFArray *)a5 validate:(float)a6
{
  uint64_t v7 = a7;
  id v12 = a3;
  if (!v12 || !a5)
  {
    std::string::size_type v17 = modelLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10008E910((uint64_t)v12, (uint64_t)a5, v17);
    }

    goto LABEL_37;
  }
  v41.receiver = self;
  v41.super_class = (Class)EMDEBeamPath;
  self = [(EMDEBeamPath *)&v41 init];
  [v12 tokens];
  begin = self->_tokens.__begin_;
  if (begin)
  {
    self->_tokens.__end_ = begin;
    operator delete(begin);
    self->_tokens.__begin_ = 0;
    self->_tokens.__end_ = 0;
    self->_tokens.__end_cap_.__value_ = 0;
  }
  end = (int *)__p[1];
  self->_tokens.__end_cap_.__value_ = v40;
  long long v15 = (int *)__p[0];
  *(_OWORD *)&self->_tokens.__begin_ = *(_OWORD *)__p;
  if (__p[1] >= v40)
  {
    uint64_t v18 = ((char *)__p[1] - (char *)__p[0]) >> 2;
    unint64_t v19 = v18 + 1;
    if ((unint64_t)(v18 + 1) >> 62) {
      sub_100004204();
    }
    uint64_t v20 = (char *)v40 - (char *)__p[0];
    if (((char *)v40 - (char *)__p[0]) >> 1 > v19) {
      unint64_t v19 = v20 >> 1;
    }
    if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v21 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v21 = v19;
    }
    if (v21)
    {
      unsigned int v22 = (char *)sub_10000A17C((uint64_t)&self->_tokens.__end_cap_, v21);
      long long v15 = self->_tokens.__begin_;
      end = self->_tokens.__end_;
    }
    else
    {
      unsigned int v22 = 0;
    }
    unsigned int v23 = (int *)&v22[4 * v18];
    unint64_t v24 = (int *)&v22[4 * v21];
    int *v23 = a4.var0;
    v16 = v23 + 1;
    while (end != v15)
    {
      int v25 = *--end;
      *--unsigned int v23 = v25;
    }
    self->_tokens.__begin_ = v23;
    self->_tokens.__end_ = v16;
    self->_tokens.__end_cap_.__value_ = v24;
    if (v15) {
      operator delete(v15);
    }
  }
  else
  {
    *(_DWORD *)__p[1] = a4.var0;
    v16 = (int *)((char *)__p[1] + 4);
  }
  self->_tokens.__end_ = v16;
  [v12 currentPrediction];
  p_currentPrediction = &self->_currentPrediction;
  if (*((char *)&self->_currentPrediction.__r_.__value_.var0.var1 + 23) < 0) {
    operator delete(p_currentPrediction->__r_.__value_.var0.var1.__data_);
  }
  *(_OWORD *)p_currentPrediction->__r_.__value_.var0.var0.__data_ = *(_OWORD *)__p;
  *((void *)&self->_currentPrediction.__r_.__value_.var0.var1 + 2) = v40;
  [v12 allowedWords];
  p_std::string::size_type size = &self->_currentWord.__r_.__value_.var0.var1.__size_;
  if (*((char *)&self->_currentWord.__r_.var1 + 3) < 0) {
    operator delete((void *)*p_size);
  }
  *(_OWORD *)p_std::string::size_type size = *(_OWORD *)__p;
  *(void *)&self->_currentWord.__r_.std::string::size_type var0 = v40;
  self->_capitaliseNextWord = 0;
  char v28 = +[EMDEUtils config];
  unsigned int v29 = [v28 objectForKeyedSubscript:@"EMDE_TOKENISER_VERSION"];
  if (v29)
  {
    long long v30 = +[EMDEUtils config];
    std::string::size_type v31 = [v30 objectForKeyedSubscript:@"EMDE_TOKENISER_VERSION"];
    int v32 = [v31 intValue];

    if (v32 >= 2)
    {
      unsigned int v33 = [(EMDEBeamPath *)self createBeamForSuffixBasedTokeniserFrom:v12 additionalToken:a4 validate:v7];
      goto LABEL_33;
    }
  }
  else
  {
  }
  unsigned int v33 = [(EMDEBeamPath *)self createBeamForPrefixBasedTokeniserFrom:v12 additionalToken:a4 validate:v7];
LABEL_33:
  if (!v33)
  {
LABEL_37:
    int v37 = 0;
    goto LABEL_38;
  }
  self->_state = a5;
  [v12 score];
  float v35 = v34 + a4.var1;
  self->_score = v34 + a4.var1;
  [(EMDEBeamPath *)self tokens];
  float v36 = v35 / pow((double)(unint64_t)((((char *)__p[1] - (char *)__p[0]) >> 2) - 1), a6);
  self->_averageScore = v36;
  if (__p[0]) {
    operator delete(__p[0]);
  }
  self = self;
  int v37 = self;
LABEL_38:

  return v37;
}

- (vector<int,)tokens
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<int, std::allocator<int>> *)sub_10000DBB4(retstr, self->_tokens.__begin_, (uint64_t)self->_tokens.__end_, self->_tokens.__end_ - self->_tokens.__begin_);
}

- (basic_string<char,)currentPrediction
{
  if (SHIBYTE(result[1].var0) < 0) {
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_1000302DC(retstr, *((void **)&result[1].__r_.__value_.var0.var1+ 2), *(void *)&result[1].__r_.var0);
  }
  *(_OWORD *)retstr->__r_.__value_.var0.var0.__data_ = *((_OWORD *)&result[1].__r_.__value_.var0.var1 + 1);
  *((void *)&retstr->__r_.__value_.var0.var1 + 2) = result[1].var0;
  return result;
}

- (basic_string<char,)currentWord
{
  if (*((char *)&result[2].__r_.__value_.var0.var1 + 23) < 0) {
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_1000302DC(retstr, result[2].__r_.__value_.var0.var1.__data_, result[2].__r_.__value_.var0.var1.__size_);
  }
  *(_OWORD *)retstr->__r_.__value_.var0.var0.__data_ = *(_OWORD *)result[2].__r_.__value_.var0.var0.__data_;
  *((void *)&retstr->__r_.__value_.var0.var1 + 2) = *((void *)&result[2].__r_.__value_.var0.var1 + 2);
  return result;
}

- (float)score
{
  return self->_score;
}

- (float)averageScore
{
  return self->_averageScore;
}

- (basic_string<char,)allowedWords
{
  if (result[3].__r_.__value_.var0.var0.__data_[7] < 0) {
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_1000302DC(retstr, *(void **)&result[2].__r_.var0, result[2].var0);
  }
  *(_OWORD *)retstr->__r_.__value_.var0.var0.__data_ = *(_OWORD *)&result[2].__r_.var0;
  *((void *)&retstr->__r_.__value_.var0.var1 + 2) = result[3].__r_.__value_.var0.var1.__data_;
  return result;
}

- (__CFArray)state
{
  return self->_state;
}

- (void)setState:(__CFArray *)a3
{
  self->_state = a3;
}

- (BOOL)capitaliseNextWord
{
  return self->_capitaliseNextWord;
}

- (void).cxx_destruct
{
  if (*((char *)&self->_currentWord.__r_.var1 + 3) < 0) {
    operator delete((void *)self->_currentWord.__r_.__value_.var0.var1.__size_);
  }
  if (self->_currentWord.__r_.__value_.var0.var0.__data_[7] < 0) {
    operator delete(*(void **)&self->_currentPrediction.__r_.var0);
  }
  if (*((char *)&self->_currentPrediction.__r_.__value_.var0.var1 + 23) < 0) {
    operator delete(self->_currentPrediction.__r_.__value_.var0.var1.__data_);
  }
  begin = self->_tokens.__begin_;
  if (begin)
  {
    self->_tokens.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  return self;
}

@end