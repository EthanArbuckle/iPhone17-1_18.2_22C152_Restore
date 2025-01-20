@interface EARLanguageDetector
@end

@implementation EARLanguageDetector

void __58___EARLanguageDetector_startRequestWith_context_delegate___block_invoke(uint64_t a1)
{
}

void __58___EARLanguageDetector_startRequestWith_context_delegate___block_invoke_63(uint64_t a1, clockid_t a2)
{
  char v19 = 1;
  kaldi::Timer::Reset((kaldi::Timer *)v18, a2);
  uint64_t v20 = 0;
  +[_EARLanguageDetector quasarLocalesOfMessages:*(void *)(a1 + 32)];
  double Seconds = kaldi::Timer::GetSeconds((kaldi::Timer *)5, v3);
  v5 = *(std::__shared_weak_count **)(a1 + 56);
  if (v5)
  {
    double v6 = Seconds;
    double v7 = v18[0];
    v8 = std::__shared_weak_count::lock(v5);
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 48);
      if (v9) {
        atomic_store(COERCE_UNSIGNED_INT64((v6 - v7) * 1000.0), (unint64_t *)(v9 + 24));
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
  }
  v10 = *(std::__shared_weak_count **)(a1 + 72);
  if (v10)
  {
    v11 = std::__shared_weak_count::lock(v10);
    if (v11)
    {
      v12 = v11;
      v13 = *(uint64_t **)(a1 + 64);
      if (v13)
      {
        WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 40));
        if (WeakRetained)
        {
          +[_EARLanguageDetector updateContext:*(void *)(a1 + 80) withMessageLocales:v17];
          quasar::LanguageDetector::updateContext(WeakRetained[1], v13, (uint64_t *)&v15);
          if (v16) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v16);
          }
        }
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    }
  }
  v15 = (void **)v17;
  std::vector<std::optional<quasar::language_detector::Locale>>::__destroy_vector::operator()[abi:ne180100](&v15);
}

@end