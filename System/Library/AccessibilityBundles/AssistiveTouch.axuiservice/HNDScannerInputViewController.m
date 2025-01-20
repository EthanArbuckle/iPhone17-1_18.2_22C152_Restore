@interface HNDScannerInputViewController
- (BOOL)_canShowWhileLocked;
- (CALayer)cameraInputSourceStateLeftLayer;
- (CALayer)cameraInputSourceStateRightLayer;
- (HNDUIServer)userInterfaceServer;
- (NSString)cameraInputSourceAlertIdentifier;
- (NSString)hardwareInputSourceAlertIdentifier;
- (NSString)screenInputSourceAlertIdentifier;
- (void)_hideAlertsForAllSources;
- (void)_hideStateForAllSources;
- (void)dealloc;
- (void)hideAlertForSource:(unint64_t)a3;
- (void)hideAlerts;
- (void)hideStateForSource:(unint64_t)a3;
- (void)setCameraInputSourceAlertIdentifier:(id)a3;
- (void)setCameraInputSourceStateLeftLayer:(id)a3;
- (void)setCameraInputSourceStateRightLayer:(id)a3;
- (void)setHardwareInputSourceAlertIdentifier:(id)a3;
- (void)setScreenInputSourceAlertIdentifier:(id)a3;
- (void)setUserInterfaceServer:(id)a3;
- (void)showAlert:(id)a3 forSource:(unint64_t)a4;
- (void)showState:(id)a3 forSource:(unint64_t)a4;
@end

@implementation HNDScannerInputViewController

- (void)_hideAlertsForAllSources
{
  [(HNDScannerInputViewController *)self hideAlertForSource:1];
  [(HNDScannerInputViewController *)self hideAlertForSource:2];

  [(HNDScannerInputViewController *)self hideAlertForSource:3];
}

- (void)_hideStateForAllSources
{
  [(HNDScannerInputViewController *)self hideStateForSource:1];
  [(HNDScannerInputViewController *)self hideStateForSource:2];

  [(HNDScannerInputViewController *)self hideStateForSource:3];
}

