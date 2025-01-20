@interface AVMetricEventStream
+ (id)eventStream;
- (AVMetricEventStream)init;
- (BOOL)addPublisher:(id)a3;
- (BOOL)setSubscriber:(id)a3 queue:(id)a4;
- (id)contentKeyRequestEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3;
- (id)errorEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3;
- (id)initialLikelyToKeepUpEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3;
- (id)likelyToKeepUpEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3;
- (id)mediaSegmentRequestEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3;
- (id)metricEventForFigMetricEvent:(OpaqueFigMetricEvent *)a3;
- (id)playbackSummaryEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3;
- (id)playlistRequestEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3;
- (id)rateChangeEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3;
- (id)resourceRequestEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3;
- (id)seekDidCompleteEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3;
- (id)seekEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3;
- (id)stallEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3;
- (id)variantChangeEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3;
- (id)variantChangeStartEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3;
- (int64_t)getFigMetricEventIDForAVMetricClass:(Class)a3;
- (void)addPublisher:(id)a3 eventTimeline:(OpaqueFigMetricEventTimeline *)a4;
- (void)dealloc;
- (void)didReceiveEventForMetricEventTimeline:(OpaqueFigMetricEventTimeline *)a3 event:(OpaqueFigMetricEvent *)a4;
- (void)subscribeToAllMetricEvents;
- (void)subscribeToMetricEvent:(Class)a3;
- (void)subscribeToMetricEvents:(id)a3;
@end

@implementation AVMetricEventStream

- (AVMetricEventStream)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVMetricEventStream;
  v2 = [(AVMetricEventStream *)&v5 init];
  if (v2)
  {
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v2->_publisherByEventTimeline = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], 0);
    v2->_publishers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v2->_eventTimelines = CFArrayCreateMutable(v3, 0, MEMORY[0x1E4F1D510]);
    v2->_internalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.avmetrics", 0);
    v2->_metricEventClassesToSubscribe = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    FigMetricInstallAllPlaybackDeserializationHandlers();
  }
  return v2;
}

- (void)dealloc
{
  publisherByEventTimeline = self->_publisherByEventTimeline;
  if (publisherByEventTimeline) {
    CFRelease(publisherByEventTimeline);
  }

  eventTimelines = self->_eventTimelines;
  if (eventTimelines) {
    CFRelease(eventTimelines);
  }

  internalQueue = self->_internalQueue;
  if (internalQueue) {
    dispatch_release(internalQueue);
  }
  v6.receiver = self;
  v6.super_class = (Class)AVMetricEventStream;
  [(AVMetricEventStream *)&v6 dealloc];
}

+ (id)eventStream
{
  v2 = objc_alloc_init(AVMetricEventStream);
  return v2;
}

- (id)errorEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3
{
  void (*v10)(long long *__return_ptr, OpaqueFigMetricEvent *);
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(OpaqueFigMetricEvent *);
  void *v14;
  AVMetricErrorEvent *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(OpaqueFigMetricEvent *);
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(OpaqueFigMetricEvent *);
  uint64_t v23;
  AVMetricErrorEvent *v24;
  long long v26;
  uint64_t v27;
  long long v28;
  uint64_t v29;

  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  objc_super v6 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v5 + 32);
  if (v6) {
    uint64_t v7 = v6(a3);
  }
  else {
    uint64_t v7 = 0;
  }
  v28 = 0uLL;
  v29 = 0;
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  v10 = *(void (**)(long long *__return_ptr, OpaqueFigMetricEvent *))(v9 + 56);
  if (v10)
  {
    v10(&v28, a3);
  }
  else
  {
    v28 = *MEMORY[0x1E4F1F9F8];
    v29 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  }
  v11 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v11) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  v13 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v12 + 40);
  if (v13) {
    v14 = (void *)v13(a3);
  }
  else {
    v14 = 0;
  }
  v15 = [AVMetricErrorEvent alloc];
  v16 = *(void *)(CMBaseObjectGetVTable() + 24);
  if (v16) {
    v17 = v16;
  }
  else {
    v17 = 0;
  }
  v18 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v17 + 16);
  if (v18) {
    v19 = v18(a3);
  }
  else {
    v19 = 0;
  }
  v20 = *(void *)(CMBaseObjectGetVTable() + 24);
  if (v20) {
    v21 = v20;
  }
  else {
    v21 = 0;
  }
  v22 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v21 + 8);
  if (v22) {
    v23 = v22(a3);
  }
  else {
    v23 = 0;
  }
  v26 = v28;
  v27 = v29;
  v24 = [(AVMetricErrorEvent *)v15 initWithDate:v7 mediaTime:&v26 sessionID:v14 didRecover:v19 != 0 error:v23];

  return v24;
}

