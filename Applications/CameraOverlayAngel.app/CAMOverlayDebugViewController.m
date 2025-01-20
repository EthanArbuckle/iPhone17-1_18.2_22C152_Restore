@interface CAMOverlayDebugViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)panning;
- (BOOL)visible;
- (CAMOverlayClientConnection)connection;
- (CAMOverlayDebugViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UILabel)label;
- (void)adoptConnection:(id)a3;
- (void)dealloc;
- (void)handlePan:(id)a3;
- (void)invalidateConnection:(id)a3;
- (void)serverLostConnectionFromProcessID:(int64_t)a3;
- (void)setConnection:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPanning:(BOOL)a3;
- (void)setVisible:(BOOL)a3;
- (void)tearDownScene:(id)a3;
- (void)toggleVisible:(id)a3;
- (void)updateLabel;
- (void)viewDidLoad;
@end

@implementation CAMOverlayDebugViewController

- (CAMOverlayDebugViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)CAMOverlayDebugViewController;
  v4 = [(CAMOverlayDebugViewController *)&v15 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = os_log_create("com.apple.camera.overlay", "Angel");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138543362;
      v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);
    }
    v8 = +[CAMOverlayServer sharedInstance];
    v9 = [v8 allConnections];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100005A50;
    v13[3] = &unk_10001C838;
    v10 = v4;
    v14 = v10;
    [v9 enumerateObjectsUsingBlock:v13];
    v11 = +[CAMOverlayServer sharedInstance];
    [v11 addObserver:v10];
  }
  return v4;
}

- (void)dealloc
{
  v3 = os_log_create("com.apple.camera.overlay", "Angel");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543362;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deallocating %{public}@", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)CAMOverlayDebugViewController;
  [(CAMOverlayDebugViewController *)&v6 dealloc];
}

- (void)serverLostConnectionFromProcessID:(int64_t)a3
{
  v5 = [(CAMOverlayDebugViewController *)self connection];
  objc_super v6 = [v5 auditToken];
  id v7 = [v6 versionedPID];

  if (v7 == (id)a3)
  {
    v8 = [(CAMOverlayDebugViewController *)self connection];
    [v8 removeObserver:self];

    [(CAMOverlayDebugViewController *)self setConnection:0];
  }
}

- (void)adoptConnection:(id)a3
{
  id v4 = a3;
  v5 = [(CAMOverlayDebugViewController *)self connection];
  [v5 removeObserver:self];

  [(CAMOverlayDebugViewController *)self setConnection:v4];
  [v4 addObserver:self];

  [(CAMOverlayDebugViewController *)self updateLabel];
}

- (void)viewDidLoad
{
  v42.receiver = self;
  v42.super_class = (Class)CAMOverlayDebugViewController;
  [(CAMOverlayDebugViewController *)&v42 viewDidLoad];
  id v3 = objc_alloc_init((Class)UILabel);
  [(CAMOverlayDebugViewController *)self setLabel:v3];

  id v4 = [(CAMOverlayDebugViewController *)self label];
  [v4 setUserInteractionEnabled:1];

  v5 = [(CAMOverlayDebugViewController *)self label];
  [v5 setTextAlignment:0];

  objc_super v6 = [(CAMOverlayDebugViewController *)self label];
  [v6 setNumberOfLines:0];

  id v7 = +[UIColor whiteColor];
  v8 = [(CAMOverlayDebugViewController *)self label];
  [v8 setTextColor:v7];

  v9 = +[UIColor colorWithWhite:0.0 alpha:0.3];
  v10 = [(CAMOverlayDebugViewController *)self label];
  [v10 setBackgroundColor:v9];

  v11 = [(CAMOverlayDebugViewController *)self view];
  v12 = [(CAMOverlayDebugViewController *)self label];
  [v11 addSubview:v12];

  v13 = [(CAMOverlayDebugViewController *)self label];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

  v14 = [(CAMOverlayDebugViewController *)self label];
  objc_super v15 = [v14 centerXAnchor];
  v16 = [(CAMOverlayDebugViewController *)self view];
  v17 = [v16 centerXAnchor];
  v18 = [v15 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  v19 = [(CAMOverlayDebugViewController *)self label];
  v20 = [v19 centerYAnchor];
  v21 = [(CAMOverlayDebugViewController *)self view];
  v22 = [v21 centerYAnchor];
  v23 = [v20 constraintEqualToAnchor:v22];
  [v23 setActive:1];

  v24 = [(CAMOverlayDebugViewController *)self label];
  v25 = [v24 widthAnchor];
  v26 = [(CAMOverlayDebugViewController *)self view];
  v27 = [v26 widthAnchor];
  v28 = [v25 constraintEqualToAnchor:v27 multiplier:0.8];
  [v28 setActive:1];

  v29 = [(CAMOverlayDebugViewController *)self label];
  v30 = [v29 heightAnchor];
  v31 = [(CAMOverlayDebugViewController *)self label];
  v32 = [v31 widthAnchor];
  v33 = [v30 constraintEqualToAnchor:v32];
  [v33 setActive:1];

  id v34 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"toggleVisible:"];
  v35 = [(CAMOverlayDebugViewController *)self label];
  [v35 addGestureRecognizer:v34];

  id v36 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"invalidateConnection:"];
  [v36 setNumberOfTouchesRequired:2];
  v37 = [(CAMOverlayDebugViewController *)self label];
  [v37 addGestureRecognizer:v36];

  id v38 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"tearDownScene:"];
  [v38 setNumberOfTouchesRequired:3];
  v39 = [(CAMOverlayDebugViewController *)self label];
  [v39 addGestureRecognizer:v38];

  id v40 = [objc_alloc((Class)UIPanGestureRecognizer) initWithTarget:self action:"handlePan:"];
  v41 = [(CAMOverlayDebugViewController *)self label];
  [v41 addGestureRecognizer:v40];

  [(CAMOverlayDebugViewController *)self updateLabel];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)toggleVisible:(id)a3
{
  [(CAMOverlayDebugViewController *)self setVisible:[(CAMOverlayDebugViewController *)self visible] ^ 1];

  [(CAMOverlayDebugViewController *)self updateLabel];
}

