@interface WKVideoLayerRemote
- (BOOL)resizePreservingGravity;
- (CGRect)videoLayerFrame;
- (WKVideoLayerRemote)init;
- (id).cxx_construct;
- (uint64_t)init;
- (unsigned)videoGravity;
- (void)dealloc;
- (void)init;
- (void)layoutSublayers;
- (void)mediaPlayerPrivateRemote;
- (void)resolveBounds;
- (void)setMediaPlayerPrivateRemote:(void *)a3;
- (void)setVideoGravity:(unsigned __int8)a3;
- (void)setVideoLayerFrame:(CGRect)a3;
@end

@implementation WKVideoLayerRemote

- (WKVideoLayerRemote)init
{
  v9.receiver = self;
  v9.super_class = (Class)WKVideoLayerRemote;
  v2 = [(WKVideoLayerRemote *)&v9 init];
  v3 = v2;
  if (v2)
  {
    [(WKVideoLayerRemote *)v2 setMasksToBounds:1];
    id location = 0;
    objc_initWeak(&location, v3);
    v4 = (WebCore::TimerBase *)WTF::fastMalloc((WTF *)0x38);
    uint64_t v5 = WTF::fastMalloc((WTF *)0x10);
    *(void *)uint64_t v5 = &unk_1EE9D6ED8;
    *(void *)(v5 + 8) = 0;
    objc_moveWeak((id *)(v5 + 8), &location);
    WebCore::TimerBase::TimerBase(v4);
    *(void *)v4 = &unk_1EE9BA5F0;
    *((void *)v4 + 6) = v5;
    value = v3->_resolveBoundsTimer.__ptr_.__value_;
    v3->_resolveBoundsTimer.__ptr_.__value_ = (Timer *)v4;
    if (value) {
      (*(void (**)(Timer *))(*(void *)value + 8))(value);
    }
    objc_destroyWeak(&location);
    v3->_shouldRestartWhenTimerFires = 0;
  }
  return v3;
}

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)WKVideoLayerRemote;
    [(WKVideoLayerRemote *)&v4 dealloc];
  }
}

- (void)mediaPlayerPrivateRemote
{
  p_mediaPlayerPrivateRemote = &self->_mediaPlayerPrivateRemote;
  m_ptr = self->_mediaPlayerPrivateRemote.m_controlBlock.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  WTF::ThreadSafeWeakPtrControlBlock::makeStrongReferenceIfPossible<WebCore::WebGPU::ExternalTexture>((atomic_uchar *)m_ptr, (uint64_t)p_mediaPlayerPrivateRemote->m_objectOfCorrectType, &v6);
  objc_super v4 = v6;
  v6 = 0;
  if (v4) {
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::MediaPlayerPrivateRemote,(WTF::DestructionThread)1>(v4[6]);
  }
  return v4;
}

- (void)setMediaPlayerPrivateRemote:(void *)a3
{
  p_mediaPlayerPrivateRemote = &self->_mediaPlayerPrivateRemote;
  uint64_t v5 = (atomic_uchar *)*((void *)a3 + 6);
  if (v5) {
    uint64_t v5 = WTF::ThreadSafeWeakPtrControlBlock::weakRef(v5);
  }
  m_ptr = (atomic_uchar *)p_mediaPlayerPrivateRemote->m_controlBlock.m_ptr;
  p_mediaPlayerPrivateRemote->m_controlBlock.m_ptr = (ThreadSafeWeakPtrControlBlock *)v5;
  if (m_ptr) {
    WTF::ThreadSafeWeakPtrControlBlock::weakDeref(m_ptr, (void *)a2);
  }
  p_mediaPlayerPrivateRemote->m_objectOfCorrectType = (MediaPlayerPrivateRemote *)a3;
}

- (unsigned)videoGravity
{
  return self->_videoGravity;
}

- (void)setVideoGravity:(unsigned __int8)a3
{
  self->_videoGravity = a3;
}

- (BOOL)resizePreservingGravity
{
  v3 = [(WKVideoLayerRemote *)self mediaPlayerPrivateRemote];
  if (!v3) {
    return self->_videoGravity != 0;
  }
  objc_super v4 = v3;
  uint64_t v5 = (atomic_uchar **)(v3 + 6);
  WTF::ThreadSafeRefCountedAndCanMakeThreadSafeWeakPtr<IPC::WorkQueueMessageReceiver,(WTF::DestructionThread)0>::ref(v3 + 6);
  if ((*(uint64_t (**)(void))(**((void **)v4 + 19) + 40))(*((void *)v4 + 19))) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = self->_videoGravity != 0;
  }
  WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::MediaPlayerPrivateRemote,(WTF::DestructionThread)1>(*v5);
  return v6;
}

