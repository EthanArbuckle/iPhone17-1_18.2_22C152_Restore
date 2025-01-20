@interface AKUIMicaPlayer
+ (BOOL)BOOLFromDictionary:(id)a3 key:(id)a4 defaultValue:(BOOL)a5;
+ (id)rootDictForPath:(id)a3;
+ (id)updatePublishedObjects:(id)a3 toReferenceLayersInTree:(id)a4 ratherThanLayersInTree:(id)a5;
- (AKUIMicaPlayer)initWithFileName:(id)a3 retinaScale:(double)a4;
- (AKUIMicaPlayer)initWithPath:(id)a3 retinaScale:(double)a4;
- (AKUIMicaPlayer)initWithPath:(id)a3 retinaScale:(double)a4 rootLayer:(id)a5 publishedObjects:(id)a6;
- (AKUIMicaPlayerDelegate)delegate;
- (BOOL)isPlaybackAtEnd;
- (BOOL)isPlaying;
- (BOOL)isTimerNeeded;
- (BOOL)loopDuringPlayback;
- (CALayer)rootLayer;
- (NSDictionary)publishedObjects;
- (NSString)path;
- (NSTimer)playTimer;
- (double)documentDuration;
- (double)playbackTime;
- (double)retinaScale;
- (float)preferredPlaybackSpeed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)publishedLayerWithKey:(id)a3 required:(BOOL)a4;
- (id)publishedObjectWithKey:(id)a3 required:(BOOL)a4;
- (void)addToLayer:(id)a3 onTop:(BOOL)a4 gravity:(id)a5;
- (void)dealloc;
- (void)gotoEnd;
- (void)moveAndResizeWithinParentLayer:(id)a3 usingGravity:(id)a4 animate:(BOOL)a5;
- (void)notifyDelegateDidChangePlaybackTime;
- (void)notifyDelegateDidStartPlaying;
- (void)notifyDelegateDidStopPlaying;
- (void)pause;
- (void)play;
- (void)removeFromSuperlayer;
- (void)runPlayTimer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDocumentDuration:(double)a3;
- (void)setLoopDuringPlayback:(BOOL)a3;
- (void)setPath:(id)a3;
- (void)setPlayTimer:(id)a3;
- (void)setPlaybackTime:(double)a3;
- (void)setPreferredPlaybackSpeed:(float)a3;
- (void)setPublishedObjects:(id)a3;
- (void)setRetinaScale:(double)a3;
- (void)setRootLayer:(id)a3;
- (void)startPlayTimerIfNeeded;
- (void)stopPlayTimer;
@end

@implementation AKUIMicaPlayer

- (AKUIMicaPlayer)initWithFileName:(id)a3 retinaScale:(double)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/PrivateFrameworks/AuthKitUI.framework"];
  v8 = (void *)MEMORY[0x1E4F1CB10];
  v9 = [v7 pathForResource:v6 ofType:@"caar"];
  v10 = [v8 fileURLWithPath:v9];

  if (v10)
  {
    v11 = [v10 path];
    v12 = [(AKUIMicaPlayer *)self initWithPath:v11 retinaScale:a4];
    self = v11;
  }
  else
  {
    NSLog(&cfstr_UnableToFindMi.isa, v6);
    v12 = 0;
  }

  return v12;
}

- (AKUIMicaPlayer)initWithPath:(id)a3 retinaScale:(double)a4
{
  id v6 = a3;
  v7 = +[AKUIMicaPlayer rootDictForPath:v6];
  v8 = v7;
  if (!v7
    || ([v7 objectForKeyedSubscript:@"rootLayer"],
        (v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_6:
    NSLog(&cfstr_UnableToLoadMi.isa, v6);
    v12 = 0;
    goto LABEL_7;
  }
  v10 = v9;
  objc_msgSend(v9, "setGeometryFlipped:", +[AKUIMicaPlayer BOOLFromDictionary:key:defaultValue:](AKUIMicaPlayer, "BOOLFromDictionary:key:defaultValue:", v8, @"geometryFlipped", 0) ^ 1);
  [v10 setMasksToBounds:1];
  [v10 setRepeatCount:0.0];
  v11 = [v8 objectForKeyedSubscript:@"publishedObjects"];
  v12 = [(AKUIMicaPlayer *)self initWithPath:v6 retinaScale:v10 rootLayer:v11 publishedObjects:a4];

  if (!v12) {
    goto LABEL_6;
  }
LABEL_7:

  return v12;
}

- (AKUIMicaPlayer)initWithPath:(id)a3 retinaScale:(double)a4 rootLayer:(id)a5 publishedObjects:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)AKUIMicaPlayer;
  v13 = [(AKUIMicaPlayer *)&v17 init];
  v14 = v13;
  if (v13)
  {
    [(AKUIMicaPlayer *)v13 setPath:v10];
    [(AKUIMicaPlayer *)v14 setRootLayer:v11];
    [(AKUIMicaPlayer *)v14 setPublishedObjects:v12];
    LODWORD(v15) = 1.0;
    [(AKUIMicaPlayer *)v14 setPreferredPlaybackSpeed:v15];
    [(AKUIMicaPlayer *)v14 setRetinaScale:a4];
    [v11 duration];
    -[AKUIMicaPlayer setDocumentDuration:](v14, "setDocumentDuration:");
    [(CALayer *)v14->_rootLayer setDuration:INFINITY];
  }

  return v14;
}

