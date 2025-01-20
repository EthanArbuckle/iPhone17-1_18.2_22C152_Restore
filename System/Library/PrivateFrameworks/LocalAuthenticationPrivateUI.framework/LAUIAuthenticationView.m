@interface LAUIAuthenticationView
+ (CGRect)defaultRect;
- (BOOL)disableMechanism:(unint64_t)a3 error:(id *)a4;
- (BOOL)enableMechanism:(unint64_t)a3 error:(id *)a4;
- (BOOL)fastAnimations;
- (BOOL)idleWhenDone;
- (BOOL)isMechanismActive:(unint64_t)a3;
- (BOOL)isMechanismAvailable:(unint64_t)a3 error:(id *)a4;
- (BOOL)isMechanismEnabled:(unint64_t)a3;
- (LAUIAuthenticationCore)authenticationCore;
- (LAUIAuthenticationDelegate)delegate;
- (LAUIAuthenticationView)initWithCoder:(id)a3;
- (LAUIAuthenticationView)initWithFrame:(CGRect)a3;
- (LAUIAuthenticationView)initWithFrame:(CGRect)a3 mechanisms:(unint64_t)a4;
- (LAUIAuthenticationView)initWithFrame:(CGRect)a3 mechanisms:(unint64_t)a4 context:(id)a5;
- (LAUIAuthenticationView)initWithMechanisms:(unint64_t)a3;
- (LAUIAuthenticationView)initWithMechanisms:(unint64_t)a3 context:(id)a4;
- (LAUIPKGlyphWrapper)glyphWrapper;
- (id)callerIconBundlePath;
- (id)callerIconPath;
- (id)localizedCallerName;
- (int64_t)_stateOfSuccess;
- (int64_t)glyphStyle;
- (int64_t)style;
- (void)_biometryIdle;
- (void)_setupMechanisms:(unint64_t)a3 context:(id)a4;
- (void)_setupView;
- (void)authenticationResult:(id)a3 error:(id)a4 context:(id)a5;
- (void)biometricNoMatch;
- (void)biometryState:(int64_t)a3 completionHandler:(id)a4;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)setDelegate:(id)a3;
- (void)setFastAnimations:(BOOL)a3;
- (void)setGlyphStyle:(int64_t)a3;
- (void)setIdleWhenDone:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)tappedFaceID:(id)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation LAUIAuthenticationView

