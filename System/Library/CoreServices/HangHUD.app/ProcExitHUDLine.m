@interface ProcExitHUDLine
- (CATextLayer)exitedProcNameLayer;
- (ExitReasonLayer)exitReasonLayer;
- (ProcExitHUDLine)initWithProcExitRecord:(id)a3 theme:(id)a4 lineDelegate:(id)a5;
- (void)nilifyCALayers;
- (void)setFontSize:(double)a3;
- (void)update:(id)a3 options:(unint64_t)a4;
@end

@implementation ProcExitHUDLine

- (ProcExitHUDLine)initWithProcExitRecord:(id)a3 theme:(id)a4 lineDelegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)ProcExitHUDLine;
  v11 = [(HUDLine *)&v29 init];
  if (v11)
  {
    [(HUDLine *)v11 setSpacing:sub_10001AB84()];
    id v12 = [v9 currentProcessExitTextColor];
    uint64_t v13 = +[CATextLayer layer];
    exitedProcNameLayer = v11->_exitedProcNameLayer;
    v11->_exitedProcNameLayer = (CATextLayer *)v13;

    [(CATextLayer *)v11->_exitedProcNameLayer setTruncationMode:kCATruncationEnd];
    if (qword_10003E9C0 != -1) {
      dispatch_once(&qword_10003E9C0, &stru_100030C88);
    }
    [(CATextLayer *)v11->_exitedProcNameLayer setFont:qword_10003E9C8];
    sub_10001A688();
    -[CATextLayer setFontSize:](v11->_exitedProcNameLayer, "setFontSize:");
    [(HUDLine *)v11 contentScaleForTexts];
    -[CATextLayer setContentsScale:](v11->_exitedProcNameLayer, "setContentsScale:");
    v15 = [v8 processName];
    [(CATextLayer *)v11->_exitedProcNameLayer setString:v15];

    [(CATextLayer *)v11->_exitedProcNameLayer setForegroundColor:v12];
    [(HUDLine *)v11 setVibrancyFilter:v11->_exitedProcNameLayer];
    v16 = +[CATextLayer layer];
    id v28 = v12;
    if (qword_10003E9E0 != -1) {
      dispatch_once(&qword_10003E9E0, &stru_100030CC8);
    }
    [v16 setFont:qword_10003E9E8];
    sub_10001A688();
    objc_msgSend(v16, "setFontSize:");
    [(HUDLine *)v11 contentScaleForTexts];
    objc_msgSend(v16, "setContentsScale:");
    [v16 setAlignmentMode:kCAAlignmentRight];
    id v17 = objc_alloc_init((Class)NSString);
    v18 = +[NSSet setWithObject:&off_100035B40];
    v19 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v8 exitReasonNamespace]);
    unsigned __int8 v20 = [v18 containsObject:v19];

    if ((v20 & 1) == 0)
    {
      uint64_t v21 = sub_100011868([v8 exitReasonNamespace]);

      id v17 = (id)v21;
    }
    [v16 setString:v17];
    objc_msgSend(v16, "setForegroundColor:", objc_msgSend(v9, "processExitReasonNamespaceTextColor"));
    v22 = +[CATextLayer layer];
    if (qword_10003E9D0 != -1) {
      dispatch_once(&qword_10003E9D0, &stru_100030CA8);
    }
    [v22 setFont:qword_10003E9D8];
    sub_10001A688();
    objc_msgSend(v22, "setFontSize:");
    [(HUDLine *)v11 contentScaleForTexts];
    objc_msgSend(v22, "setContentsScale:");
    [v22 setAlignmentMode:kCAAlignmentRight];
    v23 = sub_100012C20((int)[v8 exitReasonNamespace], (uint64_t)objc_msgSend(v8, "exitReasonCode"));
    [v22 setString:v23];

    [v22 setForegroundColor:v28];
    v24 = [[ExitReasonLayer alloc] initWithNamespaceLayer:v16 codeLayer:v22];
    exitReasonLayer = v11->_exitReasonLayer;
    v11->_exitReasonLayer = v24;

    [(HUDLine *)v11 setVibrancyFilter:v11->_exitReasonLayer];
    [(ProcExitHUDLine *)v11 addSublayer:v11->_exitReasonLayer];
    [(ProcExitHUDLine *)v11 addSublayer:v11->_exitedProcNameLayer];
    [(HUDLine *)v11 setKeyLayer:v11->_exitedProcNameLayer];
    [(HUDLine *)v11 setValueLayer:v11->_exitReasonLayer];
    [(HUDLine *)v11 setLineDelegate:v10];
  }

  return v11;
}

- (void)nilifyCALayers
{
  exitedProcNameLayer = self->_exitedProcNameLayer;
  if (exitedProcNameLayer)
  {
    self->_exitedProcNameLayer = 0;
  }
  exitReasonLayer = self->_exitReasonLayer;
  if (exitReasonLayer)
  {
    [(ExitReasonLayer *)exitReasonLayer nilifyCALayers];
    v5 = self->_exitReasonLayer;
    self->_exitReasonLayer = 0;
  }
}

- (void)setFontSize:(double)a3
{
  -[CATextLayer setFontSize:](self->_exitedProcNameLayer, "setFontSize:");
  v5 = [(ExitReasonLayer *)self->_exitReasonLayer exitReasonNamespaceTextLayer];
  [v5 setFontSize:a3];

  id v6 = [(ExitReasonLayer *)self->_exitReasonLayer exitReasonCodeTextLayer];
  [v6 setFontSize:a3];
}

- (void)update:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  unsigned __int8 v7 = [(HUDLine *)self updatesComplete];
  if ((v4 & 1) == 0 && (v7 & 1) == 0)
  {
    id v8 = sub_100006A20();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10001CE60(v6);
    }

    [(HUDLine *)self setUpdatesComplete:1];
  }
}

- (CATextLayer)exitedProcNameLayer
{
  return self->_exitedProcNameLayer;
}

- (ExitReasonLayer)exitReasonLayer
{
  return self->_exitReasonLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitReasonLayer, 0);

  objc_storeStrong((id *)&self->_exitedProcNameLayer, 0);
}

@end