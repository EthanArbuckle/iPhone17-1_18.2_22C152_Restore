@interface AVCRTTSessionDelegate
- (AVCRTTSessionDelegate)initWithOwner:(shared_ptr<AVCRTTSession>)a3 andStackController:(shared_ptr<AVCRTPStackController>)a4;
- (id).cxx_construct;
- (shared_ptr<AVCRTPStackController>)stackController;
- (void)setOwner:(weak_ptr<AVCRTTSession>)a3;
- (void)setStackController:(shared_ptr<AVCRTPStackController>)a3;
- (void)stream:(id)a3 didPause:(BOOL)a4 error:(id)a5;
- (void)stream:(id)a3 didResume:(BOOL)a4 error:(id)a5;
- (void)stream:(id)a3 didStart:(BOOL)a4 error:(id)a5;
- (void)streamDidRTCPTimeOut:(id)a3;
- (void)streamDidRTPTimeOut:(id)a3;
- (void)streamDidServerDie:(id)a3;
- (void)streamDidStop:(id)a3;
- (weak_ptr<AVCRTTSession>)owner;
@end

@implementation AVCRTTSessionDelegate

- (void)stream:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  std::string::basic_string[abi:ne180100]<0>(v20, "avc.rtt.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v10 = ims::debug((uint64_t)v20, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v10 + 8), (uint64_t)"-[AVCRTTSessionDelegate stream:didStart:error:]", 47);
  *(unsigned char *)(v10 + 17) = 0;
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v10 + 64))(v10, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v10 + 17) = 0;
  if (v19 < 0) {
    operator delete(__p[0]);
  }
  if (v21 < 0) {
    operator delete(v20[0]);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__AVCRTTSessionDelegate_stream_didStart_error___block_invoke;
  v13[3] = &unk_1E650F2B8;
  id v11 = v9;
  id v14 = v11;
  id v12 = v8;
  id v15 = v12;
  v16 = self;
  BOOL v17 = a4;
  ims::performBlock((IMSClientManager *)v13);
}

