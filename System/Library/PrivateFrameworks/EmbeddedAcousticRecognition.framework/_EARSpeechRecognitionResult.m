@interface _EARSpeechRecognitionResult
- (NSArray)preITNTokens;
- (NSArray)preITNVoiceCommandInterpretations;
- (NSArray)tokens;
- (NSArray)voiceCommandInterpretations;
- (double)confidence;
- (double)utteranceStart;
- (id).cxx_construct;
- (id)_initWithTokens:()vector<quasar:(std:()vector<quasar:(std:(double)a5 :(id)a6 allocator<quasar:(id)a7 :(double)a8 Token>> *)a4 :Token :allocator<quasar::Token>> *)a3 :Token preITNTokens:confidence:voiceCommandInterpretations:preITNVoiceCommandInterpretations:utteranceStart:;
- (id)_initWithTokens:()vector<quasar:(std:()vector<quasar:(std:(double)a5 :allocator<quasar::Token>> *)a4 :Token :allocator<quasar::Token>> *)a3 :Token preITNTokens:confidence:;
- (id)_initWithTokens:()vector<quasar:(std:()vector<quasar:(std::allocator<quasar::Token>> *)a4 :Token :allocator<quasar::Token>> *)a3 :Token preITNTokens:;
- (id)description;
- (vector<quasar::Token,)quasarPreItnTokens;
- (vector<quasar::Token,)quasarTokens;
@end

@implementation _EARSpeechRecognitionResult

- (id)_initWithTokens:()vector<quasar:(std:()vector<quasar:(std::allocator<quasar::Token>> *)a4 :Token :allocator<quasar::Token>> *)a3 :Token preITNTokens:
{
  memset(v9, 0, sizeof(v9));
  std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(v9, (uint64_t)a3->__begin_, (uint64_t)a3->__end_, 0x6DB6DB6DB6DB6DB7 * (((char *)a3->__end_ - (char *)a3->__begin_) >> 5));
  memset(v8, 0, sizeof(v8));
  std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(v8, (uint64_t)a4->__begin_, (uint64_t)a4->__end_, 0x6DB6DB6DB6DB6DB7 * (((char *)a4->__end_ - (char *)a4->__begin_) >> 5));
  id v6 = [(_EARSpeechRecognitionResult *)self _initWithTokens:v9 preITNTokens:v8 confidence:0.0];
  v10 = (void **)v8;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](&v10);
  v10 = (void **)v9;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](&v10);
  return v6;
}

- (id)_initWithTokens:()vector<quasar:(std:()vector<quasar:(std:(double)a5 :allocator<quasar::Token>> *)a4 :Token :allocator<quasar::Token>> *)a3 :Token preITNTokens:confidence:
{
  memset(v11, 0, sizeof(v11));
  std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(v11, (uint64_t)a3->__begin_, (uint64_t)a3->__end_, 0x6DB6DB6DB6DB6DB7 * (((char *)a3->__end_ - (char *)a3->__begin_) >> 5));
  memset(v10, 0, sizeof(v10));
  std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(v10, (uint64_t)a4->__begin_, (uint64_t)a4->__end_, 0x6DB6DB6DB6DB6DB7 * (((char *)a4->__end_ - (char *)a4->__begin_) >> 5));
  id v8 = [(_EARSpeechRecognitionResult *)self _initWithTokens:v11 preITNTokens:v10 confidence:0 voiceCommandInterpretations:0 preITNVoiceCommandInterpretations:a5 utteranceStart:0.0];
  v12 = (void **)v10;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](&v12);
  v12 = (void **)v11;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](&v12);
  return v8;
}

