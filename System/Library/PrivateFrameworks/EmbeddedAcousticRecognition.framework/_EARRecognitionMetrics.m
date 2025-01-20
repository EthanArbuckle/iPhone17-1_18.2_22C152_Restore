@interface _EARRecognitionMetrics
- (BOOL)isEmojiDisambiguationUsed;
- (BOOL)isEmojiExpectedButNotRecognized;
- (BOOL)isEmojiPersonalizationUsed;
- (NSArray)pauseDurations;
- (NSArray)recognizedEmojis;
- (NSMutableArray)allItnRunIntervals;
- (NSNumber)itnDurationInNs;
- (_EARRecognitionMetrics)initWithRecognizer:(shared_ptr<quasar::SpeechRecognizer>)a3;
- (id).cxx_construct;
- (void)addEmojiRecognitionMetrics:(id)a3 recognizedEmojis:(id)a4;
- (void)addItnRunIntervals:(id)a3;
- (void)addPauseDurationMetric;
- (void)setAllItnRunIntervals:(id)a3;
@end

@implementation _EARRecognitionMetrics

- (_EARRecognitionMetrics)initWithRecognizer:(shared_ptr<quasar::SpeechRecognizer>)a3
{
  ptr = a3.__ptr_;
  v12.receiver = self;
  v12.super_class = (Class)_EARRecognitionMetrics;
  v4 = [(_EARRecognitionMetrics *)&v12 init];
  v5 = v4;
  if (v4)
  {
    v7 = *(SpeechRecognizer **)ptr;
    uint64_t v6 = *((void *)ptr + 1);
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 16), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v4->_recognizer.__cntrl_;
    v5->_recognizer.__ptr_ = v7;
    v5->_recognizer.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl) {
      std::__shared_weak_count::__release_weak(cntrl);
    }
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    allItnRunIntervals = v5->_allItnRunIntervals;
    v5->_allItnRunIntervals = v9;
  }
  return v5;
}

- (void)addPauseDurationMetric
{
  cntrl = self->_recognizer.__cntrl_;
  if (!cntrl)
  {
    v4 = 0;
    goto LABEL_7;
  }
  v4 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
  if (!v4 || (ptr = self->_recognizer.__ptr_) == 0)
  {
LABEL_7:
    pauseDurations = self->_pauseDurations;
    self->_pauseDurations = (NSArray *)MEMORY[0x1E4F1CBF0];

    if (!v4) {
      return;
    }
    goto LABEL_8;
  }
  quasar::SpeechRecognizer::getPauseDurations((quasar::SpeechRecognizer *)ptr, __p);
  EARHelpers::VectorToArray<float>((uint64_t)__p);
  uint64_t v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v7 = self->_pauseDurations;
  self->_pauseDurations = v6;

  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
LABEL_8:
  std::__shared_weak_count::__release_shared[abi:ne180100](v4);
}

- (void)addEmojiRecognitionMetrics:(id)a3 recognizedEmojis:(id)a4
{
  id v13 = a3;
  uint64_t v6 = (NSArray *)a4;
  v7 = [v13 objectForKeyedSubscript:@"itnDurationInNs"];
  itnDurationInNs = self->_itnDurationInNs;
  self->_itnDurationInNs = v7;

  v9 = [v13 objectForKeyedSubscript:@"isEmojiPersonalizationUsed"];
  self->_isEmojiPersonalizationUsed = [v9 BOOLValue];

  v10 = [v13 objectForKeyedSubscript:@"isEmojiDisambiguationUsed"];
  self->_isEmojiDisambiguationUsed = [v10 BOOLValue];

  v11 = [v13 objectForKeyedSubscript:@"isEmojiExpectedButNotRecognized"];
  self->_isEmojiExpectedButNotRecognized = [v11 BOOLValue];

  recognizedEmojis = self->_recognizedEmojis;
  self->_recognizedEmojis = v6;
}

- (void)addItnRunIntervals:(id)a3
{
}

- (NSMutableArray)allItnRunIntervals
{
  return self->_allItnRunIntervals;
}

- (void)setAllItnRunIntervals:(id)a3
{
}

- (NSArray)pauseDurations
{
  return self->_pauseDurations;
}

- (NSNumber)itnDurationInNs
{
  return self->_itnDurationInNs;
}

- (BOOL)isEmojiPersonalizationUsed
{
  return self->_isEmojiPersonalizationUsed;
}

- (BOOL)isEmojiDisambiguationUsed
{
  return self->_isEmojiDisambiguationUsed;
}

- (BOOL)isEmojiExpectedButNotRecognized
{
  return self->_isEmojiExpectedButNotRecognized;
}

- (NSArray)recognizedEmojis
{
  return self->_recognizedEmojis;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognizedEmojis, 0);
  objc_storeStrong((id *)&self->_itnDurationInNs, 0);
  objc_storeStrong((id *)&self->_pauseDurations, 0);
  objc_storeStrong((id *)&self->_allItnRunIntervals, 0);
  cntrl = self->_recognizer.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end