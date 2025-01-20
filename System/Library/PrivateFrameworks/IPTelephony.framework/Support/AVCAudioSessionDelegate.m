@interface AVCAudioSessionDelegate
- (AVCAudioSessionDelegate)initWithOwner:(shared_ptr<AVCAudioSession>)a3 andStackController:(shared_ptr<AVCRTPStackController>)a4;
- (id).cxx_construct;
- (shared_ptr<AVCRTPStackController>)stackController;
- (void)handleRTCPPacketWithBlock:(id)a3;
- (void)setOwner:(weak_ptr<AVCAudioSession>)a3;
- (void)setStackController:(shared_ptr<AVCRTPStackController>)a3;
- (void)stream:(id)a3 didPause:(BOOL)a4 error:(id)a5;
- (void)stream:(id)a3 didReceiveDTMFEventWithDigit:(char)a4;
- (void)stream:(id)a3 didReceiveRTCPPackets:(id)a4;
- (void)stream:(id)a3 didResume:(BOOL)a4 error:(id)a5;
- (void)stream:(id)a3 didStart:(BOOL)a4 error:(id)a5;
- (void)stream:(id)a3 updateInputFrequencyLevel:(id)a4;
- (void)stream:(id)a3 updateOutputFrequencyLevel:(id)a4;
- (void)streamDidRTCPTimeOut:(id)a3;
- (void)streamDidRTPTimeOut:(id)a3;
- (void)streamDidServerDie:(id)a3;
- (void)streamDidStop:(id)a3;
- (weak_ptr<AVCAudioSession>)owner;
@end

@implementation AVCAudioSessionDelegate

- (void)stream:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  std::string::basic_string[abi:ne180100]<0>(v20, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v10 = ims::debug((uint64_t)v20, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v10 + 8), (uint64_t)"-[AVCAudioSessionDelegate stream:didStart:error:]", 49);
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
  v13[2] = __49__AVCAudioSessionDelegate_stream_didStart_error___block_invoke;
  v13[3] = &unk_1E650F2B8;
  id v11 = v9;
  id v14 = v11;
  id v12 = v8;
  id v15 = v12;
  v16 = self;
  BOOL v17 = a4;
  ims::performBlock((IMSClientManager *)v13);
}

void __49__AVCAudioSessionDelegate_stream_didStart_error___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    std::string::basic_string[abi:ne180100]<0>(&v26, "avc.audio.delegate");
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
            MediaSessionDriver::cancelTimerForRequest(v9 + 3, 0);
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
                  AVCRTPSession<AVCAudioStream>::pauseAVCSession((uint64_t)v9);
                  goto LABEL_50;
                }
                __int8 v13 = *(unsigned char *)(a1 + 56);
              }
              v9[60].i8[1] = v13;
              v9[60].i8[2] = *(unsigned char *)(a1 + 56) ^ 1;
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
              v9[60].i8[2] = *(unsigned char *)(a1 + 56) ^ 1;
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
        std::string::basic_string[abi:ne180100]<0>(&v26, "avc.audio.delegate");
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
  std::string::basic_string[abi:ne180100]<0>(&v26, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v14 = ims::debug((uint64_t)&v26, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v14 + 8), (uint64_t)"-[AVCAudioSessionDelegate stream:didStart:error:]_block_invoke", 62);
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

- (void)stream:(id)a3 didPause:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  std::string::basic_string[abi:ne180100]<0>(v20, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v10 = ims::debug((uint64_t)v20, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v10 + 8), (uint64_t)"-[AVCAudioSessionDelegate stream:didPause:error:]", 49);
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
  v13[2] = __49__AVCAudioSessionDelegate_stream_didPause_error___block_invoke;
  v13[3] = &unk_1E650F2B8;
  id v11 = v9;
  id v14 = v11;
  id v12 = v8;
  id v15 = v12;
  uint64_t v16 = self;
  BOOL v17 = a4;
  ims::performBlock((IMSClientManager *)v13);
}

void __49__AVCAudioSessionDelegate_stream_didPause_error___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    std::string::basic_string[abi:ne180100]<0>(&v23, "avc.audio.delegate");
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    uint64_t v2 = ims::error((uint64_t)&v23, (uint64_t)__p);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v2 + 8), (uint64_t)"Failed to pause session ", 24);
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

    if (v22 < 0) {
      operator delete(__p[0]);
    }
    if (v25 < 0) {
      operator delete(v23);
    }
  }
  uint64_t v6 = *(void *)(a1 + 48);
  v7 = *(std::__shared_weak_count **)(v6 + 16);
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
              __int8 v13 = v20;
              if (!v20) {
                goto LABEL_39;
              }
            }
            else
            {
              *(unsigned char *)(v9 + 482) = 1;
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
              __int8 v13 = v18;
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
        std::string::basic_string[abi:ne180100]<0>(&v23, "avc.audio.delegate");
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
  std::string::basic_string[abi:ne180100]<0>(&v23, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v14 = ims::debug((uint64_t)&v23, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v14 + 8), (uint64_t)"-[AVCAudioSessionDelegate stream:didPause:error:]_block_invoke", 62);
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
  std::string::basic_string[abi:ne180100]<0>(v20, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v10 = ims::debug((uint64_t)v20, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v10 + 8), (uint64_t)"-[AVCAudioSessionDelegate stream:didResume:error:]", 50);
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
  v13[2] = __50__AVCAudioSessionDelegate_stream_didResume_error___block_invoke;
  v13[3] = &unk_1E650F2B8;
  id v11 = v9;
  id v14 = v11;
  id v12 = v8;
  id v15 = v12;
  uint64_t v16 = self;
  BOOL v17 = a4;
  ims::performBlock((IMSClientManager *)v13);
}