- (LAUIAuthenticationView)initWithFrame:(CGRect)a3
{
  return -[LAUIAuthenticationView initWithFrame:mechanisms:](self, "initWithFrame:mechanisms:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (LAUIAuthenticationView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LAUIAuthenticationView;
  v3 = [(LAUIAuthenticationView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(LAUIAuthenticationView *)v3 _setupMechanisms:0 context:0];
  }
  return v4;
}

- (LAUIAuthenticationView)initWithMechanisms:(unint64_t)a3
{
  return [(LAUIAuthenticationView *)self initWithMechanisms:a3 context:0];
}

- (LAUIAuthenticationView)initWithMechanisms:(unint64_t)a3 context:(id)a4
{
  id v6 = a4;
  +[LAUIAuthenticationView defaultRect];
  v7 = -[LAUIAuthenticationView initWithFrame:mechanisms:context:](self, "initWithFrame:mechanisms:context:", a3, v6);

  return v7;
}

- (LAUIAuthenticationView)initWithFrame:(CGRect)a3 mechanisms:(unint64_t)a4
{
  return -[LAUIAuthenticationView initWithFrame:mechanisms:context:](self, "initWithFrame:mechanisms:context:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (LAUIAuthenticationView)initWithFrame:(CGRect)a3 mechanisms:(unint64_t)a4 context:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LAUIAuthenticationView;
  v12 = -[LAUIAuthenticationView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v13 = v12;
  if (v12) {
    [(LAUIAuthenticationView *)v12 _setupMechanisms:a4 context:v11];
  }

  return v13;
}

- (void)_setupMechanisms:(unint64_t)a3 context:(id)a4
{
  id v6 = a4;
  v7 = [[LAUIAuthenticationCore alloc] initWithMechanisms:a3 context:v6];

  authenticationCore = self->_authenticationCore;
  self->_authenticationCore = v7;

  [(LAUIAuthenticationCore *)self->_authenticationCore setView:self];
  v9 = self->_authenticationCore;
  [(LAUIAuthenticationCore *)v9 setDelegate:self];
}

- (BOOL)isMechanismAvailable:(unint64_t)a3 error:(id *)a4
{
  id v6 = [(LAUIAuthenticationView *)self authenticationCore];
  LOBYTE(a4) = [v6 isMechanismAvailable:a3 error:a4];

  return (char)a4;
}

- (BOOL)isMechanismEnabled:(unint64_t)a3
{
  v4 = [(LAUIAuthenticationView *)self authenticationCore];
  LOBYTE(a3) = [v4 isMechanismEnabled:a3];

  return a3;
}

- (BOOL)isMechanismActive:(unint64_t)a3
{
  v4 = [(LAUIAuthenticationView *)self authenticationCore];
  LOBYTE(a3) = [v4 isMechanismActive:a3];

  return a3;
}

- (BOOL)enableMechanism:(unint64_t)a3 error:(id *)a4
{
  id v6 = [(LAUIAuthenticationView *)self authenticationCore];
  LOBYTE(a4) = [v6 enableMechanism:a3 error:a4];

  return (char)a4;
}

- (BOOL)disableMechanism:(unint64_t)a3 error:(id *)a4
{
  id v6 = [(LAUIAuthenticationView *)self authenticationCore];
  LOBYTE(a4) = [v6 disableMechanism:a3 error:a4];

  return (char)a4;
}

+ (CGRect)defaultRect
{
  double v2 = 64.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 64.0;
  result.size.double height = v5;
  result.size.double width = v2;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)willMoveToSuperview:(id)a3
{
  if (a3) {
    [(LAUIAuthenticationView *)self _setupView];
  }
}

- (void)didMoveToSuperview
{
  id v2 = [(LAUIAuthenticationView *)self authenticationCore];
  [v2 checkView];
}

- (void)didMoveToWindow
{
  id v2 = [(LAUIAuthenticationView *)self authenticationCore];
  [v2 checkView];
}

- (void)_setupView
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  double v3 = LA_LOG_LAUIAuthenticationView();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    v13 = "-[LAUIAuthenticationView _setupView]";
    __int16 v14 = 2112;
    objc_super v15 = self;
    _os_log_impl(&dword_214463000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v12, 0x16u);
  }

  int64_t v4 = [(LAUIAuthenticationView *)self style];
  [(LAUIAuthenticationView *)self frame];
  +[LAUIPKGlyphWrapper glyphWithStyle:frame:](LAUIPKGlyphWrapper, "glyphWithStyle:frame:", v4);
  double v5 = (LAUIPKGlyphWrapper *)objc_claimAutoreleasedReturnValue();
  glyphWrapper = self->_glyphWrapper;
  self->_glyphWrapper = v5;

  [(LAUIPKGlyphWrapper *)self->_glyphWrapper setFastAnimations:[(LAUIAuthenticationView *)self fastAnimations]];
  v7 = [(LAUIAuthenticationView *)self glyphWrapper];
  v8 = [v7 view];

  if (v8)
  {
    [(LAUIAuthenticationView *)self addSubview:v8];
    v9 = [(LAUIAuthenticationView *)self authenticationCore];
    uint64_t v10 = [v9 biometryType];

    if (v10 == 2)
    {
      id v11 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel_tappedFaceID_];
      [v8 addGestureRecognizer:v11];
    }
  }
}

- (void)tappedFaceID:(id)a3
{
}

- (void)biometryState:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v7 = LA_LOG_LAUIAuthenticationView();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[LAUIAuthenticationView biometryState:completionHandler:](a3, (uint64_t)self, v7);
  }

  v8 = [(LAUIAuthenticationView *)self authenticationCore];
  uint64_t v9 = [v8 biometryType];

  switch(a3)
  {
    case 0:
      if (self->_lastState) {
        [(LAUIAuthenticationView *)self _biometryIdle];
      }
      goto LABEL_6;
    case 1:
      uint64_t v10 = 4 * (v9 == 2);
      break;
    case 2:
      if (v9 == 2) {
        uint64_t v10 = 5;
      }
      else {
        uint64_t v10 = 1;
      }
      break;
    case 3:
      uint64_t v10 = 7;
      break;
    case 4:
      uint64_t v10 = [(LAUIAuthenticationView *)self _stateOfSuccess];
      break;
    case 5:
      if (v9 == 2) {
        uint64_t v10 = 3;
      }
      else {
        uint64_t v10 = 0;
      }
      break;
    default:
LABEL_6:
      uint64_t v10 = 0;
      break;
  }
  if (a3) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v9 == 2;
  }
  uint64_t v12 = !v11;
  self->_lastState = a3;
  v13 = [(LAUIAuthenticationView *)self glyphWrapper];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __58__LAUIAuthenticationView_biometryState_completionHandler___block_invoke;
  v15[3] = &unk_26420C7C8;
  id v16 = v6;
  id v14 = v6;
  [v13 setState:v10 idleTouchID:v12 animated:1 completionHandler:v15];
}

