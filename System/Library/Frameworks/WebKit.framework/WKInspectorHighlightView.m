@interface WKInspectorHighlightView
- (WKInspectorHighlightView)initWithFrame:(CGRect)a3;
- (id).cxx_construct;
- (void)_createLayers:(unint64_t)a3;
- (void)_layoutForNodeHighlight:(const void *)a3 offset:(unsigned int)a4;
- (void)_layoutForNodeListHighlight:(const void *)a3;
- (void)_layoutForRectsHighlight:(const void *)a3;
- (void)_removeAllLayers;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)update:(const void *)a3 scale:(double)a4 frame:(const FloatRect *)a5;
@end

@implementation WKInspectorHighlightView

- (WKInspectorHighlightView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WKInspectorHighlightView;
  v3 = -[WKInspectorHighlightView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    m_ptr = v3->_layers.m_ptr;
    v3->_layers.m_ptr = v4;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    [(WKInspectorHighlightView *)v3 setOpaque:0];
    [(WKInspectorHighlightView *)v3 setUserInteractionEnabled:0];
  }
  return v3;
}

- (void)dealloc
{
  [(WKInspectorHighlightView *)self _removeAllLayers];
  v3.receiver = self;
  v3.super_class = (Class)WKInspectorHighlightView;
  [(WKInspectorHighlightView *)&v3 dealloc];
}

- (void)_removeAllLayers
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  m_ptr = self->_layers.m_ptr;
  uint64_t v4 = [m_ptr countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(m_ptr);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * i) removeFromSuperlayer];
      }
      uint64_t v5 = [m_ptr countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [self->_layers.m_ptr removeAllObjects];
}

- (void)_createLayers:(unint64_t)a3
{
  uint64_t v5 = [self->_layers.m_ptr count];
  if (a3 && v5 != a3)
  {
    do
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F39C88]);
      [(WKInspectorHighlightView *)self frame];
      double v8 = v7;
      [(WKInspectorHighlightView *)self frame];
      objc_msgSend(v6, "setPosition:", -v8, -v9);
      [self->_layers.m_ptr addObject:v6];
      objc_msgSend((id)-[WKInspectorHighlightView layer](self, "layer"), "addSublayer:", v6);
      if (v6) {
        CFRelease(v6);
      }
      --a3;
    }
    while (a3);
  }
}

- (void)_layoutForNodeHighlight:(const void *)a3 offset:(unsigned int)a4
{
  unint64_t v7 = [self->_layers.m_ptr count];
  unint64_t v8 = a4 + 4;
  if (v7 >= v8 && *((_DWORD *)a3 + 15) >= v8)
  {
    double v9 = (CAShapeLayer *)[self->_layers.m_ptr objectAtIndex:a4];
    uint64_t v10 = a4 + 1;
    long long v11 = (CAShapeLayer *)[self->_layers.m_ptr objectAtIndex:v10];
    uint64_t v12 = a4 + 2;
    uint64_t v13 = (CAShapeLayer *)[self->_layers.m_ptr objectAtIndex:v12];
    uint64_t v14 = a4 + 3;
    uint64_t v15 = [self->_layers.m_ptr objectAtIndex:v14];
    unsigned int v17 = *((_DWORD *)a3 + 15);
    if (v17 <= a4) {
      goto LABEL_20;
    }
    uint64_t v18 = *((void *)a3 + 6);
    v19 = (_OWORD *)(v18 + 32 * a4);
    long long v20 = v19[1];
    v39[0] = *v19;
    v39[1] = v20;
    if (v17 <= v10)
    {
      __break(0xC471u);
      JUMPOUT(0x198D5BB24);
    }
    v21 = (_OWORD *)(v18 + 32 * v10);
    long long v22 = v21[1];
    v38[0] = *v21;
    v38[1] = v22;
    if (v17 <= v12)
    {
      __break(0xC471u);
      JUMPOUT(0x198D5BB2CLL);
    }
    v23 = (_OWORD *)(v18 + 32 * v12);
    long long v24 = v23[1];
    v37[0] = *v23;
    v37[1] = v24;
    if (v17 <= v14)
    {
LABEL_20:
      __break(0xC471u);
      JUMPOUT(0x198D5BB1CLL);
    }
    v25 = (CAShapeLayer *)v15;
    v26 = (_OWORD *)(v18 + 32 * v14);
    long long v27 = v26[1];
    v36[0] = *v26;
    v36[1] = v27;
    WebCore::cachedCGColor((uint64_t *)&cf, (WebCore *)((char *)a3 + 32), v16);
    [(CAShapeLayer *)v9 setFillColor:cf];
    CFTypeRef v29 = cf;
    CFTypeRef cf = 0;
    if (v29) {
      CFRelease(v29);
    }
    WebCore::cachedCGColor((uint64_t *)&cf, (WebCore *)((char *)a3 + 24), v28);
    [(CAShapeLayer *)v11 setFillColor:cf];
    CFTypeRef v31 = cf;
    CFTypeRef cf = 0;
    if (v31) {
      CFRelease(v31);
    }
    WebCore::cachedCGColor((uint64_t *)&cf, (WebCore *)((char *)a3 + 16), v30);
    [(CAShapeLayer *)v13 setFillColor:cf];
    CFTypeRef v33 = cf;
    CFTypeRef cf = 0;
    if (v33) {
      CFRelease(v33);
    }
    WebCore::cachedCGColor((uint64_t *)&cf, (WebCore *)a3, v32);
    [(CAShapeLayer *)v25 setFillColor:cf];
    CFTypeRef v34 = cf;
    CFTypeRef cf = 0;
    if (v34) {
      CFRelease(v34);
    }
    layerPathWithHole(v9, (const WebCore::FloatQuad *)v39, (const WebCore::FloatQuad *)v38);
    layerPathWithHole(v11, (const WebCore::FloatQuad *)v38, (const WebCore::FloatQuad *)v37);
    layerPathWithHole(v13, (const WebCore::FloatQuad *)v37, (const WebCore::FloatQuad *)v36);
    layerPath(v25, (const WebCore::FloatQuad *)v36);
  }
}

