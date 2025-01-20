@interface RCChronologicalAnnotationView
- ($F24F406B2B787EFB06265DBA3D28CBD5)markerClippingRange;
- ($F24F406B2B787EFB06265DBA3D28CBD5)visibleTimeRange;
- (BOOL)isPlayback;
- (BOOL)shouldOnlyRenderOnScreenTimeLabels;
- (CGSize)labelsSize;
- (RCChronologicalAnnotationView)initWithFrame:(CGRect)a3;
- (UIColor)backgroundDebugColor;
- (double)contentDuration;
- (double)timeLabelsMajorInterval;
- (id)_timeLabelAttributes;
- (id)_timeLabelAttributesWithFont:(id)a3;
- (id)description;
- (int64_t)tickMarksForMajorInterval:(double)a3;
- (unint64_t)debugID;
- (void)drawRect:(CGRect)a3;
- (void)setBackgroundDebugColor:(id)a3;
- (void)setContentDuration:(double)a3;
- (void)setDebugID:(unint64_t)a3;
- (void)setIsPlayback:(BOOL)a3;
- (void)setMarkerClippingRange:(id)a3;
- (void)setShouldOnlyRenderOnScreenTimeLabels:(BOOL)a3;
- (void)setVisibleTimeRange:(id)a3;
@end

@implementation RCChronologicalAnnotationView

- (RCChronologicalAnnotationView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RCChronologicalAnnotationView;
  v3 = -[RCChronologicalAnnotationView initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (RCChronologicalAnnotationView *)v3;
  if (v3)
  {
    *(_OWORD *)(v3 + 56) = RCTimeRangeZero;
    v5 = +[RCRecorderStyleProvider sharedStyleProvider];
    uint64_t v6 = [v5 timeLineLabelFont];
    timeLabelFont = v4->_timeLabelFont;
    v4->_timeLabelFont = (UIFont *)v6;

    v8 = [(RCChronologicalAnnotationView *)v4 layer];
    [v8 removeAllAnimations];
  }
  return v4;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)RCChronologicalAnnotationView;
  v3 = [(RCChronologicalAnnotationView *)&v8 description];
  v4 = NSStringFromRCTimeRange(self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime);
  [(RCChronologicalAnnotationView *)self timeLabelsMajorInterval];
  v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  uint64_t v6 = +[NSString stringWithFormat:@"%@: visibleTimeRange = %@, self.timeLabelsMajorInterval = %@", v3, v4, v5];

  return v6;
}

- (void)setVisibleTimeRange:(id)a3
{
  self->_visibleTimeRange = ($93AB83F55FD8EAABF5C634313E89AB95)a3;
  id v7 = +[RCRecorderStyleProvider sharedStyleProvider];
  v4 = [(RCChronologicalAnnotationView *)self traitCollection];
  id v5 = [v4 isUserInterfaceStyleDark];

  uint64_t v6 = [v7 timelinePlaybackBackgroundColor:v5];
  [(RCChronologicalAnnotationView *)self setBackgroundColor:v6];

  [(RCChronologicalAnnotationView *)self setNeedsDisplay];
}

- (void)setContentDuration:(double)a3
{
  if (self->_contentDuration != a3) {
    self->_contentDuration = a3;
  }
}

- (void)setMarkerClippingRange:(id)a3
{
  self->_markerClippingRange = ($93AB83F55FD8EAABF5C634313E89AB95)a3;
  [(RCChronologicalAnnotationView *)self setNeedsDisplay];
}

- (void)setBackgroundDebugColor:(id)a3
{
}

