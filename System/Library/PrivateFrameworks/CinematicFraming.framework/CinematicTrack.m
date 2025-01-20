@interface CinematicTrack
- (BOOL)isTrackedByDirector;
- (CGRect)afterImageBoundingBoxAtTime:(id *)a3;
- (CGRect)boundingBoxForFraming;
- (CGRect)faceBoundingBoxForFramingAtTime:(id *)a3;
- (CinematicTrack)initWithObservation:(id)a3 identifier:(int64_t)a4 options:(id)a5 atTime:(id *)a6;
- (void)resetProperties;
- (void)setAfterImage:(CGRect)a3 forDuration:(float)a4 atTime:(id *)a5;
- (void)setBoundingBoxForFraming:(CGRect)a3;
- (void)setIsTrackedByDirector:(BOOL)a3;
- (void)updatePropertiesWithTimestamp:(id *)a3 inView:(CGRect)a4;
@end

@implementation CinematicTrack

- (CinematicTrack)initWithObservation:(id)a3 identifier:(int64_t)a4 options:(id)a5 atTime:(id *)a6
{
  v12.receiver = self;
  v12.super_class = (Class)CinematicTrack;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a6;
  v6 = [(BaseTrack *)&v12 initWithObservation:a3 identifier:a4 type:0 atTime:&v11];
  v7 = (CinematicTrack *)v6;
  if (v6)
  {
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)(v6 + 184) = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(v6 + 200) = v8;
    v9 = v6;
  }

  return v7;
}

- (void)updatePropertiesWithTimestamp:(id *)a3 inView:(CGRect)a4
{
  [(BaseTrack *)self lastObservationBounds];
  self->_boundingBoxForFraming.origin.x = v5;
  self->_boundingBoxForFraming.origin.y = v6;
  self->_boundingBoxForFraming.size.width = v7;
  self->_boundingBoxForFraming.size.height = v8;
}

- (void)setAfterImage:(CGRect)a3 forDuration:(float)a4 atTime:(id *)a5
{
  self->_afterImageBoundingBox = a3;
  p_afterImageExpirationTimestamp = &self->_afterImageExpirationTimestamp;
  CMTimeMake(&rhs, (uint64_t)(float)(a4 * 1000000.0), 1000000);
  CMTime v7 = *(CMTime *)a5;
  CMTimeAdd(&v9, &v7, &rhs);
  *(CMTime *)p_afterImageExpirationTimestamp = v9;
}

- (CGRect)afterImageBoundingBoxAtTime:(id *)a3
{
  p_afterImageExpirationTimestamp = &self->_afterImageExpirationTimestamp;
  CMTime time1 = (CMTime)self->_afterImageExpirationTimestamp;
  $95D729B680665BEAEFA1D6FCA8238556 v11 = *($95D729B680665BEAEFA1D6FCA8238556 *)*(void *)&MEMORY[0x1E4F1F9F8];
  if (CMTimeCompare(&time1, (CMTime *)&v11)
    && (time1 = (CMTime)*a3, $95D729B680665BEAEFA1D6FCA8238556 v11 = *p_afterImageExpirationTimestamp, CMTimeCompare(&time1, (CMTime *)&v11) < 0))
  {
    p_afterImageBoundingBodouble x = &self->_afterImageBoundingBox;
  }
  else
  {
    p_afterImageBoundingBodouble x = (CGRect *)MEMORY[0x1E4F1DB20];
  }
  double width = p_afterImageBoundingBox->size.width;
  double height = p_afterImageBoundingBox->size.height;
  double x = p_afterImageBoundingBox->origin.x;
  double y = p_afterImageBoundingBox->origin.y;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)resetProperties
{
  self->_afterImageExpirationTimestamp = *($95D729B680665BEAEFA1D6FCA8238556 *)*(void *)&MEMORY[0x1E4F1F9F8];
}

