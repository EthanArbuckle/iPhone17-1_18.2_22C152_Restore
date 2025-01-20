@interface FTCinematicTrackingState
+ (id)stateWithTracker:(shared_ptr<ft:(shared_ptr<ft:(id)a5 :Frame>)a4 :CinematicTracker>)a3 frame:input:;
- (FTCinematicHighPriorityTrackerState)highPriorityTrackerState;
- (FTCinematicInput)input;
- (id).cxx_construct;
- (id)commit;
- (void)commit;
@end

@implementation FTCinematicTrackingState

+ (id)stateWithTracker:(shared_ptr<ft:(shared_ptr<ft:(id)a5 :Frame>)a4 :CinematicTracker>)a3 frame:input:
{
  ptr = a4.__ptr_;
  cntrl = a3.__cntrl_;
  v7 = a3.__ptr_;
  v8 = a4.__ptr_;
  v9 = objc_alloc_init(FTCinematicTrackingState);
  v10 = v9;
  v12 = *(CinematicTracker **)v7;
  uint64_t v11 = *((void *)v7 + 1);
  if (v11) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
  }
  v13 = (std::__shared_weak_count *)v9->_tracker.__cntrl_;
  v9->_tracker.__ptr_ = v12;
  v9->_tracker.__cntrl_ = (__shared_weak_count *)v11;
  if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
  v15 = *(Frame **)cntrl;
  uint64_t v14 = *((void *)cntrl + 1);
  if (v14) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v14 + 8), 1uLL, memory_order_relaxed);
  }
  v16 = (std::__shared_weak_count *)v10->_frame.__cntrl_;
  v10->_frame.__ptr_ = v15;
  v10->_frame.__cntrl_ = (__shared_weak_count *)v14;
  if (v16 && !atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
  }
  objc_storeStrong((id *)&v10->_input, ptr);
  v10->_commitToken = *(void *)(*(void *)v7 + 8);
  v17 = [FTCinematicHighPriorityTrackerState alloc];
  v18 = (std::__shared_weak_count *)*((void *)v7 + 1);
  v27 = *(CinematicTracker **)v7;
  v28 = v18;
  if (v18) {
    atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v19 = (std::__shared_weak_count *)*((void *)cntrl + 1);
  v25 = *(Frame **)cntrl;
  v26 = v19;
  if (v19) {
    atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v20 = [(FTCinematicHighPriorityTrackerState *)v17 initWithTracker:&v27 frame:&v25];
  highPriorityTrackerState = v10->_highPriorityTrackerState;
  v10->_highPriorityTrackerState = (FTCinematicHighPriorityTrackerState *)v20;

  v22 = v26;
  if (v26 && !atomic_fetch_add(&v26->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
    std::__shared_weak_count::__release_weak(v22);
  }
  v23 = v28;
  if (v28 && !atomic_fetch_add(&v28->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
    std::__shared_weak_count::__release_weak(v23);
  }

  return v10;
}

- (id)commit
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  v67 = (std::recursive_mutex *)((char *)self->_tracker.__ptr_ + 80);
  std::recursive_mutex::lock(v67);
  v3 = (ft *)[(FTCinematicHighPriorityTrackerState *)self->_highPriorityTrackerState completed];
  if ((v3 & 1) == 0)
  {
    v7 = ft::GetOsLog(v3);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[FTCinematicTrackingState commit]();
    }
    goto LABEL_54;
  }
  ptr = self->_tracker.__ptr_;
  uint64_t v5 = *((void *)ptr + 1);
  if (v5 != self->_commitToken)
  {
    v7 = ft::GetOsLog(v3);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(FTCinematicTrackingState *)(uint64_t *)&self->_commitToken commit];
    }
LABEL_54:
    v44 = 0;
    goto LABEL_55;
  }
  *((void *)ptr + 1) = v5 + 1;
  if (*(unsigned char *)ft::UserDefaults::Get(v3)) {
    ft::CinematicTracker::TerminateHighlyOverlappingDetectionlessTrack((ft::CinematicTracker *)self->_tracker.__ptr_);
  }
  ActiveTracks = (void *)ft::TrackPool::GetActiveTracks(*((ft::TrackPool **)self->_tracker.__ptr_ + 24));
  v7 = [MEMORY[0x263EFF980] arrayWithCapacity:(uint64_t)(ActiveTracks[1] - *ActiveTracks) >> 4];
  v8 = self->_tracker.__ptr_;
  uint64_t v10 = *((void *)v8 + 19);
  v9 = (std::__shared_weak_count *)*((void *)v8 + 20);
  uint64_t v85 = v10;
  v86 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v11 = [(FTCinematicTrackingState *)self input];
  v68 = [v11 observations];

  uint64_t v14 = (void *)*ActiveTracks;
  v13 = (void *)ActiveTracks[1];
  if ((void *)*ActiveTracks == v13) {
    goto LABEL_58;
  }
  *(void *)&long long v12 = 134217984;
  long long v66 = v12;
  do
  {
    v15 = (std::__shared_weak_count *)v14[1];
    uint64_t v83 = *v14;
    v84 = v15;
    if (v15) {
      atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v16 = +[FTCinematicTrack fromTrack:&v83 isHighPriority:*v14 == v85];
    v17 = v84;
    if (v84 && !atomic_fetch_add(&v84->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
      v18 = self->_tracker.__ptr_;
      uint64_t v19 = *v14;
      int8x8_t v20 = *(int8x8_t *)((char *)v18 + 48);
      if (!*(void *)&v20) {
        goto LABEL_35;
      }
    }
    else
    {
      v18 = self->_tracker.__ptr_;
      uint64_t v19 = *v14;
      int8x8_t v20 = *(int8x8_t *)((char *)v18 + 48);
      if (!*(void *)&v20) {
        goto LABEL_35;
      }
    }
    unint64_t v21 = *(void *)(v19 + 16);
    uint8x8_t v22 = (uint8x8_t)vcnt_s8(v20);
    v22.i16[0] = vaddlv_u8(v22);
    if (v22.u32[0] > 1uLL)
    {
      unint64_t v23 = *(void *)(v19 + 16);
      if (v21 >= *(void *)&v20) {
        unint64_t v23 = v21 % *(void *)&v20;
      }
    }
    else
    {
      unint64_t v23 = (*(void *)&v20 - 1) & v21;
    }
    uint64_t v24 = (uint64_t)v18 + 40;
    v25 = *(void **)(*((void *)v18 + 5) + 8 * v23);
    if (!v25 || (v26 = (void *)*v25) == 0)
    {
LABEL_35:
      if (!*(unsigned char *)(v19 + 232)) {
        goto LABEL_76;
      }
      goto LABEL_36;
    }
    if (v22.u32[0] < 2uLL)
    {
      uint64_t v27 = *(void *)&v20 - 1;
      while (1)
      {
        uint64_t v29 = v26[1];
        if (v21 == v29)
        {
          if (v26[2] == v21) {
            goto LABEL_48;
          }
        }
        else if ((v29 & v27) != v23)
        {
          goto LABEL_35;
        }
        v26 = (void *)*v26;
        if (!v26) {
          goto LABEL_35;
        }
      }
    }
    while (1)
    {
      unint64_t v28 = v26[1];
      if (v21 == v28) {
        break;
      }
      if (v28 >= *(void *)&v20) {
        v28 %= *(void *)&v20;
      }
      if (v28 != v23) {
        goto LABEL_35;
      }
LABEL_23:
      v26 = (void *)*v26;
      if (!v26) {
        goto LABEL_35;
      }
    }
    if (v26[2] != v21) {
      goto LABEL_23;
    }
LABEL_48:
    *(void *)buf = *(void *)(v19 + 16);
    *(void *)&v89[0] = buf;
    v43 = std::__hash_table<std::__hash_value_type<long long,CMTime>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,CMTime>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,CMTime>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,CMTime>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long &&>,std::tuple<>>(v24, (unint64_t *)buf, (uint64_t)&std::piecewise_construct, (uint64_t **)v89);
    long long v81 = *(_OWORD *)(v43 + 3);
    uint64_t v82 = v43[5];
    [v16 setLastTappedTime:&v81];
    uint64_t v19 = *v14;
    if (!*(unsigned char *)(*v14 + 232))
    {
LABEL_76:
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Track not yet initialized.");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
LABEL_36:
    long long v30 = *(_OWORD *)(v19 + 152);
    v89[5] = *(_OWORD *)(v19 + 136);
    v89[6] = v30;
    CMTime v90 = *(CMTime *)(v19 + 168);
    long long v31 = *(_OWORD *)(v19 + 72);
    long long v32 = *(_OWORD *)(v19 + 104);
    v89[2] = *(_OWORD *)(v19 + 88);
    v89[3] = v32;
    v89[4] = *(_OWORD *)(v19 + 120);
    v89[0] = *(_OWORD *)(v19 + 56);
    v89[1] = v31;
    if (*(unsigned char *)(v19 + 200))
    {
      unint64_t v33 = *(void *)(v19 + 192);
      CMTime time1 = v90;
      v34 = self->_frame.__ptr_;
      CMTimeEpoch v35 = *((void *)v34 + 2);
      *(_OWORD *)&time2.value = *(_OWORD *)v34;
      time2.epoch = v35;
      if (!CMTimeCompare(&time1, &time2))
      {
        v36 = (ft *)[v68 count];
        if (v33 >= (unint64_t)v36)
        {
          v37 = ft::GetOsLog(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v66;
            *(void *)&buf[4] = v33;
            _os_log_error_impl(&dword_21762A000, v37, OS_LOG_TYPE_ERROR, "Internal inconsistency: observation index out of bounds: %zd", buf, 0xCu);
          }
        }
        else
        {
          v37 = [v68 objectAtIndexedSubscript:v33];
          if (objc_opt_respondsToSelector())
          {
            v38 = [v37 metadata];
            [v16 setMetadata:v38];
          }
        }
      }
    }
    objc_msgSend(v16, "setIsTapSpawned:", *(_DWORD *)(*v14 + 8) & 1, v66);
    [v16 box];
    v95.origin.double x = 0.0;
    v95.origin.double y = 0.0;
    v95.size.double width = 1.0;
    v95.size.double height = 1.0;
    CGRect v94 = CGRectIntersection(v93, v95);
    double x = v94.origin.x;
    double y = v94.origin.y;
    double width = v94.size.width;
    double height = v94.size.height;
    if (!CGRectIsEmpty(v94))
    {
      objc_msgSend(v16, "setBox:", x, y, width, height);
      [v7 addObject:v16];
    }

    v14 += 2;
  }
  while (v14 != v13);
LABEL_58:
  v44 = objc_alloc_init(FTCinematicTrackingResult);
  [(FTCinematicTrackingResult *)v44 setTracks:v7];
  v46 = self->_frame.__ptr_;
  uint64_t v47 = *((void *)v46 + 2);
  long long v77 = *(_OWORD *)v46;
  uint64_t v78 = v47;
  [(FTCinematicTrackingResult *)v44 setSourceFrameTimestamp:&v77];
  v48 = self->_tracker.__ptr_;
  long long v49 = *((_OWORD *)v48 + 1);
  uint64_t v76 = *((void *)v48 + 4);
  long long v75 = v49;
  [(FTCinematicTrackingResult *)v44 setMostRecentTapTime:&v75];
  [(FTCinematicTrackingResult *)v44 setDetectorDidRun:*((unsigned __int8 *)self->_frame.__ptr_ + 24)];
  v50 = [(FTCinematicTrackingState *)self input];
  v51 = [v50 tapRequest];
  BOOL v52 = v51 == 0;

  if (!v52)
  {
    v53 = objc_alloc_init(FTCinematicTapResponse);
    v54 = [(FTCinematicTrackingState *)self input];
    v55 = [v54 tapRequest];
    [(FTCinematicTapResponse *)v53 setRequest:v55];

    [(FTCinematicTrackingResult *)v44 setTapResponse:v53];
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    v56 = v7;
    uint64_t v57 = [v56 countByEnumeratingWithState:&v71 objects:v87 count:16];
    if (v57)
    {
      uint64_t v58 = *(void *)v72;
      while (2)
      {
        for (uint64_t i = 0; i != v57; ++i)
        {
          if (*(void *)v72 != v58) {
            objc_enumerationMutation(v56);
          }
          v60 = *(void **)(*((void *)&v71 + 1) + 8 * i);
          if (v60) {
            [*(id *)(*((void *)&v71 + 1) + 8 * i) lastTappedTime];
          }
          else {
            memset(&v70, 0, sizeof(v70));
          }
          v61 = self->_frame.__ptr_;
          CMTimeEpoch v62 = *((void *)v61 + 2);
          *(_OWORD *)&v69.value = *(_OWORD *)v61;
          v69.epoch = v62;
          if (!CMTimeCompare(&v70, &v69))
          {
            id v63 = v60;
            goto LABEL_72;
          }
        }
        uint64_t v57 = [v56 countByEnumeratingWithState:&v71 objects:v87 count:16];
        if (v57) {
          continue;
        }
        break;
      }
    }
    id v63 = 0;
LABEL_72:

    [(FTCinematicTapResponse *)v53 setTappedTrack:v63];
    [(FTCinematicTapResponse *)v53 setWasSuccessful:v63 != 0];
  }
  v64 = v86;
  if (v86 && !atomic_fetch_add(&v86->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v64->__on_zero_shared)(v64);
    std::__shared_weak_count::__release_weak(v64);
  }
LABEL_55:

  std::recursive_mutex::unlock(v67);

  return v44;
}

- (FTCinematicHighPriorityTrackerState)highPriorityTrackerState
{
  return self->_highPriorityTrackerState;
}

- (FTCinematicInput)input
{
  return self->_input;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_highPriorityTrackerState, 0);
  cntrl = self->_frame.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    v4 = self->_tracker.__cntrl_;
    if (!v4) {
      return;
    }
  }
  else
  {
    v4 = self->_tracker.__cntrl_;
    if (!v4) {
      return;
    }
  }
  if (!atomic_fetch_add((atomic_ullong *volatile)v4 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v4 + 16))(v4);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  return self;
}

- (void)commit
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21762A000, v0, v1, "Operation requested for high priority tracking not completed.", v2, v3, v4, v5, v6);
}

@end