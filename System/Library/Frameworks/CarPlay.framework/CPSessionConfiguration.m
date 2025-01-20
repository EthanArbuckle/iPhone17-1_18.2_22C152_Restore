@interface CPSessionConfiguration
- (CARSessionStatus)currentStatus;
- (CPContentStyle)contentStyle;
- (CPLimitableUserInterface)limitedUserInterfaces;
- (CPSTemplateEnvironment)templateEnvironment;
- (CPSessionConfiguration)initWithCarSessionStatus:(id)a3 delegate:(id)a4;
- (CPSessionConfiguration)initWithDelegate:(id)a3 templateEnvironment:(id)a4;
- (CPSessionConfiguration)initWithDelegate:(id)delegate;
- (id)delegate;
- (unint64_t)convertLimitableUserInterfaces:(unint64_t)a3;
- (void)_contentStyleUpdated:(id)a3;
- (void)_limitedUIDidChange:(id)a3;
- (void)_updateContentStyleWithScene:(id)a3;
- (void)_updateLimitedUIStatus;
- (void)dealloc;
- (void)sessionDidConnect:(id)a3;
- (void)setContentStyle:(unint64_t)a3;
- (void)setCurrentStatus:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setLimitedUserInterfaces:(unint64_t)a3;
- (void)setTemplateEnvironment:(id)a3;
- (void)setupConfiguration;
@end

@implementation CPSessionConfiguration

- (CPSessionConfiguration)initWithDelegate:(id)delegate
{
  id v4 = delegate;
  v10.receiver = self;
  v10.super_class = (Class)CPSessionConfiguration;
  v5 = [(CPSessionConfiguration *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (CARSessionStatus *)objc_alloc_init(MEMORY[0x263F30E50]);
    currentStatus = v6->_currentStatus;
    v6->_currentStatus = v7;

    [(CARSessionStatus *)v6->_currentStatus addSessionObserver:v6];
    [(CPSessionConfiguration *)v6 setupConfiguration];
  }

  return v6;
}

- (CPSessionConfiguration)initWithCarSessionStatus:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPSessionConfiguration;
  v9 = [(CPSessionConfiguration *)&v12 init];
  objc_super v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    objc_storeStrong((id *)&v10->_currentStatus, a3);
    [(CARSessionStatus *)v10->_currentStatus addSessionObserver:v10];
    [(CPSessionConfiguration *)v10 setupConfiguration];
  }

  return v10;
}

- (CPSessionConfiguration)initWithDelegate:(id)a3 templateEnvironment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CPSessionConfiguration;
  id v8 = [(CPSessionConfiguration *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    [(CPSessionConfiguration *)v9 setTemplateEnvironment:v7];
    uint64_t v10 = [v7 sessionStatus];
    currentStatus = v9->_currentStatus;
    v9->_currentStatus = (CARSessionStatus *)v10;

    [(CARSessionStatus *)v9->_currentStatus addSessionObserver:v9];
    [(CPSessionConfiguration *)v9 setupConfiguration];
  }

  return v9;
}

- (void)setupConfiguration
{
  [(CPSessionConfiguration *)self _updateLimitedUIStatus];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__limitedUIDidChange_ name:*MEMORY[0x263F30DA0] object:0];

  id v5 = +[CPTemplateApplicationScene activeTemplateScene];
  [(CPSessionConfiguration *)self _updateContentStyleWithScene:v5];
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel__contentStyleUpdated_ name:@"CPTemplateApplicationSceneContentStyleUpdated" object:0];
}

- (void)dealloc
{
  [(CARSessionStatus *)self->_currentStatus removeSessionObserver:self];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F30DA0] object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:@"CPTemplateApplicationSceneContentStyleUpdated" object:0];

  v5.receiver = self;
  v5.super_class = (Class)CPSessionConfiguration;
  [(CPSessionConfiguration *)&v5 dealloc];
}

- (void)sessionDidConnect:(id)a3
{
}

- (void)_updateLimitedUIStatus
{
  v3 = [(CPSessionConfiguration *)self currentStatus];
  id v6 = [v3 currentSession];

  id v4 = [v6 limitUserInterfaces];
  if ([v4 BOOLValue])
  {
    objc_super v5 = [v6 configuration];
    -[CPSessionConfiguration setLimitedUserInterfaces:](self, "setLimitedUserInterfaces:", -[CPSessionConfiguration convertLimitableUserInterfaces:](self, "convertLimitableUserInterfaces:", [v5 limitableUserInterfaces]));
  }
  else
  {
    [(CPSessionConfiguration *)self setLimitedUserInterfaces:0];
  }
}

- (void)_limitedUIDidChange:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__CPSessionConfiguration__limitedUIDidChange___block_invoke;
  block[3] = &unk_264309D80;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __46__CPSessionConfiguration__limitedUIDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) limitedUserInterfaces];
  [*(id *)(a1 + 32) _updateLimitedUIStatus];
  if (v2 != [*(id *)(a1 + 32) limitedUserInterfaces])
  {
    v3 = [*(id *)(a1 + 32) delegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) delegate];
      objc_msgSend(v5, "sessionConfiguration:limitedUserInterfacesChanged:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "limitedUserInterfaces"));
    }
  }
}

- (unint64_t)convertLimitableUserInterfaces:(unint64_t)a3
{
  id v5 = [(CPSessionConfiguration *)self templateEnvironment];

  if (!v5)
  {
    char HasAudioEntitlement = CPCurrentProcessHasAudioEntitlement();
    unint64_t v8 = a3 & 1;
    if (HasAudioEntitlement) {
      goto LABEL_3;
    }
LABEL_5:
    char v9 = 1;
    return v8 | (a3 >> v9) & 2;
  }
  id v6 = [(CPSessionConfiguration *)self templateEnvironment];
  char v7 = [v6 hasAudioEntitlement];

  unint64_t v8 = a3 & 1;
  if ((v7 & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  char v9 = 2;
  return v8 | (a3 >> v9) & 2;
}

- (void)_updateContentStyleWithScene:(id)a3
{
  if ([a3 contentStyle] == 2) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }

  [(CPSessionConfiguration *)self setContentStyle:v4];
}

- (void)_contentStyleUpdated:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__CPSessionConfiguration__contentStyleUpdated___block_invoke;
  v6[3] = &unk_264309F38;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __47__CPSessionConfiguration__contentStyleUpdated___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) contentStyle];
  v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) object];
  [v3 _updateContentStyleWithScene:v4];

  if (v2 != [*(id *)(a1 + 32) contentStyle])
  {
    id v5 = [*(id *)(a1 + 32) delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) delegate];
      objc_msgSend(v7, "sessionConfiguration:contentStyleChanged:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "contentStyle"));
    }
  }
}

- (CPLimitableUserInterface)limitedUserInterfaces
{
  return self->_limitedUserInterfaces;
}

- (void)setLimitedUserInterfaces:(unint64_t)a3
{
  self->_limitedUserInterfaces = a3;
}

- (CPContentStyle)contentStyle
{
  return self->_contentStyle;
}

- (void)setContentStyle:(unint64_t)a3
{
  self->_contentStyle = a3;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (CARSessionStatus)currentStatus
{
  return self->_currentStatus;
}

- (void)setCurrentStatus:(id)a3
{
}

- (CPSTemplateEnvironment)templateEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_templateEnvironment);

  return (CPSTemplateEnvironment *)WeakRetained;
}

- (void)setTemplateEnvironment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_templateEnvironment);
  objc_storeStrong((id *)&self->_currentStatus, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end