- (void)layoutSublayers
{
  v3 = (void *)[(WKVideoLayerRemote *)self sublayers];
  if ([v3 count] == 1)
  {
    [(WKVideoLayerRemote *)self videoLayerFrame];
    v44.a = v4;
    v44.b = v5;
    v44.c = v6;
    v44.d = v7;
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v50, (const CGRect *)&v44);
    [(WKVideoLayerRemote *)self bounds];
    v44.a = v8;
    v44.b = v9;
    v44.c = v10;
    v44.d = v11;
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v46, (const CGRect *)&v44);
    *(float *)&double v13 = v51;
    if (v50 != v46 || v51 != v47) {
      goto LABEL_16;
    }
    *(float *)&double v12 = v52;
    *(float *)&double v13 = v53;
    if (v52 != v48 || v53 != v49) {
      goto LABEL_16;
    }
    if (self) {
      [(WKVideoLayerRemote *)self affineTransform];
    }
    else {
      memset(&v45, 0, sizeof(v45));
    }
    if (!CGAffineTransformIsIdentity(&v45))
    {
LABEL_16:
      *(float *)&double v12 = v52;
      if (v52 <= 0.0 || (*(float *)&double v12 = v53, v53 <= 0.0))
      {
        [(WKVideoLayerRemote *)self resolveBounds];
      }
      else
      {
        long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        *(_OWORD *)&v44.a = *MEMORY[0x1E4F1DAB8];
        *(_OWORD *)&v44.c = v16;
        *(_OWORD *)&v44.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        if ([(WKVideoLayerRemote *)self resizePreservingGravity])
        {
          m_ptr = self->_mediaPlayerPrivateRemote.m_controlBlock.m_ptr;
          if (m_ptr)
          {
            WTF::ThreadSafeWeakPtrControlBlock::makeStrongReferenceIfPossible<WebCore::WebGPU::ExternalTexture>((atomic_uchar *)m_ptr, (uint64_t)self->_mediaPlayerPrivateRemote.m_objectOfCorrectType, &v43);
            uint64_t v18 = v43;
            if (v43)
            {
              float v19 = *(float *)(v43 + 340);
              float v20 = *(float *)(v43 + 344);
              uint64_t v43 = 0;
              WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::MediaPlayerPrivateRemote,(WTF::DestructionThread)1>(*(atomic_uchar **)(v18 + 48));
              if (v19 > 0.0 && v20 > 0.0)
              {
                float v22 = v19 / v20;
                WebCore::largestRectWithAspectRatioInsideRect((WebCore *)&v50, v22, v21);
                float v50 = v23;
                float v51 = v24;
                float v52 = v25;
                float v53 = v26;
                WebCore::largestRectWithAspectRatioInsideRect((WebCore *)&v46, v22, v27);
                float v46 = v28;
                float v47 = v29;
                float v48 = v30;
                float v49 = v31;
              }
            }
          }
          double v32 = fmaxf(v48 / v52, v49 / v53);
          double v33 = v32;
        }
        else
        {
          double v32 = (float)(v48 / v52);
          double v33 = (float)(v49 / v53);
        }
        CGAffineTransformMakeScale(&v44, v32, v33);
        v34 = (void *)[v3 objectAtIndex:0];
        [MEMORY[0x1E4F39CF8] begin];
        [MEMORY[0x1E4F39CF8] setDisableActions:1];
        [(WKVideoLayerRemote *)self bounds];
        double MidX = CGRectGetMidX(v54);
        [(WKVideoLayerRemote *)self bounds];
        objc_msgSend(v34, "setPosition:", MidX, CGRectGetMidY(v55));
        CGAffineTransform v42 = v44;
        [v34 setAffineTransform:&v42];
        [MEMORY[0x1E4F39CF8] commit];
        v36 = (void *)[MEMORY[0x1E4F39B58] currentContext];
        v37 = v36;
        if (v36) {
          CFRetain(v36);
        }
        v38 = self->_context.m_ptr;
        self->_context.m_ptr = v37;
        if (v38) {
          CFRelease(v38);
        }
        [MEMORY[0x1E4F39CF8] animationDuration];
        self->_delay.m_value = v39 + 0.1;
        value = self->_resolveBoundsTimer.__ptr_.__value_;
        if ((*((void *)value + 4) & 0xFFFFFFFFFFFFLL) == 0
          || *(double *)((*((void *)value + 4) & 0xFFFFFFFFFFFFLL) + 8) == 0.0)
        {
          WebCore::TimerBase::start();
        }
        else
        {
          self->_shouldRestartWhenTimerFires = 1;
          WebCore::TimerBase::nextFireInterval((WebCore::TimerBase *)value);
          self->_delay.m_value = self->_delay.m_value - v41;
        }
      }
    }
  }
}