void __47__AVCRTTSessionDelegate_stream_didStart_error___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    std::string::basic_string[abi:ne180100]<0>(&v26, "avc.rtt.delegate");
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    uint64_t v2 = ims::error((uint64_t)&v26, (uint64_t)__p);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v2 + 8), (uint64_t)"Failed to start session ", 24);
    *(unsigned char *)(v2 + 17) = 0;
    std::ostream::operator<<();
    *(unsigned char *)(v2 + 17) = 0;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v2 + 8), (uint64_t)" error: ", 8);
    *(unsigned char *)(v2 + 17) = 0;
    id v3 = [*(id *)(a1 + 32) description];
    v4 = (const char *)[v3 UTF8String];
    size_t v5 = strlen(v4);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v2 + 8), (uint64_t)v4, v5);
    *(unsigned char *)(v2 + 17) = 0;
    (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v2 + 64))(v2, std::endl[abi:ne180100]<char,std::char_traits<char>>);
    *(unsigned char *)(v2 + 17) = 0;

    if (v25 < 0) {
      operator delete(__p[0]);
    }
    if (v28 < 0) {
      operator delete(v26);
    }
  }
  uint64_t v6 = *(void *)(a1 + 48);
  v7 = *(std::__shared_weak_count **)(v6 + 16);
  if (v7)
  {
    id v8 = std::__shared_weak_count::lock(v7);
    if (v8)
    {
      id v9 = *(int8x8_t **)(v6 + 8);
      if (v9)
      {
        uint64_t v10 = v9 + 3;
        (*(void (**)(void **__return_ptr, int8x8_t *))(*(void *)&v9[3] + 152))(&v26, v9 + 3);
        if (v27)
        {
          id v11 = std::__shared_weak_count::lock(v27);
          if (v11) {
            id v12 = v26;
          }
          else {
            id v12 = 0;
          }
          if (v27) {
            std::__shared_weak_count::__release_weak(v27);
          }
          if (v12)
          {
            MediaSessionDriver::cancelTimerForRequest(v9 + 3, 1);
            if (v9[60].i8[3])
            {
              v9[60].i8[3] = 0;
              __int8 v13 = *(unsigned char *)(a1 + 56);
              if (v13)
              {
                if ((*(unsigned int (**)(int8x8_t *))(*(void *)v10 + 96))(v9 + 3) == 4)
                {
                  v9[60].i8[5] = 1;
LABEL_34:
                  AVCRTPSession<AVCTextStream>::pauseAVCSession((uint64_t)v9);
                  goto LABEL_50;
                }
                __int8 v13 = *(unsigned char *)(a1 + 56);
              }
              v9[60].i8[1] = v13;
              if (*(unsigned char *)(a1 + 56))
              {
                uint64_t v18 = 0;
              }
              else
              {
                char v19 = *(void **)(a1 + 32);
                if (v19)
                {
                  if ([v19 code] == 32005) {
                    uint64_t v18 = 7;
                  }
                  else {
                    uint64_t v18 = 9;
                  }
                }
                else
                {
                  uint64_t v18 = 9;
                }
              }
              v22 = v9 + 3;
              v23 = v8;
              atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
              (*(void (**)(void *, int8x8_t **, uint64_t))(*(void *)v12 + 16))(v12, &v22, v18);
              BOOL v17 = v23;
              if (!v23) {
                goto LABEL_50;
              }
            }
            else
            {
              v9[60].i8[1] = *(unsigned char *)(a1 + 56);
              if (*(unsigned char *)(a1 + 56)
                && (*(unsigned int (**)(int8x8_t *))(*(void *)v10 + 96))(v9 + 3) == 4)
              {
                goto LABEL_34;
              }
              v20 = v9 + 3;
              char v21 = v8;
              atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
              if (*(unsigned char *)(a1 + 56)) {
                uint64_t v16 = 0;
              }
              else {
                uint64_t v16 = 9;
              }
              (*(void (**)(void *, int8x8_t **, uint64_t))(*(void *)v12 + 24))(v12, &v20, v16);
              BOOL v17 = v21;
              if (!v21) {
                goto LABEL_50;
              }
            }
            std::__shared_weak_count::__release_shared[abi:ne180100](v17);
LABEL_50:
            if (v11) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v11);
            }
LABEL_52:
            std::__shared_weak_count::__release_shared[abi:ne180100](v8);
            return;
          }
        }
        else
        {
          id v11 = 0;
        }
        std::string::basic_string[abi:ne180100]<0>(&v26, "avc.rtt.delegate");
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        uint64_t v15 = ims::warn((uint64_t)&v26, (uint64_t)__p);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v15 + 8), (uint64_t)"Ignoring didStart notification received for session ", 52);
        *(unsigned char *)(v15 + 17) = 0;
        (*(void (**)(int8x8_t *))(*(void *)v10 + 176))(v9 + 3);
        std::ostream::operator<<();
        *(unsigned char *)(v15 + 17) = 0;
        (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v15 + 64))(v15, std::endl[abi:ne180100]<char,std::char_traits<char>>);
        *(unsigned char *)(v15 + 17) = 0;
        if (v25 < 0) {
          operator delete(__p[0]);
        }
        if (v28 < 0) {
          operator delete(v26);
        }
        goto LABEL_50;
      }
    }
  }
  else
  {
    id v8 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(&v26, "avc.rtt.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v14 = ims::debug((uint64_t)&v26, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v14 + 8), (uint64_t)"-[AVCRTTSessionDelegate stream:didStart:error:]_block_invoke", 60);
  *(unsigned char *)(v14 + 17) = 0;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v14 + 8), (uint64_t)" owner is null", 14);
  *(unsigned char *)(v14 + 17) = 0;
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v14 + 64))(v14, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v14 + 17) = 0;
  if (v25 < 0) {
    operator delete(__p[0]);
  }
  if (v28 < 0) {
    operator delete(v26);
  }
  if (v8) {
    goto LABEL_52;
  }
}

- (void)streamDidStop:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:ne180100]<0>(v9, "avc.rtt.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v5 = ims::debug((uint64_t)v9, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v5 + 8), (uint64_t)"-[AVCRTTSessionDelegate streamDidStop:]", 39);
  *(unsigned char *)(v5 + 17) = 0;
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v5 + 64))(v5, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v5 + 17) = 0;
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  if (v10 < 0) {
    operator delete(v9[0]);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__AVCRTTSessionDelegate_streamDidStop___block_invoke;
  v6[3] = &unk_1E650F2E0;
  v6[4] = self;
  ims::performBlock((IMSClientManager *)v6);
}

