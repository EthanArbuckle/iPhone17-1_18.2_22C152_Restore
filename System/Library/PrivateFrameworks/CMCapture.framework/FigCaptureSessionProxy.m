@interface FigCaptureSessionProxy
+ (void)initialize;
- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken;
- (BOOL)containsMovieFileSink;
- (BOOL)containsStillImageSink;
- (BOOL)containsVideoSource;
- (FigCaptureSessionProxy)initWithFigCaptureSession:(OpaqueFigCaptureSession *)a3 identifier:(int64_t)a4 clientAuditToken:(id *)a5 containsVideoSource:(BOOL)a6 containsStillImageSink:(BOOL)a7 containsMovieFileSink:(BOOL)a8;
- (int)openPreviewTapWithDelegate:(id)a3;
- (int64_t)identifier;
- (void)closePreviewTap;
- (void)dealloc;
@end

@implementation FigCaptureSessionProxy

- (void)dealloc
{
  session = self->_session;
  if (session) {
    CFRelease(session);
  }
  v4.receiver = self;
  v4.super_class = (Class)FigCaptureSessionProxy;
  [(FigCaptureSessionProxy *)&v4 dealloc];
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (BOOL)containsVideoSource
{
  return self->_containsVideoSource;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken
{
  long long v3 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

+ (void)initialize
{
}

- (FigCaptureSessionProxy)initWithFigCaptureSession:(OpaqueFigCaptureSession *)a3 identifier:(int64_t)a4 clientAuditToken:(id *)a5 containsVideoSource:(BOOL)a6 containsStillImageSink:(BOOL)a7 containsMovieFileSink:(BOOL)a8
{
  if (a3)
  {
    v17.receiver = self;
    v17.super_class = (Class)FigCaptureSessionProxy;
    v14 = [(FigCaptureSessionProxy *)&v17 init];
    if (v14)
    {
      *((void *)v14 + 1) = CFRetain(a3);
      *((void *)v14 + 2) = a4;
      long long v15 = *(_OWORD *)&a5->var0[4];
      *(_OWORD *)(v14 + 24) = *(_OWORD *)a5->var0;
      *(_OWORD *)(v14 + 40) = v15;
      v14[56] = a6;
      v14[57] = a7;
      v14[58] = a8;
    }
  }
  else
  {

    return 0;
  }
  return (FigCaptureSessionProxy *)v14;
}

- (BOOL)containsStillImageSink
{
  return self->_containsStillImageSink;
}

- (BOOL)containsMovieFileSink
{
  return self->_containsMovieFileSink;
}

- (int)openPreviewTapWithDelegate:(id)a3
{
  if (self->_previewTapOpened)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v4 = FigSignalErrorAt();
    if (!v4) {
      return v4;
    }
    goto LABEL_8;
  }
  self->_previewTapDelegate = (FigCaptureSessionPreviewTapDelegate *)a3;
  int v4 = FigCaptureSessionSetVideoPreviewTapCallback(self->_session, (uint64_t)csp_previewTapCallback, (uint64_t)self);
  if (v4)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_8:
    self->_previewTapDelegate = 0;
    return v4;
  }
  self->_previewTapOpened = 1;
  return v4;
}

- (void)closePreviewTap
{
  if (self->_previewTapOpened)
  {
    int v4 = FigCaptureSessionSetVideoPreviewTapCallback(self->_session, 0, 0);
    if (v4)
    {
      int v5 = v4;
      fig_log_get_emitter();
      LODWORD(v6) = v5;
      FigDebugAssert3();
      -[FigCaptureSessionPreviewTapDelegate captureSessionPreviewTapDidClose:](self->_previewTapDelegate, "captureSessionPreviewTapDidClose:", self, v6, v2);
      self->_previewTapDelegate = 0;
      self->_previewTapOpened = 0;
    }
  }
}

@end