- (void)invalidateConnection:(id)a3
{
  id v4 = [(CAMOverlayDebugViewController *)self connection];
  [v4 invalidate];

  [(CAMOverlayDebugViewController *)self setConnection:0];

  [(CAMOverlayDebugViewController *)self updateLabel];
}

- (void)tearDownScene:(id)a3
{
  id v6 = +[UIApplication sharedApplication];
  id v3 = [v6 connectedScenes];
  id v4 = [v3 anyObject];

  v5 = [v4 session];
  [v6 requestSceneSessionDestruction:v5 options:0 errorHandler:&stru_10001C878];
}

- (void)handlePan:(id)a3
{
  id v5 = a3;
  if ([v5 state] == (id)3)
  {
    [(CAMOverlayDebugViewController *)self setPanning:0];
  }
  else if ([v5 state] == (id)2)
  {
    if (![(CAMOverlayDebugViewController *)self panning]) {
      [(CAMOverlayDebugViewController *)self setPanning:1];
    }
    id v4 = [(CAMOverlayDebugViewController *)self label];
    [v5 setTranslation:CGPointZero.x, CGPointZero.y];
  }
}

- (void)updateLabel
{
  v2 = +[CAMOverlayServer sharedInstance];
  id v3 = [v2 allConnections];

  id v40 = v3;
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v5 = +[CAMOverlayServer sharedInstance];
  id v6 = [v5 allConnections];

  id v7 = [v6 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v46;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v46 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        v12 = CAMStringForOverlayClientConnectionStatus((unint64_t)[v11 status]);
        v13 = [v11 auditToken];
        v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lld (%@)", [v13 versionedPID], v12);

        [v4 addObject:v14];
      }
      id v8 = [v6 countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v8);
  }

  v37 = v4;
  id v38 = [v4 componentsJoinedByString:@"\n    "];
  objc_super v15 = [0 allKeys];
  v16 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [0 count]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v17 = v15;
  id v18 = [v17 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v42;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v42 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v41 + 1) + 8 * (void)j);
        v23 = [0 objectForKeyedSubscript:v22];
        v24 = +[NSString stringWithFormat:@"%@: %@", v22, v23];

        [v16 addObject:v24];
      }
      id v19 = [v17 countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v19);
  }
  id v36 = v17;

  v25 = [v16 componentsJoinedByString:@"\n        "];
  id v26 = [v3 count];
  v27 = [(CAMOverlayDebugViewController *)self connection];
  v28 = [v27 auditToken];
  id v29 = [v28 versionedPID];
  v30 = [(CAMOverlayDebugViewController *)self connection];
  v31 = CAMStringForOverlayClientConnectionStatus((unint64_t)[v30 status]);
  unsigned int v32 = [(CAMOverlayDebugViewController *)self visible];
  CFStringRef v33 = @"hidden";
  if (v32) {
    CFStringRef v33 = @"visible";
  }
  id v34 = +[NSString stringWithFormat:@"    Server: %lu connection(s) \n        %@ \n    Active VPID: %lld \n        status: %@\n    Controls: \n        %@ \n    \n    Overlay: %@\n        ", v26, v38, v29, v31, v25, v33];
  v35 = [(CAMOverlayDebugViewController *)self label];
  [v35 setText:v34];
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (BOOL)panning
{
  return self->_panning;
}

- (void)setPanning:(BOOL)a3
{
  self->_panning = a3;
}

- (CAMOverlayClientConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  self->_connection = (CAMOverlayClientConnection *)a3;
}

- (void).cxx_destruct
{
}

@end