void __39__AVCRTTSessionDelegate_streamDidStop___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(std::__shared_weak_count **)(v1 + 16);
  if (v2)
  {
    id v3 = std::__shared_weak_count::lock(v2);
    if (v3)
    {
      id v4 = *(int8x8_t **)(v1 + 8);
      if (v4)
      {
        uint64_t v5 = v4 + 3;
        (*(void (**)(void **__return_ptr, int8x8_t *))(*(void *)&v4[3] + 152))(&v14, v4 + 3);
        if (v15)
        {
          uint64_t v6 = std::__shared_weak_count::lock(v15);
          if (v6) {
            v7 = v14;
          }
          else {
            v7 = 0;
          }
          if (v15) {
            std::__shared_weak_count::__release_weak(v15);
          }
          if (v7)
          {
            MediaSessionDriver::cancelTimerForRequest(v4 + 3, 3);
            if (v4[60].i8[3] || v4[60].i8[4])
            {
              v4[60].i8[4] = 0;
              (*(void (**)(int8x8_t *, void))(*(void *)v4 + 24))(v4, 0);
            }
            else
            {
              v4[60].i8[1] = 0;
              char v10 = v4 + 3;
              id v11 = v3;
              atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
              (*(void (**)(void *, int8x8_t **, void))(*(void *)v7 + 32))(v7, &v10, 0);
              if (v11) {
                std::__shared_weak_count::__release_shared[abi:ne180100](v11);
              }
            }
LABEL_26:
            if (v6) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v6);
            }
LABEL_28:
            std::__shared_weak_count::__release_shared[abi:ne180100](v3);
            return;
          }
        }
        else
        {
          uint64_t v6 = 0;
        }
        std::string::basic_string[abi:ne180100]<0>(&v14, "avc.rtt.delegate");
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        uint64_t v9 = ims::warn((uint64_t)&v14, (uint64_t)__p);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v9 + 8), (uint64_t)"Ignoring didStop notification received for session ", 51);
        *(unsigned char *)(v9 + 17) = 0;
        (*(void (**)(int8x8_t *))(*(void *)v5 + 176))(v5);
        std::ostream::operator<<();
        *(unsigned char *)(v9 + 17) = 0;
        (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v9 + 64))(v9, std::endl[abi:ne180100]<char,std::char_traits<char>>);
        *(unsigned char *)(v9 + 17) = 0;
        if (v13 < 0) {
          operator delete(__p[0]);
        }
        if (v16 < 0) {
          operator delete(v14);
        }
        goto LABEL_26;
      }
    }
  }
  else
  {
    id v3 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(&v14, "avc.rtt.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v8 = ims::debug((uint64_t)&v14, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v8 + 8), (uint64_t)"-[AVCRTTSessionDelegate streamDidStop:]_block_invoke", 52);
  *(unsigned char *)(v8 + 17) = 0;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v8 + 8), (uint64_t)" owner is null", 14);
  *(unsigned char *)(v8 + 17) = 0;
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v8 + 64))(v8, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v8 + 17) = 0;
  if (v13 < 0) {
    operator delete(__p[0]);
  }
  if (v16 < 0) {
    operator delete(v14);
  }
  if (v3) {
    goto LABEL_28;
  }
}

- (void)streamDidServerDie:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:ne180100]<0>(v9, "avc.rtt.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v5 = ims::debug((uint64_t)v9, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v5 + 8), (uint64_t)"AVCRTTSessionDelegate::", 23);
  *(unsigned char *)(v5 + 17) = 0;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v5 + 8), (uint64_t)"-[AVCRTTSessionDelegate streamDidServerDie:]", 44);
  *(unsigned char *)(v5 + 17) = 0;
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v5 + 64))(v5, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v5 + 17) = 0;
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  if (v10 < 0) {
    operator delete(v9[0]);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__AVCRTTSessionDelegate_streamDidServerDie___block_invoke;
  v6[3] = &unk_1E650F2E0;
  v6[4] = self;
  ims::performBlock((IMSClientManager *)v6);
}