- (void)dealloc
{
  [(AKUIMicaPlayer *)self stopPlayTimer];
  v3.receiver = self;
  v3.super_class = (Class)AKUIMicaPlayer;
  [(AKUIMicaPlayer *)&v3 dealloc];
}

+ (id)rootDictForPath:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
  if (v4)
  {
    id v20 = 0;
    v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4 options:1 error:&v20];
    id v6 = v20;
    v7 = v6;
    if (v5)
    {
      v8 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = objc_opt_class();
      v13 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
      id v19 = v7;
      v14 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v13 fromData:v5 error:&v19];
      id v15 = v19;

      if (v15)
      {
        v16 = [v3 lastPathComponent];
        NSLog(&cfstr_UnableToOpenMi.isa, v16);

        objc_super v17 = [v15 description];
        NSLog(&cfstr_Error.isa, v17);
      }
    }
    else
    {
      v14 = 0;
      id v15 = v6;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (BOOL)BOOLFromDictionary:(id)a3 key:(id)a4 defaultValue:(BOOL)a5
{
  id v6 = [a3 objectForKeyedSubscript:a4];
  v7 = v6;
  if (v6) {
    a5 = [v6 BOOLValue];
  }

  return a5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [(AKUIMicaPlayer *)self path];
  id v6 = (void *)[v5 copy];

  v7 = [(AKUIMicaPlayer *)self rootLayer];
  v8 = objc_msgSend(v7, "mp_deepCopyLayer");

  uint64_t v9 = [(AKUIMicaPlayer *)self publishedObjects];
  uint64_t v10 = [(AKUIMicaPlayer *)self rootLayer];
  uint64_t v11 = +[AKUIMicaPlayer updatePublishedObjects:v9 toReferenceLayersInTree:v8 ratherThanLayersInTree:v10];

  uint64_t v12 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [(AKUIMicaPlayer *)self retinaScale];
  v13 = objc_msgSend(v12, "initWithPath:retinaScale:rootLayer:publishedObjects:", v6, v8, v11);

  return v13;
}

+ (id)updatePublishedObjects:(id)a3 toReferenceLayersInTree:(id)a4 ratherThanLayersInTree:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v28 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v7 && [v7 count])
  {
    uint64_t v10 = objc_msgSend(v9, "mp_allLayersInTree");
    id v24 = v9;
    v26 = objc_msgSend(v9, "mp_allAnimationsInTree");
    uint64_t v11 = objc_msgSend(v8, "mp_allLayersInTree");
    v25 = objc_msgSend(v8, "mp_allAnimationsInTree");
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = [v7 allKeys];
    uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          objc_super v17 = [v7 objectForKeyedSubscript:v16];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          id v19 = v10;
          id v20 = v11;
          if ((isKindOfClass & 1) != 0
            || (objc_opt_class(), v21 = objc_opt_isKindOfClass(), v20 = v25, id v19 = v26, (v21 & 1) != 0))
          {
            v22 = objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v19, "indexOfObjectIdenticalTo:", v17));
            [v28 setObject:v22 forKeyedSubscript:v16];
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v13);
    }

    id v9 = v24;
  }

  return v28;
}

- (void)addToLayer:(id)a3 onTop:(BOOL)a4 gravity:(id)a5
{
  BOOL v6 = a4;
  id v11 = a3;
  id v8 = a5;
  id v9 = [(CALayer *)self->_rootLayer superlayer];

  if (!v9)
  {
    [(AKUIMicaPlayer *)self pause];
    [(AKUIMicaPlayer *)self setPlaybackTime:0.0];
    [(AKUIMicaPlayer *)self moveAndResizeWithinParentLayer:v11 usingGravity:v8 animate:0];
    rootLayer = self->_rootLayer;
    if (v6) {
      [v11 addSublayer:rootLayer];
    }
    else {
      [v11 insertSublayer:rootLayer atIndex:0];
    }
  }
}

- (void)removeFromSuperlayer
{
  id v3 = [(CALayer *)self->_rootLayer superlayer];

  if (v3)
  {
    [(AKUIMicaPlayer *)self pause];
    rootLayer = self->_rootLayer;
    [(CALayer *)rootLayer removeFromSuperlayer];
  }
}

