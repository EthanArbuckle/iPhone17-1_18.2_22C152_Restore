@interface SCATModernMenuItem
+ (CGSize)imageSize;
+ (SCATModernMenuItem)itemWithIdentifier:(id)a3 delegate:(id)a4 title:(id)a5 imageName:(id)a6 activateBehavior:(unint64_t)a7;
+ (SCATModernMenuItem)itemWithIdentifier:(id)a3 delegate:(id)a4 title:(id)a5 imageName:(id)a6 activateBehavior:(unint64_t)a7 activateHandler:(id)a8 updateHandler:(id)a9;
+ (SCATModernMenuItem)itemWithIdentifier:(id)a3 delegate:(id)a4 title:(id)a5 imageName:(id)a6 activateBehavior:(unint64_t)a7 allowedWithGuidedAccess:(BOOL)a8 allowedWithAssistiveAccess:(BOOL)a9;
+ (SCATModernMenuItem)itemWithIdentifier:(id)a3 delegate:(id)a4 title:(id)a5 imageName:(id)a6 activateBehavior:(unint64_t)a7 allowedWithGuidedAccess:(BOOL)a8 allowedWithAssistiveAccess:(BOOL)a9 activateHandler:(id)a10 updateHandler:(id)a11;
+ (id)titleTextAttributes;
- (AXDispatchTimer)repeatItemWithDismissTimer;
- (AXNamedReplayableGesture)customGesture;
- (BOOL)allowsDwellScanningToAbortAfterTimeout;
- (BOOL)didActivate;
- (BOOL)handleActivateWithElement:(id)a3;
- (BOOL)isAllowedWithAssistiveAccess;
- (BOOL)isAllowedWithGuidedAccess;
- (BOOL)isDisabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldFlipForRTL;
- (BOOL)shouldSuppressAudioOutput;
- (BOOL)shouldUseActivityIndicator;
- (NSString)identifier;
- (NSString)imageName;
- (NSString)menuItemGroupName;
- (NSString)title;
- (SCATElement)scatElement;
- (SCATModernMenuItem)init;
- (SCATModernMenuItem)initWithIdentifier:(id)a3 delegate:(id)a4 title:(id)a5 imageName:(id)a6 activateBehavior:(unint64_t)a7 allowedWithGuidedAccess:(BOOL)a8 allowedWithAssistiveAccess:(BOOL)a9 activateHandler:(id)a10 updateHandler:(id)a11;
- (SCATModernMenuItemDelegate)delegate;
- (SCATSwitchTypingShortcut)customShortcut;
- (UIImage)image;
- (UIImage)resolvedImage;
- (double)iconImageAngle;
- (id)accessibilityLabel;
- (id)activateHandler;
- (id)description;
- (id)updateHandler;
- (unint64_t)activateBehavior;
- (unint64_t)style;
- (void)_updateVisuals;
- (void)activate;
- (void)flash;
- (void)resetActivation;
- (void)setActivateBehavior:(unint64_t)a3;
- (void)setActivateHandler:(id)a3;
- (void)setAllowsDwellScanningToAbortAfterTimeout:(BOOL)a3;
- (void)setCustomGesture:(id)a3;
- (void)setCustomShortcut:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidActivate:(BOOL)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setIconImageAngle:(double)a3;
- (void)setIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageName:(id)a3;
- (void)setMenuItemGroupName:(id)a3;
- (void)setRepeatItemWithDismissTimer:(id)a3;
- (void)setResolvedImage:(id)a3;
- (void)setScatElement:(id)a3;
- (void)setShouldFlipForRTL:(BOOL)a3;
- (void)setShouldSuppressAudioOutput:(BOOL)a3;
- (void)setShouldUseActivityIndicator:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setTitle:(id)a3;
- (void)setUpdateHandler:(id)a3;
- (void)updateItem;
@end

@implementation SCATModernMenuItem

+ (id)titleTextAttributes
{
  if (qword_1001F0C08 != -1) {
    dispatch_once(&qword_1001F0C08, &stru_1001AE4B8);
  }
  v2 = (void *)qword_1001F0C00;

  return v2;
}

+ (CGSize)imageSize
{
  v2 = +[UIScreen mainScreen];
  [v2 scale];
  double v4 = v3;

  double v5 = 60.0;
  if (v4 == 1.0) {
    double v5 = 59.0;
  }
  double v6 = v5;
  result.height = v6;
  result.width = v5;
  return result;
}

+ (SCATModernMenuItem)itemWithIdentifier:(id)a3 delegate:(id)a4 title:(id)a5 imageName:(id)a6 activateBehavior:(unint64_t)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  LOBYTE(v17) = 1;
  v15 = [(id)objc_opt_class() itemWithIdentifier:v14 delegate:v13 title:v12 imageName:v11 activateBehavior:a7 allowedWithGuidedAccess:1 allowedWithAssistiveAccess:v17];

  return (SCATModernMenuItem *)v15;
}