void __44__AVCRTTSessionDelegate_streamDidServerDie___block_invoke(uint64_t a1)
{
  std::string::basic_string[abi:ne180100]<0>(v20, "avc.rtt.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v2 = ims::error((uint64_t)v20, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v2 + 8), (uint64_t)"streamDidServerDie callback triggered. ---> AVCONFERENCED HAS CRASHED!!! <---.", 78);
  *(unsigned char *)(v2 + 17) = 0;
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v2 + 64))(v2, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v2 + 17) = 0;
  if (v19 < 0) {
    operator delete(__p[0]);
  }
  if (v21 < 0) {
    operator delete(v20[0]);
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 24);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v13[0] = &unk_1F20B2680;
  v13[1] = &_bambiDomain;
  int v14 = 1073741845;
  (*(void (**)(uint64_t, void *))(*(void *)v3 + 48))(v3, v13);
  ImsResult::~ImsResult((ImsResult *)v13);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(std::__shared_weak_count **)(v4 + 16);
  if (v5)
  {
    uint64_t v6 = std::__shared_weak_count::lock(v5);
    if (v6)
    {
      uint64_t v7 = *(void *)(v4 + 8);
      if (v7)
      {
        uint64_t v9 = *(void *)(v7 + 56);
        char v8 = *(std::__shared_weak_count **)(v7 + 64);
        if (v8) {
          atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        if (v9)
        {
          uint64_t v10 = v7 + 80;
          id v11 = std::__tree<std::__value_type<std::string,std::list<SipLazuliManager::OutgoingMsrp>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<SipLazuliManager::OutgoingMsrp>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<SipLazuliManager::OutgoingMsrp>>>>::find<std::string>(v9 + 312, (void **)(v7 + 80));
          if ((void **)(v9 + 320) == v11 || *((_DWORD *)v11 + 14) != 1) {
            (*(void (**)(void, uint64_t, void))(**(void **)(*(void *)(a1 + 32) + 24) + 24))(*(void *)(*(void *)(a1 + 32) + 24), v10, 0);
          }
        }
        if (v8) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v8);
        }
LABEL_22:
        std::__shared_weak_count::__release_shared[abi:ne180100](v6);
        return;
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(v20, "avc.rtt.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v12 = ims::debug((uint64_t)v20, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v12 + 8), (uint64_t)"-[AVCRTTSessionDelegate streamDidServerDie:]_block_invoke", 57);
  *(unsigned char *)(v12 + 17) = 0;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v12 + 8), (uint64_t)" owner is null", 14);
  *(unsigned char *)(v12 + 17) = 0;
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v12 + 64))(v12, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v12 + 17) = 0;
  if (v19 < 0) {
    operator delete(__p[0]);
  }
  if (v21 < 0) {
    operator delete(v20[0]);
  }
  if (v6) {
    goto LABEL_22;
  }
}

- (void)stream:(id)a3 didPause:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  std::string::basic_string[abi:ne180100]<0>(v20, "avc.rtt.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v10 = ims::debug((uint64_t)v20, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v10 + 8), (uint64_t)"-[AVCRTTSessionDelegate stream:didPause:error:]", 47);
  *(unsigned char *)(v10 + 17) = 0;
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v10 + 64))(v10, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v10 + 17) = 0;
  if (v19 < 0) {
    operator delete(__p[0]);
  }
  if (v21 < 0) {
    operator delete(v20[0]);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __47__AVCRTTSessionDelegate_stream_didPause_error___block_invoke;
  v13[3] = &unk_1E650F2B8;
  id v11 = v9;
  id v14 = v11;
  id v12 = v8;
  id v15 = v12;
  long long v16 = self;
  BOOL v17 = a4;
  ims::performBlock((IMSClientManager *)v13);
}