- (void)dealloc
{
  [(HNDScannerInputViewController *)self _hideAlertsForAllSources];
  [(HNDScannerInputViewController *)self _hideStateForAllSources];
  v3.receiver = self;
  v3.super_class = (Class)HNDScannerInputViewController;
  [(HNDScannerInputViewController *)&v3 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)hideAlerts
{
  id v9 = +[AXUIDisplayManager sharedDisplayManager];
  objc_super v3 = [(HNDScannerInputViewController *)self cameraInputSourceAlertIdentifier];
  v4 = [(HNDScannerInputViewController *)self userInterfaceServer];
  [v9 hideAlertWithIdentifier:v3 forService:v4];

  v5 = [(HNDScannerInputViewController *)self hardwareInputSourceAlertIdentifier];
  v6 = [(HNDScannerInputViewController *)self userInterfaceServer];
  [v9 hideAlertWithIdentifier:v5 forService:v6];

  v7 = [(HNDScannerInputViewController *)self screenInputSourceAlertIdentifier];
  v8 = [(HNDScannerInputViewController *)self userInterfaceServer];
  [v9 hideAlertWithIdentifier:v7 forService:v8];

  [(HNDScannerInputViewController *)self setScreenInputSourceAlertIdentifier:0];
  [(HNDScannerInputViewController *)self setCameraInputSourceAlertIdentifier:0];
  [(HNDScannerInputViewController *)self setHardwareInputSourceAlertIdentifier:0];
}

- (void)hideAlertForSource:(unint64_t)a3
{
  id v7 = +[AXUIDisplayManager sharedDisplayManager];
  v5 = [(HNDScannerInputViewController *)self userInterfaceServer];
  switch(a3)
  {
    case 3uLL:
      v6 = [(HNDScannerInputViewController *)self screenInputSourceAlertIdentifier];
      [v7 hideAlertWithIdentifier:v6 forService:v5];
      [(HNDScannerInputViewController *)self setScreenInputSourceAlertIdentifier:0];
      goto LABEL_7;
    case 2uLL:
      v6 = [(HNDScannerInputViewController *)self hardwareInputSourceAlertIdentifier];
      [v7 hideAlertWithIdentifier:v6 forService:v5];
      [(HNDScannerInputViewController *)self setHardwareInputSourceAlertIdentifier:0];
      goto LABEL_7;
    case 1uLL:
      v6 = [(HNDScannerInputViewController *)self cameraInputSourceAlertIdentifier];
      [v7 hideAlertWithIdentifier:v6 forService:v5];
      [(HNDScannerInputViewController *)self setCameraInputSourceAlertIdentifier:0];
LABEL_7:

      goto LABEL_9;
  }
  _AXLogWithFacility();
LABEL_9:
}

- (void)showAlert:(id)a3 forSource:(unint64_t)a4
{
  id v13 = a3;
  v6 = +[AXUIDisplayManager sharedDisplayManager];
  id v7 = [(HNDScannerInputViewController *)self userInterfaceServer];
  id v8 = objc_alloc((Class)NSString);
  id v9 = HNDLocString(@"SWITCH_OVER_TITLE");
  id v10 = [v8 initWithFormat:@"%@\n%@", v9, v13];

  switch(a4)
  {
    case 3uLL:
      v11 = [(HNDScannerInputViewController *)self screenInputSourceAlertIdentifier];
      [v6 hideAlertWithIdentifier:v11 forService:v7];
      v12 = [v6 showAlertWithText:v10 subtitleText:0 iconImage:0 type:2 priority:30 duration:v7 forService:AXUIAlertDisplayTimeForever];
      [(HNDScannerInputViewController *)self setScreenInputSourceAlertIdentifier:v12];
      goto LABEL_7;
    case 2uLL:
      v11 = [(HNDScannerInputViewController *)self hardwareInputSourceAlertIdentifier];
      [v6 hideAlertWithIdentifier:v11 forService:v7];
      v12 = [v6 showAlertWithText:v10 subtitleText:0 iconImage:0 type:2 priority:30 duration:v7 forService:AXUIAlertDisplayTimeForever];
      [(HNDScannerInputViewController *)self setHardwareInputSourceAlertIdentifier:v12];
      goto LABEL_7;
    case 1uLL:
      v11 = [(HNDScannerInputViewController *)self cameraInputSourceAlertIdentifier];
      [v6 hideAlertWithIdentifier:v11 forService:v7];
      v12 = [v6 showAlertWithText:v10 subtitleText:0 iconImage:0 type:2 priority:30 duration:v7 forService:AXUIAlertDisplayTimeForever];
      [(HNDScannerInputViewController *)self setCameraInputSourceAlertIdentifier:v12];
LABEL_7:

      goto LABEL_9;
  }
  _AXLogWithFacility();
LABEL_9:
}

- (void)hideStateForSource:(unint64_t)a3
{
  if (a3 - 2 >= 2)
  {
    if (a3 == 1)
    {
      id v6 = [(HNDScannerInputViewController *)self cameraInputSourceStateLeftLayer];
      if (v6)
      {
        [v6 removeFromSuperlayer];
        [(HNDScannerInputViewController *)self setCameraInputSourceStateLeftLayer:0];
      }
      v4 = [(HNDScannerInputViewController *)self cameraInputSourceStateRightLayer];
      v5 = v4;
      if (v4)
      {
        [v4 removeFromSuperlayer];
        [(HNDScannerInputViewController *)self setCameraInputSourceStateRightLayer:0];
      }
    }
    else
    {
      _AXLogWithFacility();
    }
  }
}

- (void)showState:(id)a3 forSource:(unint64_t)a4
{
  id v6 = a3;
  if (a4 - 2 >= 2)
  {
    id v23 = v6;
    if (a4 == 1)
    {
      id v7 = [(HNDScannerInputViewController *)self view];
      id v8 = [v7 layer];

      id v9 = [v23 objectAtIndexedSubscript:0];
      [v9 floatValue];
      float v11 = v10;

      v12 = [v23 objectAtIndexedSubscript:1];
      [v12 floatValue];
      float v14 = v13;

      v15 = [(HNDScannerInputViewController *)self cameraInputSourceStateLeftLayer];
      if (!v15)
      {
        v15 = +[CALayer layer];
        objc_msgSend(v15, "setAnchorPoint:", 0.0, 0.0);
        v16 = +[AXSettings sharedInstance];
        [v16 assistiveTouchCursorColor];

        id v17 = +[UIColor colorWithCGColor:AXSAssistiveTouchCursorColor()];
        objc_msgSend(v15, "setBackgroundColor:", objc_msgSend(v17, "CGColor"));

        [v8 bounds];
        objc_msgSend(v15, "setBounds:", 0.0, 0.0, 7.5, CGRectGetHeight(v25));
        LODWORD(v18) = 0.5;
        [v15 setOpacity:v18];
        objc_msgSend(v15, "setPosition:", 0.0, 0.0);
        [(HNDScannerInputViewController *)self setCameraInputSourceStateLeftLayer:v15];
        [v8 addSublayer:v15];
      }
      v19 = [(HNDScannerInputViewController *)self cameraInputSourceStateRightLayer];
      if (!v19)
      {
        v19 = +[CALayer layer];
        objc_msgSend(v19, "setAnchorPoint:", 0.0, 0.0);
        v20 = +[AXSettings sharedInstance];
        [v20 assistiveTouchCursorColor];

        id v21 = +[UIColor colorWithCGColor:AXSAssistiveTouchCursorColor()];
        objc_msgSend(v19, "setBackgroundColor:", objc_msgSend(v21, "CGColor"));

        [v8 bounds];
        objc_msgSend(v19, "setBounds:", 0.0, 0.0, 7.5, CGRectGetHeight(v26));
        LODWORD(v22) = 0.5;
        [v19 setOpacity:v22];
        [v8 bounds];
        objc_msgSend(v19, "setPosition:", CGRectGetWidth(v27) + -7.5, 0.0);
        [(HNDScannerInputViewController *)self setCameraInputSourceStateRightLayer:v19];
        [v8 addSublayer:v19];
      }
      +[CATransaction begin];
      [v8 bounds];
      objc_msgSend(v15, "setBounds:", 0.0, 0.0, 7.5, CGRectGetHeight(v28));
      objc_msgSend(v15, "setPosition:", v11 * -7.5 + 0.0, 0.0);
      [v8 bounds];
      objc_msgSend(v19, "setBounds:", 0.0, 0.0, 7.5, CGRectGetHeight(v29));
      [v8 bounds];
      objc_msgSend(v19, "setPosition:", CGRectGetWidth(v30) + -7.5 + v14 * 7.5, 0.0);
      +[CATransaction commit];
    }
    else
    {
      _AXLogWithFacility();
    }
    id v6 = v23;
  }
}

- (HNDUIServer)userInterfaceServer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userInterfaceServer);

  return (HNDUIServer *)WeakRetained;
}