void __50__AVCAudioSessionDelegate_stream_didResume_error___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    std::string::basic_string[abi:ne180100]<0>(&v19, "avc.audio.delegate");
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    uint64_t v2 = ims::error((uint64_t)&v19, (uint64_t)__p);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v2 + 8), (uint64_t)"Failed to resume session ", 25);
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

    if (v18 < 0) {
      operator delete(__p[0]);
    }
    if (v21 < 0) {
      operator delete(v19);
    }
  }
  uint64_t v6 = *(void *)(a1 + 48);
  v7 = *(std::__shared_weak_count **)(v6 + 16);
  if (v7)
  {
    id v8 = std::__shared_weak_count::lock(v7);
    if (v8)
    {
      uint64_t v9 = *(void *)(v6 + 8);
      if (v9)
      {
        (*(void (**)(void **__return_ptr, uint64_t))(*(void *)(v9 + 24) + 152))(&v19, v9 + 24);
        if (v20)
        {
          uint64_t v10 = std::__shared_weak_count::lock(v20);
          if (v10) {
            id v11 = v19;
          }
          else {
            id v11 = 0;
          }
          if (v20) {
            std::__shared_weak_count::__release_weak(v20);
          }
          if (v11)
          {
            *(unsigned char *)(v9 + 482) = 0;
            uint64_t v15 = v9 + 24;
            uint64_t v16 = v8;
            atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
            if (*(unsigned char *)(a1 + 56)) {
              uint64_t v12 = 0;
            }
            else {
              uint64_t v12 = 9;
            }
            (*(void (**)(void *, uint64_t *, uint64_t))(*(void *)v11 + 24))(v11, &v15, v12);
            if (v16) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v16);
            }
LABEL_33:
            if (v10) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v10);
            }
LABEL_35:
            std::__shared_weak_count::__release_shared[abi:ne180100](v8);
            return;
          }
        }
        else
        {
          uint64_t v10 = 0;
        }
        std::string::basic_string[abi:ne180100]<0>(&v19, "avc.audio.delegate");
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        uint64_t v14 = ims::warn((uint64_t)&v19, (uint64_t)__p);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v14 + 8), (uint64_t)"Ignoring didResume notification received for session ", 53);
        *(unsigned char *)(v14 + 17) = 0;
        (*(void (**)(uint64_t))(*(void *)(v9 + 24) + 176))(v9 + 24);
        std::ostream::operator<<();
        *(unsigned char *)(v14 + 17) = 0;
        (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v14 + 64))(v14, std::endl[abi:ne180100]<char,std::char_traits<char>>);
        *(unsigned char *)(v14 + 17) = 0;
        if (v18 < 0) {
          operator delete(__p[0]);
        }
        if (v21 < 0) {
          operator delete(v19);
        }
        goto LABEL_33;
      }
    }
  }
  else
  {
    id v8 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(&v19, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v13 = ims::debug((uint64_t)&v19, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v13 + 8), (uint64_t)"-[AVCAudioSessionDelegate stream:didResume:error:]_block_invoke", 63);
  *(unsigned char *)(v13 + 17) = 0;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v13 + 8), (uint64_t)" owner is null", 14);
  *(unsigned char *)(v13 + 17) = 0;
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v13 + 64))(v13, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v13 + 17) = 0;
  if (v18 < 0) {
    operator delete(__p[0]);
  }
  if (v21 < 0) {
    operator delete(v19);
  }
  if (v8) {
    goto LABEL_35;
  }
}

- (void)streamDidStop:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:ne180100]<0>(v9, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v5 = ims::debug((uint64_t)v9, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v5 + 8), (uint64_t)"-[AVCAudioSessionDelegate streamDidStop:]", 41);
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
  v6[2] = __41__AVCAudioSessionDelegate_streamDidStop___block_invoke;
  v6[3] = &unk_1E650F2E0;
  v6[4] = self;
  ims::performBlock((IMSClientManager *)v6);
}

void __41__AVCAudioSessionDelegate_streamDidStop___block_invoke(uint64_t a1)
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
            MediaSessionDriver::cancelTimerForRequest(v4 + 3, 2);
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
        std::string::basic_string[abi:ne180100]<0>(&v14, "avc.audio.delegate");
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
  std::string::basic_string[abi:ne180100]<0>(&v14, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v8 = ims::debug((uint64_t)&v14, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v8 + 8), (uint64_t)"-[AVCAudioSessionDelegate streamDidStop:]_block_invoke", 54);
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

- (void)streamDidRTPTimeOut:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:ne180100]<0>(v9, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v5 = ims::debug((uint64_t)v9, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v5 + 8), (uint64_t)"-[AVCAudioSessionDelegate streamDidRTPTimeOut:]", 47);
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
  v6[2] = __47__AVCAudioSessionDelegate_streamDidRTPTimeOut___block_invoke;
  v6[3] = &unk_1E650F2E0;
  v6[4] = self;
  ims::performBlock((IMSClientManager *)v6);
}