void __47__AVCRTTSessionDelegate_stream_didPause_error___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    std::string::basic_string[abi:ne180100]<0>(&v23, "avc.rtt.delegate");
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    uint64_t v2 = ims::error((uint64_t)&v23, (uint64_t)__p);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v2 + 8), (uint64_t)"Failed to pause session ", 24);
    *(unsigned char *)(v2 + 17) = 0;
    std::ostream::operator<<();
    *(unsigned char *)(v2 + 17) = 0;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v2 + 8), (uint64_t)" error: ", 8);
    *(unsigned char *)(v2 + 17) = 0;
    id v3 = [*(id *)(a1 + 32) description];
    uint64_t v4 = (const char *)[v3 UTF8String];
    size_t v5 = strlen(v4);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v2 + 8), (uint64_t)v4, v5);
    *(unsigned char *)(v2 + 17) = 0;
    (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v2 + 64))(v2, std::endl[abi:ne180100]<char,std::char_traits<char>>);
    *(unsigned char *)(v2 + 17) = 0;

    if (v22 < 0) {
      operator delete(__p[0]);
    }
    if (v25 < 0) {
      operator delete(v23);
    }
  }
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(std::__shared_weak_count **)(v6 + 16);
  if (v7)
  {
    id v8 = std::__shared_weak_count::lock(v7);
    if (v8)
    {
      uint64_t v9 = *(void *)(v6 + 8);
      if (v9)
      {
        (*(void (**)(void **__return_ptr, uint64_t))(*(void *)(v9 + 24) + 152))(&v23, v9 + 24);
        if (v24)
        {
          uint64_t v10 = std::__shared_weak_count::lock(v24);
          if (v10) {
            id v11 = v23;
          }
          else {
            id v11 = 0;
          }
          if (v24) {
            std::__shared_weak_count::__release_weak(v24);
          }
          if (v11)
          {
            if (*(unsigned char *)(v9 + 485))
            {
              *(unsigned char *)(v9 + 485) = 0;
              uint64_t v19 = v9 + 24;
              v20 = v8;
              atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
              if (*(unsigned char *)(a1 + 56)) {
                uint64_t v12 = 0;
              }
              else {
                uint64_t v12 = 9;
              }
              (*(void (**)(void *, uint64_t *, uint64_t))(*(void *)v11 + 16))(v11, &v19, v12);
              char v13 = v20;
              if (!v20) {
                goto LABEL_39;
              }
            }
            else
            {
              uint64_t v17 = v9 + 24;
              uint64_t v18 = v8;
              atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
              if (*(unsigned char *)(a1 + 56)) {
                uint64_t v16 = 0;
              }
              else {
                uint64_t v16 = 9;
              }
              (*(void (**)(void *, uint64_t *, uint64_t))(*(void *)v11 + 24))(v11, &v17, v16);
              char v13 = v18;
              if (!v18) {
                goto LABEL_39;
              }
            }
            std::__shared_weak_count::__release_shared[abi:ne180100](v13);
LABEL_39:
            if (v10) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v10);
            }
LABEL_41:
            std::__shared_weak_count::__release_shared[abi:ne180100](v8);
            return;
          }
        }
        else
        {
          uint64_t v10 = 0;
        }
        std::string::basic_string[abi:ne180100]<0>(&v23, "avc.rtt.delegate");
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        uint64_t v15 = ims::warn((uint64_t)&v23, (uint64_t)__p);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v15 + 8), (uint64_t)"Ignoring didPause notification received for session ", 52);
        *(unsigned char *)(v15 + 17) = 0;
        (*(void (**)(uint64_t))(*(void *)(v9 + 24) + 176))(v9 + 24);
        std::ostream::operator<<();
        *(unsigned char *)(v15 + 17) = 0;
        (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v15 + 64))(v15, std::endl[abi:ne180100]<char,std::char_traits<char>>);
        *(unsigned char *)(v15 + 17) = 0;
        if (v22 < 0) {
          operator delete(__p[0]);
        }
        if (v25 < 0) {
          operator delete(v23);
        }
        goto LABEL_39;
      }
    }
  }
  else
  {
    id v8 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(&v23, "avc.rtt.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v14 = ims::debug((uint64_t)&v23, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v14 + 8), (uint64_t)"-[AVCRTTSessionDelegate stream:didPause:error:]_block_invoke", 60);
  *(unsigned char *)(v14 + 17) = 0;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v14 + 8), (uint64_t)" owner is null", 14);
  *(unsigned char *)(v14 + 17) = 0;
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v14 + 64))(v14, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v14 + 17) = 0;
  if (v22 < 0) {
    operator delete(__p[0]);
  }
  if (v25 < 0) {
    operator delete(v23);
  }
  if (v8) {
    goto LABEL_41;
  }
}

- (void)stream:(id)a3 didResume:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  std::string::basic_string[abi:ne180100]<0>(v20, "avc.rtt.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v10 = ims::debug((uint64_t)v20, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v10 + 8), (uint64_t)"-[AVCRTTSessionDelegate stream:didResume:error:]", 48);
  *(unsigned char *)(v10 + 17) = 0;
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v10 + 64))(v10, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v10 + 17) = 0;
  if (v19 < 0) {
    operator delete(__p[0]);
  }
  if (v21 < 0) {
    operator delete(v20[0]);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __48__AVCRTTSessionDelegate_stream_didResume_error___block_invoke;
  v13[3] = &unk_1E650F2B8;
  id v11 = v9;
  id v14 = v11;
  id v12 = v8;
  id v15 = v12;
  uint64_t v16 = self;
  BOOL v17 = a4;
  ims::performBlock((IMSClientManager *)v13);
}