- (id)resourceRequestEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3
{
  void (*v10)(long long *__return_ptr, OpaqueFigMetricEvent *);
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(OpaqueFigMetricEvent *);
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(OpaqueFigMetricEvent *);
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(OpaqueFigMetricEvent *);
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(OpaqueFigMetricEvent *);
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(OpaqueFigMetricEvent *);
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(OpaqueFigMetricEvent *);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(OpaqueFigMetricEvent *);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(OpaqueFigMetricEvent *);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(OpaqueFigMetricEvent *);
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(OpaqueFigMetricEvent *);
  AVMetricErrorEvent *v48;
  uint64_t v49;
  uint64_t v50;
  AVMetricErrorEvent *v51;
  uint64_t (*v52)(OpaqueFigMetricEvent *);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t (*v56)(OpaqueFigMetricEvent *);
  uint64_t v57;
  BOOL v58;
  void *v59;
  uint64_t v60;
  AVMetricMediaResourceRequestEvent *v61;
  AVMetricMediaResourceRequestEvent *v62;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  long long v69;
  uint64_t v70;
  long long v71;
  uint64_t v72;

  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  objc_super v6 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v5 + 32);
  if (v6) {
    uint64_t v7 = v6(a3);
  }
  else {
    uint64_t v7 = 0;
  }
  v71 = 0uLL;
  v72 = 0;
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  v10 = *(void (**)(long long *__return_ptr, OpaqueFigMetricEvent *))(v9 + 56);
  if (v10)
  {
    v10(&v71, a3);
  }
  else
  {
    v71 = *MEMORY[0x1E4F1F9F8];
    v72 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  }
  v11 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v11) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  v13 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v12 + 40);
  if (v13) {
    v14 = (void *)v13(a3);
  }
  else {
    v14 = 0;
  }
  v15 = *(void *)(CMBaseObjectGetVTable() + 32);
  if (v15) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  v17 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v16 + 8);
  if (v17) {
    v68 = v17(a3);
  }
  else {
    v68 = 0;
  }
  v18 = *(void *)(CMBaseObjectGetVTable() + 32);
  if (v18) {
    v19 = v18;
  }
  else {
    v19 = 0;
  }
  v20 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v19 + 16);
  if (v20) {
    v67 = v20(a3);
  }
  else {
    v67 = 0;
  }
  v21 = *(void *)(CMBaseObjectGetVTable() + 32);
  if (v21) {
    v22 = v21;
  }
  else {
    v22 = 0;
  }
  v23 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v22 + 24);
  if (v23) {
    v66 = v23(a3);
  }
  else {
    v66 = 0;
  }
  v24 = *(void *)(CMBaseObjectGetVTable() + 32);
  if (v24) {
    v25 = v24;
  }
  else {
    v25 = 0;
  }
  v26 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v25 + 32);
  if (v26) {
    v65 = v26(a3);
  }
  else {
    v65 = 0;
  }
  v27 = *(void *)(CMBaseObjectGetVTable() + 32);
  if (v27) {
    v28 = v27;
  }
  else {
    v28 = 0;
  }
  v29 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v28 + 40);
  if (v29) {
    v30 = v29(a3);
  }
  else {
    v30 = 0;
  }
  v31 = *(void *)(CMBaseObjectGetVTable() + 32);
  if (v31) {
    v32 = v31;
  }
  else {
    v32 = 0;
  }
  v33 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v32 + 48);
  if (v33) {
    v34 = v33(a3);
  }
  else {
    v34 = 0;
  }
  v35 = *(void *)(CMBaseObjectGetVTable() + 32);
  if (v35) {
    v36 = v35;
  }
  else {
    v36 = 0;
  }
  v37 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v36 + 56);
  if (v37)
  {
    v38 = v37(a3);
    v40 = v39;
  }
  else
  {
    v38 = 0;
    v40 = 0;
  }
  v41 = *(void *)(CMBaseObjectGetVTable() + 32);
  if (v41) {
    v42 = v41;
  }
  else {
    v42 = 0;
  }
  v43 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v42 + 64);
  if (v43) {
    v44 = v43(a3);
  }
  else {
    v44 = 0;
  }
  v45 = *(void *)(CMBaseObjectGetVTable() + 32);
  if (v45) {
    v46 = v45;
  }
  else {
    v46 = 0;
  }
  v47 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v46 + 72);
  if (v47 && v47(a3))
  {
    v48 = [AVMetricErrorEvent alloc];
    v49 = *(void *)(CMBaseObjectGetVTable() + 32);
    if (v49) {
      v50 = v49;
    }
    else {
      v50 = 0;
    }
    v52 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v50 + 72);
    if (v52) {
      v53 = v52(a3);
    }
    else {
      v53 = 0;
    }
    v69 = v71;
    v70 = v72;
    v51 = [(AVMetricErrorEvent *)v48 initWithDate:v7 mediaTime:&v69 sessionID:v14 didRecover:1 error:v53];
  }
  else
  {
    v51 = 0;
  }
  v54 = *(void *)(CMBaseObjectGetVTable() + 32);
  if (v54) {
    v55 = v54;
  }
  else {
    v55 = 0;
  }
  v56 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v55 + 80);
  if (v56) {
    v57 = v56(a3);
  }
  else {
    v57 = 0;
  }
  v58 = v44 != 0;
  v59 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v57 error:0];
  [v59 setRequiresSecureCoding:1];
  v60 = [v59 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];

  v61 = [AVMetricMediaResourceRequestEvent alloc];
  v69 = v71;
  v70 = v72;
  LOBYTE(v64) = v58;
  v62 = -[AVMetricMediaResourceRequestEvent initWithDate:mediaTime:sessionID:url:serverAddress:requestStartTime:requestEndTime:responseStartTime:responseEndTime:byteRange:readFromCache:errorEvent:networkTransactionMetrics:](v61, "initWithDate:mediaTime:sessionID:url:serverAddress:requestStartTime:requestEndTime:responseStartTime:responseEndTime:byteRange:readFromCache:errorEvent:networkTransactionMetrics:", v7, &v69, v14, v68, v67, v66, v65, v30, v34, v38, v40, v64, v51, v60);

  return v62;
}

- (id)playlistRequestEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3
{
  void (*v11)(long long *__return_ptr, OpaqueFigMetricEvent *);
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(OpaqueFigMetricEvent *);
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(OpaqueFigMetricEvent *);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(OpaqueFigMetricEvent *);
  uint64_t v24;
  id v25;
  AVMetricHLSPlaylistRequestEvent *v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int (*v29)(OpaqueFigMetricEvent *);
  BOOL v30;
  AVMetricHLSPlaylistRequestEvent *v31;
  long long v33;
  uint64_t v34;
  long long v35;
  uint64_t v36;

  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v6 + 32);
  if (v7) {
    uint64_t v8 = v7(a3);
  }
  else {
    uint64_t v8 = 0;
  }
  v35 = 0uLL;
  v36 = 0;
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  v11 = *(void (**)(long long *__return_ptr, OpaqueFigMetricEvent *))(v10 + 56);
  if (v11)
  {
    v11(&v35, a3);
  }
  else
  {
    v35 = *MEMORY[0x1E4F1F9F8];
    v36 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  }
  v12 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v12) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  v14 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v13 + 40);
  if (v14) {
    v15 = (void *)v14(a3);
  }
  else {
    v15 = 0;
  }
  v16 = *(void *)(CMBaseObjectGetVTable() + 32);
  if (v16) {
    v17 = v16;
  }
  else {
    v17 = 0;
  }
  v18 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v17 + 8);
  if (v18) {
    v19 = v18(a3);
  }
  else {
    v19 = 0;
  }
  v20 = *(void *)(CMBaseObjectGetVTable() + 32);
  if (v20) {
    v21 = v20;
  }
  else {
    v21 = 0;
  }
  v22 = 1836415096;
  v23 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v21 + 96);
  if (v23) {
    v22 = v23(a3);
  }
  v24 = AVMediaTypeFromCMMediaType(v22);
  v25 = [(AVMetricEventStream *)self resourceRequestEventWithFigMetricEvent:a3];
  v26 = [AVMetricHLSPlaylistRequestEvent alloc];
  v27 = *(void *)(CMBaseObjectGetVTable() + 32);
  if (v27) {
    v28 = v27;
  }
  else {
    v28 = 0;
  }
  v29 = *(unsigned int (**)(OpaqueFigMetricEvent *))(v28 + 88);
  if (v29) {
    v30 = v29(a3) != 0;
  }
  else {
    v30 = 0;
  }
  v33 = v35;
  v34 = v36;
  v31 = [(AVMetricHLSPlaylistRequestEvent *)v26 initWithDate:v8 mediaTime:&v33 sessionID:v15 url:v19 isMultivariantPlaylist:v30 mediaType:v24 mediaResourceRequestEvent:v25];

  return v31;
}

- (id)mediaSegmentRequestEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3
{
  void (*v11)(long long *__return_ptr, OpaqueFigMetricEvent *);
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(OpaqueFigMetricEvent *);
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(OpaqueFigMetricEvent *);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(OpaqueFigMetricEvent *);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(OpaqueFigMetricEvent *);
  uint64_t v31;
  AVMetricHLSMediaSegmentRequestEvent *v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int (*v35)(OpaqueFigMetricEvent *);
  BOOL v36;
  AVMetricHLSMediaSegmentRequestEvent *v37;
  uint64_t v39;
  long long v40;
  uint64_t v41;
  long long v42;
  uint64_t v43;

  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v6 + 32);
  if (v7) {
    uint64_t v8 = v7(a3);
  }
  else {
    uint64_t v8 = 0;
  }
  v42 = 0uLL;
  v43 = 0;
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  v11 = *(void (**)(long long *__return_ptr, OpaqueFigMetricEvent *))(v10 + 56);
  if (v11)
  {
    v11(&v42, a3);
  }
  else
  {
    v42 = *MEMORY[0x1E4F1F9F8];
    v43 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  }
  v12 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v12) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  v14 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v13 + 40);
  if (v14) {
    v15 = (void *)v14(a3);
  }
  else {
    v15 = 0;
  }
  v16 = *(void *)(CMBaseObjectGetVTable() + 32);
  if (v16) {
    v17 = v16;
  }
  else {
    v17 = 0;
  }
  v18 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v17 + 128);
  if (v18) {
    v19 = v18(a3);
  }
  else {
    v19 = 0;
  }
  v20 = *(void *)(CMBaseObjectGetVTable() + 32);
  if (v20) {
    v21 = v20;
  }
  else {
    v21 = 0;
  }
  v22 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v21 + 56);
  if (v22)
  {
    v23 = v22(a3);
    v25 = v24;
  }
  else
  {
    v23 = 0;
    v25 = 0;
  }
  v26 = [(AVMetricEventStream *)self resourceRequestEventWithFigMetricEvent:a3];
  v27 = *(void *)(CMBaseObjectGetVTable() + 32);
  if (v27) {
    v28 = v27;
  }
  else {
    v28 = 0;
  }
  v29 = 1836415096;
  v30 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v28 + 96);
  if (v30) {
    v29 = v30(a3);
  }
  v31 = AVMediaTypeFromCMMediaType(v29);
  v32 = [AVMetricHLSMediaSegmentRequestEvent alloc];
  v33 = *(void *)(CMBaseObjectGetVTable() + 32);
  if (v33) {
    v34 = v33;
  }
  else {
    v34 = 0;
  }
  v35 = *(unsigned int (**)(OpaqueFigMetricEvent *))(v34 + 104);
  if (v35) {
    v36 = v35(a3) != 0;
  }
  else {
    v36 = 0;
  }
  v40 = v42;
  v41 = v43;
  LOBYTE(v39) = v36;
  v37 = -[AVMetricHLSMediaSegmentRequestEvent initWithDate:mediaTime:sessionID:indexFileURL:byteRange:isMapSegment:mediaType:mediaResourceRequestEvent:](v32, "initWithDate:mediaTime:sessionID:indexFileURL:byteRange:isMapSegment:mediaType:mediaResourceRequestEvent:", v8, &v40, v15, v19, v23, v25, v39, v31, v26);

  return v37;
}