- (void)_layoutForNodeListHighlight:(const void *)a3
{
  unsigned int v3 = *((_DWORD *)a3 + 15);
  if (v3)
  {
    [(WKInspectorHighlightView *)self _createLayers:v3 & 0xFFFFFFFC];
    if (v3 >= 4)
    {
      uint64_t v6 = 0;
      unsigned int v7 = v3 >> 2;
      do
      {
        [(WKInspectorHighlightView *)self _layoutForNodeHighlight:a3 offset:v6];
        uint64_t v6 = (v6 + 4);
        --v7;
      }
      while (v7);
    }
  }
}

- (void)_layoutForRectsHighlight:(const void *)a3
{
  uint64_t v3 = *((unsigned int *)a3 + 15);
  if (v3)
  {
    [(WKInspectorHighlightView *)self _createLayers:*((unsigned int *)a3 + 15)];
    WebCore::cachedCGColor((uint64_t *)&cf, (WebCore *)a3, v6);
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    uint64_t v9 = 32 * v3;
    do
    {
      uint64_t v10 = (CAShapeLayer *)[self->_layers.m_ptr objectAtIndex:v8];
      [(CAShapeLayer *)v10 setFillColor:cf];
      if (v8 >= *((unsigned int *)a3 + 15))
      {
        __break(0xC471u);
        return;
      }
      layerPath(v10, (const WebCore::FloatQuad *)(*((void *)a3 + 6) + v7));
      ++v8;
      v7 += 32;
    }
    while (v9 != v7);
    CFTypeRef v11 = cf;
    CFTypeRef cf = 0;
    if (v11) {
      CFRelease(v11);
    }
  }
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  CGRect v31 = a3;
  v30.receiver = self;
  v30.super_class = (Class)WKInspectorHighlightView;
  -[WKInspectorHighlightView drawRect:](&v30, sel_drawRect_);
  p_highlight = &self->_highlight;
  if (self->_highlight.__engaged_)
  {
    UIGraphicsGetCurrentContext();
    WebCore::GraphicsContextCG::GraphicsContextCG();
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v24, &v31);
    WebCore::GraphicsContextCG::clip((WebCore::GraphicsContextCG *)v32, &v24);
    [(WKInspectorHighlightView *)self frame];
    double v6 = v5;
    [(WKInspectorHighlightView *)self frame];
    float v7 = v6;
    *(float *)&double v8 = v8;
    WebCore::GraphicsContextCG::translate((WebCore::GraphicsContextCG *)v32, -v7, -*(float *)&v8);
    if (!self->_highlight.__engaged_) {
      goto LABEL_20;
    }
    uint64_t m_size = self->_highlight.var0.__val_.gridHighlightOverlays.m_size;
    if (m_size)
    {
      m_buffer = self->_highlight.var0.__val_.gridHighlightOverlays.m_buffer;
      uint64_t v11 = 72 * m_size;
      do
      {
        WebCore::InspectorOverlayHighlight::GridHighlightOverlay::GridHighlightOverlay((WebCore::InspectorOverlayHighlight::GridHighlightOverlay *)&v24, (const Color *)m_buffer);
        WebCore::InspectorOverlay::drawGridOverlay((WebCore::InspectorOverlay *)v32, (WebCore::GraphicsContext *)&v24, v12);
        WTF::Vector<WebCore::InspectorOverlayLabel,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v29, v13);
        WTF::Vector<WebCore::TextRecognitionBlockData,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v28, v14);
        v16 = v26;
        if (v26)
        {
          v26 = 0;
          int v27 = 0;
          WTF::fastFree(v16, v15);
        }
        unsigned int v17 = (WTF *)v24.m_size;
        if (v24.m_size)
        {
          v24.uint64_t m_size = 0;
          int v25 = 0;
          WTF::fastFree(v17, v15);
        }
        if ((*(void *)&v24.m_location & 0x8000000000000) != 0)
        {
          uint64_t v18 = (unsigned int *)(*(void *)&v24.m_location & 0xFFFFFFFFFFFFLL);
          if (atomic_fetch_add((atomic_uint *volatile)(*(void *)&v24.m_location & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
          {
            atomic_store(1u, v18);
            WTF::fastFree((WTF *)v18, v15);
          }
        }
        m_buffer = (GridHighlightOverlay *)((char *)m_buffer + 72);
        v11 -= 72;
      }
      while (v11);
      if (!p_highlight->__engaged_) {
LABEL_20:
      }
        __break(1u);
    }
    uint64_t v19 = p_highlight->var0.__val_.flexHighlightOverlays.m_size;
    if (v19)
    {
      long long v20 = p_highlight->var0.__val_.flexHighlightOverlays.m_buffer;
      uint64_t v21 = 136 * v19;
      do
      {
        WebCore::InspectorOverlayHighlight::FlexHighlightOverlay::FlexHighlightOverlay((WebCore::InspectorOverlayHighlight::FlexHighlightOverlay *)&v24, v20);
        WebCore::InspectorOverlay::drawFlexOverlay((WebCore::InspectorOverlay *)v32, (WebCore::GraphicsContext *)&v24, v22);
        WebCore::InspectorOverlayHighlight::FlexHighlightOverlay::~FlexHighlightOverlay((WebCore::InspectorOverlayHighlight::FlexHighlightOverlay *)&v24, v23);
        long long v20 = (const FlexHighlightOverlay *)((char *)v20 + 136);
        v21 -= 136;
      }
      while (v21);
    }
    WebCore::GraphicsContextCG::~GraphicsContextCG((WebCore::GraphicsContextCG *)v32);
  }
}