- (void)moveAndResizeWithinParentLayer:(id)a3 usingGravity:(id)a4 animate:(BOOL)a5
{
  BOOL v5 = a5;
  rootLayer = self->_rootLayer;
  id v9 = a4;
  id v10 = a3;
  [(AKUIMicaPlayer *)self retinaScale];
  -[CALayer mp_moveAndResizeWithinParentLayer:usingGravity:geometryFlipped:retinaScale:animate:](rootLayer, "mp_moveAndResizeWithinParentLayer:usingGravity:geometryFlipped:retinaScale:animate:", v10, v9, 1, v5);
}

- (id)publishedLayerWithKey:(id)a3 required:(BOOL)a4
{
  v4 = [(AKUIMicaPlayer *)self publishedObjectWithKey:a3 required:a4];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v4 = 0;
    }
  }

  return v4;
}

- (id)publishedObjectWithKey:(id)a3 required:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(NSDictionary *)self->_publishedObjects objectForKeyedSubscript:v6];
  id v8 = (void *)v7;
  if (v4 && !v7)
  {
    id v9 = [(NSString *)self->_path lastPathComponent];
    NSLog(&cfstr_MissingPublish.isa, v6, v9);
  }

  return v8;
}

- (void)play
{
  if (![(AKUIMicaPlayer *)self isPlaying])
  {
    double v3 = CACurrentMediaTime();
    [(AKUIMicaPlayer *)self playbackTime];
    [(CALayer *)self->_rootLayer setBeginTime:v3 - v4 / self->_preferredPlaybackSpeed];
    [(CALayer *)self->_rootLayer setTimeOffset:0.0];
    *(float *)&double v5 = self->_preferredPlaybackSpeed;
    [(CALayer *)self->_rootLayer setSpeed:v5];
    [(AKUIMicaPlayer *)self startPlayTimerIfNeeded];
    [(AKUIMicaPlayer *)self notifyDelegateDidStartPlaying];
  }
}

- (void)pause
{
  if ([(AKUIMicaPlayer *)self isPlaying])
  {
    [(AKUIMicaPlayer *)self playbackTime];
    -[CALayer setTimeOffset:](self->_rootLayer, "setTimeOffset:");
    [(CALayer *)self->_rootLayer setBeginTime:0.0];
    [(CALayer *)self->_rootLayer setSpeed:0.0];
    [(AKUIMicaPlayer *)self stopPlayTimer];
    [(AKUIMicaPlayer *)self notifyDelegateDidStopPlaying];
  }
}

- (void)gotoEnd
{
  if (![(AKUIMicaPlayer *)self isPlaying])
  {
    [(CALayer *)self->_rootLayer setBeginTime:0.0];
    [(AKUIMicaPlayer *)self documentDuration];
    [(CALayer *)self->_rootLayer setTimeOffset:v3 + -0.001];
    [(CALayer *)self->_rootLayer setSpeed:0.0];
    [(AKUIMicaPlayer *)self startPlayTimerIfNeeded];
    [(AKUIMicaPlayer *)self notifyDelegateDidStartPlaying];
  }
}

- (BOOL)isPlaying
{
  [(CALayer *)self->_rootLayer speed];
  return v2 != 0.0;
}

- (void)setPreferredPlaybackSpeed:(float)a3
{
  if (a3 <= 0.0) {
    float v4 = 1.0;
  }
  else {
    float v4 = a3;
  }
  self->_preferredPlaybackSpeed = v4;
  if ([(AKUIMicaPlayer *)self isPlaying])
  {
    rootLayer = self->_rootLayer;
    *(float *)&double v5 = v4;
    [(CALayer *)rootLayer setSpeed:v5];
  }
}

- (double)playbackTime
{
  if ([(AKUIMicaPlayer *)self isPlaying])
  {
    double v3 = CACurrentMediaTime();
    [(CALayer *)self->_rootLayer beginTime];
    double v5 = v3 - v4;
    [(CALayer *)self->_rootLayer speed];
    return v5 * v6;
  }
  else
  {
    rootLayer = self->_rootLayer;
    [(CALayer *)rootLayer timeOffset];
  }
  return result;
}

- (void)setPlaybackTime:(double)a3
{
  BOOL v5 = [(AKUIMicaPlayer *)self isPlaying];
  double v6 = 0.0;
  if (v5)
  {
    double v6 = CACurrentMediaTime() - a3;
    a3 = 0.0;
  }
  [(CALayer *)self->_rootLayer setBeginTime:v6];
  [(CALayer *)self->_rootLayer setTimeOffset:a3];

  [(AKUIMicaPlayer *)self notifyDelegateDidChangePlaybackTime];
}