void __47__AVCAudioSessionDelegate_streamDidRTPTimeOut___block_invoke(uint64_t a1)
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
          v7 = std::__shared_weak_count::lock(v16);
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
            uint64_t v12 = v3;
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
          v7 = 0;
        }
        std::string::basic_string[abi:ne180100]<0>(&v15, "avc.audio.delegate");
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
  std::string::basic_string[abi:ne180100]<0>(&v15, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v9 = ims::debug((uint64_t)&v15, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v9 + 8), (uint64_t)"-[AVCAudioSessionDelegate streamDidRTPTimeOut:]_block_invoke", 60);
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
  std::string::basic_string[abi:ne180100]<0>(v9, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v5 = ims::debug((uint64_t)v9, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v5 + 8), (uint64_t)"-[AVCAudioSessionDelegate streamDidRTCPTimeOut:]", 48);
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
  v6[2] = __48__AVCAudioSessionDelegate_streamDidRTCPTimeOut___block_invoke;
  v6[3] = &unk_1E650F2E0;
  v6[4] = self;
  ims::performBlock((IMSClientManager *)v6);
}

void __48__AVCAudioSessionDelegate_streamDidRTCPTimeOut___block_invoke(uint64_t a1)
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
          v7 = std::__shared_weak_count::lock(v16);
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
            uint64_t v12 = v3;
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
          v7 = 0;
        }
        std::string::basic_string[abi:ne180100]<0>(&v15, "avc.audio.delegate");
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
  std::string::basic_string[abi:ne180100]<0>(&v15, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v9 = ims::debug((uint64_t)&v15, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v9 + 8), (uint64_t)"-[AVCAudioSessionDelegate streamDidRTCPTimeOut:]_block_invoke", 61);
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

- (void)stream:(id)a3 didReceiveDTMFEventWithDigit:(char)a4
{
  id v6 = a3;
  std::string::basic_string[abi:ne180100]<0>(v12, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v7 = ims::debug((uint64_t)v12, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v7 + 8), (uint64_t)"-[AVCAudioSessionDelegate stream:didReceiveDTMFEventWithDigit:]", 63);
  *(unsigned char *)(v7 + 17) = 0;
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v7 + 64))(v7, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v7 + 17) = 0;
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  if (v13 < 0) {
    operator delete(v12[0]);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__AVCAudioSessionDelegate_stream_didReceiveDTMFEventWithDigit___block_invoke;
  v8[3] = &unk_1E6511E40;
  char v9 = a4;
  v8[4] = self;
  ims::performBlock((IMSClientManager *)v8);
}

void __63__AVCAudioSessionDelegate_stream_didReceiveDTMFEventWithDigit___block_invoke()
{
  std::string::basic_string[abi:ne180100]<0>(v2, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(v1, "");
  uint64_t v0 = ims::debug((uint64_t)v2, (uint64_t)v1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v0 + 8), (uint64_t)"DTMF digit received: ", 21);
  *(unsigned char *)(v0 + 17) = 0;
  ims::detail::to_string_impl<char,std::integral_constant<BOOL,false>>::operator()();
}

- (void)stream:(id)a3 didReceiveRTCPPackets:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  std::string::basic_string[abi:ne180100]<0>(v17, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v8 = ims::debug((uint64_t)v17, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v8 + 8), (uint64_t)"-[AVCAudioSessionDelegate stream:didReceiveRTCPPackets:]", 56);
  *(unsigned char *)(v8 + 17) = 0;
  uint64_t v9 = (*(uint64_t (**)(uint64_t, void *(*)(void *)))(*(void *)v8 + 64))(v8, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v8 + 17) = 0;
  if (v16 < 0) {
    operator delete(__p[0]);
  }
  if (v18 < 0) {
    operator delete(v17[0]);
  }
  uint64_t v10 = (void *)MEMORY[0x1C878EAB0](v9);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__AVCAudioSessionDelegate_stream_didReceiveRTCPPackets___block_invoke;
  v12[3] = &unk_1E6511E90;
  id v11 = v7;
  id v13 = v11;
  char v14 = self;
  ims::performBlock((IMSClientManager *)v12);
}