void __48__AVCRTTSessionDelegate_stream_didResume_error___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    std::string::basic_string[abi:ne180100]<0>(&v21, "avc.rtt.delegate");
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    uint64_t v2 = ims::error((uint64_t)&v21, (uint64_t)__p);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v2 + 8), (uint64_t)"Failed to resume session ", 25);
    *(unsigned char *)(v2 + 17) = 0;
    std::ostream::operator<<();
    *(unsigned char *)(v2 + 17) = 0;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v2 + 8), (uint64_t)" error: ", 8);
    *(unsigned char *)(v2 + 17) = 0;
    id v3 = [*(id *)(a1 + 32) description];
    uint64_t v4 = (const char *)[v3 UTF8String];
    size_t v5 = strlen(v4);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v2 + 8), (uint64_t)v4, v5);
    *(unsigned char *)(v2 + 17) = 0;
    (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v2 + 64))(v2, std::endl[abi:ne180100]<char,std::char_traits<char>>);
    *(unsigned char *)(v2 + 17) = 0;

    if (v20 < 0) {
      operator delete(__p[0]);
    }
    if (v23 < 0) {
      operator delete(v21);
    }
  }
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(std::__shared_weak_count **)(v6 + 16);
  if (v7)
  {
    id v8 = std::__shared_weak_count::lock(v7);
    if (v8)
    {
      uint64_t v9 = *(void *)(v6 + 8);
      if (v9)
      {
        uint64_t v11 = *(void *)(v9 + 24);
        uint64_t v10 = v9 + 24;
        (*(void (**)(void **__return_ptr, uint64_t))(v11 + 152))(&v21, v10);
        if (v22)
        {
          id v12 = std::__shared_weak_count::lock(v22);
          if (v12) {
            char v13 = v21;
          }
          else {
            char v13 = 0;
          }
          if (v22) {
            std::__shared_weak_count::__release_weak(v22);
          }
          if (v13)
          {
            uint64_t v17 = v10;
            uint64_t v18 = v8;
            atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
            if (*(unsigned char *)(a1 + 56)) {
              uint64_t v14 = 0;
            }
            else {
              uint64_t v14 = 9;
            }
            (*(void (**)(void *, uint64_t *, uint64_t))(*(void *)v13 + 24))(v13, &v17, v14);
            if (v18) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v18);
            }
LABEL_33:
            if (v12) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v12);
            }
LABEL_35:
            std::__shared_weak_count::__release_shared[abi:ne180100](v8);
            return;
          }
        }
        else
        {
          id v12 = 0;
        }
        std::string::basic_string[abi:ne180100]<0>(&v21, "avc.rtt.delegate");
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        uint64_t v16 = ims::warn((uint64_t)&v21, (uint64_t)__p);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v16 + 8), (uint64_t)"Ignoring didResume notification received for session ", 53);
        *(unsigned char *)(v16 + 17) = 0;
        (*(void (**)(uint64_t))(*(void *)v10 + 176))(v10);
        std::ostream::operator<<();
        *(unsigned char *)(v16 + 17) = 0;
        (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v16 + 64))(v16, std::endl[abi:ne180100]<char,std::char_traits<char>>);
        *(unsigned char *)(v16 + 17) = 0;
        if (v20 < 0) {
          operator delete(__p[0]);
        }
        if (v23 < 0) {
          operator delete(v21);
        }
        goto LABEL_33;
      }
    }
  }
  else
  {
    id v8 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(&v21, "avc.rtt.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v15 = ims::debug((uint64_t)&v21, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v15 + 8), (uint64_t)"-[AVCRTTSessionDelegate stream:didResume:error:]_block_invoke", 61);
  *(unsigned char *)(v15 + 17) = 0;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v15 + 8), (uint64_t)" owner is null", 14);
  *(unsigned char *)(v15 + 17) = 0;
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v15 + 64))(v15, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v15 + 17) = 0;
  if (v20 < 0) {
    operator delete(__p[0]);
  }
  if (v23 < 0) {
    operator delete(v21);
  }
  if (v8) {
    goto LABEL_35;
  }
}

- (void)streamDidRTPTimeOut:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:ne180100]<0>(v9, "avc.rtt.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v5 = ims::debug((uint64_t)v9, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v5 + 8), (uint64_t)"-[AVCRTTSessionDelegate streamDidRTPTimeOut:]", 45);
  *(unsigned char *)(v5 + 17) = 0;
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v5 + 64))(v5, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v5 + 17) = 0;
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  if (v10 < 0) {
    operator delete(v9[0]);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__AVCRTTSessionDelegate_streamDidRTPTimeOut___block_invoke;
  v6[3] = &unk_1E650F2E0;
  v6[4] = self;
  ims::performBlock((IMSClientManager *)v6);
}

