@interface FigCameraViewfinderSession
- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken;
- (BOOL)usesMovieFileOutput;
- (BOOL)usesPhotoOutput;
- (FigCameraViewfinderSession)init;
- (id)description;
- (id)initSubclass;
- (void)closePreviewStream;
- (void)dealloc;
- (void)openPreviewStreamWithOptions:(id)a3;
@end

@implementation FigCameraViewfinderSession

- (id)initSubclass
{
  v3.receiver = self;
  v3.super_class = (Class)FigCameraViewfinderSession;
  return [(FigCameraViewfinderSession *)&v3 init];
}

- (FigCameraViewfinderSession)init
{
  v2 = [(FigCameraViewfinderSession *)self initSubclass];
  if (v2)
  {
    uint64_t v3 = objc_opt_class();
    if (v3 == objc_opt_class())
    {
      v4 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v5 = *MEMORY[0x1E4F1C3C8];
      v6 = (objc_class *)objc_opt_class();
      [v4 raise:v5, @"*** -%@ cannot be instantiated directly, it is vended by FigCameraViewfinder!", NSStringFromClass(v6) format];

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCameraViewfinderSession;
  [(FigCameraViewfinderSession *)&v3 dealloc];
}

- (id)description
{
  if (self) {
    [(FigCameraViewfinderSession *)self clientAuditToken];
  }
  else {
    memset(v7, 0, sizeof(v7));
  }
  uint64_t PIDFromAuditToken = FigCaptureGetPIDFromAuditToken(v7);
  v4 = NSString;
  uint64_t v5 = (objc_class *)objc_opt_class();
  return (id)[v4 stringWithFormat:@"<%@: %p pid:%d photoOutput:%d movieFileOutput:%d>", NSStringFromClass(v5), self, PIDFromAuditToken, -[FigCameraViewfinderSession usesPhotoOutput](self, "usesPhotoOutput"), -[FigCameraViewfinderSession usesMovieFileOutput](self, "usesMovieFileOutput")];
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken
{
  v6 = (objc_class *)objc_opt_class();
  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)_requestConcreteImplementation((objc_class *)self, a3, v6);
  *(void *)&long long v8 = -1;
  *((void *)&v8 + 1) = -1;
  *(_OWORD *)retstr->var0 = v8;
  *(_OWORD *)&retstr->var0[4] = v8;
  return result;
}

- (BOOL)usesPhotoOutput
{
  v4 = (objc_class *)objc_opt_class();
  _requestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (BOOL)usesMovieFileOutput
{
  v4 = (objc_class *)objc_opt_class();
  _requestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (void)openPreviewStreamWithOptions:(id)a3
{
  uint64_t v5 = (objc_class *)objc_opt_class();
  _requestConcreteImplementation((objc_class *)self, a2, v5);
}

- (void)closePreviewStream
{
  v4 = (objc_class *)objc_opt_class();
  _requestConcreteImplementation((objc_class *)self, a2, v4);
}

@end