void __56__AVCAudioSessionDelegate_stream_didReceiveRTCPPackets___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    uint64_t v41 = [v1 count];
    if (v41)
    {
      for (uint64_t i = 0; v41 != i; ++i)
      {
        id v3 = [*(id *)(a1 + 32) objectAtIndex:i];
        if (!v3)
        {
          uint64_t v4 = 0;
          std::string::basic_string[abi:ne180100]<0>(&v61, "avc.audio.delegate");
          std::string::basic_string[abi:ne180100]<0>(v55, "");
          uint64_t v10 = ims::debug((uint64_t)&v61, (uint64_t)v55);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v10 + 8), (uint64_t)"NULL Packet at index: ", 22);
          *(unsigned char *)(v10 + 17) = 0;
          std::ostream::operator<<();
          *(unsigned char *)(v10 + 17) = 0;
          (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v10 + 64))(v10, std::endl[abi:ne180100]<char,std::char_traits<char>>);
          goto LABEL_14;
        }
        uint64_t v4 = v3;
        int v5 = [v3 packetType];
        switch(v5)
        {
          case 200:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              std::string::basic_string[abi:ne180100]<0>(&v61, "avc.audio.delegate");
              std::string::basic_string[abi:ne180100]<0>(v55, "");
              uint64_t v10 = ims::error((uint64_t)&v61, (uint64_t)v55);
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v10 + 8), (uint64_t)"Packet type is not AVCRTCPSenderReport", 38);
              *(unsigned char *)(v10 + 17) = 0;
              (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v10 + 64))(v10, std::endl[abi:ne180100]<char,std::char_traits<char>>);
              goto LABEL_14;
            }
            id v6 = v4;
            unsigned int v11 = [v6 NTPMostSignificantWord];
            unsigned int v12 = [v6 NTPLeastSignificantWord];
            unsigned int v13 = [v6 RTPTimestamp];
            unsigned int v14 = [v6 packetsSent];
            unsigned int v15 = [v6 octetsSent];
            v61 = 0;
            v62 = &v61;
            uint64_t v63 = 0x7812000000;
            v64 = __Block_byref_object_copy__7;
            v65 = __Block_byref_object_dispose__7;
            v66 = "";
            long long v67 = 0u;
            long long v68 = 0u;
            long long v69 = 0u;
            long long v70 = 0u;
            uint64_t v71 = 0;
            unsigned int v16 = [v6 SSRC];
            BYTE8(v67) = 0;
            WORD6(v67) = 0;
            LODWORD(v68) = 0;
            WORD2(v68) = 0;
            *(void *)&long long v67 = &unk_1F20E0780;
            *((void *)&v68 + 1) = __PAIR64__(v11, v16);
            *(void *)&long long v69 = __PAIR64__(v13, v12);
            *((void *)&v69 + 1) = __PAIR64__(v15, v14);
            uint64_t v71 = 0;
            long long v70 = 0uLL;
            char v17 = *(void **)(a1 + 40);
            v60[0] = MEMORY[0x1E4F143A8];
            v60[1] = 3221225472;
            v60[2] = __56__AVCAudioSessionDelegate_stream_didReceiveRTCPPackets___block_invoke_17;
            v60[3] = &unk_1E6511E68;
            v60[4] = v17;
            v60[5] = &v61;
            [v17 handleRTCPPacketWithBlock:v60];
            char v18 = [v6 receiverReport];
            char v19 = v18;
            if (v18)
            {
              int v39 = [v18 reportedSourceSSRC];
              char v38 = [v19 fractionLost];
              unsigned int v20 = [v19 cumulativePacketsLost];
              unsigned int v21 = [v19 extendedHighestSequenceNumber];
              unsigned int v22 = [v19 interarrivalJitter];
              unsigned int v23 = [v19 lastSRTimestamp];
              int v24 = [v19 delaySinceLastSR];
              v55[0] = 0;
              v55[1] = v55;
              v55[2] = (void *)0x6812000000;
              v55[3] = __Block_byref_object_copy__18;
              v55[4] = __Block_byref_object_dispose__19;
              v55[5] = "";
              long long v56 = 0u;
              long long v57 = 0u;
              long long __p = 0u;
              uint64_t v59 = 0;
              int v25 = [v6 SSRC];
              BYTE8(v56) = 0;
              WORD6(v56) = 0;
              LODWORD(v57) = 0;
              WORD2(v57) = 0;
              *(void *)&long long v56 = &unk_1F20E3660;
              DWORD2(v57) = v25;
              uint64_t v59 = 0;
              long long __p = 0uLL;
              BYTE7(v49) = 0;
              *(_WORD *)((char *)&v49 + 5) = 0;
              LODWORD(v49) = v39;
              BYTE4(v49) = v38;
              *((void *)&v49 + 1) = __PAIR64__(v21, v20);
              *(void *)&long long v50 = __PAIR64__(v23, v22);
              DWORD2(v50) = v24;
              RTCPReceiverReports::addReport((void **)v55[1] + 10, &v49);
              v26 = *(void **)(a1 + 40);
              v54[0] = MEMORY[0x1E4F143A8];
              v54[1] = 3221225472;
              v54[2] = __56__AVCAudioSessionDelegate_stream_didReceiveRTCPPackets___block_invoke_21;
              v54[3] = &unk_1E6511E68;
              v54[4] = v26;
              v54[5] = v55;
              [v26 handleRTCPPacketWithBlock:v54];
              _Block_object_dispose(v55, 8);
              *(void *)&long long v56 = &unk_1F20E3660;
              if ((void)__p)
              {
                *((void *)&__p + 1) = __p;
                operator delete((void *)__p);
              }
            }

            _Block_object_dispose(&v61, 8);
            *(void *)&long long v67 = &unk_1F20E0780;
            if ((void)v70)
            {
              *((void *)&v70 + 1) = v70;
              operator delete((void *)v70);
            }
            break;
          case 201:
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v27 = v4;
              int v40 = [v27 reportedSourceSSRC];
              char v28 = [v27 fractionLost];
              unsigned int v29 = [v27 cumulativePacketsLost];
              unsigned int v30 = [v27 extendedHighestSequenceNumber];
              unsigned int v31 = [v27 interarrivalJitter];
              unsigned int v32 = [v27 lastSRTimestamp];
              int v33 = [v27 delaySinceLastSR];
              v61 = 0;
              v62 = &v61;
              uint64_t v63 = 0x6812000000;
              v64 = __Block_byref_object_copy__18;
              v65 = __Block_byref_object_dispose__19;
              v66 = "";
              long long v67 = 0u;
              long long v68 = 0u;
              long long v69 = 0u;
              *(void *)&long long v70 = 0;
              int v34 = [v27 SSRC];
              BYTE8(v67) = 0;
              WORD6(v67) = 0;
              LODWORD(v68) = 0;
              WORD2(v68) = 0;
              *(void *)&long long v67 = &unk_1F20E3660;
              DWORD2(v68) = v34;
              *(void *)&long long v70 = 0;
              long long v69 = 0uLL;
              HIBYTE(v55[0]) = 0;
              *(_WORD *)((char *)v55 + 5) = 0;
              LODWORD(v55[0]) = v40;
              BYTE4(v55[0]) = v28;
              v55[1] = (void *)__PAIR64__(v30, v29);
              v55[2] = (void *)__PAIR64__(v32, v31);
              LODWORD(v55[3]) = v33;
              RTCPReceiverReports::addReport((void **)v62 + 10, (long long *)v55);
              v35 = *(void **)(a1 + 40);
              v53[0] = MEMORY[0x1E4F143A8];
              v53[1] = 3221225472;
              v53[2] = __56__AVCAudioSessionDelegate_stream_didReceiveRTCPPackets___block_invoke_2;
              v53[3] = &unk_1E6511E68;
              v53[4] = v35;
              v53[5] = &v61;
              [v35 handleRTCPPacketWithBlock:v53];
              _Block_object_dispose(&v61, 8);
              *(void *)&long long v67 = &unk_1F20E3660;
              if ((void)v69)
              {
                *((void *)&v69 + 1) = v69;
                operator delete((void *)v69);
              }

              goto LABEL_47;
            }
            std::string::basic_string[abi:ne180100]<0>(&v61, "avc.audio.delegate");
            std::string::basic_string[abi:ne180100]<0>(v55, "");
            uint64_t v10 = ims::error((uint64_t)&v61, (uint64_t)v55);
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v10 + 8), (uint64_t)"Packet type is not AVCRTCPReceiverReport", 40);
            *(unsigned char *)(v10 + 17) = 0;
            (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v10 + 64))(v10, std::endl[abi:ne180100]<char,std::char_traits<char>>);