- (id)contentKeyRequestEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3
{
  void (*v11)(long long *__return_ptr, OpaqueFigMetricEvent *);
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(OpaqueFigMetricEvent *);
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(OpaqueFigMetricEvent *);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(OpaqueFigMetricEvent *);
  __CFString *v25;
  AVContentKeySpecifier *v26;
  AVContentKeySpecifier *v27;
  AVMetricContentKeyRequestEvent *v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int (*v31)(OpaqueFigMetricEvent *);
  BOOL v32;
  AVMetricContentKeyRequestEvent *v33;
  long long v35;
  uint64_t v36;
  long long v37;
  uint64_t v38;

  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v6 + 32);
  if (v7) {
    uint64_t v8 = v7(a3);
  }
  else {
    uint64_t v8 = 0;
  }
  v37 = 0uLL;
  v38 = 0;
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  v11 = *(void (**)(long long *__return_ptr, OpaqueFigMetricEvent *))(v10 + 56);
  if (v11)
  {
    v11(&v37, a3);
  }
  else
  {
    v37 = *MEMORY[0x1E4F1F9F8];
    v38 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  }
  v12 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v12) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  v14 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v13 + 40);
  if (v14) {
    v15 = (void *)v14(a3);
  }
  else {
    v15 = 0;
  }
  v16 = [(AVMetricEventStream *)self resourceRequestEventWithFigMetricEvent:a3];
  v17 = *(void *)(CMBaseObjectGetVTable() + 32);
  if (v17) {
    v18 = v17;
  }
  else {
    v18 = 0;
  }
  v19 = 1836415096;
  v20 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v18 + 96);
  if (v20) {
    v19 = v20(a3);
  }
  v21 = AVMediaTypeFromCMMediaType(v19);
  v22 = *(void *)(CMBaseObjectGetVTable() + 32);
  if (v22) {
    v23 = v22;
  }
  else {
    v23 = 0;
  }
  v24 = *(void (**)(OpaqueFigMetricEvent *))(v23 + 112);
  if (v24) {
    v24(a3);
  }
  if (FigContentKeySpecifierGetKeySystem() == 1)
  {
    v25 = @"FairPlayStreaming";
  }
  else
  {
    v25 = @"ClearKeySystem";
    if (FigContentKeySpecifierGetKeySystem() != 2
      && FigContentKeySpecifierGetKeySystem() == 3)
    {
      v25 = @"AuthorizationTokenSystem";
    }
  }
  v26 = [AVContentKeySpecifier alloc];
  v27 = [(AVContentKeySpecifier *)v26 initForKeySystem:v25 identifier:FigContentKeySpecifierGetIdentifier() options:MEMORY[0x1E4F1CC08]];
  v28 = [AVMetricContentKeyRequestEvent alloc];
  v29 = *(void *)(CMBaseObjectGetVTable() + 32);
  if (v29) {
    v30 = v29;
  }
  else {
    v30 = 0;
  }
  v31 = *(unsigned int (**)(OpaqueFigMetricEvent *))(v30 + 120);
  if (v31) {
    v32 = v31(a3) != 0;
  }
  else {
    v32 = 0;
  }
  v35 = v37;
  v36 = v38;
  v33 = [(AVMetricContentKeyRequestEvent *)v28 initWithDate:v8 mediaTime:&v35 sessionID:v15 contentKeySpecifier:v27 mediaType:v21 isClientInitiated:v32 mediaResourceRequestEvent:v16];

  return v33;
}

- (id)likelyToKeepUpEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3
{
  void (*v10)(long long *__return_ptr, OpaqueFigMetricEvent *);
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(OpaqueFigMetricEvent *);
  void *v14;
  AVAssetVariant *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(OpaqueFigMetricEvent *);
  uint64_t v19;
  AVAssetVariant *v20;
  AVMetricPlayerItemLikelyToKeepUpEvent *v21;
  uint64_t v22;
  uint64_t v23;
  double (*v24)(OpaqueFigMetricEvent *);
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(OpaqueFigMetricEvent *);
  uint64_t v29;
  AVMetricPlayerItemLikelyToKeepUpEvent *v30;
  long long v32;
  uint64_t v33;
  long long v34;
  uint64_t v35;

  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v5 + 32);
  if (v6) {
    uint64_t v7 = v6(a3);
  }
  else {
    uint64_t v7 = 0;
  }
  v34 = 0uLL;
  v35 = 0;
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void (**)(long long *__return_ptr, OpaqueFigMetricEvent *))(v9 + 56);
  if (v10)
  {
    v10(&v34, a3);
  }
  else
  {
    v34 = *MEMORY[0x1E4F1F9F8];
    v35 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  }
  v11 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v11) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  v13 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v12 + 40);
  if (v13) {
    v14 = (void *)v13(a3);
  }
  else {
    v14 = 0;
  }
  v15 = [AVAssetVariant alloc];
  v16 = *(void *)(CMBaseObjectGetVTable() + 40);
  if (v16) {
    v17 = v16;
  }
  else {
    v17 = 0;
  }
  v18 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v17 + 8);
  if (v18) {
    v19 = v18(a3);
  }
  else {
    v19 = 0;
  }
  v20 = [(AVAssetVariant *)v15 initWithFigAlternate:v19];
  v21 = [AVMetricPlayerItemLikelyToKeepUpEvent alloc];
  v22 = *(void *)(CMBaseObjectGetVTable() + 40);
  if (v22) {
    v23 = v22;
  }
  else {
    v23 = 0;
  }
  v24 = *(double (**)(OpaqueFigMetricEvent *))(v23 + 48);
  v25 = 0.0;
  if (v24) {
    v25 = v24(a3);
  }
  v26 = *(void *)(CMBaseObjectGetVTable() + 40);
  if (v26) {
    v27 = v26;
  }
  else {
    v27 = 0;
  }
  v28 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v27 + 16);
  if (v28) {
    v29 = v28(a3);
  }
  else {
    v29 = 0;
  }
  v32 = v34;
  v33 = v35;
  v30 = [(AVMetricPlayerItemLikelyToKeepUpEvent *)v21 initWithDate:v7 mediaTime:&v32 sessionID:v14 variant:v20 timeTaken:v29 loadedTimeRanges:v25];

  return v30;
}

- (id)initialLikelyToKeepUpEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3
{
  void (*v11)(long long *__return_ptr, OpaqueFigMetricEvent *);
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(OpaqueFigMetricEvent *);
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  AVAssetVariant *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(OpaqueFigMetricEvent *);
  uint64_t v23;
  AVAssetVariant *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(OpaqueFigMetricEvent *);
  CFArrayRef v28;
  CFIndex v29;
  CFIndex i;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(OpaqueFigMetricEvent *);
  CFArrayRef v34;
  CFIndex v35;
  CFIndex j;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(OpaqueFigMetricEvent *);
  CFArrayRef v40;
  CFIndex v41;
  CFIndex k;
  AVMetricPlayerItemInitialLikelyToKeepUpEvent *v43;
  uint64_t v44;
  uint64_t v45;
  double (*v46)(OpaqueFigMetricEvent *);
  double v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t (*v50)(OpaqueFigMetricEvent *);
  uint64_t v51;
  AVMetricPlayerItemInitialLikelyToKeepUpEvent *v52;
  long long v54;
  uint64_t v55;
  long long v56;
  uint64_t v57;

  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v6 + 32);
  if (v7) {
    uint64_t v8 = v7(a3);
  }
  else {
    uint64_t v8 = 0;
  }
  v56 = 0uLL;
  v57 = 0;
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  v11 = *(void (**)(long long *__return_ptr, OpaqueFigMetricEvent *))(v10 + 56);
  if (v11)
  {
    v11(&v56, a3);
  }
  else
  {
    v56 = *MEMORY[0x1E4F1F9F8];
    v57 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  }
  v12 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v12) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  v14 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v13 + 40);
  if (v14) {
    v15 = (void *)v14(a3);
  }
  else {
    v15 = 0;
  }
  v16 = (void *)[MEMORY[0x1E4F1CA48] array];
  v17 = (void *)[MEMORY[0x1E4F1CA48] array];
  v18 = (void *)[MEMORY[0x1E4F1CA48] array];
  v19 = [AVAssetVariant alloc];
  v20 = *(void *)(CMBaseObjectGetVTable() + 40);
  if (v20) {
    v21 = v20;
  }
  else {
    v21 = 0;
  }
  v22 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v21 + 8);
  if (v22) {
    v23 = v22(a3);
  }
  else {
    v23 = 0;
  }
  v24 = [(AVAssetVariant *)v19 initWithFigAlternate:v23];
  v25 = *(void *)(CMBaseObjectGetVTable() + 40);
  if (v25) {
    v26 = v25;
  }
  else {
    v26 = 0;
  }
  v27 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v26 + 24);
  if (v27) {
    v28 = (const __CFArray *)v27(a3);
  }
  else {
    v28 = 0;
  }
  v29 = 0;
  if (!v28) {
    goto LABEL_33;
  }
LABEL_32:
  for (i = CFArrayGetCount(v28); v29 < i; i = 0)
  {
    objc_msgSend(v16, "addObject:", -[AVMetricEventStream playlistRequestEventWithFigMetricEvent:](self, "playlistRequestEventWithFigMetricEvent:", CFArrayGetValueAtIndex(v28, v29++)));
    if (v28) {
      goto LABEL_32;
    }
LABEL_33:
    ;
  }
  v31 = *(void *)(CMBaseObjectGetVTable() + 40);
  if (v31) {
    v32 = v31;
  }
  else {
    v32 = 0;
  }
  v33 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v32 + 32);
  if (v33) {
    v34 = (const __CFArray *)v33(a3);
  }
  else {
    v34 = 0;
  }
  v35 = 0;
  if (!v34) {
    goto LABEL_45;
  }
LABEL_44:
  for (j = CFArrayGetCount(v34); v35 < j; j = 0)
  {
    objc_msgSend(v17, "addObject:", -[AVMetricEventStream mediaSegmentRequestEventWithFigMetricEvent:](self, "mediaSegmentRequestEventWithFigMetricEvent:", CFArrayGetValueAtIndex(v34, v35++)));
    if (v34) {
      goto LABEL_44;
    }
LABEL_45:
    ;
  }
  v37 = *(void *)(CMBaseObjectGetVTable() + 40);
  if (v37) {
    v38 = v37;
  }
  else {
    v38 = 0;
  }
  v39 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v38 + 40);
  if (v39) {
    v40 = (const __CFArray *)v39(a3);
  }
  else {
    v40 = 0;
  }
  v41 = 0;
  if (!v40) {
    goto LABEL_57;
  }
LABEL_56:
  for (k = CFArrayGetCount(v40); v41 < k; k = 0)
  {
    objc_msgSend(v18, "addObject:", -[AVMetricEventStream contentKeyRequestEventWithFigMetricEvent:](self, "contentKeyRequestEventWithFigMetricEvent:", CFArrayGetValueAtIndex(v40, v41++)));
    if (v40) {
      goto LABEL_56;
    }
LABEL_57:
    ;
  }
  v43 = [AVMetricPlayerItemInitialLikelyToKeepUpEvent alloc];
  v44 = *(void *)(CMBaseObjectGetVTable() + 40);
  if (v44) {
    v45 = v44;
  }
  else {
    v45 = 0;
  }
  v46 = *(double (**)(OpaqueFigMetricEvent *))(v45 + 48);
  v47 = 0.0;
  if (v46) {
    v47 = v46(a3);
  }
  v48 = *(void *)(CMBaseObjectGetVTable() + 40);
  if (v48) {
    v49 = v48;
  }
  else {
    v49 = 0;
  }
  v50 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v49 + 16);
  if (v50) {
    v51 = v50(a3);
  }
  else {
    v51 = 0;
  }
  v54 = v56;
  v55 = v57;
  v52 = [(AVMetricPlayerItemInitialLikelyToKeepUpEvent *)v43 initWithDate:v8 mediaTime:&v54 sessionID:v15 variant:v24 timeTaken:v51 loadedTimeRanges:v16 playlistRequestEvents:v47 mediaSegmentRequestEvents:v17 contentKeyRequestEvents:v18];

  return v52;
}

- (id)rateChangeEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3
{
  void (*v10)(long long *__return_ptr, OpaqueFigMetricEvent *);
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(OpaqueFigMetricEvent *);
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(OpaqueFigMetricEvent *);
  AVAssetVariant *v18;
  AVMetricPlayerItemRateChangeEvent *v19;
  uint64_t v20;
  uint64_t v21;
  double (*v22)(OpaqueFigMetricEvent *);
  double v23;
  uint64_t v24;
  uint64_t v25;
  double (*v26)(OpaqueFigMetricEvent *);
  double v27;
  AVMetricPlayerItemRateChangeEvent *v28;
  long long v30;
  uint64_t v31;
  long long v32;
  uint64_t v33;

  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v5 + 32);
  if (v6) {
    uint64_t v7 = v6(a3);
  }
  else {
    uint64_t v7 = 0;
  }
  v32 = 0uLL;
  v33 = 0;
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void (**)(long long *__return_ptr, OpaqueFigMetricEvent *))(v9 + 56);
  if (v10)
  {
    v10(&v32, a3);
  }
  else
  {
    v32 = *MEMORY[0x1E4F1F9F8];
    v33 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  }
  v11 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v11) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  v13 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v12 + 40);
  if (v13) {
    v14 = (void *)v13(a3);
  }
  else {
    v14 = 0;
  }
  v15 = *(void *)(CMBaseObjectGetVTable() + 48);
  if (v15) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  v17 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v16 + 8);
  if (v17)
  {
    v18 = (AVAssetVariant *)v17(a3);
    if (v18) {
      v18 = [[AVAssetVariant alloc] initWithFigAlternate:v18];
    }
  }
  else
  {
    v18 = 0;
  }
  v19 = [AVMetricPlayerItemRateChangeEvent alloc];
  v20 = *(void *)(CMBaseObjectGetVTable() + 48);
  if (v20) {
    v21 = v20;
  }
  else {
    v21 = 0;
  }
  v22 = *(double (**)(OpaqueFigMetricEvent *))(v21 + 16);
  v23 = 0.0;
  if (v22) {
    v23 = v22(a3);
  }
  v24 = *(void *)(CMBaseObjectGetVTable() + 48);
  if (v24) {
    v25 = v24;
  }
  else {
    v25 = 0;
  }
  v26 = *(double (**)(OpaqueFigMetricEvent *))(v25 + 24);
  v27 = 0.0;
  if (v26) {
    v27 = v26(a3);
  }
  v30 = v32;
  v31 = v33;
  v28 = [(AVMetricPlayerItemRateChangeEvent *)v19 initWithDate:v7 mediaTime:&v30 sessionID:v14 variant:v18 rate:v23 previousRate:v27];

  return v28;
}