- (void)resolveBounds
{
  if (self->_shouldRestartWhenTimerFires)
  {
    self->_shouldRestartWhenTimerFires = 0;
    WebCore::TimerBase::start();
  }
  else
  {
    v3 = (void *)[(WKVideoLayerRemote *)self sublayers];
    if ([v3 count] == 1)
    {
      CGFloat v4 = (void *)[v3 objectAtIndex:0];
      [(WKVideoLayerRemote *)self videoLayerFrame];
      if (CGRectIsEmpty(v45)) {
        goto LABEL_12;
      }
      [(WKVideoLayerRemote *)self videoLayerFrame];
      CGFloat v6 = v5;
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      [v4 bounds];
      v48.origin.x = v13;
      v48.origin.y = v14;
      v48.size.width = v15;
      v48.size.height = v16;
      v46.origin.x = v6;
      v46.origin.y = v8;
      v46.size.width = v10;
      v46.size.height = v12;
      if (!CGRectEqualToRect(v46, v48)) {
        goto LABEL_12;
      }
      if (v4) {
        [v4 affineTransform];
      }
      else {
        memset(&v43, 0, sizeof(v43));
      }
      if (!CGAffineTransformIsIdentity(&v43))
      {
LABEL_12:
        [MEMORY[0x1E4F39CF8] begin];
        [MEMORY[0x1E4F39CF8] setDisableActions:1];
        [(WKVideoLayerRemote *)self videoLayerFrame];
        CGFloat v18 = v17;
        CGFloat v20 = v19;
        CGFloat v22 = v21;
        CGFloat v24 = v23;
        [(WKVideoLayerRemote *)self bounds];
        v49.origin.x = v25;
        v49.origin.y = v26;
        v49.size.width = v27;
        v49.size.height = v28;
        v47.origin.x = v18;
        v47.origin.y = v20;
        v47.size.width = v22;
        v47.size.height = v24;
        if (!CGRectEqualToRect(v47, v49))
        {
          [(WKVideoLayerRemote *)self bounds];
          -[WKVideoLayerRemote setVideoLayerFrame:](self, "setVideoLayerFrame:");
          float v29 = [(WKVideoLayerRemote *)self mediaPlayerPrivateRemote];
          if (v29)
          {
            uint64_t v30 = (uint64_t)v29;
            float v31 = (atomic_uchar **)(v29 + 6);
            WTF::ThreadSafeRefCountedAndCanMakeThreadSafeWeakPtr<IPC::WorkQueueMessageReceiver,(WTF::DestructionThread)0>::ref(v29 + 6);
            WTF::MachSendRight::adopt((WTF::MachSendRight *)[self->_context.m_ptr createFencePort]);
            [(WKVideoLayerRemote *)self videoLayerFrame];
            uint64_t v38 = v32;
            uint64_t v39 = v33;
            v40.width = v34;
            v40.height = v35;
            WebCore::FloatSize::FloatSize((WebCore::FloatSize *)v41, &v40);
            WebKit::MediaPlayerPrivateRemote::setVideoLayerSizeFenced(v30, v41, (unint64_t)v42);
            WTF::MachSendRight::~MachSendRight((WTF::MachSendRight *)v42);
            WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::MediaPlayerPrivateRemote,(WTF::DestructionThread)1>(*v31);
          }
        }
        long long v36 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        v37[0] = *MEMORY[0x1E4F1DAB8];
        v37[1] = v36;
        v37[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        [v4 setAffineTransform:v37];
        [(WKVideoLayerRemote *)self bounds];
        objc_msgSend(v4, "setFrame:");
        [MEMORY[0x1E4F39CF8] commit];
      }
    }
  }
}

- (CGRect)videoLayerFrame
{
  double x = self->_videoLayerFrame.origin.x;
  double y = self->_videoLayerFrame.origin.y;
  double width = self->_videoLayerFrame.size.width;
  double height = self->_videoLayerFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setVideoLayerFrame:(CGRect)a3
{
  self->_videoLayerFrame = a3;
}

- (void).cxx_destruct
{
  value = self->_resolveBoundsTimer.__ptr_.__value_;
  self->_resolveBoundsTimer.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Timer *, SEL))(*(void *)value + 8))(value, a2);
  }
  m_ptr = self->_context.m_ptr;
  self->_context.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  double v5 = self->_mediaPlayerPrivateRemote.m_controlBlock.m_ptr;
  self->_mediaPlayerPrivateRemote.m_controlBlock.m_ptr = 0;
  if (v5)
  {
    WTF::ThreadSafeWeakPtrControlBlock::weakDeref((atomic_uchar *)v5, (void *)a2);
  }
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 10) = 0;
  return self;
}

- (uint64_t)init
{
  *a1 = &unk_1EE9D6ED8;
  objc_destroyWeak(a1 + 1);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)init
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained resolveBounds];
    CFRelease(v2);
  }
}

@end