LABEL_14:
            *(unsigned char *)(v10 + 17) = 0;
LABEL_27:
            if (SHIBYTE(v55[2]) < 0) {
              operator delete(v55[0]);
            }
            if (SHIBYTE(v63) < 0) {
              operator delete(v61);
            }
            goto LABEL_47;
          case 202:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              std::string::basic_string[abi:ne180100]<0>(&v61, "avc.audio.delegate");
              std::string::basic_string[abi:ne180100]<0>(v55, "");
              uint64_t v10 = ims::error((uint64_t)&v61, (uint64_t)v55);
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v10 + 8), (uint64_t)"Packet type is not AVCRTCPSourceDescription", 43);
              *(unsigned char *)(v10 + 17) = 0;
              (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v10 + 64))(v10, std::endl[abi:ne180100]<char,std::char_traits<char>>);
              goto LABEL_14;
            }
            id v6 = v4;
            memset(&v52, 0, sizeof(v52));
            std::string::basic_string[abi:ne180100]<0>(&v52, "");
            id v7 = [v6 text];
            uint64_t v8 = v7;
            if (v7) {
              std::string::__assign_external(&v52, (const std::string::value_type *)[v7 UTF8String]);
            }
            memset(v55, 0, 32);
            int v9 = [v6 type];
            if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
              std::string::__init_copy_ctor_external(&__str, v52.__r_.__value_.__l.__data_, v52.__r_.__value_.__l.__size_);
            }
            else {
              std::string __str = v52;
            }
            RTCPSDesItem::RTCPSDesItem((uint64_t)v55, v9, &__str);
            if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__str.__r_.__value_.__l.__data_);
            }
            long long v49 = 0u;
            long long v50 = 0u;
            LODWORD(v49) = [v6 SSRC];
            long long v50 = 0uLL;
            *((void *)&v49 + 1) = 0;
            int v46 = (int)v55[0];
            char v47 = BYTE4(v55[0]);
            if (SHIBYTE(v55[3]) < 0) {
              std::string::__init_copy_ctor_external(&v48, (const std::string::value_type *)v55[1], (std::string::size_type)v55[2]);
            }
            else {
              std::string v48 = *(std::string *)&v55[1];
            }
            RTCPSDesInfo::addSDesItem((uint64_t)&v49, &v46);
            if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v48.__r_.__value_.__l.__data_);
            }
            v62 = 0;
            uint64_t v63 = 0;
            v61 = (void **)&unk_1F20E4F30;
            v65 = 0;
            v66 = 0;
            v64 = 0;
            int v44 = v49;
            memset(v45, 0, sizeof(v45));
            std::vector<RTCPSDesItem>::__init_with_size[abi:ne180100]<RTCPSDesItem*,RTCPSDesItem*>(v45, *((uint64_t *)&v49 + 1), v50, (uint64_t)(v50 - *((void *)&v49 + 1)) >> 5);
            RTCPSDesPacket::addSDesInfo((uint64_t *)&v61, (uint64_t)&v44);
            v72[0] = (void **)v45;
            std::vector<RTCPSDesItem>::__destroy_vector::operator()[abi:ne180100](v72);
            v37 = *(void **)(a1 + 40);
            v43[0] = MEMORY[0x1E4F143A8];
            v43[1] = 3221225472;
            v43[2] = __56__AVCAudioSessionDelegate_stream_didReceiveRTCPPackets___block_invoke_3;
            v43[3] = &unk_1E650F2E0;
            v43[4] = v37;
            [v37 handleRTCPPacketWithBlock:v43];
            v61 = (void **)&unk_1F20E4F30;
            v72[0] = (void **)&v64;
            std::vector<RTCPSDesInfo>::__destroy_vector::operator()[abi:ne180100](v72);
            v61 = (void **)&v49 + 1;
            std::vector<RTCPSDesItem>::__destroy_vector::operator()[abi:ne180100](&v61);
            if (SHIBYTE(v55[3]) < 0) {
              operator delete(v55[1]);
            }

            if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v52.__r_.__value_.__l.__data_);
            }
            break;
          default:
            std::string::basic_string[abi:ne180100]<0>(&v61, "avc.audio.delegate");
            std::string::basic_string[abi:ne180100]<0>(v55, "");
            uint64_t v36 = ims::debug((uint64_t)&v61, (uint64_t)v55);
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v36 + 8), (uint64_t)"Ignoring RTCP packet at index: ", 31);
            *(unsigned char *)(v36 + 17) = 0;
            std::ostream::operator<<();
            *(unsigned char *)(v36 + 17) = 0;
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v36 + 8), (uint64_t)" with Type: ", 12);
            *(unsigned char *)(v36 + 17) = 0;
            [v4 packetType];
            std::ostream::operator<<();
            *(unsigned char *)(v36 + 17) = 0;
            (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v36 + 64))(v36, std::endl[abi:ne180100]<char,std::char_traits<char>>);
            *(unsigned char *)(v36 + 17) = 0;
            goto LABEL_27;
        }