- (id)stallEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3
{
  void (*v10)(long long *__return_ptr, OpaqueFigMetricEvent *);
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(OpaqueFigMetricEvent *);
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(OpaqueFigMetricEvent *);
  AVAssetVariant *v18;
  AVMetricPlayerItemStallEvent *v19;
  uint64_t v20;
  uint64_t v21;
  double (*v22)(OpaqueFigMetricEvent *);
  double v23;
  uint64_t v24;
  uint64_t v25;
  double (*v26)(OpaqueFigMetricEvent *);
  double v27;
  AVMetricPlayerItemStallEvent *v28;
  long long v30;
  uint64_t v31;
  long long v32;
  uint64_t v33;

  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v5 + 32);
  if (v6) {
    uint64_t v7 = v6(a3);
  }
  else {
    uint64_t v7 = 0;
  }
  v32 = 0uLL;
  v33 = 0;
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void (**)(long long *__return_ptr, OpaqueFigMetricEvent *))(v9 + 56);
  if (v10)
  {
    v10(&v32, a3);
  }
  else
  {
    v32 = *MEMORY[0x1E4F1F9F8];
    v33 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  }
  v11 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v11) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  v13 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v12 + 40);
  if (v13) {
    v14 = (void *)v13(a3);
  }
  else {
    v14 = 0;
  }
  v15 = *(void *)(CMBaseObjectGetVTable() + 48);
  if (v15) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  v17 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v16 + 8);
  if (v17)
  {
    v18 = (AVAssetVariant *)v17(a3);
    if (v18) {
      v18 = [[AVAssetVariant alloc] initWithFigAlternate:v18];
    }
  }
  else
  {
    v18 = 0;
  }
  v19 = [AVMetricPlayerItemStallEvent alloc];
  v20 = *(void *)(CMBaseObjectGetVTable() + 48);
  if (v20) {
    v21 = v20;
  }
  else {
    v21 = 0;
  }
  v22 = *(double (**)(OpaqueFigMetricEvent *))(v21 + 16);
  v23 = 0.0;
  if (v22) {
    v23 = v22(a3);
  }
  v24 = *(void *)(CMBaseObjectGetVTable() + 48);
  if (v24) {
    v25 = v24;
  }
  else {
    v25 = 0;
  }
  v26 = *(double (**)(OpaqueFigMetricEvent *))(v25 + 24);
  v27 = 0.0;
  if (v26) {
    v27 = v26(a3);
  }
  v30 = v32;
  v31 = v33;
  v28 = [(AVMetricPlayerItemRateChangeEvent *)v19 initWithDate:v7 mediaTime:&v30 sessionID:v14 variant:v18 rate:v23 previousRate:v27];

  return v28;
}

- (id)seekEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3
{
  void (*v10)(long long *__return_ptr, OpaqueFigMetricEvent *);
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(OpaqueFigMetricEvent *);
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(OpaqueFigMetricEvent *);
  AVAssetVariant *v18;
  AVMetricPlayerItemSeekEvent *v19;
  uint64_t v20;
  uint64_t v21;
  double (*v22)(OpaqueFigMetricEvent *);
  double v23;
  uint64_t v24;
  uint64_t v25;
  double (*v26)(OpaqueFigMetricEvent *);
  double v27;
  AVMetricPlayerItemSeekEvent *v28;
  long long v30;
  uint64_t v31;
  long long v32;
  uint64_t v33;

  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v5 + 32);
  if (v6) {
    uint64_t v7 = v6(a3);
  }
  else {
    uint64_t v7 = 0;
  }
  v32 = 0uLL;
  v33 = 0;
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void (**)(long long *__return_ptr, OpaqueFigMetricEvent *))(v9 + 56);
  if (v10)
  {
    v10(&v32, a3);
  }
  else
  {
    v32 = *MEMORY[0x1E4F1F9F8];
    v33 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  }
  v11 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v11) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  v13 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v12 + 40);
  if (v13) {
    v14 = (void *)v13(a3);
  }
  else {
    v14 = 0;
  }
  v15 = *(void *)(CMBaseObjectGetVTable() + 48);
  if (v15) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  v17 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v16 + 8);
  if (v17)
  {
    v18 = (AVAssetVariant *)v17(a3);
    if (v18) {
      v18 = [[AVAssetVariant alloc] initWithFigAlternate:v18];
    }
  }
  else
  {
    v18 = 0;
  }
  v19 = [AVMetricPlayerItemSeekEvent alloc];
  v20 = *(void *)(CMBaseObjectGetVTable() + 48);
  if (v20) {
    v21 = v20;
  }
  else {
    v21 = 0;
  }
  v22 = *(double (**)(OpaqueFigMetricEvent *))(v21 + 16);
  v23 = 0.0;
  if (v22) {
    v23 = v22(a3);
  }
  v24 = *(void *)(CMBaseObjectGetVTable() + 48);
  if (v24) {
    v25 = v24;
  }
  else {
    v25 = 0;
  }
  v26 = *(double (**)(OpaqueFigMetricEvent *))(v25 + 24);
  v27 = 0.0;
  if (v26) {
    v27 = v26(a3);
  }
  v30 = v32;
  v31 = v33;
  v28 = [(AVMetricPlayerItemRateChangeEvent *)v19 initWithDate:v7 mediaTime:&v30 sessionID:v14 variant:v18 rate:v23 previousRate:v27];

  return v28;
}