+ (SCATModernMenuItem)itemWithIdentifier:(id)a3 delegate:(id)a4 title:(id)a5 imageName:(id)a6 activateBehavior:(unint64_t)a7 allowedWithGuidedAccess:(BOOL)a8 allowedWithAssistiveAccess:(BOOL)a9
{
  BOOL v9 = a8;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  LOBYTE(v20) = a9;
  id v18 = [objc_alloc((Class)objc_opt_class()) initWithIdentifier:v17 delegate:v16 title:v15 imageName:v14 activateBehavior:a7 allowedWithGuidedAccess:v9 allowedWithAssistiveAccess:v20 activateHandler:0 updateHandler:0];

  return (SCATModernMenuItem *)v18;
}

+ (SCATModernMenuItem)itemWithIdentifier:(id)a3 delegate:(id)a4 title:(id)a5 imageName:(id)a6 activateBehavior:(unint64_t)a7 allowedWithGuidedAccess:(BOOL)a8 allowedWithAssistiveAccess:(BOOL)a9 activateHandler:(id)a10 updateHandler:(id)a11
{
  BOOL v11 = a8;
  id v17 = a11;
  id v18 = a10;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  LOBYTE(v25) = a9;
  id v23 = [objc_alloc((Class)objc_opt_class()) initWithIdentifier:v22 delegate:v21 title:v20 imageName:v19 activateBehavior:a7 allowedWithGuidedAccess:v11 allowedWithAssistiveAccess:v25 activateHandler:v18 updateHandler:v17];

  return (SCATModernMenuItem *)v23;
}

+ (SCATModernMenuItem)itemWithIdentifier:(id)a3 delegate:(id)a4 title:(id)a5 imageName:(id)a6 activateBehavior:(unint64_t)a7 activateHandler:(id)a8 updateHandler:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  LOBYTE(v23) = 1;
  id v21 = [(id)objc_opt_class() itemWithIdentifier:v20 delegate:v19 title:v18 imageName:v17 activateBehavior:a7 allowedWithGuidedAccess:1 allowedWithAssistiveAccess:v23 activateHandler:v16 updateHandler:v15];

  return (SCATModernMenuItem *)v21;
}

- (SCATModernMenuItem)init
{
  return 0;
}

- (SCATModernMenuItem)initWithIdentifier:(id)a3 delegate:(id)a4 title:(id)a5 imageName:(id)a6 activateBehavior:(unint64_t)a7 allowedWithGuidedAccess:(BOOL)a8 allowedWithAssistiveAccess:(BOOL)a9 activateHandler:(id)a10 updateHandler:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a10;
  id v22 = a11;
  v30.receiver = self;
  v30.super_class = (Class)SCATModernMenuItem;
  uint64_t v23 = [(SCATModernMenuItem *)&v30 init];
  v24 = v23;
  if (v23)
  {
    [(SCATModernMenuItem *)v23 setActivateHandler:v21];
    [(SCATModernMenuItem *)v24 setUpdateHandler:v22];
    [(SCATModernMenuItem *)v24 setIdentifier:v17];
    [(SCATModernMenuItem *)v24 setDelegate:v18];
    [(SCATModernMenuItem *)v24 setTitle:v19];
    if (v20)
    {
      [(SCATModernMenuItem *)v24 setImageName:v20];
    }
    else
    {
      +[NSString stringWithFormat:@"SCATIcon_%@", v17];
      unint64_t v29 = a7;
      v26 = BOOL v25 = a8;
      [(SCATModernMenuItem *)v24 setImageName:v26];

      a8 = v25;
      a7 = v29;
    }
    [(SCATModernMenuItem *)v24 setActivateBehavior:a7];
    v24->_allowedWithGuidedAccess = a8;
    v24->_allowedWithAssistiveAccess = a9;
    [(SCATModernMenuItem *)v24 setStyle:0];
    v27 = [[SCATMenuItemElement alloc] initWithMenuItem:v24];
    [(SCATModernMenuItem *)v24 setScatElement:v27];
  }
  return v24;
}

- (id)description
{
  double v3 = (objc_class *)objc_opt_class();
  double v4 = NSStringFromClass(v3);
  double v5 = [(SCATModernMenuItem *)self title];
  double v6 = +[NSNumber numberWithBool:self->_didActivate];
  v7 = +[NSString stringWithFormat:@"%@<%p>. title:%@ didActivate:%@", v4, self, v5, v6];

  return v7;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
  [(SCATModernMenuItem *)self _updateVisuals];
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    [(SCATModernMenuItem *)self setStyle:a3];
  }
}

