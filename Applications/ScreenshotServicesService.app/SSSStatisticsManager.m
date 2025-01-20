@interface SSSStatisticsManager
+ (id)sharedStatisticsManager;
- (BOOL)_statisticsEnabled;
- (id)_triggerTypeForPresentationMode:(unint64_t)a3;
- (void)_sendEvent:(id)a3 block:(id)a4;
- (void)didAccidentallyDraw;
- (void)didChangeOpacityOnFullPage;
- (void)didChangeOpacityOnNormalScreenshot;
- (void)didCopyDeleteScreenshots;
- (void)didCropInFullPageMode;
- (void)didCropInNormalMode;
- (void)didDeleteScreenshots;
- (void)didRenameScreenshot;
- (void)didSaveFullPagePDFToFiles;
- (void)didSaveImageToFiles;
- (void)didSaveImageToPhotos;
- (void)didSaveImageToQuickNote;
- (void)didSaveMixedAllToFiles;
- (void)didSaveMixedToPhotosAndFiles;
- (void)didSaveMixedToQuickNoteAndFiles;
- (void)didSavePDFImageToPhotos;
- (void)didShareFullPageMixedScreenshots;
- (void)didShareFullPageScreenshotAsAutomaticImage;
- (void)didShareFullPageScreenshotAsAutomaticPDF;
- (void)didShareFullPageScreenshotAsImage;
- (void)didShareFullPageScreenshotAsPDF;
- (void)didShareScreenMultipleScreenshots;
- (void)didShareScreenSingleScreenshots;
- (void)didSubmitFeedbackWithAnnotationCount:(unint64_t)a3;
- (void)didTapBetaFeedbackButton;
- (void)didTapFullPageSegment;
- (void)drewStrokes:(unint64_t)a3;
- (void)fullscreenExperienceHadCropEvent;
- (void)logTotalAnnotations:(unint64_t)a3;
- (void)pipDragEndedSuccessfully;
- (void)pipExpanded;
- (void)pipSlidOffscreenDueToTimeout;
- (void)screenshotGestureTriggered:(unint64_t)a3;
- (void)screenshotGestureTriggeredWhileAnotherScreenshotWasShowing:(unint64_t)a3;
@end

@implementation SSSStatisticsManager

+ (id)sharedStatisticsManager
{
  if (qword_1000B57A8 != -1) {
    dispatch_once(&qword_1000B57A8, &stru_10009A4B0);
  }
  v2 = (void *)qword_1000B57A0;

  return v2;
}

- (BOOL)_statisticsEnabled
{
  return 1;
}

- (void)screenshotGestureTriggered:(unint64_t)a3
{
  [(SSSStatisticsManager *)self _triggerTypeForPresentationMode:a3];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100032294;
  v5[3] = &unk_10009A4D8;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v6;
  [(SSSStatisticsManager *)self _sendEvent:@"triggered" block:v5];
}

- (void)screenshotGestureTriggeredWhileAnotherScreenshotWasShowing:(unint64_t)a3
{
  [(SSSStatisticsManager *)self _triggerTypeForPresentationMode:a3];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000323CC;
  v5[3] = &unk_10009A4D8;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v6;
  [(SSSStatisticsManager *)self _sendEvent:@"triggered" block:v5];
}

- (id)_triggerTypeForPresentationMode:(unint64_t)a3
{
  CFStringRef v3 = @"keychord";
  if (a3 == 1) {
    CFStringRef v3 = @"keyboard";
  }
  if (a3 == 2) {
    return @"pencil";
  }
  else {
    return (id)v3;
  }
}

- (void)pipSlidOffscreenDueToTimeout
{
}

- (void)pipDragEndedSuccessfully
{
}

- (void)pipExpanded
{
}

- (void)fullscreenExperienceHadCropEvent
{
}

- (void)didCropInNormalMode
{
}

- (void)didCropInFullPageMode
{
}

- (void)didAccidentallyDraw
{
}

- (void)drewStrokes:(unint64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003294C;
  v3[3] = &unk_10009A5F8;
  v3[4] = a3;
  [(SSSStatisticsManager *)self _sendEvent:@"edit" block:v3];
}

- (void)logTotalAnnotations:(unint64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100032A74;
  v3[3] = &unk_10009A5F8;
  v3[4] = a3;
  [(SSSStatisticsManager *)self _sendEvent:@"edit" block:v3];
}

- (void)didTapBetaFeedbackButton
{
}

- (void)didSubmitFeedbackWithAnnotationCount:(unint64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100032C3C;
  v3[3] = &unk_10009A5F8;
  v3[4] = a3;
  [(SSSStatisticsManager *)self _sendEvent:@"beta_feedback_submitted" block:v3];
}

- (void)didTapFullPageSegment
{
}

- (void)didChangeOpacityOnNormalScreenshot
{
}

- (void)didChangeOpacityOnFullPage
{
}

- (void)didShareScreenSingleScreenshots
{
}

- (void)didShareScreenMultipleScreenshots
{
}

- (void)didShareFullPageMixedScreenshots
{
}

- (void)didShareFullPageScreenshotAsAutomaticImage
{
}

- (void)didShareFullPageScreenshotAsAutomaticPDF
{
}

- (void)didShareFullPageScreenshotAsImage
{
}

- (void)didShareFullPageScreenshotAsPDF
{
}

- (void)didRenameScreenshot
{
}

- (void)didSaveImageToPhotos
{
}

- (void)didSaveImageToFiles
{
}

- (void)didSaveImageToQuickNote
{
}

- (void)didSavePDFImageToPhotos
{
}

- (void)didSaveFullPagePDFToFiles
{
}

- (void)didSaveMixedToPhotosAndFiles
{
}

- (void)didSaveMixedToQuickNoteAndFiles
{
}

- (void)didSaveMixedAllToFiles
{
}

- (void)didDeleteScreenshots
{
}

- (void)didCopyDeleteScreenshots
{
}

- (void)_sendEvent:(id)a3 block:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([(SSSStatisticsManager *)self _statisticsEnabled])
  {
    v7 = +[NSString stringWithFormat:@"com.apple.screenshotservices.%@", v8];
    AnalyticsSendEventLazy();
  }
}

@end