void __45__AVCRTTSessionDelegate_streamDidRTPTimeOut___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(std::__shared_weak_count **)(v1 + 16);
  if (v2)
  {
    id v3 = std::__shared_weak_count::lock(v2);
    if (v3)
    {
      uint64_t v4 = *(void *)(v1 + 8);
      if (v4)
      {
        uint64_t v6 = *(void *)(v4 + 24);
        uint64_t v5 = v4 + 24;
        (*(void (**)(void **__return_ptr, uint64_t))(v6 + 152))(&v15, v5);
        if (v16)
        {
          uint64_t v7 = std::__shared_weak_count::lock(v16);
          if (v7) {
            char v8 = v15;
          }
          else {
            char v8 = 0;
          }
          if (v16) {
            std::__shared_weak_count::__release_weak(v16);
          }
          if (v8)
          {
            uint64_t v11 = v5;
            id v12 = v3;
            atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
            (*(void (**)(void *, uint64_t *, uint64_t))(*(void *)v8 + 40))(v8, &v11, 5);
            if (v12) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v12);
            }
LABEL_25:
            if (v7) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v7);
            }
LABEL_27:
            std::__shared_weak_count::__release_shared[abi:ne180100](v3);
            return;
          }
        }
        else
        {
          uint64_t v7 = 0;
        }
        std::string::basic_string[abi:ne180100]<0>(&v15, "avc.rtt.delegate");
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        uint64_t v10 = ims::warn((uint64_t)&v15, (uint64_t)__p);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v10 + 8), (uint64_t)"Ignoring RTP timeout notification received for session ", 55);
        *(unsigned char *)(v10 + 17) = 0;
        (*(void (**)(uint64_t))(*(void *)v5 + 176))(v5);
        std::ostream::operator<<();
        *(unsigned char *)(v10 + 17) = 0;
        (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v10 + 64))(v10, std::endl[abi:ne180100]<char,std::char_traits<char>>);
        *(unsigned char *)(v10 + 17) = 0;
        if (v14 < 0) {
          operator delete(__p[0]);
        }
        if (v17 < 0) {
          operator delete(v15);
        }
        goto LABEL_25;
      }
    }
  }
  else
  {
    id v3 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(&v15, "avc.rtt.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v9 = ims::debug((uint64_t)&v15, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v9 + 8), (uint64_t)"-[AVCRTTSessionDelegate streamDidRTPTimeOut:]_block_invoke", 58);
  *(unsigned char *)(v9 + 17) = 0;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v9 + 8), (uint64_t)" owner is null", 14);
  *(unsigned char *)(v9 + 17) = 0;
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v9 + 64))(v9, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v9 + 17) = 0;
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  if (v17 < 0) {
    operator delete(v15);
  }
  if (v3) {
    goto LABEL_27;
  }
}

- (void)streamDidRTCPTimeOut:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:ne180100]<0>(v9, "avc.rtt.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v5 = ims::debug((uint64_t)v9, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v5 + 8), (uint64_t)"-[AVCRTTSessionDelegate streamDidRTCPTimeOut:]", 46);
  *(unsigned char *)(v5 + 17) = 0;
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v5 + 64))(v5, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v5 + 17) = 0;
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  if (v10 < 0) {
    operator delete(v9[0]);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__AVCRTTSessionDelegate_streamDidRTCPTimeOut___block_invoke;
  v6[3] = &unk_1E650F2E0;
  v6[4] = self;
  ims::performBlock((IMSClientManager *)v6);
}