uint64_t __58__LAUIAuthenticationView_biometryState_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)_stateOfSuccess
{
  if ([(LAUIAuthenticationView *)self idleWhenDone]) {
    int64_t v3 = 12;
  }
  else {
    int64_t v3 = 11;
  }
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __41__LAUIAuthenticationView__stateOfSuccess__block_invoke;
  v11[3] = &unk_26420C810;
  objc_copyWeak(v12, &location);
  v12[1] = (id)v3;
  int64_t v4 = (void *)MEMORY[0x2166A1D50](v11);
  double v5 = [(LAUIAuthenticationView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(LAUIAuthenticationView *)self delegate];
    [v7 processAuthenticationSuccessWithCompletionHandler:v4];
LABEL_8:

    int64_t v3 = 7;
    goto LABEL_9;
  }
  v8 = [(LAUIAuthenticationView *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v7 = [(LAUIAuthenticationView *)self delegate];
    [v7 processBiometricMatchWithCompletionHandler:v4];
    goto LABEL_8;
  }
LABEL_9:

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
  return v3;
}

void __41__LAUIAuthenticationView__stateOfSuccess__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __41__LAUIAuthenticationView__stateOfSuccess__block_invoke_2;
  v2[3] = &unk_26420C810;
  objc_copyWeak(v3, (id *)(a1 + 32));
  v3[1] = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], v2);
  objc_destroyWeak(v3);
}

void __41__LAUIAuthenticationView__stateOfSuccess__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained glyphWrapper];
  [v2 setState:*(void *)(a1 + 40) idleTouchID:0 animated:1 completionHandler:&__block_literal_global_1];
}

- (void)authenticationResult:(id)a3 error:(id)a4 context:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [(LAUIAuthenticationView *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v13 = LA_LOG_LAUIAuthenticationView();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      if (v8) {
        id v14 = v8;
      }
      else {
        id v14 = v9;
      }
      int v16 = 136315906;
      v17 = "-[LAUIAuthenticationView authenticationResult:error:context:]";
      __int16 v18 = 2114;
      id v19 = v14;
      __int16 v20 = 2114;
      id v21 = v10;
      __int16 v22 = 2112;
      v23 = self;
      _os_log_impl(&dword_214463000, v13, OS_LOG_TYPE_DEFAULT, "%s %{public}@, %{public}@ on %@", (uint8_t *)&v16, 0x2Au);
    }

    objc_super v15 = [(LAUIAuthenticationView *)self delegate];
    [v15 authenticationResult:v8 error:v9 context:v10];
  }
}

- (void)biometricNoMatch
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int64_t v3 = [(LAUIAuthenticationView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = LA_LOG_LAUIAuthenticationView();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      id v8 = "-[LAUIAuthenticationView biometricNoMatch]";
      __int16 v9 = 2112;
      id v10 = self;
      _os_log_impl(&dword_214463000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v7, 0x16u);
    }

    char v6 = [(LAUIAuthenticationView *)self delegate];
    [v6 biometricNoMatch];
  }
}

- (void)_biometryIdle
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int64_t v3 = [(LAUIAuthenticationView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = LA_LOG_LAUIAuthenticationView();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      id v8 = "-[LAUIAuthenticationView _biometryIdle]";
      __int16 v9 = 2112;
      id v10 = self;
      _os_log_impl(&dword_214463000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v7, 0x16u);
    }

    char v6 = [(LAUIAuthenticationView *)self delegate];
    [v6 biometryDidBecomeIdle];
  }
}

- (id)callerIconPath
{
  int64_t v3 = [(LAUIAuthenticationView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    char v4 = [(LAUIAuthenticationView *)self delegate];
    double v5 = [v4 callerIconPath];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (id)callerIconBundlePath
{
  int64_t v3 = [(LAUIAuthenticationView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    char v4 = [(LAUIAuthenticationView *)self delegate];
    double v5 = [v4 callerIconBundlePath];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (id)localizedCallerName
{
  int64_t v3 = [(LAUIAuthenticationView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    char v4 = [(LAUIAuthenticationView *)self delegate];
    double v5 = [v4 localizedCallerName];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (void)setFastAnimations:(BOOL)a3
{
  BOOL v3 = a3;
  self->_fastAnimations = a3;
  id v4 = [(LAUIAuthenticationView *)self glyphWrapper];
  [v4 setFastAnimations:v3];
}

- (LAUIAuthenticationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (LAUIAuthenticationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)glyphStyle
{
  return self->_glyphStyle;
}

- (void)setGlyphStyle:(int64_t)a3
{
  self->_glyphStyle = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (BOOL)idleWhenDone
{
  return self->_idleWhenDone;
}

- (void)setIdleWhenDone:(BOOL)a3
{
  self->_idleWhenDone = a3;
}

- (BOOL)fastAnimations
{
  return self->_fastAnimations;
}

- (LAUIAuthenticationCore)authenticationCore
{
  return self->_authenticationCore;
}

- (LAUIPKGlyphWrapper)glyphWrapper
{
  return self->_glyphWrapper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphWrapper, 0);
  objc_storeStrong((id *)&self->_authenticationCore, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)biometryState:(os_log_t)log completionHandler:.cold.1(int a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a2 + 408);
  v4[0] = 67109376;
  v4[1] = a1;
  __int16 v5 = 1024;
  int v6 = v3;
  _os_log_debug_impl(&dword_214463000, log, OS_LOG_TYPE_DEBUG, "biometryState: %d last state: %d", (uint8_t *)v4, 0xEu);
}

@end