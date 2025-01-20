@interface MUPlaceCoverPhotoTransitionController
- (BOOL)hideLogo;
- (BOOL)shouldBlurChromeHeaderButtons;
- (MUPlaceCoverPhotoTransitionController)initWithMetrics:(MUPlaceHeaderMetrics *)a3 updateHandler:(id)a4;
- (double)_logoImageAlphaForVerticalDrag;
- (double)coverPhotoAlpha;
- (double)coverPhotoHeightForProposedWidth:(double)a3;
- (double)expansionProgress;
- (double)interpolatedCoverPhotoToTitleSpacing;
- (double)logoImageAlpha;
- (int64_t)currentScrollDirection;
- (void)_updateWithOldProgress:(double)a3;
- (void)setExpansionProgress:(double)a3;
@end

@implementation MUPlaceCoverPhotoTransitionController

- (MUPlaceCoverPhotoTransitionController)initWithMetrics:(MUPlaceHeaderMetrics *)a3 updateHandler:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MUPlaceCoverPhotoTransitionController;
  v7 = [(MUPlaceCoverPhotoTransitionController *)&v15 init];
  v8 = (MUPlaceCoverPhotoTransitionController *)v7;
  if (v7)
  {
    *(_OWORD *)(v7 + 8) = *(_OWORD *)&a3->topToTitleSpacing;
    long long v9 = *(_OWORD *)&a3->coverPhotoMetrics.hasLogo;
    long long v10 = *(_OWORD *)&a3->coverPhotoMetrics.logoSize.height;
    long long v11 = *(_OWORD *)&a3->coverPhotoMetrics.coverPhotoContainerToTitleSpacing;
    *((void *)v7 + 9) = *(void *)&a3->coverPhotoMetrics.endingLogoAlphaTransitionValue;
    *(_OWORD *)(v7 + 56) = v11;
    *(_OWORD *)(v7 + 40) = v10;
    *(_OWORD *)(v7 + 24) = v9;
    v12 = _Block_copy(v6);
    id updateHandler = v8->_updateHandler;
    v8->_id updateHandler = v12;
  }
  return v8;
}

- (void)setExpansionProgress:(double)a3
{
  double v3 = fmin(fmax(a3, 0.0), 1.0);
  if (self->_expansionProgress != v3)
  {
    self->_expansionProgress = v3;
    -[MUPlaceCoverPhotoTransitionController _updateWithOldProgress:](self, "_updateWithOldProgress:");
  }
}

- (BOOL)hideLogo
{
  return self->_expansionProgress == 0.0;
}

- (double)coverPhotoAlpha
{
  return self->_expansionProgress;
}

- (double)coverPhotoHeightForProposedWidth:(double)a3
{
  if (self->_metrics.coverPhotoMetrics.hasLogo) {
    double coverPhotoBottomToLogoBottomSpacing = self->_metrics.coverPhotoMetrics.coverPhotoBottomToLogoBottomSpacing;
  }
  else {
    double coverPhotoBottomToLogoBottomSpacing = 0.0;
  }
  double v4 = coverPhotoBottomToLogoBottomSpacing + self->_metrics.coverPhotoMetrics.aspectRatio * a3;
  [(MUPlaceCoverPhotoTransitionController *)self expansionProgress];
  return v4 * v5;
}

- (void)_updateWithOldProgress:(double)a3
{
  double expansionProgress = self->_expansionProgress;
  if (expansionProgress <= a3)
  {
    if (expansionProgress >= a3) {
      goto LABEL_6;
    }
    int64_t v5 = 2;
  }
  else
  {
    int64_t v5 = 1;
  }
  self->_currentScrollDirection = v5;
LABEL_6:
  id updateHandler = (void (**)(id, MUPlaceCoverPhotoTransitionController *))self->_updateHandler;
  if (updateHandler) {
    updateHandler[2](updateHandler, self);
  }
}

- (double)logoImageAlpha
{
  if ((unint64_t)(self->_currentScrollDirection - 1) > 1) {
    return 0.0;
  }
  [(MUPlaceCoverPhotoTransitionController *)self _logoImageAlphaForVerticalDrag];
  return result;
}

- (double)_logoImageAlphaForVerticalDrag
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(MUPlaceCoverPhotoTransitionController *)self expansionProgress];
  double v4 = v3;
  double startingLogoAlphaTransitionValue = self->_metrics.coverPhotoMetrics.startingLogoAlphaTransitionValue;
  double v6 = 0.0;
  if (v4 >= startingLogoAlphaTransitionValue)
  {
    double endingLogoAlphaTransitionValue = self->_metrics.coverPhotoMetrics.endingLogoAlphaTransitionValue;
    double v6 = 1.0;
    if (v4 <= endingLogoAlphaTransitionValue)
    {
      double v8 = v4 - startingLogoAlphaTransitionValue;
      double v9 = endingLogoAlphaTransitionValue - startingLogoAlphaTransitionValue;
      if (qword_1EB4F70D8 != -1)
      {
        double v12 = v9;
        dispatch_once(&qword_1EB4F70D8, &__block_literal_global_3);
        double v9 = v12;
      }
      long long v10 = _MergedGlobals_115;
      double v6 = v8 / v9;
      if (os_log_type_enabled((os_log_t)_MergedGlobals_115, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        double v14 = v4;
        __int16 v15 = 2048;
        double v16 = v6;
        _os_log_impl(&dword_1931EA000, v10, OS_LOG_TYPE_DEBUG, "Progress for logo transition is %f and evaluated alpha is %f", buf, 0x16u);
      }
    }
  }
  return v6;
}

- (double)interpolatedCoverPhotoToTitleSpacing
{
  double topToTitleSpacing = self->_metrics.topToTitleSpacing;
  if (!self->_metrics.coverPhotoMetrics.hasLogo) {
    return self->_metrics.topToTitleSpacing;
  }
  [(MUPlaceCoverPhotoTransitionController *)self expansionProgress];
  return topToTitleSpacing - v4 * self->_metrics.coverPhotoMetrics.coverPhotoContainerToTitleSpacing;
}

- (BOOL)shouldBlurChromeHeaderButtons
{
  return self->_expansionProgress > 0.3;
}

- (int64_t)currentScrollDirection
{
  return self->_currentScrollDirection;
}

- (double)expansionProgress
{
  return self->_expansionProgress;
}

- (void).cxx_destruct
{
}

@end