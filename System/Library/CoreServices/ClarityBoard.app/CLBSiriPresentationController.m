@interface CLBSiriPresentationController
+ (CLBSiriPresentationController)sharedPresentationController;
- (BOOL)isPresented;
- (CLBSiriPresentationController)init;
- (SASPresentationConnectionListener)presentationConnectionListener;
- (SASSignalConnectionListener)signalConnectionListener;
- (SiriAssertion)siriPrewarmAssertion;
- (SiriLongPressButtonSource)siriButtonSource;
- (SiriPresentationControllerDelegate)delegate;
- (SiriPresentationViewController)viewController;
- (id)contentBackgroundColor;
- (void)_setBackgroundColor;
- (void)activateSiri;
- (void)dismissSiri:(BOOL)a3 completion:(id)a4;
- (void)dismissSiri:(int64_t)a3;
- (void)prewarmSiri;
- (void)setDelegate:(id)a3;
- (void)setIsPresented:(BOOL)a3;
- (void)setPresentationConnectionListener:(id)a3;
- (void)setSignalConnectionListener:(id)a3;
- (void)setSiriButtonSource:(id)a3;
- (void)setSiriPrewarmAssertion:(id)a3;
- (void)setup;
- (void)siriPresentation:(id)a3 isEnabledDidChange:(BOOL)a4;
- (void)siriPresentation:(id)a3 requestsDismissalWithOptions:(id)a4 withHandler:(id)a5;
- (void)siriPresentation:(id)a3 requestsPresentationWithOptions:(id)a4 withHandler:(id)a5;
- (void)siriPresentation:(id)a3 requestsPunchout:(id)a4 withHandler:(id)a5;
@end

@implementation CLBSiriPresentationController

+ (CLBSiriPresentationController)sharedPresentationController
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001344C;
  block[3] = &unk_10015C5A8;
  block[4] = a1;
  if (qword_100181028 != -1) {
    dispatch_once(&qword_100181028, block);
  }
  v2 = (void *)qword_100181020;

  return (CLBSiriPresentationController *)v2;
}

- (CLBSiriPresentationController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CLBSiriPresentationController;
  v2 = [(CLBSiriPresentationController *)&v6 init];
  if (v2)
  {
    v3 = (SiriPresentationViewController *)[objc_alloc((Class)SiriPresentationViewController) initWithIdentifier:3];
    viewController = v2->_viewController;
    v2->_viewController = v3;

    [(SiriPresentationViewController *)v2->_viewController setSiriPresentationControllerDelegate:v2];
    [(CLBSiriPresentationController *)v2 _setBackgroundColor];
  }
  return v2;
}

