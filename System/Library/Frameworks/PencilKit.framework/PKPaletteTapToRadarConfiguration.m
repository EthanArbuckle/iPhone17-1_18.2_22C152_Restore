@interface PKPaletteTapToRadarConfiguration
- (BOOL)hasContent;
- (PKTextInputDebugSharpenerLog)debugSharpenerLog;
- (UIViewController)presentationViewController;
- (void)setDebugSharpenerLog:(id)a3;
- (void)setPresentationViewController:(id)a3;
@end

@implementation PKPaletteTapToRadarConfiguration

- (BOOL)hasContent
{
  v2 = [(PKPaletteTapToRadarConfiguration *)self debugSharpenerLog];
  char v3 = [v2 hasContent];

  return v3;
}

- (PKTextInputDebugSharpenerLog)debugSharpenerLog
{
  return self->_debugSharpenerLog;
}

- (void)setDebugSharpenerLog:(id)a3
{
}

- (UIViewController)presentationViewController
{
  return self->_presentationViewController;
}

- (void)setPresentationViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationViewController, 0);

  objc_storeStrong((id *)&self->_debugSharpenerLog, 0);
}

@end