- (id)seekDidCompleteEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3
{
  void (*v10)(long long *__return_ptr, OpaqueFigMetricEvent *);
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(OpaqueFigMetricEvent *);
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(OpaqueFigMetricEvent *);
  AVAssetVariant *v18;
  AVMetricPlayerItemSeekDidCompleteEvent *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(OpaqueFigMetricEvent *);
  int v23;
  uint64_t v24;
  uint64_t v25;
  double (*v26)(OpaqueFigMetricEvent *);
  double v27;
  uint64_t v28;
  uint64_t v29;
  double (*v30)(OpaqueFigMetricEvent *);
  double v31;
  AVMetricPlayerItemSeekDidCompleteEvent *v32;
  long long v34;
  uint64_t v35;
  long long v36;
  uint64_t v37;

  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v5 + 32);
  if (v6) {
    uint64_t v7 = v6(a3);
  }
  else {
    uint64_t v7 = 0;
  }
  v36 = 0uLL;
  v37 = 0;
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void (**)(long long *__return_ptr, OpaqueFigMetricEvent *))(v9 + 56);
  if (v10)
  {
    v10(&v36, a3);
  }
  else
  {
    v36 = *MEMORY[0x1E4F1F9F8];
    v37 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  }
  v11 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v11) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  v13 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v12 + 40);
  if (v13) {
    v14 = (void *)v13(a3);
  }
  else {
    v14 = 0;
  }
  v15 = *(void *)(CMBaseObjectGetVTable() + 48);
  if (v15) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  v17 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v16 + 8);
  if (v17)
  {
    v18 = (AVAssetVariant *)v17(a3);
    if (v18) {
      v18 = [[AVAssetVariant alloc] initWithFigAlternate:v18];
    }
  }
  else
  {
    v18 = 0;
  }
  v19 = [AVMetricPlayerItemSeekDidCompleteEvent alloc];
  v20 = *(void *)(CMBaseObjectGetVTable() + 48);
  if (v20) {
    v21 = v20;
  }
  else {
    v21 = 0;
  }
  v22 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v21 + 32);
  if (v22) {
    v23 = v22(a3);
  }
  else {
    v23 = 0;
  }
  v24 = *(void *)(CMBaseObjectGetVTable() + 48);
  if (v24) {
    v25 = v24;
  }
  else {
    v25 = 0;
  }
  v26 = *(double (**)(OpaqueFigMetricEvent *))(v25 + 16);
  v27 = 0.0;
  if (v26) {
    v27 = v26(a3);
  }
  v28 = *(void *)(CMBaseObjectGetVTable() + 48);
  if (v28) {
    v29 = v28;
  }
  else {
    v29 = 0;
  }
  v30 = *(double (**)(OpaqueFigMetricEvent *))(v29 + 24);
  v31 = 0.0;
  if (v30) {
    v31 = v30(a3);
  }
  v34 = v36;
  v35 = v37;
  v32 = [(AVMetricPlayerItemSeekDidCompleteEvent *)v19 initWithDate:v7 mediaTime:&v34 sessionID:v14 variant:v18 didSeekInBuffer:v23 != 0 rate:v27 previousRate:v31];

  return v32;
}

- (id)variantChangeEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3
{
  void (*v10)(long long *__return_ptr, OpaqueFigMetricEvent *);
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(OpaqueFigMetricEvent *);
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(OpaqueFigMetricEvent *);
  AVAssetVariant *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(OpaqueFigMetricEvent *);
  AVAssetVariant *v22;
  AVMetricPlayerItemVariantSwitchEvent *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(OpaqueFigMetricEvent *);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int (*v30)(OpaqueFigMetricEvent *);
  BOOL v31;
  AVMetricPlayerItemVariantSwitchEvent *v32;
  uint64_t v34;
  long long v35;
  uint64_t v36;
  long long v37;
  uint64_t v38;

  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v5 + 32);
  if (v6) {
    uint64_t v7 = v6(a3);
  }
  else {
    uint64_t v7 = 0;
  }
  v37 = 0uLL;
  v38 = 0;
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void (**)(long long *__return_ptr, OpaqueFigMetricEvent *))(v9 + 56);
  if (v10)
  {
    v10(&v37, a3);
  }
  else
  {
    v37 = *MEMORY[0x1E4F1F9F8];
    v38 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  }
  v11 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v11) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  v13 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v12 + 40);
  if (v13) {
    v14 = (void *)v13(a3);
  }
  else {
    v14 = 0;
  }
  v15 = *(void *)(CMBaseObjectGetVTable() + 56);
  if (v15) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  v17 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v16 + 16);
  if (v17) {
    v18 = (AVAssetVariant *)v17(a3);
  }
  else {
    v18 = 0;
  }
  v19 = *(void *)(CMBaseObjectGetVTable() + 56);
  if (v19) {
    v20 = v19;
  }
  else {
    v20 = 0;
  }
  v21 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v20 + 8);
  if (v21)
  {
    v22 = (AVAssetVariant *)v21(a3);
    if (v22) {
      v22 = [[AVAssetVariant alloc] initWithFigAlternate:v22];
    }
  }
  else
  {
    v22 = 0;
  }
  if (v18) {
    v18 = [[AVAssetVariant alloc] initWithFigAlternate:v18];
  }
  v23 = [AVMetricPlayerItemVariantSwitchEvent alloc];
  v24 = *(void *)(CMBaseObjectGetVTable() + 56);
  if (v24) {
    v25 = v24;
  }
  else {
    v25 = 0;
  }
  v26 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v25 + 24);
  if (v26) {
    v27 = v26(a3);
  }
  else {
    v27 = 0;
  }
  v28 = *(void *)(CMBaseObjectGetVTable() + 56);
  if (v28) {
    v29 = v28;
  }
  else {
    v29 = 0;
  }
  v30 = *(unsigned int (**)(OpaqueFigMetricEvent *))(v29 + 32);
  if (v30) {
    v31 = v30(a3) != 0;
  }
  else {
    v31 = 0;
  }
  v35 = v37;
  v36 = v38;
  LOBYTE(v34) = v31;
  v32 = [(AVMetricPlayerItemVariantSwitchEvent *)v23 initWithDate:v7 mediaTime:&v35 sessionID:v14 fromVariant:v18 toVariant:v22 loadedTimeRanges:v27 didSucceed:v34];

  return v32;
}

- (id)variantChangeStartEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3
{
  void (*v10)(long long *__return_ptr, OpaqueFigMetricEvent *);
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(OpaqueFigMetricEvent *);
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(OpaqueFigMetricEvent *);
  AVAssetVariant *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(OpaqueFigMetricEvent *);
  AVAssetVariant *v22;
  AVMetricPlayerItemVariantSwitchStartEvent *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(OpaqueFigMetricEvent *);
  uint64_t v27;
  AVMetricPlayerItemVariantSwitchStartEvent *v28;
  long long v30;
  uint64_t v31;
  long long v32;
  uint64_t v33;

  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v5 + 32);
  if (v6) {
    uint64_t v7 = v6(a3);
  }
  else {
    uint64_t v7 = 0;
  }
  v32 = 0uLL;
  v33 = 0;
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void (**)(long long *__return_ptr, OpaqueFigMetricEvent *))(v9 + 56);
  if (v10)
  {
    v10(&v32, a3);
  }
  else
  {
    v32 = *MEMORY[0x1E4F1F9F8];
    v33 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  }
  v11 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v11) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  v13 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v12 + 40);
  if (v13) {
    v14 = (void *)v13(a3);
  }
  else {
    v14 = 0;
  }
  v15 = *(void *)(CMBaseObjectGetVTable() + 80);
  if (v15) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  v17 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v16 + 16);
  if (v17) {
    v18 = (AVAssetVariant *)v17(a3);
  }
  else {
    v18 = 0;
  }
  v19 = *(void *)(CMBaseObjectGetVTable() + 80);
  if (v19) {
    v20 = v19;
  }
  else {
    v20 = 0;
  }
  v21 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v20 + 8);
  if (v21)
  {
    v22 = (AVAssetVariant *)v21(a3);
    if (v22) {
      v22 = [[AVAssetVariant alloc] initWithFigAlternate:v22];
    }
  }
  else
  {
    v22 = 0;
  }
  if (v18) {
    v18 = [[AVAssetVariant alloc] initWithFigAlternate:v18];
  }
  v23 = [AVMetricPlayerItemVariantSwitchStartEvent alloc];
  v24 = *(void *)(CMBaseObjectGetVTable() + 80);
  if (v24) {
    v25 = v24;
  }
  else {
    v25 = 0;
  }
  v26 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v25 + 24);
  if (v26) {
    v27 = v26(a3);
  }
  else {
    v27 = 0;
  }
  v30 = v32;
  v31 = v33;
  v28 = [(AVMetricPlayerItemVariantSwitchStartEvent *)v23 initWithDate:v7 mediaTime:&v30 sessionID:v14 fromVariant:v18 toVariant:v22 loadedTimeRanges:v27];

  return v28;
}