- (void)setImage:(id)a3
{
  double v5 = (UIImage *)a3;
  p_image = &self->_image;
  if (self->_image != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_image, a3);
    p_image = (UIImage **)[(SCATModernMenuItem *)self _updateVisuals];
    double v5 = v7;
  }

  _objc_release_x1(p_image, v5);
}

- (void)setIconImageAngle:(double)a3
{
  if (self->_iconImageAngle != a3)
  {
    self->_iconImageAngle = a3;
    [(SCATModernMenuItem *)self _updateVisuals];
  }
}

- (void)resetActivation
{
}

- (void)updateItem
{
  double v4 = [(SCATModernMenuItem *)self updateHandler];
  if (v4
    && ([(SCATModernMenuItem *)self updateHandler],
        v2 = (unsigned int (**)(void, void))objc_claimAutoreleasedReturnValue(),
        ((unsigned int (**)(void, SCATModernMenuItem *))v2)[2](v2, self)))
  {
  }
  else
  {
    double v5 = [(SCATModernMenuItem *)self delegate];
    unsigned int v6 = [v5 shouldUpdateMenuItem:self];

    if (v4)
    {

      if ((v6 & 1) == 0) {
        return;
      }
    }
    else if (!v6)
    {
      return;
    }
  }

  [(SCATModernMenuItem *)self _updateVisuals];
}

- (UIImage)resolvedImage
{
  double v3 = [(SCATModernMenuItem *)self image];

  if (v3) {
    [(SCATModernMenuItem *)self image];
  }
  else {
  double v4 = sub_1000CC1D8(self);
  }

  return (UIImage *)v4;
}

- (BOOL)handleActivateWithElement:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SCATModernMenuItem *)self activateBehavior];
  unsigned int v6 = [(SCATModernMenuItem *)self didActivate];
  if (v6 && v5 - 5 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    _AXLogWithFacility();
  }
  else
  {
    [(SCATModernMenuItem *)self setDidActivate:1];
    v7 = +[SCATScannerManager sharedManager];
    [(SCATModernMenuItem *)self flash];
    switch([(SCATModernMenuItem *)self activateBehavior])
    {
      case 1uLL:
        [(SCATModernMenuItem *)self activate];
        v8 = [v7 menu];
        [v8 hideWithCompletion:0];

        goto LABEL_13;
      case 2uLL:
        [(SCATModernMenuItem *)self activate];
        [(SCATModernMenuItem *)self updateItem];
        goto LABEL_13;
      case 3uLL:
        [(SCATModernMenuItem *)self activate];
        [(SCATModernMenuItem *)self updateItem];
        BOOL v9 = [v7 menu];
        v10 = +[SCATFocusContext focusContextWithElement:v4 elementManager:v9 selectBehavior:0 options:0];
        [v7 beginScanningWithFocusContext:v10];

        goto LABEL_12;
      case 4uLL:
        [(SCATModernMenuItem *)self activate];
        [(SCATModernMenuItem *)self updateItem];
        BOOL v11 = [v7 menu];
        BOOL v9 = +[SCATFocusContext focusContextWithElement:v4 elementManager:v11 selectBehavior:0 options:0];

        id v12 = +[SCATScannerManager sharedManager];
        [v12 beginScanningWithFocusContext:v9];

        [(AXDispatchTimer *)self->_repeatItemWithDismissTimer cancel];
        repeatItemWithDismissTimer = self->_repeatItemWithDismissTimer;
        if (!repeatItemWithDismissTimer)
        {
          id v14 = (AXDispatchTimer *)[objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
          id v15 = self->_repeatItemWithDismissTimer;
          self->_repeatItemWithDismissTimer = v14;

          repeatItemWithDismissTimer = self->_repeatItemWithDismissTimer;
        }
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_1000CC6D8;
        v20[3] = &unk_1001AAA90;
        id v21 = v7;
        [(AXDispatchTimer *)repeatItemWithDismissTimer afterDelay:v20 processBlock:0.5];

        goto LABEL_12;
      default:
        BOOL v9 = [v7 menu];
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_1000CC720;
        v19[3] = &unk_1001AAA90;
        v19[4] = self;
        [v9 hideWithCompletion:v19];
LABEL_12:

LABEL_13:
        break;
    }
  }
  char v16 = v6 ^ 1;
  if (v5 == 3) {
    char v16 = 1;
  }
  if (v5 == 4) {
    BOOL v17 = 1;
  }
  else {
    BOOL v17 = v16;
  }

  return v17;
}

