@interface _EARSpeechRecognitionToken
- (BOOL)appendedAutoPunctuation;
- (BOOL)hasSpaceAfter;
- (BOOL)hasSpaceBefore;
- (BOOL)isEqual:(id)a3;
- (BOOL)isModifiedByAutoPunctuation;
- (BOOL)prependedAutoPunctuation;
- (NSString)ipaPhoneSequence;
- (NSString)phoneSequence;
- (NSString)tokenName;
- (Token)quasarToken;
- (_EARSpeechRecognitionToken)initWithTokenName:(id)a3 start:(double)a4 end:(double)a5 silenceStart:(double)a6 confidence:(double)a7 hasSpaceAfter:(BOOL)a8 hasSpaceBefore:(BOOL)a9 phoneSequence:(id)a10 ipaPhoneSequence:(id)a11;
- (_EARSpeechRecognitionToken)initWithTokenName:(id)a3 start:(double)a4 end:(double)a5 silenceStart:(double)a6 confidence:(double)a7 hasSpaceAfter:(BOOL)a8 hasSpaceBefore:(BOOL)a9 phoneSequence:(id)a10 ipaPhoneSequence:(id)a11 appendedAutoPunctuation:(BOOL)a12;
- (double)acousticCost;
- (double)confidence;
- (double)end;
- (double)graphCost;
- (double)silenceStart;
- (double)start;
- (id).cxx_construct;
- (id)_initWithQuasarToken:(const void *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation _EARSpeechRecognitionToken

- (unint64_t)hash
{
  v2 = [(_EARSpeechRecognitionToken *)self tokenName];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = quasar::Token::operator==((unsigned __int8 *)&self->_quasarToken, v4 + 8);
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (_EARSpeechRecognitionToken)initWithTokenName:(id)a3 start:(double)a4 end:(double)a5 silenceStart:(double)a6 confidence:(double)a7 hasSpaceAfter:(BOOL)a8 hasSpaceBefore:(BOOL)a9 phoneSequence:(id)a10 ipaPhoneSequence:(id)a11
{
  return [(_EARSpeechRecognitionToken *)self initWithTokenName:a3 start:a8 end:a9 silenceStart:a10 confidence:a11 hasSpaceAfter:0 hasSpaceBefore:a4 phoneSequence:a5 ipaPhoneSequence:a6 appendedAutoPunctuation:a7];
}

- (_EARSpeechRecognitionToken)initWithTokenName:(id)a3 start:(double)a4 end:(double)a5 silenceStart:(double)a6 confidence:(double)a7 hasSpaceAfter:(BOOL)a8 hasSpaceBefore:(BOOL)a9 phoneSequence:(id)a10 ipaPhoneSequence:(id)a11 appendedAutoPunctuation:(BOOL)a12
{
  id v22 = a3;
  id v23 = a10;
  id v24 = a11;
  if (v22)
  {
    objc_msgSend(v22, "ear_toString");
    if (v23) {
      goto LABEL_3;
    }
LABEL_6:
    long long v33 = 0uLL;
    uint64_t v34 = 0;
    if (v24) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  long long v35 = 0uLL;
  uint64_t v36 = 0;
  if (!v23) {
    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v23, "ear_toString");
  if (v24)
  {
LABEL_4:
    objc_msgSend(v24, "ear_toString");
    goto LABEL_8;
  }
LABEL_7:
  long long v31 = 0uLL;
  uint64_t v32 = 0;
LABEL_8:
  memset(v30, 0, sizeof(v30));
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  float v25 = a7;
  quasar::Token::Token(v37, &v35, (a4 * 1000.0), (a5 * 1000.0), (a6 * 1000.0), a8, a9, &v33, v25, &v31, v30, a12, (long long *)__p, 0, 0);
  if (v29 < 0) {
    operator delete(__p[0]);
  }
  __p[0] = v30;
  std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  if (SHIBYTE(v32) < 0) {
    operator delete((void *)v31);
  }
  if (SHIBYTE(v34) < 0) {
    operator delete((void *)v33);
  }
  if (SHIBYTE(v36) < 0) {
    operator delete((void *)v35);
  }
  v26 = (_EARSpeechRecognitionToken *)[(_EARSpeechRecognitionToken *)self _initWithQuasarToken:v37];
  if (v47 < 0) {
    operator delete(v46);
  }
  if (v45 < 0) {
    operator delete(v44);
  }
  *(void *)&long long v33 = &v43;
  std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v33);
  if (v42 < 0) {
    operator delete(v41);
  }
  *(void *)&long long v33 = &v40;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v33);
  if (v39 < 0) {
    operator delete(v38);
  }
  if (SHIBYTE(v37[0].__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v37[0].__r_.__value_.__l.__data_);
  }

  return v26;
}

- (id)_initWithQuasarToken:(const void *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_EARSpeechRecognitionToken;
  v4 = [(_EARSpeechRecognitionToken *)&v7 init];
  char v5 = v4;
  if (v4) {
    quasar::Token::operator=((uint64_t)&v4->_quasarToken, (uint64_t)a3);
  }
  return v5;
}

- (NSString)tokenName
{
  if (*((char *)&self->_quasarToken.tokenName.__r_.__value_.var0.var1 + 23) < 0)
  {
    data = (Token *)self->_quasarToken.tokenName.__r_.__value_.var0.var1.__data_;
    unint64_t size = self->_quasarToken.tokenName.__r_.__value_.var0.var1.__size_;
  }
  else
  {
    data = &self->_quasarToken;
    unint64_t size = *((unsigned __int8 *)&self->_quasarToken.tokenName.__r_.__value_.var0.var1 + 23);
  }
  return (NSString *)objc_msgSend(NSString, "ear_stringWithStringView:", data, size);
}

- (double)start
{
  LODWORD(v2) = *(_DWORD *)&self->_quasarToken.tokenName.__r_.var1;
  return (double)v2 * 0.001;
}

- (double)end
{
  LODWORD(v2) = self->_quasarToken.tokenName.var0;
  return (double)v2 * 0.001;
}

- (double)silenceStart
{
  LODWORD(v2) = HIDWORD(self->_quasarToken.tokenName.var0);
  return (double)v2 * 0.001;
}

- (double)confidence
{
  return *(float *)&self[1].super.isa;
}

- (BOOL)hasSpaceAfter
{
  return BYTE4(self[1].super.isa);
}

- (BOOL)hasSpaceBefore
{
  return BYTE5(self[1].super.isa);
}

- (NSString)phoneSequence
{
  if (*((char *)&self[1]._quasarToken.tokenName.__r_.__value_.var0.var1 + 23) < 0)
  {
    data = self[1]._quasarToken.tokenName.__r_.__value_.var0.var1.__data_;
    unint64_t size = self[1]._quasarToken.tokenName.__r_.__value_.var0.var1.__size_;
  }
  else
  {
    data = self[1]._quasarToken.tokenName.__r_.__value_.var0.var0.__data_;
    unint64_t size = *((unsigned __int8 *)&self[1]._quasarToken.tokenName.__r_.__value_.var0.var1 + 23);
  }
  return (NSString *)objc_msgSend(NSString, "ear_stringWithStringView:", data, size);
}

- (NSString)ipaPhoneSequence
{
  if (*((char *)&self[2]._quasarToken.tokenName.__r_.__value_.var0.var1 + 23) < 0)
  {
    data = self[2]._quasarToken.tokenName.__r_.__value_.var0.var1.__data_;
    unint64_t size = self[2]._quasarToken.tokenName.__r_.__value_.var0.var1.__size_;
  }
  else
  {
    data = self[2]._quasarToken.tokenName.__r_.__value_.var0.var0.__data_;
    unint64_t size = *((unsigned __int8 *)&self[2]._quasarToken.tokenName.__r_.__value_.var0.var1 + 23);
  }
  return (NSString *)objc_msgSend(NSString, "ear_stringWithStringView:", data, size);
}

- (BOOL)appendedAutoPunctuation
{
  return self[3]._quasarToken.tokenName.__r_.var1;
}

- (BOOL)prependedAutoPunctuation
{
  return HIBYTE(self[3]._quasarToken.tokenName.__r_.var1);
}

- (BOOL)isModifiedByAutoPunctuation
{
  return self[4]._quasarToken.tokenName.__r_.__value_.var0.var0.__data_[8];
}

- (double)graphCost
{
  return *((float *)&self[4]._quasarToken.tokenName.__r_.__value_.var0.var1.__size_ + 1);
}

- (double)acousticCost
{
  return *((float *)&self[4]._quasarToken.tokenName.__r_.__value_.var0.var1 + 4);
}

- (id)description
{
  v25.receiver = self;
  v25.super_class = (Class)_EARSpeechRecognitionToken;
  unint64_t v3 = [(_EARSpeechRecognitionToken *)&v25 description];
  v4 = [(_EARSpeechRecognitionToken *)self tokenName];
  [(_EARSpeechRecognitionToken *)self start];
  uint64_t v6 = v5;
  [(_EARSpeechRecognitionToken *)self silenceStart];
  uint64_t v8 = v7;
  [(_EARSpeechRecognitionToken *)self end];
  uint64_t v10 = v9;
  [(_EARSpeechRecognitionToken *)self confidence];
  uint64_t v12 = v11;
  BOOL v13 = [(_EARSpeechRecognitionToken *)self hasSpaceAfter];
  BOOL v14 = [(_EARSpeechRecognitionToken *)self hasSpaceBefore];
  v15 = [(_EARSpeechRecognitionToken *)self phoneSequence];
  v16 = [(_EARSpeechRecognitionToken *)self ipaPhoneSequence];
  BOOL v17 = [(_EARSpeechRecognitionToken *)self appendedAutoPunctuation];
  BOOL v18 = [(_EARSpeechRecognitionToken *)self prependedAutoPunctuation];
  BOOL v19 = [(_EARSpeechRecognitionToken *)self isModifiedByAutoPunctuation];
  [(_EARSpeechRecognitionToken *)self graphCost];
  uint64_t v21 = v20;
  [(_EARSpeechRecognitionToken *)self acousticCost];
  id v23 = [v3 stringByAppendingFormat:@" tokenName=%@, start=%f, silenceStart=%f, end=%f, confidence=%f, hasSpaceAfter=%d, hasSpaceBefore=%d, phoneSeq=%@, ipaPhoneSeq=%@, appendedAutoPunctuation=%d, prependedAutoPunctuation=%d, isModifiedByAutoPunctuation=%d, graphCost=%f, acousticCost=%f", v4, v6, v8, v10, v12, v13, v14, v15, v16, v17, v18, v19, v21, v22];

  return v23;
}

- (Token)quasarToken
{
  return (Token *)quasar::Token::Token((std::string *)retstr, (const quasar::Token *)(v1 + 8));
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end