LABEL_47:
      }
    }
  }
}

void __56__AVCAudioSessionDelegate_stream_didReceiveRTCPPackets___block_invoke_17(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(std::__shared_weak_count **)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = std::__shared_weak_count::lock(v3);
    if (v4)
    {
      int v5 = v4;
      uint64_t v6 = *(void *)(v2 + 8);
      if (v6)
      {
        uint64_t v7 = *(void *)(v6 + 56);
        uint64_t v8 = *(std::__shared_weak_count **)(v6 + 64);
        if (v8) {
          atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        uint64_t v9 = *(void *)(v7 + 296);
        if (v9) {
          AnalyticsLogger::logRemoteRTCPSRPacket(*(AnalyticsLogger **)(v9 + 120), (const RTCPSRPacket *)(*(void *)(*(void *)(a1 + 40) + 8) + 48));
        }
        if (v8) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v8);
        }
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
}

void __56__AVCAudioSessionDelegate_stream_didReceiveRTCPPackets___block_invoke_21(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(std::__shared_weak_count **)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = std::__shared_weak_count::lock(v3);
    if (v4)
    {
      int v5 = v4;
      uint64_t v6 = *(void *)(v2 + 8);
      if (v6)
      {
        uint64_t v7 = *(void *)(v6 + 56);
        uint64_t v8 = *(std::__shared_weak_count **)(v6 + 64);
        if (v8) {
          atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        uint64_t v9 = *(void *)(v7 + 296);
        if (v9) {
          AnalyticsLogger::logRemoteRTCPRRPacket(*(AnalyticsLogger **)(v9 + 120), (const RTCPRRPacket *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), 0);
        }
        if (v8) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v8);
        }
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
}

void __56__AVCAudioSessionDelegate_stream_didReceiveRTCPPackets___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(std::__shared_weak_count **)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = std::__shared_weak_count::lock(v3);
    if (v4)
    {
      int v5 = v4;
      uint64_t v6 = *(void *)(v2 + 8);
      if (v6)
      {
        uint64_t v7 = *(void *)(v6 + 56);
        uint64_t v8 = *(std::__shared_weak_count **)(v6 + 64);
        if (v8) {
          atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        uint64_t v9 = *(void *)(v7 + 296);
        if (v9) {
          AnalyticsLogger::logRemoteRTCPRRPacket(*(AnalyticsLogger **)(v9 + 120), (const RTCPRRPacket *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), 0);
        }
        if (v8) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v8);
        }
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
}

void __56__AVCAudioSessionDelegate_stream_didReceiveRTCPPackets___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(std::__shared_weak_count **)(v1 + 16);
  if (v2)
  {
    id v3 = std::__shared_weak_count::lock(v2);
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)(v1 + 8);
      if (v5)
      {
        uint64_t v6 = *(void *)(v5 + 56);
        uint64_t v7 = *(std::__shared_weak_count **)(v5 + 64);
        if (v7) {
          atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        uint64_t v8 = *(void *)(v6 + 296);
        if (v8)
        {
          uint64_t v9 = *(void *)(v8 + 120);
          *(void *)(v9 + 536) = time(0);
        }
        if (v7) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v7);
        }
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
  }
}

- (void)streamDidServerDie:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__AVCAudioSessionDelegate_streamDidServerDie___block_invoke;
  v3[3] = &unk_1E650F2E0;
  v3[4] = self;
  ims::performBlock((IMSClientManager *)v3);
}

