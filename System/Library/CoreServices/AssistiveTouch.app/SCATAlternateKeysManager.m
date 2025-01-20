@interface SCATAlternateKeysManager
- (BOOL)canBeActiveElementManager;
- (BOOL)handleInputAction:(id)a3 withElement:(id)a4;
- (CGPoint)_fingerControllerPointForKeyboardKey:(id)a3;
- (NSArray)alternateKeys;
- (SCATAlternateKeysManager)init;
- (SCATAlternateKeysManagerDelegate)delegate;
- (SCATElement)currentKeyForAlternates;
- (id)_fingerController;
- (id)allElements;
- (void)_cleanUpAlternateKeyOperations;
- (void)_releaseLastShownKey;
- (void)_selectAlternateKey:(id)a3;
- (void)_updateAlternateKeys;
- (void)accessibilityManager:(id)a3 didReceiveEvent:(int64_t)a4 data:(id)a5;
- (void)dealloc;
- (void)didFetchElements:(id)a3 foundNewElements:(BOOL)a4 currentFocusContext:(id)a5 didChangeActiveElementManager:(BOOL)a6;
- (void)setAlternateKeys:(id)a3;
- (void)setCurrentKeyForAlternates:(id)a3;
- (void)setDelegate:(id)a3;
- (void)showAlternateKeysForKey:(id)a3;
@end

@implementation SCATAlternateKeysManager

- (SCATAlternateKeysManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)SCATAlternateKeysManager;
  v2 = [(SCATAlternateKeysManager *)&v5 init];
  if (v2)
  {
    v3 = +[HNDAccessibilityManager sharedManager];
    [v3 addObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[HNDAccessibilityManager sharedManager];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SCATAlternateKeysManager;
  [(SCATAlternateKeysManager *)&v4 dealloc];
}

- (BOOL)canBeActiveElementManager
{
  v2 = [(SCATAlternateKeysManager *)self currentKeyForAlternates];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_updateAlternateKeys
{
  id v4 = [(SCATAlternateKeysManager *)self currentKeyForAlternates];
  BOOL v3 = [v4 scatAlternateKeys];
  [(SCATAlternateKeysManager *)self setAlternateKeys:v3];
}

- (id)_fingerController
{
  v2 = +[HNDHandManager sharedManager];
  BOOL v3 = [v2 fingerController];

  return v3;
}

- (CGPoint)_fingerControllerPointForKeyboardKey:(id)a3
{
  [a3 scatFrame];
  AX_CGRectGetCenter();
  double v5 = v4;
  double v7 = v6;
  v8 = [(SCATAlternateKeysManager *)self _fingerController];
  v9 = [v8 fingerContainerView];
  v10 = [v8 fingerContainerView];
  v11 = [v10 window];
  objc_msgSend(v11, "convertPoint:fromWindow:", 0, v5, v7);
  objc_msgSend(v9, "convertPoint:fromView:", 0);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (void)showAlternateKeysForKey:(id)a3
{
  id v4 = a3;
  [(SCATAlternateKeysManager *)self _fingerControllerPointForKeyboardKey:v4];
  double v6 = v5;
  double v8 = v7;
  v9 = [(SCATAlternateKeysManager *)self _fingerController];
  objc_msgSend(v9, "performDownAtPoint:", v6, v8);

  [(SCATAlternateKeysManager *)self setCurrentKeyForAlternates:v4];
  id v10 = +[SCATScannerManager sharedManager];
  [v10 endScanning];
}

- (void)_cleanUpAlternateKeyOperations
{
  [(SCATAlternateKeysManager *)self setAlternateKeys:0];

  [(SCATAlternateKeysManager *)self setCurrentKeyForAlternates:0];
}

- (void)_selectAlternateKey:(id)a3
{
  id v4 = a3;
  [(SCATAlternateKeysManager *)self _fingerControllerPointForKeyboardKey:v4];
  double v6 = v5;
  double v8 = v7;
  id v10 = [(SCATAlternateKeysManager *)self _fingerController];
  objc_msgSend(v10, "performMoveToPoint:", v6, v8);
  objc_msgSend(v10, "performUpAtPoint:", v6, v8);
  [(SCATAlternateKeysManager *)self _cleanUpAlternateKeyOperations];
  v9 = [(SCATAlternateKeysManager *)self delegate];
  [v9 alternateKeysManager:self didSelectAlternateKey:v4];
}

- (void)_releaseLastShownKey
{
  BOOL v3 = [(SCATAlternateKeysManager *)self currentKeyForAlternates];

  if (v3)
  {
    id v4 = [(SCATAlternateKeysManager *)self _fingerController];
    double v5 = [(SCATAlternateKeysManager *)self currentKeyForAlternates];
    [(SCATAlternateKeysManager *)self _fingerControllerPointForKeyboardKey:v5];
    objc_msgSend(v4, "performUpAtPoint:");
  }

  [(SCATAlternateKeysManager *)self _cleanUpAlternateKeyOperations];
}

- (id)allElements
{
  return [(SCATAlternateKeysManager *)self alternateKeys];
}

- (void)didFetchElements:(id)a3 foundNewElements:(BOOL)a4 currentFocusContext:(id)a5 didChangeActiveElementManager:(BOOL)a6
{
  id v9 = a3;
  double v7 = +[HNDAccessibilityManager sharedManager];
  double v8 = [v7 firstKeyboardItem];

  if (!v8)
  {
    [(SCATAlternateKeysManager *)self _releaseLastShownKey];
    [v9 beginScanningWithFocusContext:0];
  }
}

- (BOOL)handleInputAction:(id)a3 withElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 action] == (id)100
    || [v6 action] == (id)103
    || [v6 action] == (id)109)
  {
    [(SCATAlternateKeysManager *)self _selectAlternateKey:v7];
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)accessibilityManager:(id)a3 didReceiveEvent:(int64_t)a4 data:(id)a5
{
  if (a4 == 9)
  {
    id v6 = [(SCATAlternateKeysManager *)self currentKeyForAlternates];

    if (v6)
    {
      [(SCATAlternateKeysManager *)self _updateAlternateKeys];
      id v7 = +[SCATScannerManager sharedManager];
      [v7 beginScanningWithFocusContext:0];
    }
  }
}

- (SCATAlternateKeysManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SCATAlternateKeysManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SCATElement)currentKeyForAlternates
{
  return self->_currentKeyForAlternates;
}

- (void)setCurrentKeyForAlternates:(id)a3
{
}

- (NSArray)alternateKeys
{
  return self->_alternateKeys;
}

- (void)setAlternateKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateKeys, 0);
  objc_storeStrong((id *)&self->_currentKeyForAlternates, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end