- (id)_initWithTokens:()vector<quasar:(std:()vector<quasar:(std:(double)a5 :(id)a6 allocator<quasar:(id)a7 :(double)a8 Token>> *)a4 :Token :allocator<quasar::Token>> *)a3 :Token preITNTokens:confidence:voiceCommandInterpretations:preITNVoiceCommandInterpretations:utteranceStart:
{
  id v14 = a6;
  id v15 = a7;
  v25.receiver = self;
  v25.super_class = (Class)_EARSpeechRecognitionResult;
  v16 = [(_EARSpeechRecognitionResult *)&v25 init];
  v17 = v16;
  v18 = v16;
  if (v16)
  {
    uint64_t p_quasarTokens = (uint64_t)&v16->_quasarTokens;
    if (&v17->_quasarTokens != a3) {
      std::vector<quasar::Token>::__assign_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(p_quasarTokens, (uint64_t)a3->__begin_, (uint64_t)a3->__end_, 0x6DB6DB6DB6DB6DB7 * (((char *)a3->__end_ - (char *)a3->__begin_) >> 5));
    }
    if (&v17->_quasarPreItnTokens != a4) {
      std::vector<quasar::Token>::__assign_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>((uint64_t)&v17->_quasarPreItnTokens, (uint64_t)a4->__begin_, (uint64_t)a4->__end_, 0x6DB6DB6DB6DB6DB7 * (((char *)a4->__end_ - (char *)a4->__begin_) >> 5));
    }
    v18->_confidence = a5;
    uint64_t v20 = [v14 copy];
    voiceCommandInterpretations = v18->_voiceCommandInterpretations;
    v18->_voiceCommandInterpretations = (NSArray *)v20;

    uint64_t v22 = [v15 copy];
    preITNVoiceCommandInterpretations = v18->_preITNVoiceCommandInterpretations;
    v18->_preITNVoiceCommandInterpretations = (NSArray *)v22;

    v18->_utteranceStart = a8;
  }

  return v18;
}

- (NSArray)tokens
{
  return (NSArray *)EARHelpers::EARSpeechRecognitionTokensFromQuasarTokens((const quasar::Token **)&self->_quasarTokens);
}

- (NSArray)preITNTokens
{
  return (NSArray *)EARHelpers::EARSpeechRecognitionTokensFromQuasarTokens((const quasar::Token **)&self->_quasarPreItnTokens);
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)_EARSpeechRecognitionResult;
  v3 = [(_EARSpeechRecognitionResult *)&v8 description];
  v4 = [(_EARSpeechRecognitionResult *)self tokens];
  v5 = [(_EARSpeechRecognitionResult *)self preITNTokens];
  id v6 = [v3 stringByAppendingFormat:@" tokens=%@, preITNTokens=%@", v4, v5];

  return v6;
}

- (double)confidence
{
  return self->_confidence;
}

- (NSArray)voiceCommandInterpretations
{
  return self->_voiceCommandInterpretations;
}

- (NSArray)preITNVoiceCommandInterpretations
{
  return self->_preITNVoiceCommandInterpretations;
}

- (vector<quasar::Token,)quasarTokens
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<quasar::Token, std::allocator<quasar::Token>> *)std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(retstr, (uint64_t)self->_quasarTokens.__begin_, (uint64_t)self->_quasarTokens.__end_, 0x6DB6DB6DB6DB6DB7* (((char *)self->_quasarTokens.__end_- (char *)self->_quasarTokens.__begin_) >> 5));
}

- (vector<quasar::Token,)quasarPreItnTokens
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<quasar::Token, std::allocator<quasar::Token>> *)std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(retstr, (uint64_t)self->_quasarPreItnTokens.__begin_, (uint64_t)self->_quasarPreItnTokens.__end_, 0x6DB6DB6DB6DB6DB7* (((char *)self->_quasarPreItnTokens.__end_- (char *)self->_quasarPreItnTokens.__begin_) >> 5));
}

- (double)utteranceStart
{
  return self->_utteranceStart;
}

- (void).cxx_destruct
{
  p_quasarPreItnTokens = &self->_quasarPreItnTokens;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_quasarPreItnTokens);
  p_quasarPreItnTokens = &self->_quasarTokens;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_quasarPreItnTokens);
  objc_storeStrong((id *)&self->_preITNVoiceCommandInterpretations, 0);
  objc_storeStrong((id *)&self->_voiceCommandInterpretations, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  return self;
}

@end