- (id)playbackSummaryEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3
{
  void (*v10)(long long *__return_ptr, OpaqueFigMetricEvent *);
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(OpaqueFigMetricEvent *);
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(OpaqueFigMetricEvent *);
  uint64_t v18;
  id v19;
  AVMetricPlayerItemPlaybackSummaryEvent *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(OpaqueFigMetricEvent *);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(OpaqueFigMetricEvent *);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(OpaqueFigMetricEvent *);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(OpaqueFigMetricEvent *);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(OpaqueFigMetricEvent *);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double (*v43)(OpaqueFigMetricEvent *);
  double v44;
  uint64_t v45;
  uint64_t v46;
  double (*v47)(OpaqueFigMetricEvent *);
  double v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t (*v51)(OpaqueFigMetricEvent *);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t (*v55)(OpaqueFigMetricEvent *);
  uint64_t v56;
  AVMetricPlayerItemPlaybackSummaryEvent *v57;
  uint64_t v59;
  long long v60;
  uint64_t v61;
  long long v62;
  uint64_t v63;

  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v6 + 32);
  if (v7) {
    v59 = v7(a3);
  }
  else {
    v59 = 0;
  }
  v62 = 0uLL;
  v63 = 0;
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void (**)(long long *__return_ptr, OpaqueFigMetricEvent *))(v9 + 56);
  if (v10)
  {
    v10(&v62, a3);
  }
  else
  {
    v62 = *MEMORY[0x1E4F1F9F8];
    v63 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  }
  v11 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v11) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  v13 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v12 + 40);
  if (v13) {
    v14 = (void *)v13(a3);
  }
  else {
    v14 = 0;
  }
  v15 = *(void *)(CMBaseObjectGetVTable() + 72);
  if (v15) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  v17 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v16 + 8);
  if (v17 && (v18 = v17(a3)) != 0) {
    v19 = [(AVMetricEventStream *)self errorEventWithFigMetricEvent:v18];
  }
  else {
    v19 = 0;
  }
  v20 = [AVMetricPlayerItemPlaybackSummaryEvent alloc];
  v21 = *(void *)(CMBaseObjectGetVTable() + 72);
  if (v21) {
    v22 = v21;
  }
  else {
    v22 = 0;
  }
  v23 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v22 + 16);
  if (v23) {
    v24 = v23(a3);
  }
  else {
    v24 = 0;
  }
  v25 = *(void *)(CMBaseObjectGetVTable() + 72);
  if (v25) {
    v26 = v25;
  }
  else {
    v26 = 0;
  }
  v27 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v26 + 24);
  if (v27) {
    v28 = v27(a3);
  }
  else {
    v28 = 0;
  }
  v29 = *(void *)(CMBaseObjectGetVTable() + 72);
  if (v29) {
    v30 = v29;
  }
  else {
    v30 = 0;
  }
  v31 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v30 + 32);
  if (v31) {
    v32 = v31(a3);
  }
  else {
    v32 = 0;
  }
  v33 = *(void *)(CMBaseObjectGetVTable() + 72);
  if (v33) {
    v34 = v33;
  }
  else {
    v34 = 0;
  }
  v35 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v34 + 40);
  if (v35) {
    v36 = v35(a3);
  }
  else {
    v36 = 0;
  }
  v37 = *(void *)(CMBaseObjectGetVTable() + 72);
  if (v37) {
    v38 = v37;
  }
  else {
    v38 = 0;
  }
  v39 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v38 + 48);
  if (v39) {
    v40 = v39(a3);
  }
  else {
    v40 = 0;
  }
  v41 = *(void *)(CMBaseObjectGetVTable() + 72);
  if (v41) {
    v42 = v41;
  }
  else {
    v42 = 0;
  }
  v43 = *(double (**)(OpaqueFigMetricEvent *))(v42 + 56);
  v44 = 0.0;
  if (v43) {
    v44 = v43(a3);
  }
  v45 = *(void *)(CMBaseObjectGetVTable() + 72);
  if (v45) {
    v46 = v45;
  }
  else {
    v46 = 0;
  }
  v47 = *(double (**)(OpaqueFigMetricEvent *))(v46 + 64);
  v48 = 0.0;
  if (v47) {
    v48 = v47(a3);
  }
  v49 = *(void *)(CMBaseObjectGetVTable() + 72);
  if (v49) {
    v50 = v49;
  }
  else {
    v50 = 0;
  }
  v51 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v50 + 72);
  if (v51) {
    v52 = v51(a3);
  }
  else {
    v52 = 0;
  }
  v53 = *(void *)(CMBaseObjectGetVTable() + 72);
  if (v53) {
    v54 = v53;
  }
  else {
    v54 = 0;
  }
  v55 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v54 + 80);
  if (v55) {
    v56 = v55(a3);
  }
  else {
    v56 = 0;
  }
  v60 = v62;
  v61 = v63;
  v57 = [(AVMetricPlayerItemPlaybackSummaryEvent *)v20 initWithDate:v59 mediaTime:&v60 sessionID:v14 errorEvent:v19 recoverableErrorCount:v24 stallCount:v28 variantSwitchCount:v44 playbackDuration:v48 mediaResourceRequestCount:v32 timeSpentRecoveringFromStall:v36 timeSpentInInitialStartup:v40 timeWeightedAverageBitrate:v52 timeWeightedPeakBitrate:v56];

  return v57;
}

- (id)metricEventForFigMetricEvent:(OpaqueFigMetricEvent *)a3
{
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(OpaqueFigMetricEvent *))(v6 + 24);
  if (!v7) {
    return 0;
  }
  switch(v7(a3))
  {
    case 0:
      id result = [(AVMetricEventStream *)self playlistRequestEventWithFigMetricEvent:a3];
      break;
    case 1:
      id result = [(AVMetricEventStream *)self mediaSegmentRequestEventWithFigMetricEvent:a3];
      break;
    case 2:
      id result = [(AVMetricEventStream *)self contentKeyRequestEventWithFigMetricEvent:a3];
      break;
    case 4:
      id result = [(AVMetricEventStream *)self initialLikelyToKeepUpEventWithFigMetricEvent:a3];
      break;
    case 5:
      id result = [(AVMetricEventStream *)self likelyToKeepUpEventWithFigMetricEvent:a3];
      break;
    case 6:
      id result = [(AVMetricEventStream *)self variantChangeEventWithFigMetricEvent:a3];
      break;
    case 7:
      id result = [(AVMetricEventStream *)self variantChangeStartEventWithFigMetricEvent:a3];
      break;
    case 8:
      id result = [(AVMetricEventStream *)self stallEventWithFigMetricEvent:a3];
      break;
    case 9:
      id result = [(AVMetricEventStream *)self rateChangeEventWithFigMetricEvent:a3];
      break;
    case 10:
      id result = [(AVMetricEventStream *)self seekEventWithFigMetricEvent:a3];
      break;
    case 11:
      id result = [(AVMetricEventStream *)self seekDidCompleteEventWithFigMetricEvent:a3];
      break;
    case 12:
      id result = [(AVMetricEventStream *)self errorEventWithFigMetricEvent:a3];
      break;
    case 14:
      id result = [(AVMetricEventStream *)self playbackSummaryEventWithFigMetricEvent:a3];
      break;
    default:
      return 0;
  }
  return result;
}