- (BOOL)isPlaybackAtEnd
{
  [(AKUIMicaPlayer *)self playbackTime];
  double v4 = v3;
  [(AKUIMicaPlayer *)self documentDuration];
  return v4 >= v5 + -0.001;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  if ([(AKUIMicaPlayer *)self isTimerNeeded])
  {
    [(AKUIMicaPlayer *)self startPlayTimerIfNeeded];
  }
  else
  {
    [(AKUIMicaPlayer *)self stopPlayTimer];
  }
}

- (void)setRootLayer:(id)a3
{
  double v4 = (CALayer *)a3;
  double v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AKUIMicaPlayer setRootLayer:]((uint64_t)v4, v5);
  }

  [(CALayer *)v4 setInheritsTiming:0];
  rootLayer = self->_rootLayer;
  self->_rootLayer = v4;
}

- (void)notifyDelegateDidStartPlaying
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    double v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_delegate);
      [v8 AKUIMicaPlayerDidStartPlaying:self];
    }
  }
}

- (void)notifyDelegateDidStopPlaying
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    double v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_delegate);
      [v8 AKUIMicaPlayerDidStopPlaying:self];
    }
  }
}

- (void)notifyDelegateDidChangePlaybackTime
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    double v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_delegate);
      [v8 AKUIMicaPlayerDidChangePlaybackTime:self];
    }
  }
}

- (BOOL)isTimerNeeded
{
  if ([(AKUIMicaPlayer *)self isPlaying])
  {
    [(AKUIMicaPlayer *)self documentDuration];
    if (v3 == INFINITY)
    {
      double v5 = [(AKUIMicaPlayer *)self delegate];
      if (v5)
      {
        id v6 = [(AKUIMicaPlayer *)self delegate];
        char v4 = objc_opt_respondsToSelector();
      }
      else
      {
        char v4 = 0;
      }
    }
    else
    {
      char v4 = 1;
    }
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

- (void)startPlayTimerIfNeeded
{
  if (!self->_playTimer)
  {
    if ([(AKUIMicaPlayer *)self isTimerNeeded])
    {
      objc_initWeak(&location, self);
      double v3 = (void *)MEMORY[0x1E4F1CB00];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __40__AKUIMicaPlayer_startPlayTimerIfNeeded__block_invoke;
      v6[3] = &unk_1E648F608;
      objc_copyWeak(&v7, &location);
      char v4 = [v3 scheduledTimerWithTimeInterval:1 repeats:v6 block:0.0333333333];
      playTimer = self->_playTimer;
      self->_playTimer = v4;

      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

void __40__AKUIMicaPlayer_startPlayTimerIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  float v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained runPlayTimer:v3];
}

- (void)stopPlayTimer
{
  playTimer = self->_playTimer;
  if (playTimer)
  {
    [(NSTimer *)playTimer invalidate];
    char v4 = self->_playTimer;
    self->_playTimer = 0;
  }
}

- (void)runPlayTimer:(id)a3
{
  if ([(AKUIMicaPlayer *)self isPlaybackAtEnd])
  {
    if (self->_loopDuringPlayback) {
      [(AKUIMicaPlayer *)self setPlaybackTime:0.0];
    }
    else {
      [(AKUIMicaPlayer *)self pause];
    }
  }

  [(AKUIMicaPlayer *)self notifyDelegateDidChangePlaybackTime];
}

- (AKUIMicaPlayerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AKUIMicaPlayerDelegate *)WeakRetained;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (CALayer)rootLayer
{
  return self->_rootLayer;
}

- (double)retinaScale
{
  return self->_retinaScale;
}

- (void)setRetinaScale:(double)a3
{
  self->_retinaScale = a3;
}

- (double)documentDuration
{
  return self->_documentDuration;
}

- (void)setDocumentDuration:(double)a3
{
  self->_documentDuration = a3;
}

- (float)preferredPlaybackSpeed
{
  return self->_preferredPlaybackSpeed;
}

- (BOOL)loopDuringPlayback
{
  return self->_loopDuringPlayback;
}

- (void)setLoopDuringPlayback:(BOOL)a3
{
  self->_loopDuringPlayback = a3;
}

- (NSDictionary)publishedObjects
{
  return self->_publishedObjects;
}

- (void)setPublishedObjects:(id)a3
{
}

- (NSTimer)playTimer
{
  return self->_playTimer;
}

- (void)setPlayTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playTimer, 0);
  objc_storeStrong((id *)&self->_publishedObjects, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong((id *)&self->_path, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setRootLayer:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1C38C1000, a2, OS_LOG_TYPE_DEBUG, "Disabling inherits timing on root layer: %@", (uint8_t *)&v2, 0xCu);
}

@end