void __46__AVCRTTSessionDelegate_streamDidRTCPTimeOut___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(std::__shared_weak_count **)(v1 + 16);
  if (v2)
  {
    id v3 = std::__shared_weak_count::lock(v2);
    if (v3)
    {
      uint64_t v4 = *(void *)(v1 + 8);
      if (v4)
      {
        uint64_t v6 = *(void *)(v4 + 24);
        uint64_t v5 = v4 + 24;
        (*(void (**)(void **__return_ptr, uint64_t))(v6 + 152))(&v15, v5);
        if (v16)
        {
          uint64_t v7 = std::__shared_weak_count::lock(v16);
          if (v7) {
            char v8 = v15;
          }
          else {
            char v8 = 0;
          }
          if (v16) {
            std::__shared_weak_count::__release_weak(v16);
          }
          if (v8)
          {
            uint64_t v11 = v5;
            id v12 = v3;
            atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
            (*(void (**)(void *, uint64_t *, uint64_t))(*(void *)v8 + 40))(v8, &v11, 6);
            if (v12) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v12);
            }
LABEL_25:
            if (v7) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v7);
            }
LABEL_27:
            std::__shared_weak_count::__release_shared[abi:ne180100](v3);
            return;
          }
        }
        else
        {
          uint64_t v7 = 0;
        }
        std::string::basic_string[abi:ne180100]<0>(&v15, "avc.rtt.delegate");
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        uint64_t v10 = ims::warn((uint64_t)&v15, (uint64_t)__p);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v10 + 8), (uint64_t)"Ignoring RTCP timeout notification received for session ", 56);
        *(unsigned char *)(v10 + 17) = 0;
        (*(void (**)(uint64_t))(*(void *)v5 + 176))(v5);
        std::ostream::operator<<();
        *(unsigned char *)(v10 + 17) = 0;
        (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v10 + 64))(v10, std::endl[abi:ne180100]<char,std::char_traits<char>>);
        *(unsigned char *)(v10 + 17) = 0;
        if (v14 < 0) {
          operator delete(__p[0]);
        }
        if (v17 < 0) {
          operator delete(v15);
        }
        goto LABEL_25;
      }
    }
  }
  else
  {
    id v3 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(&v15, "avc.rtt.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v9 = ims::debug((uint64_t)&v15, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v9 + 8), (uint64_t)"-[AVCRTTSessionDelegate streamDidRTCPTimeOut:]_block_invoke", 59);
  *(unsigned char *)(v9 + 17) = 0;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v9 + 8), (uint64_t)" owner is null", 14);
  *(unsigned char *)(v9 + 17) = 0;
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v9 + 64))(v9, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v9 + 17) = 0;
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  if (v17 < 0) {
    operator delete(v15);
  }
  if (v3) {
    goto LABEL_27;
  }
}

- (AVCRTTSessionDelegate)initWithOwner:(shared_ptr<AVCRTTSession>)a3 andStackController:(shared_ptr<AVCRTPStackController>)a4
{
  var1 = a3.var1;
  var0 = a3.var0;
  std::string::basic_string[abi:ne180100]<0>(v20, "avc.rtt.sessiondelegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v7 = ims::debug((uint64_t)v20, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v7 + 8), (uint64_t)"-[AVCRTTSessionDelegate initWithOwner:andStackController:]", 58);
  *(unsigned char *)(v7 + 17) = 0;
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v7 + 64))(v7, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v7 + 17) = 0;
  if (v19 < 0) {
    operator delete(__p[0]);
  }
  if (v21 < 0) {
    operator delete(v20[0]);
  }
  v17.receiver = self;
  v17.super_class = (Class)AVCRTTSessionDelegate;
  char v8 = [(AVCRTTSessionDelegate *)&v17 init];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v11 = *(AVCRTTSession **)var0;
    uint64_t v10 = *((void *)var0 + 1);
    if (v10) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 16), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v8->owner.__cntrl_;
    v9->owner.__ptr_ = v11;
    v9->owner.__cntrl_ = (__shared_weak_count *)v10;
    if (cntrl) {
      std::__shared_weak_count::__release_weak(cntrl);
    }
    char v14 = *(AVCRTPStackController **)var1;
    uint64_t v13 = *((void *)var1 + 1);
    if (v13) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v13 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t v15 = (std::__shared_weak_count *)v9->stackController.__cntrl_;
    v9->stackController.__ptr_ = v14;
    v9->stackController.__cntrl_ = (__shared_weak_count *)v13;
    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
  }
  return v9;
}

- (weak_ptr<AVCRTTSession>)owner
{
  cntrl = self->owner.__cntrl_;
  *uint64_t v2 = self->owner.__ptr_;
  v2[1] = (AVCRTTSession *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 2, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (AVCRTTSession *)self;
  return result;
}

- (void)setOwner:(weak_ptr<AVCRTTSession>)a3
{
  uint64_t v4 = *(AVCRTTSession **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 16), 1uLL, memory_order_relaxed);
  }
  cntrl = self->owner.__cntrl_;
  self->owner.__ptr_ = v4;
  self->owner.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (shared_ptr<AVCRTPStackController>)stackController
{
  cntrl = self->stackController.__cntrl_;
  *uint64_t v2 = self->stackController.__ptr_;
  v2[1] = (AVCRTPStackController *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (AVCRTPStackController *)self;
  return result;
}

- (void)setStackController:(shared_ptr<AVCRTPStackController>)a3
{
  uint64_t v4 = *(AVCRTPStackController **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->stackController.__cntrl_;
  self->stackController.__ptr_ = v4;
  self->stackController.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void).cxx_destruct
{
  cntrl = self->stackController.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  uint64_t v4 = self->owner.__cntrl_;
  if (v4)
  {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end