- (int64_t)getFigMetricEventIDForAVMetricClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return 12;
  }
  if ((Class)objc_opt_class() == a3) {
    return 1;
  }
  if ((Class)objc_opt_class() == a3) {
    return 0;
  }
  if ((Class)objc_opt_class() == a3) {
    return 2;
  }
  if ((Class)objc_opt_class() == a3) {
    return 5;
  }
  if ((Class)objc_opt_class() == a3) {
    return 4;
  }
  if ((Class)objc_opt_class() == a3) {
    return 9;
  }
  if ((Class)objc_opt_class() == a3) {
    return 8;
  }
  if ((Class)objc_opt_class() == a3) {
    return 10;
  }
  if ((Class)objc_opt_class() == a3) {
    return 11;
  }
  if ((Class)objc_opt_class() == a3) {
    return 6;
  }
  if ((Class)objc_opt_class() == a3) {
    return 14;
  }
  if ((Class)objc_opt_class() == a3) {
    return 7;
  }
  return -1;
}

- (void)didReceiveEventForMetricEventTimeline:(OpaqueFigMetricEventTimeline *)a3 event:(OpaqueFigMetricEvent *)a4
{
  if (a3)
  {
    if (a4)
    {
      id v6 = [(AVMetricEventStream *)self metricEventForFigMetricEvent:a4];
      Value = CFDictionaryGetValue(self->_publisherByEventTimeline, a3);
      delegateStorage = self->_delegateStorage;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __67__AVMetricEventStream_didReceiveEventForMetricEventTimeline_event___block_invoke;
      v9[3] = &unk_1E57B6858;
      v9[4] = Value;
      v9[5] = v6;
      [(AVWeakReferencingDelegateStorage *)delegateStorage invokeDelegateCallbackWithBlock:v9];
    }
  }
}

uint64_t __67__AVMetricEventStream_didReceiveEventForMetricEventTimeline_event___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    return [a2 publisher:v5 didReceiveEvent:v6];
  }
  return result;
}

- (void)addPublisher:(id)a3 eventTimeline:(OpaqueFigMetricEventTimeline *)a4
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__AVMetricEventStream_addPublisher_eventTimeline___block_invoke;
  block[3] = &unk_1E57B2270;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

uint64_t __50__AVMetricEventStream_addPublisher_eventTimeline___block_invoke(uint64_t result)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v1 = *(const void **)(result + 48);
  if (v1)
  {
    uint64_t v2 = result;
    CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(result + 32) + 24), v1);
    [*(id *)(*(void *)(v2 + 32) + 16) addObject:*(void *)(v2 + 40)];
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(void *)(v2 + 32) + 8), *(const void **)(v2 + 48), *(const void **)(v2 + 40));
    uint64_t v3 = *(void *)(v2 + 48);
    uint64_t v4 = *(void *)(v2 + 32);
    uint64_t v5 = *(void *)(v4 + 56);
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = *(void (**)(uint64_t, uint64_t, void *, uint64_t))(v7 + 8);
    if (v8) {
      v8(v3, v4, &_block_invoke_subscriberCallbacks, v5);
    }
    uint64_t v9 = *(void *)(v2 + 32);
    if (*(unsigned char *)(v9 + 48))
    {
      uint64_t v10 = *(void *)(v2 + 48);
      uint64_t VTable = CMBaseObjectGetVTable();
      uint64_t v13 = *(void *)(VTable + 16);
      uint64_t result = VTable + 16;
      uint64_t v12 = v13;
      if (v13) {
        uint64_t v14 = v12;
      }
      else {
        uint64_t v14 = 0;
      }
      v25 = *(uint64_t (**)(uint64_t, uint64_t))(v14 + 32);
      if (v25)
      {
        return v25(v10, v9);
      }
    }
    else
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      v15 = *(void **)(v9 + 40);
      uint64_t result = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (result)
      {
        uint64_t v16 = result;
        uint64_t v17 = *(void *)v27;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v27 != v17) {
              objc_enumerationMutation(v15);
            }
            uint64_t v19 = [*(id *)(v2 + 32) getFigMetricEventIDForAVMetricClass:*(void *)(*((void *)&v26 + 1) + 8 * v18)];
            uint64_t v20 = *(void *)(v2 + 48);
            uint64_t v21 = *(void *)(v2 + 32);
            uint64_t v22 = *(void *)(CMBaseObjectGetVTable() + 16);
            if (v22) {
              uint64_t v23 = v22;
            }
            else {
              uint64_t v23 = 0;
            }
            v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16);
            if (v24) {
              v24(v20, v21, v19);
            }
            ++v18;
          }
          while (v16 != v18);
          uint64_t result = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
          uint64_t v16 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (BOOL)addPublisher:(id)a3
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__AVMetricEventStream_addPublisher___block_invoke;
  v5[3] = &unk_1E57B6880;
  objc_copyWeak(&v6, &location);
  v5[4] = a3;
  [a3 getEventTimelineWithCompletionHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return 1;
}

id __36__AVMetricEventStream_addPublisher___block_invoke(uint64_t a1, uint64_t a2)
{
  id result = objc_loadWeak((id *)(a1 + 40));
  if (a2)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    return (id)[result addPublisher:v5 eventTimeline:a2];
  }
  return result;
}

- (BOOL)setSubscriber:(id)a3 queue:(id)a4
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__AVMetricEventStream_setSubscriber_queue___block_invoke;
  block[3] = &unk_1E57B2138;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(internalQueue, block);
  return 1;
}

uint64_t __43__AVMetricEventStream_setSubscriber_queue___block_invoke(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 32);
  if (!v2)
  {
    *(void *)(a1[4] + 32) = objc_alloc_init(AVWeakReferencingDelegateStorage);
    uint64_t v2 = *(void **)(a1[4] + 32);
  }
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  return [v2 setDelegate:v3 queue:v4];
}

- (void)subscribeToMetricEvent:(Class)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__AVMetricEventStream_subscribeToMetricEvent___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(internalQueue, v4);
}

CFArrayRef __46__AVMetricEventStream_subscribeToMetricEvent___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
  for (CFIndex i = 0; ; ++i)
  {
    CFArrayRef result = *(const __CFArray **)(*(void *)(a1 + 32) + 24);
    if (result) {
      CFArrayRef result = (const __CFArray *)CFArrayGetCount(result);
    }
    if (i >= (uint64_t)result) {
      break;
    }
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(a1 + 32) + 24), i);
    uint64_t v5 = [*(id *)(a1 + 32) getFigMetricEventIDForAVMetricClass:*(void *)(a1 + 40)];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v9 = *(void (**)(const void *, uint64_t, uint64_t))(v8 + 16);
    if (v9) {
      v9(ValueAtIndex, v6, v5);
    }
  }
  return result;
}

- (void)subscribeToMetricEvents:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(a3);
        }
        [(AVMetricEventStream *)self subscribeToMetricEvent:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)subscribeToAllMetricEvents
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__AVMetricEventStream_subscribeToAllMetricEvents__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

CFArrayRef __49__AVMetricEventStream_subscribeToAllMetricEvents__block_invoke(uint64_t a1)
{
  CFIndex v2 = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
  while (1)
  {
    CFArrayRef result = *(const __CFArray **)(*(void *)(a1 + 32) + 24);
    if (result) {
      CFArrayRef result = (const __CFArray *)CFArrayGetCount(result);
    }
    if (v2 >= (uint64_t)result) {
      break;
    }
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(a1 + 32) + 24), v2);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = *(void (**)(const void *, uint64_t))(v7 + 32);
    if (v8) {
      v8(ValueAtIndex, v5);
    }
    ++v2;
  }
  return result;
}

@end