- (void)activate
{
  double v3 = [(SCATModernMenuItem *)self activateHandler];

  if (v3)
  {
    unsigned int v6 = [(SCATModernMenuItem *)self activateHandler];
    id v4 = [(SCATModernMenuItem *)self delegate];
    unint64_t v5 = [v4 menu];
    v6[2](v6, v5);
  }
  else
  {
    unsigned int v6 = [(SCATModernMenuItem *)self delegate];
    [v6 menuItemWasActivated:self];
  }
}

- (void)flash
{
  id v5 = [(SCATModernMenuItem *)self delegate];
  double v3 = [v5 menu];
  id v4 = [v3 menuVisualProvider];
  [v4 flashModernMenuItem:self];
}

- (id)accessibilityLabel
{
  double v3 = [(SCATModernMenuItem *)self accessibilityUserDefinedLabel];
  if (!v3)
  {
    double v3 = [(SCATModernMenuItem *)self title];
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SCATModernMenuItem;
  if ([(SCATModernMenuItem *)&v12 isEqual:v4])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    id v6 = v4;
    v7 = [(SCATModernMenuItem *)self identifier];
    v8 = [v6 identifier];
    if ([v7 isEqualToString:v8])
    {
      BOOL v9 = [(SCATModernMenuItem *)self title];
      v10 = [v6 title];
      unsigned __int8 v5 = [v9 isEqualToString:v10];
    }
    else
    {
      unsigned __int8 v5 = 0;
    }
  }
  return v5;
}

- (void)_updateVisuals
{
  id v5 = [(SCATModernMenuItem *)self delegate];
  double v3 = [v5 menu];
  id v4 = [v3 menuVisualProvider];
  [v4 updateModernMenuItem:self];
}

- (SCATModernMenuItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SCATModernMenuItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)shouldUseActivityIndicator
{
  return self->_shouldUseActivityIndicator;
}

- (void)setShouldUseActivityIndicator:(BOOL)a3
{
  self->_shouldUseActivityIndicator = a3;
}

- (BOOL)shouldSuppressAudioOutput
{
  return self->_shouldSuppressAudioOutput;
}

- (void)setShouldSuppressAudioOutput:(BOOL)a3
{
  self->_shouldSuppressAudioOutput = a3;
}

- (unint64_t)style
{
  return self->_style;
}

- (unint64_t)activateBehavior
{
  return self->_activateBehavior;
}

- (void)setActivateBehavior:(unint64_t)a3
{
  self->_activateBehavior = a3;
}

- (BOOL)isAllowedWithGuidedAccess
{
  return self->_allowedWithGuidedAccess;
}

- (BOOL)isAllowedWithAssistiveAccess
{
  return self->_allowedWithAssistiveAccess;
}

- (BOOL)shouldFlipForRTL
{
  return self->_shouldFlipForRTL;
}

- (void)setShouldFlipForRTL:(BOOL)a3
{
  self->_shouldFlipForRTL = a3;
}

- (void)setResolvedImage:(id)a3
{
}

- (double)iconImageAngle
{
  return self->_iconImageAngle;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (SCATElement)scatElement
{
  return self->_scatElement;
}

- (void)setScatElement:(id)a3
{
}

- (AXNamedReplayableGesture)customGesture
{
  return self->_customGesture;
}

- (void)setCustomGesture:(id)a3
{
}

- (SCATSwitchTypingShortcut)customShortcut
{
  return self->_customShortcut;
}

- (void)setCustomShortcut:(id)a3
{
}

- (BOOL)allowsDwellScanningToAbortAfterTimeout
{
  return self->_allowsDwellScanningToAbortAfterTimeout;
}

- (void)setAllowsDwellScanningToAbortAfterTimeout:(BOOL)a3
{
  self->_allowsDwellScanningToAbortAfterTimeout = a3;
}

- (NSString)menuItemGroupName
{
  return self->_menuItemGroupName;
}

- (void)setMenuItemGroupName:(id)a3
{
}

- (AXDispatchTimer)repeatItemWithDismissTimer
{
  return self->_repeatItemWithDismissTimer;
}

- (void)setRepeatItemWithDismissTimer:(id)a3
{
}

- (BOOL)didActivate
{
  return self->_didActivate;
}

- (void)setDidActivate:(BOOL)a3
{
  self->_didActivate = a3;
}

- (id)activateHandler
{
  return self->_activateHandler;
}

- (void)setActivateHandler:(id)a3
{
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong(&self->_activateHandler, 0);
  objc_storeStrong((id *)&self->_repeatItemWithDismissTimer, 0);
  objc_storeStrong((id *)&self->_menuItemGroupName, 0);
  objc_storeStrong((id *)&self->_customShortcut, 0);
  objc_storeStrong((id *)&self->_customGesture, 0);
  objc_storeStrong((id *)&self->_scatElement, 0);
  objc_storeStrong((id *)&self->_resolvedImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end