@interface AUGenericViewController
- (AUAudioUnit)auAudioUnit;
- (AUGenericViewController)init;
- (_TtC12CoreAudioKit21AUGenericViewInternal)genericView;
- (id)getAuAudioUnit;
- (void)addGestureObservers;
- (void)genericViewBeginGestureMessageReceived:(id)a3;
- (void)genericViewEndGestureMessageReceived:(id)a3;
- (void)genericViewNotificationMessageReceived:(id)a3;
- (void)setAuAudioUnit:(AUAudioUnit *)auAudioUnit;
- (void)setAudioUnit:(OpaqueAudioComponentInstance *)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AUGenericViewController

- (AUGenericViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)AUGenericViewController;
  v2 = [(AUGenericViewController *)&v6 init];
  v3 = -[AUGenericViewInternal initWithFrame:]([_TtC12CoreAudioKit21AUGenericViewInternal alloc], "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
  genericView = v2->_genericView;
  v2->_genericView = v3;

  [(AUGenericViewInternal *)v2->_genericView setAutoresizingMask:18];
  [(AUGenericViewInternal *)v2->_genericView setOwningController:v2];
  return v2;
}

- (void)genericViewNotificationMessageReceived:(id)a3
{
  v4 = [a3 userInfo];
  if (v4)
  {
    id v14 = v4;
    v5 = [v4 objectForKeyedSubscript:@"param.address"];
    uint64_t v6 = [v5 unsignedLongLongValue];

    v7 = [v14 objectForKeyedSubscript:@"param.value"];
    [v7 floatValue];
    int v9 = v8;

    v10 = [(AUAudioUnit *)self->_auAudioUnit parameterTree];
    v11 = [v10 parameterWithAddress:v6];

    v12 = [(AUGenericViewInternal *)self->_genericView paramObserverToken];
    LODWORD(v13) = v9;
    [v11 setValue:v12 originator:0 atHostTime:0 eventType:v13];

    v4 = v14;
  }
}

- (void)genericViewBeginGestureMessageReceived:(id)a3
{
  v4 = [a3 userInfo];
  if (v4)
  {
    id v14 = v4;
    v5 = [v4 objectForKeyedSubscript:@"param.address"];
    uint64_t v6 = [v5 unsignedLongLongValue];

    v7 = [v14 objectForKeyedSubscript:@"param.value"];
    [v7 floatValue];
    int v9 = v8;

    v10 = [(AUAudioUnit *)self->_auAudioUnit parameterTree];
    v11 = [v10 parameterWithAddress:v6];

    v12 = [(AUGenericViewInternal *)self->_genericView paramObserverToken];
    LODWORD(v13) = v9;
    [v11 setValue:v12 originator:0 atHostTime:1 eventType:v13];

    v4 = v14;
  }
}

- (void)genericViewEndGestureMessageReceived:(id)a3
{
  v4 = [a3 userInfo];
  if (v4)
  {
    id v14 = v4;
    v5 = [v4 objectForKeyedSubscript:@"param.address"];
    uint64_t v6 = [v5 unsignedLongLongValue];

    v7 = [v14 objectForKeyedSubscript:@"param.value"];
    [v7 floatValue];
    int v9 = v8;

    v10 = [(AUAudioUnit *)self->_auAudioUnit parameterTree];
    v11 = [v10 parameterWithAddress:v6];

    v12 = [(AUGenericViewInternal *)self->_genericView paramObserverToken];
    LODWORD(v13) = v9;
    [v11 setValue:v12 originator:0 atHostTime:2 eventType:v13];

    v4 = v14;
  }
}

- (void)setAuAudioUnit:(AUAudioUnit *)auAudioUnit
{
  v4 = auAudioUnit;
  [(AUGenericViewInternal *)self->_genericView setAuAudioUnit:v4];
  v5 = self->_auAudioUnit;
  self->_auAudioUnit = v4;
}

- (id)getAuAudioUnit
{
  return self->_auAudioUnit;
}

- (void)setAudioUnit:(OpaqueAudioComponentInstance *)a3
{
  id v4 = [MEMORY[0x263F28DA0] auAudioUnitForAudioUnit:a3];
  [(AUGenericViewController *)self setAuAudioUnit:v4];
}

- (void)addGestureObservers
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_genericViewNotificationMessageReceived_ name:genericViewNotificationMessageName object:self->_genericView];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_genericViewBeginGestureMessageReceived_ name:genericViewNotificationBeginGestureName object:self->_genericView];

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel_genericViewEndGestureMessageReceived_ name:genericViewNotificationEndGestureName object:self->_genericView];
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)AUGenericViewController;
  [(AUGenericViewController *)&v16 viewDidLoad];
  v3 = [(AUGenericViewController *)self view];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(AUGenericViewController *)self genericView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  double v13 = [(AUGenericViewController *)self view];
  id v14 = [(AUGenericViewController *)self genericView];
  [v13 addSubview:v14];

  v15 = [(AUGenericViewController *)self view];
  [v15 setAutoresizingMask:18];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AUGenericViewController;
  [(AUGenericViewController *)&v5 viewWillDisappear:a3];
  double v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AUGenericViewController;
  [(AUGenericViewController *)&v4 viewWillAppear:a3];
  [(AUGenericViewController *)self addGestureObservers];
}

- (AUAudioUnit)auAudioUnit
{
  return self->_auAudioUnit;
}

- (_TtC12CoreAudioKit21AUGenericViewInternal)genericView
{
  return (_TtC12CoreAudioKit21AUGenericViewInternal *)objc_getProperty(self, a2, 984, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genericView, 0);

  objc_storeStrong((id *)&self->_auAudioUnit, 0);
}

@end