void __46__AVCAudioSessionDelegate_streamDidServerDie___block_invoke(uint64_t a1)
{
  std::string::basic_string[abi:ne180100]<0>(v20, "avc.audio.delegate");
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
        uint64_t v8 = *(std::__shared_weak_count **)(v7 + 64);
        if (v8) {
          atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        if (v9)
        {
          uint64_t v10 = v7 + 80;
          unsigned int v11 = std::__tree<std::__value_type<std::string,std::list<SipLazuliManager::OutgoingMsrp>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<SipLazuliManager::OutgoingMsrp>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<SipLazuliManager::OutgoingMsrp>>>>::find<std::string>(v9 + 312, (void **)(v7 + 80));
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
  std::string::basic_string[abi:ne180100]<0>(v20, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v12 = ims::debug((uint64_t)v20, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v12 + 8), (uint64_t)"-[AVCAudioSessionDelegate streamDidServerDie:]_block_invoke", 59);
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

- (void)stream:(id)a3 updateInputFrequencyLevel:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__AVCAudioSessionDelegate_stream_updateInputFrequencyLevel___block_invoke;
  v7[3] = &unk_1E6511E90;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  ims::performBlock((IMSClientManager *)v7);
}

void __60__AVCAudioSessionDelegate_stream_updateInputFrequencyLevel___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(std::__shared_weak_count **)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = std::__shared_weak_count::lock(v3);
    if (v4)
    {
      id v5 = *(void **)(v2 + 8);
      if (v5)
      {
        uint64_t v7 = (RTPManager *)v5[7];
        id v6 = (std::__shared_weak_count *)v5[8];
        if (v6) {
          atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        if (v7)
        {
          id v8 = *(const void **)(a1 + 40);
          if (v8)
          {
            long long v15 = *(__CFData **)(a1 + 40);
            CFRetain(v8);
            int v14 = &unk_1F20D2EE0;
            uint64_t v9 = (*(uint64_t (**)(void))(v5[3] + 176))();
            RTPManager::sendInputFrequencyLevelUpdate(v7, v9, v15);
            ims::CFType::~CFType((ims::CFType *)&v14);
          }
        }
        else
        {
          std::string::basic_string[abi:ne180100]<0>(&v14, "avc.audio.delegate");
          std::string::basic_string[abi:ne180100]<0>(__p, "");
          uint64_t v11 = ims::warn((uint64_t)&v14, (uint64_t)__p);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v11 + 8), (uint64_t)"No RTPManager found!", 20);
          *(unsigned char *)(v11 + 17) = 0;
          (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v11 + 64))(v11, std::endl[abi:ne180100]<char,std::char_traits<char>>);
          *(unsigned char *)(v11 + 17) = 0;
          if (v13 < 0) {
            operator delete(__p[0]);
          }
          if (v16 < 0) {
            operator delete(v14);
          }
        }
        if (v6) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v6);
        }
LABEL_22:
        std::__shared_weak_count::__release_shared[abi:ne180100](v4);
        return;
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(&v14, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v10 = ims::debug((uint64_t)&v14, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v10 + 8), (uint64_t)"-[AVCAudioSessionDelegate stream:updateInputFrequencyLevel:]_block_invoke", 73);
  *(unsigned char *)(v10 + 17) = 0;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v10 + 8), (uint64_t)" owner is null", 14);
  *(unsigned char *)(v10 + 17) = 0;
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v10 + 64))(v10, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v10 + 17) = 0;
  if (v13 < 0) {
    operator delete(__p[0]);
  }
  if (v16 < 0) {
    operator delete(v14);
  }
  if (v4) {
    goto LABEL_22;
  }
}

- (void)stream:(id)a3 updateOutputFrequencyLevel:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__AVCAudioSessionDelegate_stream_updateOutputFrequencyLevel___block_invoke;
  v7[3] = &unk_1E6511E90;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  ims::performBlock((IMSClientManager *)v7);
}

void __61__AVCAudioSessionDelegate_stream_updateOutputFrequencyLevel___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(std::__shared_weak_count **)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = std::__shared_weak_count::lock(v3);
    if (v4)
    {
      id v5 = *(void **)(v2 + 8);
      if (v5)
      {
        uint64_t v7 = (RTPManager *)v5[7];
        id v6 = (std::__shared_weak_count *)v5[8];
        if (v6) {
          atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        if (v7)
        {
          id v8 = *(const void **)(a1 + 40);
          if (v8)
          {
            long long v15 = *(__CFData **)(a1 + 40);
            CFRetain(v8);
            int v14 = &unk_1F20D2EE0;
            uint64_t v9 = (*(uint64_t (**)(void))(v5[3] + 176))();
            RTPManager::sendOutputFrequencyLevelUpdate(v7, v9, v15);
            ims::CFType::~CFType((ims::CFType *)&v14);
          }
        }
        else
        {
          std::string::basic_string[abi:ne180100]<0>(&v14, "avc.audio.delegate");
          std::string::basic_string[abi:ne180100]<0>(__p, "");
          uint64_t v11 = ims::warn((uint64_t)&v14, (uint64_t)__p);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v11 + 8), (uint64_t)"No RTPManager found!", 20);
          *(unsigned char *)(v11 + 17) = 0;
          (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v11 + 64))(v11, std::endl[abi:ne180100]<char,std::char_traits<char>>);
          *(unsigned char *)(v11 + 17) = 0;
          if (v13 < 0) {
            operator delete(__p[0]);
          }
          if (v16 < 0) {
            operator delete(v14);
          }
        }
        if (v6) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v6);
        }