- (CGSize)labelsSize
{
  v3 = RCLocalizedDurationWithStyle(1, 0.0);
  v4 = [(RCChronologicalAnnotationView *)self _timeLabelAttributes];
  [v3 sizeWithAttributes:v4];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (double)timeLabelsMajorInterval
{
  [(RCChronologicalAnnotationView *)self frame];
  double v4 = 100.0
     / (v3
      / RCTimeRangeDeltaWithExactPrecision(self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime));
  if (v4 >= 1.0)
  {
    double v7 = 60.0;
    if (v4 < 60.0)
    {
      double v7 = 30.0;
      if (v4 < 30.0)
      {
        double v7 = 15.0;
        if (v4 < 9.0)
        {
          double v7 = 5.0;
          if (v4 < 2.0)
          {
            double v7 = v4;
            if (v4 >= 1.0) {
              return 1.0;
            }
          }
        }
      }
    }
    return v7;
  }
  else
  {
    double v5 = round(log2(v4));
    return exp2(v5);
  }
}

- (int64_t)tickMarksForMajorInterval:(double)a3
{
  if (a3 == 60.0 || a3 == 1.0) {
    return 4;
  }
  else {
    return 5;
  }
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = [(RCChronologicalAnnotationView *)self superview];
  unsigned __int8 v9 = [v8 isHidden];

  if ((v9 & 1) == 0)
  {
    p_visibleTimeRange = &self->_visibleTimeRange;
    double v11 = RCTimeRangeDeltaWithExactPrecision(self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime);
    if (v11 >= 2.22044605e-16)
    {
      double v12 = RCTimeRangeIntersectTimeRange(self->_markerClippingRange.beginTime, self->_markerClippingRange.endTime, p_visibleTimeRange->beginTime, self->_visibleTimeRange.endTime);
      if (!RCTimeRangeEqualToTimeRange(1.79769313e308, -1.79769313e308, v12, v13))
      {
        [(RCChronologicalAnnotationView *)self timeLabelsMajorInterval];
        double v15 = v14;
        uint64_t v16 = -[RCChronologicalAnnotationView tickMarksForMajorInterval:](self, "tickMarksForMajorInterval:");
        p_info = &OBJC_METACLASS___RCTextLayer.info;
        id v82 = +[RCRecorderStyleProvider sharedStyleProvider];
        v18 = [(RCChronologicalAnnotationView *)self traitCollection];
        id v19 = [v18 isUserInterfaceStyleDark];

        unsigned __int8 v79 = +[UIApplication shouldMakeUIForDefaultPNG];
        v85.origin.CGFloat x = x;
        v85.origin.CGFloat y = y;
        v85.size.CGFloat width = width;
        v85.size.CGFloat height = height;
        double v80 = CGRectGetWidth(v85);
        [v82 timeLineTickWidth];
        double v74 = v11 / v15;
        double v76 = v15;
        double v20 = v11 / v15 * (double)v16;
        double v21 = v15 / (double)v16;
        CGFloat v23 = v22;
        double beginTime = p_visibleTimeRange->beginTime;
        __y[0] = 0.0;
        double v25 = modf(fabs(beginTime / v21), __y);
        if (beginTime < 0.0)
        {
          double v26 = -__y[0];
        }
        else
        {
          double v25 = -v25;
          double v26 = __y[0];
        }
        v78 = [(RCChronologicalAnnotationView *)self _timeLabelAttributes];
        CurrentContext = UIGraphicsGetCurrentContext();
        v86.origin.CGFloat x = x;
        v86.origin.CGFloat y = y;
        v86.size.CGFloat width = width;
        v86.size.CGFloat height = height;
        CGContextClearRect(CurrentContext, v86);
        CGContextSetLineWidth(CurrentContext, v23);
        id v28 = [v82 timelinePlaybackBackgroundColor:v19];
        CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v28 CGColor]);

        v87.origin.CGFloat x = x;
        double v29 = v21;
        v87.origin.CGFloat y = y;
        v87.size.CGFloat width = width;
        v87.size.CGFloat height = height;
        CGContextFillRect(CurrentContext, v87);
        uint64_t v30 = (uint64_t)(v20 + 1.0);
        if (v30 >= -1)
        {
          uint64_t v31 = 0;
          double v32 = v80 / v20;
          double v70 = v80 / v74;
          double v71 = v23 + v23;
          uint64_t v33 = (uint64_t)v26;
          double v34 = v23 * 0.5;
          double v81 = v80 / v20 * v68;
          uint64_t v35 = v30 + 2;
          uint64_t v36 = v33 - 1;
          double v69 = 1.0 / v76;
          double v72 = v23 * 0.5;
          double v73 = v23;
          double v77 = v32;
          do
          {
            double v37 = v29 * (double)(v36 + v31);
            if (v37 >= -0.0001 && v37 >= self->_markerClippingRange.beginTime + -0.0001)
            {
              if (v37 >= self->_markerClippingRange.endTime + -0.0001) {
                break;
              }
              double v39 = v81 + v32 * (double)(v31 - 1);
              double v40 = RCRoundCoord(v39 - v34);
              if ((v36 + v31) % v16)
              {
                v41 = [v82 timeLineMinorPlaybackMarkerColor];
                [v82 timeLineMinorTickHeight];
                CGFloat v43 = v42;
                id v44 = v41;
                CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v44 CGColor]);
                v88.origin.CGFloat y = 0.0;
                v88.origin.CGFloat x = v40;
                v88.size.CGFloat width = v23;
                v88.size.CGFloat height = v43;
                CGContextFillRect(CurrentContext, v88);
              }
              else
              {
                v45 = [v82 timeLineMajorPlaybackMarkerColor];
                v46 = [p_info + 71 sharedStyleProvider];
                [v46 timeLineMajorTickHeight];
                CGFloat v48 = v47;

                id v44 = v45;
                CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v44 CGColor]);
                v89.origin.CGFloat y = 0.0;
                v89.origin.CGFloat x = v40;
                v89.size.CGFloat width = v23;
                v89.size.CGFloat height = v48;
                CGContextFillRect(CurrentContext, v89);
                char v49 = v79;
                if (v37 < 0.0) {
                  char v49 = 1;
                }
                if ((v49 & 1) == 0)
                {
                  double v50 = RCRoundCoord(v39 - v71);
                  v51 = [p_info + 71 sharedStyleProvider];
                  [v51 timeLineMajorTickHeight];
                  double v53 = v52;

                  v54 = [(RCChronologicalAnnotationView *)self window];
                  double v75 = v50;
                  -[RCChronologicalAnnotationView convertRect:toView:](self, "convertRect:toView:", v54, v50, v53, v70, 1.0);
                  double v55 = v29;
                  CGFloat v57 = v56;
                  CGFloat v59 = v58;
                  CGFloat v61 = v60;
                  CGFloat v63 = v62;
                  [v54 bounds];
                  v91.origin.CGFloat x = v57;
                  double v29 = v55;
                  v91.origin.CGFloat y = v59;
                  v91.size.CGFloat width = v61;
                  v91.size.CGFloat height = v63;
                  BOOL v64 = CGRectIntersectsRect(v90, v91);
                  if (![(RCChronologicalAnnotationView *)self shouldOnlyRenderOnScreenTimeLabels]|| [(RCChronologicalAnnotationView *)self shouldOnlyRenderOnScreenTimeLabels]&& v64)
                  {
                    float v65 = v69 * fabs(v37);
                    double v66 = floorf(v65) / v69;
                    if (v76 < 1.0) {
                      RCLocalizedPlaybackTimeWithMinimumComponents(2uLL, v66, v66);
                    }
                    else {
                    v67 = RCLocalizedDurationWithStyle(1, v66);
                    }
                    objc_msgSend(v67, "drawAtPoint:withAttributes:", v78, v75, v53, *(void *)&v69);
                  }
                  p_info = (__objc2_class_ro **)(&OBJC_METACLASS___RCTextLayer + 32);
                  double v34 = v72;
                  CGFloat v23 = v73;
                }
                double v32 = v77;
              }
            }
            ++v31;
          }
          while (v35 != v31);
        }
      }
    }
  }
}