- (void)update:(const void *)a3 scale:(double)a4 frame:(const FloatRect *)a5
{
  [(WKInspectorHighlightView *)self _removeAllLayers];
  v73 = self;
  p_highlight = &self->_highlight;
  if (!p_highlight->__engaged_)
  {
    WebCore::Color::Color((WebCore::Color *)p_highlight, (const Color *)a3);
    WebCore::Color::Color((WebCore::Color *)&p_highlight->var0.__val_.contentOutlineColor, (const Color *)a3 + 1);
    WebCore::Color::Color((WebCore::Color *)&p_highlight->var0.__val_.paddingColor, (const Color *)a3 + 2);
    WebCore::Color::Color((WebCore::Color *)&p_highlight->var0.__val_.borderColor, (const Color *)a3 + 3);
    WebCore::Color::Color((WebCore::Color *)&p_highlight->var0.__val_.marginColor, (const Color *)a3 + 4);
    p_highlight->var0.__val_.type = *((unsigned char *)a3 + 40);
    WTF::Vector<WebCore::PlatformTimeRanges::Range,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)&p_highlight->var0.__val_.quads, (uint64_t)a3 + 48);
    uint64_t v13 = *((unsigned int *)a3 + 19);
    p_highlight->var0.__val_.gridHighlightOverlays.m_buffer = 0;
    *(void *)&p_highlight->var0.__val_.gridHighlightOverlays.m_capacity = 0;
    p_highlight->var0.__val_.gridHighlightOverlays.unsigned int m_size = v13;
    if (v13)
    {
      if (v13 >= 0x38E38E4) {
        goto LABEL_78;
      }
      unsigned int v14 = 72 * v13;
      uint64_t v15 = (WebCore::InspectorOverlayHighlight::GridHighlightOverlay *)WTF::fastMalloc((WTF *)(72 * v13));
      p_highlight->var0.__val_.gridHighlightOverlays.m_capacity = v14 / 0x48;
      p_highlight->var0.__val_.gridHighlightOverlays.m_buffer = (GridHighlightOverlay *)v15;
      uint64_t v16 = *((unsigned int *)a3 + 19);
      if (v16)
      {
        unsigned int v17 = (const Color *)*((void *)a3 + 8);
        uint64_t v18 = 72 * v16;
        do
        {
          uint64_t v15 = (WebCore::InspectorOverlayHighlight::GridHighlightOverlay *)((char *)WebCore::InspectorOverlayHighlight::GridHighlightOverlay::GridHighlightOverlay(v15, v17)+ 72);
          v17 += 9;
          v18 -= 72;
        }
        while (v18);
      }
    }
    uint64_t v19 = *((unsigned int *)a3 + 23);
    p_highlight->var0.__val_.flexHighlightOverlays.m_buffer = 0;
    *(void *)&p_highlight->var0.__val_.flexHighlightOverlays.m_capacity = 0;
    p_highlight->var0.__val_.flexHighlightOverlays.unsigned int m_size = v19;
    if (!v19)
    {
LABEL_15:
      p_highlight->var0.__val_.usePageCoordinates = *((unsigned char *)a3 + 96);
      p_highlight->__engaged_ = 1;
      goto LABEL_71;
    }
    if (v19 < 0x1E1E1E2)
    {
      unsigned int v20 = 136 * v19;
      uint64_t v21 = (WebCore::InspectorOverlayHighlight::FlexHighlightOverlay *)WTF::fastMalloc((WTF *)(136 * v19));
      p_highlight->var0.__val_.flexHighlightOverlays.m_capacity = v20 / 0x88;
      p_highlight->var0.__val_.flexHighlightOverlays.m_buffer = (FlexHighlightOverlay *)v21;
      uint64_t v22 = *((unsigned int *)a3 + 23);
      if (v22)
      {
        v23 = (const FlexHighlightOverlay *)*((void *)a3 + 10);
        uint64_t v24 = 136 * v22;
        do
        {
          uint64_t v21 = (WebCore::InspectorOverlayHighlight::FlexHighlightOverlay *)((char *)WebCore::InspectorOverlayHighlight::FlexHighlightOverlay::FlexHighlightOverlay(v21, v23)+ 136);
          v23 = (const FlexHighlightOverlay *)((char *)v23 + 136);
          v24 -= 136;
        }
        while (v24);
      }
      goto LABEL_15;
    }