- (CGRect)faceBoundingBoxForFramingAtTime:(id *)a3
{
  v4 = [(BaseTrack *)self pairTrack];

  if (v4)
  {
    CGFloat v5 = [(BaseTrack *)self pairTrack];
    [v5 lastObservationBounds];
    CGFloat v7 = v6;
    CGFloat rect = v6;
    CGFloat rect_8 = v8;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    [(BaseTrack *)self lastObservationBounds];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    v68.origin.double x = v7;
    v68.origin.CGFloat y = v9;
    v68.size.double width = v11;
    v68.size.double height = v13;
    double MinX = CGRectGetMinX(v68);
    v69.origin.double x = v15;
    v69.origin.CGFloat y = v17;
    v69.size.double width = v19;
    v69.size.double height = v21;
    double v23 = MinX - CGRectGetMinX(v69);
    v70.origin.double x = v15;
    v70.origin.CGFloat y = v17;
    v70.size.double width = v19;
    v70.size.double height = v21;
    CGFloat v61 = v23 / CGRectGetWidth(v70);
    v71.origin.CGFloat y = rect_8;
    v71.origin.double x = rect;
    v71.size.double width = v11;
    v71.size.double height = v13;
    double MinY = CGRectGetMinY(v71);
    v72.origin.double x = v15;
    v72.origin.CGFloat y = v17;
    v72.size.double width = v19;
    v72.size.double height = v21;
    double v25 = MinY - CGRectGetMinY(v72);
    v73.origin.double x = v15;
    v73.origin.CGFloat y = v17;
    v73.size.double width = v19;
    v73.size.double height = v21;
    CGFloat v60 = v25 / CGRectGetHeight(v73);
    v74.origin.double x = rect;
    v74.origin.CGFloat y = rect_8;
    v74.size.double width = v11;
    v74.size.double height = v13;
    double Width = CGRectGetWidth(v74);
    v75.origin.double x = v15;
    v75.origin.CGFloat y = v17;
    v75.size.double width = v19;
    v75.size.double height = v21;
    double v58 = Width / CGRectGetWidth(v75);
    v76.origin.double x = rect;
    v76.origin.CGFloat y = rect_8;
    v76.size.double width = v11;
    v76.size.double height = v13;
    double Height = CGRectGetHeight(v76);
    v77.origin.double x = v15;
    v77.origin.CGFloat y = v17;
    v77.size.double width = v19;
    v77.size.double height = v21;
    CGFloat v28 = CGRectGetHeight(v77);
    self->_lastMeasuredFaceBoundingBox.origin.double x = v61;
    self->_lastMeasuredFaceBoundingBox.origin.CGFloat y = v60;
    self->_lastMeasuredFaceBoundingBox.size.double width = v58;
    self->_lastMeasuredFaceBoundingBox.size.double height = Height / v28;
  }
  p_lastMeasuredFaceBoundingBodouble x = &self->_lastMeasuredFaceBoundingBox;
  BOOL v30 = CGRectEqualToRect(self->_lastMeasuredFaceBoundingBox, *MEMORY[0x1E4F1DB20]);
  [(CinematicTrack *)self boundingBoxForFraming];
  CGFloat v35 = v33;
  if (v30)
  {
    float v36 = v33 / 3.0;
    double v37 = v36;
    [(CinematicTrack *)self boundingBoxForFraming];
    double v38 = v37;
    if (v39 <= v37)
    {
      [(CinematicTrack *)self boundingBoxForFraming];
      float v41 = v40;
      double v38 = v41;
    }
    [(CinematicTrack *)self boundingBoxForFraming];
    double v42 = CGRectGetMidX(v78) + v37 * -0.5;
    [(CinematicTrack *)self boundingBoxForFraming];
    double v43 = CGRectGetMinY(v79);
  }
  else
  {
    CGFloat v44 = v31;
    CGFloat v45 = v32;
    CGFloat v46 = v34;
    v80.origin.double x = p_lastMeasuredFaceBoundingBox->origin.x;
    CGFloat y = self->_lastMeasuredFaceBoundingBox.origin.y;
    CGFloat rect_8a = p_lastMeasuredFaceBoundingBox->origin.x;
    v80.size.double width = self->_lastMeasuredFaceBoundingBox.size.width;
    CGFloat v48 = self->_lastMeasuredFaceBoundingBox.size.height;
    CGFloat v59 = v80.size.width;
    v80.origin.CGFloat y = y;
    v80.size.double height = v48;
    double v49 = CGRectGetMinX(v80);
    v81.origin.double x = v44;
    v81.origin.CGFloat y = v45;
    v81.size.double width = v35;
    v81.size.double height = v46;
    double v50 = CGRectGetWidth(v81);
    v82.origin.double x = v44;
    v82.origin.CGFloat y = v45;
    v82.size.double width = v35;
    v82.size.double height = v46;
    CGFloat recta = CGRectGetMinX(v82) + v49 * v50;
    v83.origin.double x = rect_8a;
    v83.origin.CGFloat y = y;
    v83.size.double width = v59;
    v83.size.double height = v48;
    double v62 = CGRectGetMinY(v83);
    v84.origin.double x = v44;
    v84.origin.CGFloat y = v45;
    v84.size.double width = v35;
    v84.size.double height = v46;
    double v51 = CGRectGetHeight(v84);
    v85.origin.double x = v44;
    v85.origin.CGFloat y = v45;
    v85.size.double width = v35;
    v85.size.double height = v46;
    CGFloat v63 = CGRectGetMinY(v85) + v62 * v51;
    v86.origin.double x = rect_8a;
    v86.origin.CGFloat y = y;
    v86.size.double width = v59;
    v86.size.double height = v48;
    double v52 = CGRectGetWidth(v86);
    v87.origin.double x = v44;
    v87.origin.CGFloat y = v45;
    v87.size.double width = v35;
    v87.size.double height = v46;
    double v37 = v52 * CGRectGetWidth(v87);
    v88.origin.double x = rect_8a;
    v88.origin.CGFloat y = y;
    v88.size.double width = v59;
    v88.size.double height = v48;
    double v53 = CGRectGetHeight(v88);
    v89.origin.double x = v44;
    double v42 = recta;
    v89.origin.CGFloat y = v45;
    v89.size.double width = v35;
    v89.size.double height = v46;
    CGFloat v54 = CGRectGetHeight(v89);
    double v43 = v63;
    double v38 = v53 * v54;
  }
  double v55 = v42;
  double v56 = v37;
  double v57 = v38;
  result.size.double height = v57;
  result.size.double width = v56;
  result.origin.CGFloat y = v43;
  result.origin.double x = v55;
  return result;
}

- (BOOL)isTrackedByDirector
{
  return self->isTrackedByDirector;
}

- (void)setIsTrackedByDirector:(BOOL)a3
{
  self->isTrackedByDirector = a3;
}

- (CGRect)boundingBoxForFraming
{
  double x = self->_boundingBoxForFraming.origin.x;
  double y = self->_boundingBoxForFraming.origin.y;
  double width = self->_boundingBoxForFraming.size.width;
  double height = self->_boundingBoxForFraming.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBoundingBoxForFraming:(CGRect)a3
{
  self->_boundingBoxForFraming = a3;
}

@end