- (id)_timeLabelAttributesWithFont:(id)a3
{
  id v3 = a3;
  double v4 = +[RCRecorderStyleProvider sharedStyleProvider];
  double v5 = [v4 timelinePlaybackTimeColor];
  double v6 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v3, NSFontAttributeName, v5, NSForegroundColorAttributeName, 0);

  return v6;
}

- (id)_timeLabelAttributes
{
  return [(RCChronologicalAnnotationView *)self _timeLabelAttributesWithFont:self->_timeLabelFont];
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)visibleTimeRange
{
  double beginTime = self->_visibleTimeRange.beginTime;
  double endTime = self->_visibleTimeRange.endTime;
  result.var1 = endTime;
  result.var0 = beginTime;
  return result;
}

- (double)contentDuration
{
  return self->_contentDuration;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)markerClippingRange
{
  double beginTime = self->_markerClippingRange.beginTime;
  double endTime = self->_markerClippingRange.endTime;
  result.var1 = endTime;
  result.var0 = beginTime;
  return result;
}

- (BOOL)isPlayback
{
  return self->_isPlayback;
}

- (void)setIsPlayback:(BOOL)a3
{
  self->_isPlayback = a3;
}

- (BOOL)shouldOnlyRenderOnScreenTimeLabels
{
  return self->_shouldOnlyRenderOnScreenTimeLabels;
}

- (void)setShouldOnlyRenderOnScreenTimeLabels:(BOOL)a3
{
  self->_shouldOnlyRenderOnScreenTimeLabels = a3;
}

- (UIColor)backgroundDebugColor
{
  return self->_backgroundDebugColor;
}

- (unint64_t)debugID
{
  return self->_debugID;
}

- (void)setDebugID:(unint64_t)a3
{
  self->_debugID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundDebugColor, 0);

  objc_storeStrong((id *)&self->_timeLabelFont, 0);
}

@end