- (void)setup
{
  uint64_t v3 = [(CLBSiriPresentationController *)self presentationConnectionListener];
  if (!v3)
  {
    if (!AXDeviceIsSiriAvailableInClarity()) {
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  v4 = (void *)v3;
  uint64_t v5 = [(CLBSiriPresentationController *)self signalConnectionListener];
  if (!v5)
  {
    char IsSiriAvailableInClarity = AXDeviceIsSiriAvailableInClarity();

    if ((IsSiriAvailableInClarity & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  objc_super v6 = (void *)v5;
  v7 = [(CLBSiriPresentationController *)self siriButtonSource];
  if (v7)
  {

LABEL_13:
    goto LABEL_14;
  }
  char v9 = AXDeviceIsSiriAvailableInClarity();

  if (v9)
  {
LABEL_10:
    v10 = +[CLFLog commonLog];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setting up listeners this time", v13, 2u);
    }

    v11 = +[SASPresentationConnectionListener listener];
    [(CLBSiriPresentationController *)self setPresentationConnectionListener:v11];

    v12 = +[SASSignalConnectionListener listener];
    [(CLBSiriPresentationController *)self setSignalConnectionListener:v12];

    v4 = +[SiriLongPressButtonSource longPressButtonForIdentifier:2];
    [(CLBSiriPresentationController *)self setSiriButtonSource:v4];
    goto LABEL_13;
  }
LABEL_14:
  [(CLBSiriPresentationController *)self prewarmSiri];
}

- (void)prewarmSiri
{
  if (AXDeviceIsSiriAvailableInClarity())
  {
    siriPrewarmAssertion = self->_siriPrewarmAssertion;
    if (siriPrewarmAssertion) {
      [(SiriAssertion *)siriPrewarmAssertion invalidate];
    }
    self->_siriPrewarmAssertion = [(SiriLongPressButtonSource *)self->_siriButtonSource prepareForActivation];
    _objc_release_x1();
  }
}

- (void)activateSiri
{
  uint64_t v3 = +[CLFLog commonLog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Activating Siri", v4, 2u);
  }

  if (AXDeviceIsSiriAvailableInClarity()) {
    [(SiriLongPressButtonSource *)self->_siriButtonSource didRecognizeLongPress];
  }
}

- (void)dismissSiri:(int64_t)a3
{
  uint64_t v5 = +[CLFLog commonLog];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dismissing Siri", v7, 2u);
  }

  id v6 = [objc_alloc((Class)SiriDismissalOptions) initWithDeactivationOptions:0 animated:1 dismissalReason:a3];
  [(SiriPresentationViewController *)self->_viewController dismissWithOptions:v6];
  if ([(CLBSiriPresentationController *)self isPresented]) {
    [(CLBSiriPresentationController *)self dismissSiri:1 completion:&stru_10015C5C8];
  }
}

- (void)dismissSiri:(BOOL)a3 completion:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000138C8;
  block[3] = &unk_10015C618;
  BOOL v7 = a3;
  block[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_setBackgroundColor
{
  id v4 = [(CLBSiriPresentationController *)self contentBackgroundColor];
  uint64_t v3 = [(SiriPresentationViewController *)self->_viewController view];
  [v3 setBackgroundColor:v4];
}

- (void)siriPresentation:(id)a3 requestsPresentationWithOptions:(id)a4 withHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[CLFLog commonLog];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Siri presentation requested %@", buf, 0xCu);
  }

  [(CLBSiriPresentationController *)self _setBackgroundColor];
  v12 = +[BSUIAnimationFactory factoryWithDuration:0.5];
  v13 = [(CLBSiriPresentationController *)self viewController];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100013BD4;
  v17[3] = &unk_10015C640;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  [v13 animatedAppearanceWithFactory:v12 completion:v17];
}

- (void)siriPresentation:(id)a3 requestsDismissalWithOptions:(id)a4 withHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[CLFLog commonLog];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134217984;
    id v14 = [v9 dismissalReason];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Siri dismissal requested with dismissal reason: %lu", (uint8_t *)&v13, 0xCu);
  }

  if ([v9 dismissalReason] != (id)4)
  {
    v12 = [(CLBSiriPresentationController *)self delegate];
    [v12 siriPresentation:v8 requestsDismissalWithOptions:v9 withHandler:v10];

    [(CLBSiriPresentationController *)self setIsPresented:0];
  }
}

- (void)siriPresentation:(id)a3 isEnabledDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CLBSiriPresentationController *)self delegate];
  [v7 siriPresentation:v6 isEnabledDidChange:v4];
}

- (void)siriPresentation:(id)a3 requestsPunchout:(id)a4 withHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = +[CLFLog commonLog];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Siri punchout requested %@", (uint8_t *)&v13, 0xCu);
  }

  v12 = [(CLBSiriPresentationController *)self delegate];
  [v12 siriPresentation:v10 requestsPunchout:v8 withHandler:v9];
}

- (SiriPresentationViewController)viewController
{
  return self->_viewController;
}

- (SiriPresentationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SiriPresentationControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isPresented
{
  return self->_isPresented;
}

- (void)setIsPresented:(BOOL)a3
{
  self->_isPresented = a3;
}

- (SASPresentationConnectionListener)presentationConnectionListener
{
  return self->_presentationConnectionListener;
}

- (void)setPresentationConnectionListener:(id)a3
{
}

- (SASSignalConnectionListener)signalConnectionListener
{
  return self->_signalConnectionListener;
}

- (void)setSignalConnectionListener:(id)a3
{
}

- (SiriLongPressButtonSource)siriButtonSource
{
  return self->_siriButtonSource;
}

- (void)setSiriButtonSource:(id)a3
{
}

- (SiriAssertion)siriPrewarmAssertion
{
  return self->_siriPrewarmAssertion;
}

- (void)setSiriPrewarmAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriPrewarmAssertion, 0);
  objc_storeStrong((id *)&self->_siriButtonSource, 0);
  objc_storeStrong((id *)&self->_signalConnectionListener, 0);
  objc_storeStrong((id *)&self->_presentationConnectionListener, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_viewController, 0);
}

- (id)contentBackgroundColor
{
  sub_10002A544(0, (unint64_t *)&qword_10017D790);
  v2 = (void *)static UIColor.clarityUIContentBackground.getter();

  return v2;
}

@end