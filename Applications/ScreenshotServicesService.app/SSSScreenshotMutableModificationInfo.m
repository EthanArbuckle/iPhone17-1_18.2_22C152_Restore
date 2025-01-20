@interface SSSScreenshotMutableModificationInfo
- (SSSScreenshotMutableModificationInfoChangeObserver)changeObserver;
- (void)setAnnotationNSDatas:(id)a3;
- (void)setChangeObserver:(id)a3;
- (void)setCropInfo:(SSSCropInfo *)a3;
- (void)setImageDescription:(id)a3;
- (void)setOriginalAnnotations:(id)a3;
- (void)setPaperKitChangeCounter:(unint64_t)a3;
- (void)setVellumOpacity:(double)a3;
- (void)takeValueFromModificationInfo:(id)a3 forKey:(unint64_t)a4;
@end

@implementation SSSScreenshotMutableModificationInfo

- (void)setCropInfo:(SSSCropInfo *)a3
{
  CGSize totalSize = a3->totalSize;
  CGSize size = a3->currentRect.size;
  self->super._cropInfo.currentRect.origin = a3->currentRect.origin;
  self->super._cropInfo.currentRect.CGSize size = size;
  self->super._cropInfo.CGSize totalSize = totalSize;
  id v6 = [(SSSScreenshotMutableModificationInfo *)self changeObserver];
  [v6 screenshotMutableModificationInfo:self valueChangedForKey:0];
}

- (void)setAnnotationNSDatas:(id)a3
{
  objc_storeStrong((id *)&self->super._annotationNSDatas, a3);
  id v4 = [(SSSScreenshotMutableModificationInfo *)self changeObserver];
  [v4 screenshotMutableModificationInfo:self valueChangedForKey:1];
}

- (void)setOriginalAnnotations:(id)a3
{
}

- (void)setVellumOpacity:(double)a3
{
  self->super._vellumOpacity = a3;
  id v4 = [(SSSScreenshotMutableModificationInfo *)self changeObserver];
  [v4 screenshotMutableModificationInfo:self valueChangedForKey:3];
}

- (void)setImageDescription:(id)a3
{
  objc_storeStrong((id *)&self->super._imageDescription, a3);
  id v4 = [(SSSScreenshotMutableModificationInfo *)self changeObserver];
  [v4 screenshotMutableModificationInfo:self valueChangedForKey:4];
}

- (void)setPaperKitChangeCounter:(unint64_t)a3
{
  self->super._paperKitChangeCounter = a3;
  id v4 = [(SSSScreenshotMutableModificationInfo *)self changeObserver];
  [v4 screenshotMutableModificationInfo:self valueChangedForKey:2];
}

- (void)takeValueFromModificationInfo:(id)a3 forKey:(unint64_t)a4
{
  id v6 = a3;
  v7 = v6;
  switch(a4)
  {
    case 0uLL:
      if (v6) {
        [v6 cropInfo];
      }
      else {
        memset(v10, 0, sizeof(v10));
      }
      [(SSSScreenshotMutableModificationInfo *)self setCropInfo:v10];
      break;
    case 1uLL:
      v8 = [v6 annotationNSDatas];
      [(SSSScreenshotMutableModificationInfo *)self setAnnotationNSDatas:v8];

      v9 = [v7 originalAnnotations];
      [(SSSScreenshotMutableModificationInfo *)self setOriginalAnnotations:v9];
      goto LABEL_8;
    case 2uLL:
      -[SSSScreenshotMutableModificationInfo setPaperKitChangeCounter:](self, "setPaperKitChangeCounter:", [v6 paperKitChangeCounter]);
      break;
    case 3uLL:
      [v6 vellumOpacity];
      -[SSSScreenshotMutableModificationInfo setVellumOpacity:](self, "setVellumOpacity:");
      break;
    case 4uLL:
      v9 = [v6 imageDescription];
      [(SSSScreenshotMutableModificationInfo *)self setImageDescription:v9];
LABEL_8:

      break;
    default:
      break;
  }
}

- (SSSScreenshotMutableModificationInfoChangeObserver)changeObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);

  return (SSSScreenshotMutableModificationInfoChangeObserver *)WeakRetained;
}

- (void)setChangeObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end