LABEL_22:
        std::__shared_weak_count::__release_shared[abi:ne180100](v4);
        return;
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(&v14, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v10 = ims::debug((uint64_t)&v14, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v10 + 8), (uint64_t)"-[AVCAudioSessionDelegate stream:updateOutputFrequencyLevel:]_block_invoke", 74);
  *(unsigned char *)(v10 + 17) = 0;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v10 + 8), (uint64_t)" owner is null", 14);
  *(unsigned char *)(v10 + 17) = 0;
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v10 + 64))(v10, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v10 + 17) = 0;
  if (v13 < 0) {
    operator delete(__p[0]);
  }
  if (v16 < 0) {
    operator delete(v14);
  }
  if (v4) {
    goto LABEL_22;
  }
}

- (AVCAudioSessionDelegate)initWithOwner:(shared_ptr<AVCAudioSession>)a3 andStackController:(shared_ptr<AVCRTPStackController>)a4
{
  var1 = a3.var1;
  var0 = a3.var0;
  v15.receiver = self;
  v15.super_class = (Class)AVCAudioSessionDelegate;
  id v6 = [(AVCAudioSessionDelegate *)&v15 init];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v9 = *(AVCAudioSession **)var0;
    uint64_t v8 = *((void *)var0 + 1);
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 16), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v6->owner.__cntrl_;
    v7->owner.__ptr_ = v9;
    v7->owner.__cntrl_ = (__shared_weak_count *)v8;
    if (cntrl) {
      std::__shared_weak_count::__release_weak(cntrl);
    }
    uint64_t v12 = *(AVCRTPStackController **)var1;
    uint64_t v11 = *((void *)var1 + 1);
    if (v11) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
    }
    char v13 = (std::__shared_weak_count *)v7->stackController.__cntrl_;
    v7->stackController.__ptr_ = v12;
    v7->stackController.__cntrl_ = (__shared_weak_count *)v11;
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
  }
  return v7;
}

- (void)handleRTCPPacketWithBlock:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  std::string::basic_string[abi:ne180100]<0>(v17, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v5 = ims::debug((uint64_t)v17, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v5 + 8), (uint64_t)"-[AVCAudioSessionDelegate handleRTCPPacketWithBlock:]", 53);
  *(unsigned char *)(v5 + 17) = 0;
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v5 + 64))(v5, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v5 + 17) = 0;
  if (v16 < 0) {
    operator delete(__p[0]);
  }
  if (v18 < 0) {
    operator delete(v17[0]);
  }
  cntrl = self->owner.__cntrl_;
  if (cntrl)
  {
    uint64_t v7 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v7)
    {
      ptr = self->owner.__ptr_;
      if (ptr)
      {
        uint64_t v9 = *((void *)ptr + 7);
        uint64_t v10 = (std::__shared_weak_count *)*((void *)ptr + 8);
        if (v10) {
          atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        if (!v9) {
          goto LABEL_22;
        }
        uint64_t v12 = *(void *)(v9 + 296);
        uint64_t v11 = *(std::__shared_weak_count **)(v9 + 304);
        if (v11)
        {
          atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
          std::__shared_weak_count::__release_shared[abi:ne180100](v11);
        }
        if (v12)
        {
          v4[2](v4);
        }
        else
        {
LABEL_22:
          std::string::basic_string[abi:ne180100]<0>(v17, "avc.audio.delegate");
          std::string::basic_string[abi:ne180100]<0>(__p, "");
          uint64_t v14 = ims::warn((uint64_t)v17, (uint64_t)__p);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v14 + 8), (uint64_t)"No metrics logger available for incoming RTCP", 45);
          *(unsigned char *)(v14 + 17) = 0;
          (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v14 + 64))(v14, std::endl[abi:ne180100]<char,std::char_traits<char>>);
          *(unsigned char *)(v14 + 17) = 0;
          if (v16 < 0) {
            operator delete(__p[0]);
          }
          if (v18 < 0) {
            operator delete(v17[0]);
          }
        }
        if (v10) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v10);
        }
LABEL_28:
        std::__shared_weak_count::__release_shared[abi:ne180100](v7);
        goto LABEL_29;
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(v17, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v13 = ims::debug((uint64_t)v17, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v13 + 8), (uint64_t)"-[AVCAudioSessionDelegate handleRTCPPacketWithBlock:]", 53);
  *(unsigned char *)(v13 + 17) = 0;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v13 + 8), (uint64_t)" owner is null", 14);
  *(unsigned char *)(v13 + 17) = 0;
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v13 + 64))(v13, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v13 + 17) = 0;
  if (v16 < 0) {
    operator delete(__p[0]);
  }
  if (v18 < 0) {
    operator delete(v17[0]);
  }
  if (v7) {
    goto LABEL_28;
  }
LABEL_29:
}

- (weak_ptr<AVCAudioSession>)owner
{
  cntrl = self->owner.__cntrl_;
  *uint64_t v2 = self->owner.__ptr_;
  v2[1] = (AVCAudioSession *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 2, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (AVCAudioSession *)self;
  return result;
}

- (void)setOwner:(weak_ptr<AVCAudioSession>)a3
{
  uint64_t v4 = *(AVCAudioSession **)a3.__ptr_;
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