LABEL_78:
    __break(0xC471u);
    JUMPOUT(0x198D5CBACLL);
  }
  WebCore::Color::operator=();
  WebCore::Color::operator=();
  WebCore::Color::operator=();
  WebCore::Color::operator=();
  WebCore::Color::operator=();
  p_highlight->var0.__val_.type = *((unsigned char *)a3 + 40);
  WTF::Vector<WebCore::PlatformTimeRanges::Range,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((uint64_t)&p_highlight->var0.__val_.quads, (uint64_t)a3 + 48);
  if (p_highlight != a3)
  {
    p_gridHighlightOverlays = &p_highlight->var0.__val_.gridHighlightOverlays;
    unsigned int m_size = p_highlight->var0.__val_.gridHighlightOverlays.m_size;
    unsigned int v12 = *((_DWORD *)a3 + 19);
    if (m_size <= v12)
    {
      if (v12 > p_highlight->var0.__val_.gridHighlightOverlays.m_capacity)
      {
        WTF::Vector<WebCore::InspectorOverlayHighlight::GridHighlightOverlay,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((unsigned int *)&p_highlight->var0.__val_.gridHighlightOverlays, 0);
        WTF::Vector<WebCore::InspectorOverlayHighlight::GridHighlightOverlay,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>((uint64_t)&p_highlight->var0.__val_.gridHighlightOverlays, *((unsigned int *)a3 + 19));
        unsigned int m_size = p_highlight->var0.__val_.gridHighlightOverlays.m_size;
      }
    }
    else
    {
      WTF::VectorDestructor<true,WebCore::InspectorOverlayHighlight::GridHighlightOverlay>::destruct((WTF *)((char *)p_highlight->var0.__val_.gridHighlightOverlays.m_buffer + 72 * v12), (WTF *)((char *)p_highlight->var0.__val_.gridHighlightOverlays.m_buffer + 72 * m_size));
      p_highlight->var0.__val_.gridHighlightOverlays.unsigned int m_size = v12;
      unsigned int m_size = v12;
    }
    uint64_t v25 = *((void *)a3 + 8);
    if (m_size)
    {
      uint64_t v26 = v25 + 72 * m_size;
      m_buffer = p_gridHighlightOverlays->m_buffer;
      do
      {
        WebCore::Color::operator=();
        if ((GridHighlightOverlay *)v25 != m_buffer)
        {
          unint64_t v28 = *((unsigned int *)m_buffer + 5);
          unint64_t v29 = *(unsigned int *)(v25 + 20);
          if (v28 <= v29)
          {
            if (v29 > *((unsigned int *)m_buffer + 4))
            {
              WTF::Vector<WebCore::FloatLine,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((uint64_t)m_buffer + 8, 0);
              WTF::Vector<WebCore::FloatLine,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>((uint64_t)m_buffer + 8, *(unsigned int *)(v25 + 20));
              unint64_t v28 = *((unsigned int *)m_buffer + 5);
            }
          }
          else
          {
            *((_DWORD *)m_buffer + 5) = v29;
            unint64_t v28 = v29;
          }
          if (v28)
          {
            memmove(*((void **)m_buffer + 1), *(const void **)(v25 + 8), 20 * v28);
            unint64_t v28 = *((unsigned int *)m_buffer + 5);
          }
          uint64_t v30 = *(unsigned int *)(v25 + 20);
          if (v28 != v30)
          {
            uint64_t v31 = 5 * v28;
            uint64_t v32 = *((void *)m_buffer + 1) + 20 * v28;
            uint64_t v33 = *(void *)(v25 + 8) + 4 * v31;
            uint64_t v34 = 20 * v30 - 4 * v31;
            do
            {
              long long v35 = *(_OWORD *)v33;
              *(_DWORD *)(v32 + 16) = *(_DWORD *)(v33 + 16);
              *(_OWORD *)uint64_t v32 = v35;
              v32 += 20;
              v33 += 20;
              v34 -= 20;
            }
            while (v34);
            LODWORD(v28) = *(_DWORD *)(v25 + 20);
          }
          *((_DWORD *)m_buffer + 5) = v28;
          WTF::Vector<WebCore::PlatformTimeRanges::Range,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((uint64_t)m_buffer + 24, v25 + 24);
          v36 = (uint64_t *)((char *)m_buffer + 40);
          unint64_t v37 = *((unsigned int *)m_buffer + 13);
          unint64_t v38 = *(unsigned int *)(v25 + 52);
          if (v37 <= v38)
          {
            if (v38 > *((unsigned int *)m_buffer + 12))
            {
              WTF::Vector<WebCore::InspectorOverlayHighlight::GridHighlightOverlay::Area,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((unsigned int *)m_buffer + 10, 0);
              WTF::Vector<WebCore::TextRecognitionBlockData,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>((uint64_t)m_buffer + 40, *(unsigned int *)(v25 + 52));
              unint64_t v37 = *((unsigned int *)m_buffer + 13);
            }
          }
          else
          {
            WTF::VectorDestructor<true,WebCore::TextRecognitionBlockData>::destruct((WTF::StringImpl *)(*((void *)m_buffer + 5) + 40 * v38), (WTF::StringImpl *)(*((void *)m_buffer + 5) + 40 * v37));
            *((_DWORD *)m_buffer + 13) = v38;
            unint64_t v37 = v38;
          }
          uint64_t v39 = *(void *)(v25 + 40);
          if (v37)
          {
            uint64_t v40 = v39 + 40 * v37;
            uint64_t v41 = *v36;
            do
            {
              WTF::String::operator=((uint64_t *)v41, (WTF::StringImpl **)v39);
              long long v42 = *(_OWORD *)(v39 + 24);
              *(_OWORD *)(v41 + 8) = *(_OWORD *)(v39 + 8);
              *(_OWORD *)(v41 + 24) = v42;
              v39 += 40;
              v41 += 40;
            }
            while (v39 != v40);
            uint64_t v39 = *(void *)(v25 + 40);
            uint64_t v43 = *((unsigned int *)m_buffer + 13);
          }
          else
          {
            uint64_t v43 = 0;
          }
          uint64_t v44 = *(unsigned int *)(v25 + 52);
          if (v43 != v44)
          {
            uint64_t v45 = v39 + 40 * v44;
            uint64_t v46 = 5 * v43;
            uint64_t v47 = *v36 + 40 * v43;
            uint64_t v48 = v39 + 8 * v46;
            do
            {
              v49 = *(_DWORD **)v48;
              if (*(void *)v48) {
                *v49 += 2;
              }
              *(void *)uint64_t v47 = v49;
              long long v50 = *(_OWORD *)(v48 + 8);
              *(_OWORD *)(v47 + 24) = *(_OWORD *)(v48 + 24);
              *(_OWORD *)(v47 + 8) = v50;
              v48 += 40;
              v47 += 40;
            }
            while (v48 != v45);
            LODWORD(v43) = *(_DWORD *)(v25 + 52);
          }
          *((_DWORD *)m_buffer + 13) = v43;
        }
        WTF::Vector<WebCore::InspectorOverlayLabel,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((unsigned int *)m_buffer + 14, (unsigned int *)(v25 + 56));
        v25 += 72;
        m_buffer = (GridHighlightOverlay *)((char *)m_buffer + 72);
      }
      while (v25 != v26);
      uint64_t v25 = *((void *)a3 + 8);
      unsigned int m_size = p_highlight->var0.__val_.gridHighlightOverlays.m_size;
      p_gridHighlightOverlays = &p_highlight->var0.__val_.gridHighlightOverlays;
    }
    unsigned int v51 = *((_DWORD *)a3 + 19);
    if (m_size != v51)
    {
      v52 = (WebCore::InspectorOverlayHighlight::GridHighlightOverlay *)((char *)p_gridHighlightOverlays->m_buffer
                                                                       + 72 * m_size);
      v53 = (const Color *)(v25 + 72 * m_size);
      uint64_t v54 = 72 * v51 - 72 * m_size;
      do
      {
        v52 = (WebCore::InspectorOverlayHighlight::GridHighlightOverlay *)((char *)WebCore::InspectorOverlayHighlight::GridHighlightOverlay::GridHighlightOverlay(v52, v53)+ 72);
        v53 += 9;
        v54 -= 72;
      }
      while (v54);
      unsigned int m_size = *((_DWORD *)a3 + 19);
    }
    p_highlight->var0.__val_.gridHighlightOverlays.unsigned int m_size = m_size;
    p_flexHighlightOverlays = &p_highlight->var0.__val_.flexHighlightOverlays;
    unsigned int v56 = p_highlight->var0.__val_.flexHighlightOverlays.m_size;
    uint64_t v57 = *((unsigned int *)a3 + 23);
    if (v56 <= v57)
    {
      BOOL v61 = v57 > p_highlight->var0.__val_.flexHighlightOverlays.m_capacity;
      LODWORD(v57) = p_highlight->var0.__val_.flexHighlightOverlays.m_size;
      if (v61)
      {
        WTF::Vector<WebCore::InspectorOverlayHighlight::FlexHighlightOverlay,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((uint64_t)&p_highlight->var0.__val_.flexHighlightOverlays, 0);
        WTF::Vector<WebCore::InspectorOverlayHighlight::FlexHighlightOverlay,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>((uint64_t)&p_highlight->var0.__val_.flexHighlightOverlays, *((unsigned int *)a3 + 23));
        LODWORD(v57) = p_highlight->var0.__val_.flexHighlightOverlays.m_size;
      }
    }
    else
    {
      v58 = (WebCore::InspectorOverlayHighlight::FlexHighlightOverlay *)((char *)p_flexHighlightOverlays->m_buffer
                                                                       + 136 * v57);
      uint64_t v59 = 136 * v56 - 136 * v57;
      do
      {
        WebCore::InspectorOverlayHighlight::FlexHighlightOverlay::~FlexHighlightOverlay(v58, v9);
        v58 = (WebCore::InspectorOverlayHighlight::FlexHighlightOverlay *)(v60 + 136);
        v59 -= 136;
      }
      while (v59);
      p_highlight->var0.__val_.flexHighlightOverlays.unsigned int m_size = v57;
    }
    uint64_t v62 = *((void *)a3 + 10);
    if (v57)
    {
      uint64_t v63 = v62 + 136 * v57;
      v64 = p_flexHighlightOverlays->m_buffer;
      do
      {
        WebCore::Color::operator=();
        long long v65 = *(_OWORD *)(v62 + 24);
        *(_OWORD *)((char *)v64 + 8) = *(_OWORD *)(v62 + 8);
        *(_OWORD *)((char *)v64 + 24) = v65;
        WTF::Vector<WebCore::PlatformTimeRanges::Range,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((uint64_t)v64 + 40, v62 + 40);
        WTF::Vector<WebCore::PlatformTimeRanges::Range,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((uint64_t)v64 + 56, v62 + 56);
        WTF::Vector<WebCore::PlatformTimeRanges::Range,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((uint64_t)v64 + 72, v62 + 72);
        WTF::Vector<WebCore::PlatformTimeRanges::Range,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((uint64_t)v64 + 88, v62 + 88);
        WTF::Vector<WebCore::PlatformTimeRanges::Range,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((uint64_t)v64 + 104, v62 + 104);
        WTF::Vector<WebCore::InspectorOverlayLabel,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((unsigned int *)v64 + 30, (unsigned int *)(v62 + 120));
        v62 += 136;
        v64 = (FlexHighlightOverlay *)((char *)v64 + 136);
      }
      while (v62 != v63);
      uint64_t v62 = *((void *)a3 + 10);
      unsigned int v66 = p_highlight->var0.__val_.flexHighlightOverlays.m_size;
    }
    else
    {
      unsigned int v66 = 0;
    }
    unsigned int v67 = *((_DWORD *)a3 + 23);
    if (v66 != v67)
    {
      v68 = (WebCore::InspectorOverlayHighlight::FlexHighlightOverlay *)((char *)p_flexHighlightOverlays->m_buffer
                                                                       + 136 * v66);
      v69 = (const FlexHighlightOverlay *)(v62 + 136 * v66);
      uint64_t v70 = 136 * v67 - 136 * v66;
      do
      {
        v68 = (WebCore::InspectorOverlayHighlight::FlexHighlightOverlay *)((char *)WebCore::InspectorOverlayHighlight::FlexHighlightOverlay::FlexHighlightOverlay(v68, v69)+ 136);
        v69 = (const FlexHighlightOverlay *)((char *)v69 + 136);
        v70 -= 136;
      }
      while (v70);
      unsigned int v66 = *((_DWORD *)a3 + 23);
    }
    p_highlight->var0.__val_.flexHighlightOverlays.unsigned int m_size = v66;
  }
  p_highlight->var0.__val_.usePageCoordinates = *((unsigned char *)a3 + 96);
LABEL_71:
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen"), "scale");
  [(WKInspectorHighlightView *)v73 setContentScaleFactor:v71 * a4];
  WebCore::FloatRect::operator CGRect();
  -[WKInspectorHighlightView setFrame:](v73, "setFrame:");
  int v72 = *((unsigned __int8 *)a3 + 40);
  if ((v72 - 1) >= 2)
  {
    if (v72 == 3) {
      [(WKInspectorHighlightView *)v73 _layoutForRectsHighlight:a3];
    }
  }
  else
  {
    [(WKInspectorHighlightView *)v73 _layoutForNodeListHighlight:a3];
  }

  [(WKInspectorHighlightView *)v73 setNeedsDisplay];
}

- (void).cxx_destruct
{
  p_highlight = &self->_highlight;
  if (p_highlight->__engaged_) {
    WebCore::InspectorOverlayHighlight::~InspectorOverlayHighlight((WebCore::InspectorOverlayHighlight *)p_highlight, (void *)a2);
  }
  m_ptr = self->_layers.m_ptr;
  self->_layers.m_ptr = 0;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 51) = 0;
  *((unsigned char *)self + 416) = 0;
  *((unsigned char *)self + 520) = 0;
  return self;
}

@end