- (void)setUserInterfaceServer:(id)a3
{
}

- (NSString)cameraInputSourceAlertIdentifier
{
  return self->_cameraInputSourceAlertIdentifier;
}

- (void)setCameraInputSourceAlertIdentifier:(id)a3
{
}

- (NSString)hardwareInputSourceAlertIdentifier
{
  return self->_hardwareInputSourceAlertIdentifier;
}

- (void)setHardwareInputSourceAlertIdentifier:(id)a3
{
}

- (NSString)screenInputSourceAlertIdentifier
{
  return self->_screenInputSourceAlertIdentifier;
}

- (void)setScreenInputSourceAlertIdentifier:(id)a3
{
}

- (CALayer)cameraInputSourceStateLeftLayer
{
  return self->_cameraInputSourceStateLeftLayer;
}

- (void)setCameraInputSourceStateLeftLayer:(id)a3
{
}

- (CALayer)cameraInputSourceStateRightLayer
{
  return self->_cameraInputSourceStateRightLayer;
}

- (void)setCameraInputSourceStateRightLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraInputSourceStateRightLayer, 0);
  objc_storeStrong((id *)&self->_cameraInputSourceStateLeftLayer, 0);
  objc_storeStrong((id *)&self->_screenInputSourceAlertIdentifier, 0);
  objc_storeStrong((id *)&self->_hardwareInputSourceAlertIdentifier, 0);
  objc_storeStrong((id *)&self->_cameraInputSourceAlertIdentifier, 0);

  objc_destroyWeak((id *)&self->_userInterfaceServer);
}

@end