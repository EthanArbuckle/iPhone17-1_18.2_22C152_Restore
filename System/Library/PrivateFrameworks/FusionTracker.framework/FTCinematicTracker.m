@interface FTCinematicTracker
+ (id)highPriorityExemplarNetworkDescriptor;
+ (id)highPriorityInstanceNetworkDescriptor;
+ (id)tapToBoxNetworkDescriptor;
- (FTCinematicTracker)initWithConfig:(id)a3;
- (id).cxx_construct;
- (id)computeTrackingStateForInput:(id)a3;
@end

@implementation FTCinematicTracker

- (FTCinematicTracker)initWithConfig:(id)a3
{
  v4 = (FTCinematicConfig *)a3;
  v7.receiver = self;
  v7.super_class = (Class)FTCinematicTracker;
  if ([(FTCinematicTracker *)&v7 init])
  {
    v5 = operator new(0xF0uLL);
    v5[1] = 0;
    v5[2] = 0;
    void *v5 = &unk_26C78E6E8;
    ft::CinematicTracker::CinematicTracker((ft::CinematicTracker *)(v5 + 3), v4);
  }

  return 0;
}

- (id)computeTrackingStateForInput:(id)a3
{
  id v7 = a3;
  v43 = (std::recursive_mutex *)((char *)self->_tracker.__ptr_ + 80);
  std::recursive_mutex::lock(v43);
  ptr = self->_tracker.__ptr_;
  uint64_t v10 = *((void *)ptr + 1);
  if ((v10 & 1) == 0)
  {
    *((void *)ptr + 1) = v10 + 1;
    v11 = (char *)operator new(0x80uLL);
    v12 = v11;
    *((void *)v11 + 1) = 0;
    *((void *)v11 + 2) = 0;
    *(void *)v11 = &unk_26C78E720;
    *(_OWORD *)(v11 + 24) = 0u;
    v13 = (CMTime *)(v11 + 24);
    *(_OWORD *)(v11 + 40) = 0u;
    *(_OWORD *)(v11 + 56) = 0u;
    *(_OWORD *)(v11 + 72) = 0u;
    *(_OWORD *)(v11 + 88) = 0u;
    *(_OWORD *)(v11 + 104) = 0u;
    *((void *)v11 + 15) = 0;
    v48 = v11 + 24;
    v49 = (std::__shared_weak_count *)v11;
    if (v7)
    {
      [v7 sourceFrameTimestamp];
      CMTime *v13 = time1;
      [v7 mapToInternalObservations];
      v14 = (void *)*((void *)v12 + 7);
      if (v14)
      {
        *((void *)v12 + 8) = v14;
        operator delete(v14);
        *((void *)v12 + 7) = 0;
        *((void *)v12 + 8) = 0;
        *((void *)v12 + 9) = 0;
      }
    }
    else
    {
      v13->value = 0;
      *((void *)v11 + 4) = 0;
      *((void *)v11 + 5) = 0;
      memset(&time1, 0, sizeof(time1));
    }
    *(CMTime *)(v12 + 56) = time1;
    v12[48] = [v7 detectorDidRun];
    v17 = [v7 tapRequest];
    if (v17)
    {
      v42 = [v7 tapRequest];
      uint64_t v18 = [v42 trackId];
    }
    else
    {
      uint64_t v18 = -1;
    }
    v19 = [v7 tapRequest];
    if (v19)
    {
      v4 = [v7 tapRequest];
      [v4 tapPoint];
      if (v20 >= 0.0)
      {
        v5 = [v7 tapRequest];
        [v5 tapPoint];
        if (v37 >= 0.0)
        {
          v3 = [v7 tapRequest];
          [v3 tapPoint];
          int v21 = 1;
          int v22 = 1;
          int v38 = v12[104];
          *((void *)v12 + 10) = v18;
          *((void *)v12 + 11) = v39;
          *((void *)v12 + 12) = v40;
          if (v38)
          {
LABEL_18:
            if (v22)
            {

              if (!v21)
              {
LABEL_20:
                if (!v19)
                {
LABEL_22:

                  if (v17) {
                  uint64_t v26 = [v7 highPriorityTrackId];
                  }
                  v27 = v48;
                  if (!v48[96]) {
                    v48[96] = 1;
                  }
                  *((void *)v27 + 11) = v26;
                  if ([*(id *)self->_tracker.__ptr_ ensureObservationTimestampMatchesFrame])
                  {
                    uint64_t v28 = *((void *)v27 + 4);
                    for (uint64_t i = *((void *)v27 + 5); v28 != i; v28 += 152)
                    {
                      long long v30 = *(_OWORD *)v27;
                      time1.epoch = *((void *)v27 + 2);
                      *(_OWORD *)&time1.value = v30;
                      long long v31 = *(_OWORD *)(v28 + 44);
                      time2.epoch = *(void *)(v28 + 60);
                      *(_OWORD *)&time2.value = v31;
                      if (CMTimeCompare(&time1, &time2))
                      {
                        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
                        std::runtime_error::runtime_error(exception, "Observation timestamp does not match frame timestamp.");
                        __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
                      }
                    }
                  }
                  ft::CinematicTracker::Track((ft::TrackPool **)self->_tracker.__ptr_, (const Frame *)v27);
                  cntrl = self->_tracker.__cntrl_;
                  v46 = self->_tracker.__ptr_;
                  v47 = cntrl;
                  if (cntrl) {
                    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
                  }
                  v44 = v27;
                  v45 = v49;
                  if (v49) {
                    atomic_fetch_add_explicit(&v49->__shared_owners_, 1uLL, memory_order_relaxed);
                  }
                  v16 = +[FTCinematicTrackingState stateWithTracker:&v46 frame:&v44 input:v7];
                  v33 = v45;
                  if (v45 && !atomic_fetch_add(&v45->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                  {
                    ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
                    std::__shared_weak_count::__release_weak(v33);
                  }
                  v34 = (std::__shared_weak_count *)v47;
                  if (v47 && !atomic_fetch_add((atomic_ullong *volatile)v47 + 1, 0xFFFFFFFFFFFFFFFFLL))
                  {
                    ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
                    std::__shared_weak_count::__release_weak(v34);
                  }
                  v35 = v49;
                  if (v49 && !atomic_fetch_add(&v49->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                  {
                    ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
                    std::__shared_weak_count::__release_weak(v35);
                  }
                  goto LABEL_43;
                }
LABEL_21:

                goto LABEL_22;
              }
            }
            else if (!v21)
            {
              goto LABEL_20;
            }

            if (!v19) {
              goto LABEL_22;
            }
            goto LABEL_21;
          }
LABEL_17:
          v12[104] = 1;
          goto LABEL_18;
        }
        int v21 = 1;
      }
      else
      {
        int v21 = 0;
      }
    }
    else
    {
      int v21 = 0;
    }
    [v7 tapPosition];
    int v22 = 0;
    int v23 = v12[104];
    *((void *)v12 + 10) = v18;
    *((void *)v12 + 11) = v24;
    *((void *)v12 + 12) = v25;
    if (v23) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  v15 = ft::GetOsLog(v8);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[FTCinematicTracker computeTrackingStateForInput:]();
  }

  v16 = 0;
LABEL_43:
  std::recursive_mutex::unlock(v43);

  return v16;
}

+ (id)highPriorityExemplarNetworkDescriptor
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = objc_alloc_init(FTNetworkDescriptor);
  [(FTNetworkDescriptor *)v2 setName:@"subject_tracking_initializer_v2"];
  v3 = +[FTImageTensorDescriptor bgraSquareImageWithName:@"image" size:127.0];
  v6[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [(FTNetworkDescriptor *)v2 setInputImages:v4];

  [(FTNetworkDescriptor *)v2 setOutputNames:&unk_26C790B28];

  return v2;
}

+ (id)highPriorityInstanceNetworkDescriptor
{
  v12[1] = *MEMORY[0x263EF8340];
  v2 = [a1 highPriorityExemplarNetworkDescriptor];
  v3 = [v2 name];

  v4 = objc_alloc_init(FTTensorReference);
  [(FTTensorReference *)v4 setSourceNetworkName:v3];
  [(FTTensorReference *)v4 setSourceOutputName:@"net_exempler_reg"];
  [(FTTensorReference *)v4 setDestinationInputName:@"r1_kernel"];
  v5 = objc_alloc_init(FTTensorReference);
  [(FTTensorReference *)v5 setSourceNetworkName:v3];
  [(FTTensorReference *)v5 setSourceOutputName:@"net_exempler_cls"];
  [(FTTensorReference *)v5 setDestinationInputName:@"cls1_kernel"];
  v6 = objc_alloc_init(FTNetworkDescriptor);
  [(FTNetworkDescriptor *)v6 setName:@"subject_tracking_tracker_v2"];
  id v7 = +[FTImageTensorDescriptor bgraSquareImageWithName:@"instance_image" size:271.0];
  v12[0] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  [(FTNetworkDescriptor *)v6 setInputImages:v8];

  v11[0] = v4;
  v11[1] = v5;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  [(FTNetworkDescriptor *)v6 setInputReferences:v9];

  [(FTNetworkDescriptor *)v6 setOutputNames:&unk_26C790B40];

  return v6;
}

+ (id)tapToBoxNetworkDescriptor
{
  return +[FTTapToBox networkDescriptor];
}

- (void).cxx_destruct
{
  cntrl = self->_tracker.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void)computeTrackingStateForInput:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21762A000, v0, v1, "A previous tracking state has not been committed.", v2, v3, v4, v5, v6);
}

@end