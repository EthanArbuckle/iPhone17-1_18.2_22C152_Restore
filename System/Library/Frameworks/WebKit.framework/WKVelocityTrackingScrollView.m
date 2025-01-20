@interface WKVelocityTrackingScrollView
- (CGSize)interactiveScrollVelocityInPointsPerSecond;
- (id).cxx_construct;
- (void)updateInteractiveScrollVelocity;
@end

@implementation WKVelocityTrackingScrollView

- (void)updateInteractiveScrollVelocity
{
  if (([(WKVelocityTrackingScrollView *)self isTracking] & 1) != 0
    || [(WKVelocityTrackingScrollView *)self isDecelerating])
  {
    p_scrollingDeltaWindow = &self->_scrollingDeltaWindow;
    v4 = (WTF::ApproximateTime *)[(WKVelocityTrackingScrollView *)self contentOffset];
    double v6 = v5;
    double v8 = v7;
    WTF::ApproximateTime::now(v4);
    double v10 = v9 - self->_scrollingDeltaWindow.m_lastTimestamp.m_value;
    if (v10 <= 0.1)
    {
      unint64_t m_lastIndex = self->_scrollingDeltaWindow.m_lastIndex;
      if (m_lastIndex >= 3)
      {
        __break(1u);
        return;
      }
      double v15 = v8 - self->_scrollingDeltaWindow.m_lastOffset.y;
      p_width = &p_scrollingDeltaWindow->m_deltas.__elems_[m_lastIndex].first.width;
      double *p_width = v6 - self->_scrollingDeltaWindow.m_lastOffset.x;
      p_width[1] = v15;
      p_width[2] = v10;
      if (m_lastIndex == 2) {
        unint64_t v17 = 0;
      }
      else {
        unint64_t v17 = m_lastIndex + 1;
      }
      self->_scrollingDeltaWindow.unint64_t m_lastIndex = v17;
    }
    else
    {
      uint64_t v11 = 0;
      v12 = (_OWORD *)MEMORY[0x1E4F1DB30];
      do
      {
        v13 = (char *)p_scrollingDeltaWindow + v11;
        *(_OWORD *)v13 = *v12;
        *((void *)v13 + 2) = 0;
        v11 += 24;
      }
      while (v11 != 72);
    }
    self->_scrollingDeltaWindow.m_lastTimestamp.m_value = v9;
    self->_scrollingDeltaWindow.m_lastOffset.x = v6;
    self->_scrollingDeltaWindow.m_lastOffset.y = v8;
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 2104) = 0u;
  *(_OWORD *)((char *)self + 2120) = 0u;
  *(_OWORD *)((char *)self + 2136) = 0u;
  *(_OWORD *)((char *)self + 2152) = 0u;
  *(_OWORD *)((char *)self + 2168) = 0u;
  *((void *)self + 273) = 0;
  *((_OWORD *)self + 137) = *MEMORY[0x1E4F1DAD8];
  return self;
}

- (CGSize)interactiveScrollVelocityInPointsPerSecond
{
  p_scrollingDeltaWindow = &self->_scrollingDeltaWindow;
  WTF::ApproximateTime::now((WTF::ApproximateTime *)self);
  double v4 = v3 - p_scrollingDeltaWindow->m_lastTimestamp.m_value;
  float64x2_t v5 = *(float64x2_t *)MEMORY[0x1E4F1DB30];
  if (v4 <= 0.1)
  {
    uint64_t v6 = 0;
    double v7 = 0.0;
    float64x2_t v8 = *(float64x2_t *)MEMORY[0x1E4F1DB30];
    do
    {
      uint64_t v9 = *(uint64_t *)&p_scrollingDeltaWindow->m_deltas.__elems_[v6].second.m_value;
      if (*(double *)&v9 != 0.0)
      {
        float64x2_t v8 = vaddq_f64(v8, vdivq_f64((float64x2_t)p_scrollingDeltaWindow->m_deltas.__elems_[v6].first, (float64x2_t)vdupq_lane_s64(v9, 0)));
        double v7 = v7 + 1.0;
      }
      ++v6;
    }
    while (v6 != 3);
    if (v7 != 0.0) {
      float64x2_t v5 = vdivq_f64(v8, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v7, 0));
    }
  }
  double v10 = v5.f64[1];
  result.width = v5.f64[0];
  result.height = v10;
  return result;
}

@end