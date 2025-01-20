@interface MicaPlayer
+ (BOOL)BOOLFromDictionary:(id)a3 key:(id)a4 defaultValue:(BOOL)a5;
+ (id)rootDictForPath:(id)a3;
+ (id)updatePublishedObjects:(id)a3 toReferenceLayersInTree:(id)a4 ratherThanLayersInTree:(id)a5;
- (BOOL)isPlaybackAtEnd;
- (BOOL)isPlaying;
- (BOOL)isTimerNeeded;
- (BOOL)loopDuringPlayback;
- (CALayer)rootLayer;
- (MicaPlayer)initWithData:(id)a3 url:(id)a4 retinaScale:(double)a5;
- (MicaPlayer)initWithFileName:(id)a3 retinaScale:(double)a4;
- (MicaPlayer)initWithPath:(id)a3 retinaScale:(double)a4;
- (MicaPlayer)initWithPath:(id)a3 retinaScale:(double)a4 rootLayer:(id)a5 publishedObjects:(id)a6;
- (MicaPlayerDelegate)delegate;
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
- (void)moveAndResizeWithinParentLayer:(id)a3 usingGravity:(id)a4 animate:(BOOL)a5;
- (void)notifyDelegateDidChangePlaybackTime;
- (void)notifyDelegateDidChangePlaybackTimeIsPlaybackAtEnd:(BOOL)a3;
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

@implementation MicaPlayer

- (MicaPlayer)initWithData:(id)a3 url:(id)a4 retinaScale:(double)a5
{
  id v8 = a4;
  v9 = (void *)MEMORY[0x263EFFA08];
  id v10 = a3;
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v9, "setWithObjects:", v11, v12, v13, v14, objc_opt_class(), 0);
  id v26 = 0;
  v16 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v15 fromData:v10 error:&v26];

  id v17 = v26;
  if (v17)
  {
    v18 = [v8 absoluteString];
    NSLog(&cfstr_UnableToOpenMi.isa, v18);

    v19 = [v17 description];
    NSLog(&cfstr_Error_1.isa, v19);
  }
  if (!v16
    || ([v16 objectForKeyedSubscript:@"rootLayer"],
        (v20 = objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_8:
    NSLog(&cfstr_UnableToLoadMi.isa);
    v24 = 0;
    goto LABEL_9;
  }
  v21 = v20;
  objc_msgSend(v20, "setGeometryFlipped:", +[MicaPlayer BOOLFromDictionary:key:defaultValue:](MicaPlayer, "BOOLFromDictionary:key:defaultValue:", v16, @"geometryFlipped", 0) ^ 1);
  [v21 setMasksToBounds:1];
  [v21 setRepeatCount:0.0];
  v22 = [v8 absoluteString];
  v23 = [v16 objectForKeyedSubscript:@"publishedObjects"];
  v24 = [(MicaPlayer *)self initWithPath:v22 retinaScale:v21 rootLayer:v23 publishedObjects:a5];

  if (!v24) {
    goto LABEL_8;
  }
LABEL_9:

  return v24;
}

- (MicaPlayer)initWithFileName:(id)a3 retinaScale:(double)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x263F086E0] mainBundle];
  id v8 = [v7 URLForResource:v6 withExtension:@"caar"];

  if (v8)
  {
    v9 = [v8 path];
    id v10 = [(MicaPlayer *)self initWithPath:v9 retinaScale:a4];
    self = v9;
  }
  else
  {
    NSLog(&cfstr_UnableToFindMi.isa, v6);
    id v10 = 0;
  }

  return v10;
}

- (MicaPlayer)initWithPath:(id)a3 retinaScale:(double)a4
{
  id v6 = a3;
  v7 = +[MicaPlayer rootDictForPath:v6];
  id v8 = v7;
  if (!v7
    || ([v7 objectForKeyedSubscript:@"rootLayer"],
        (v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_6:
    NSLog(&cfstr_UnableToLoadMi_0.isa, v6);
    uint64_t v12 = 0;
    goto LABEL_7;
  }
  id v10 = v9;
  objc_msgSend(v9, "setGeometryFlipped:", +[MicaPlayer BOOLFromDictionary:key:defaultValue:](MicaPlayer, "BOOLFromDictionary:key:defaultValue:", v8, @"geometryFlipped", 0) ^ 1);
  [v10 setMasksToBounds:1];
  [v10 setRepeatCount:0.0];
  uint64_t v11 = [v8 objectForKeyedSubscript:@"publishedObjects"];
  uint64_t v12 = [(MicaPlayer *)self initWithPath:v6 retinaScale:v10 rootLayer:v11 publishedObjects:a4];

  if (!v12) {
    goto LABEL_6;
  }
LABEL_7:

  return v12;
}

- (MicaPlayer)initWithPath:(id)a3 retinaScale:(double)a4 rootLayer:(id)a5 publishedObjects:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MicaPlayer;
  uint64_t v13 = [(MicaPlayer *)&v17 init];
  uint64_t v14 = v13;
  if (v13)
  {
    [(MicaPlayer *)v13 setPath:v10];
    [(MicaPlayer *)v14 setRootLayer:v11];
    [(MicaPlayer *)v14 setPublishedObjects:v12];
    LODWORD(v15) = 1.0;
    [(MicaPlayer *)v14 setPreferredPlaybackSpeed:v15];
    [(MicaPlayer *)v14 setRetinaScale:a4];
    [v11 duration];
    -[MicaPlayer setDocumentDuration:](v14, "setDocumentDuration:");
    [(CALayer *)v14->_rootLayer setDuration:INFINITY];
  }

  return v14;
}

- (void)dealloc
{
  [(MicaPlayer *)self stopPlayTimer];
  v3.receiver = self;
  v3.super_class = (Class)MicaPlayer;
  [(MicaPlayer *)&v3 dealloc];
}

+ (id)rootDictForPath:(id)a3
{
  id v3 = a3;
  v4 = [NSURL fileURLWithPath:v3];
  if (v4)
  {
    id v21 = 0;
    v5 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v4 options:1 error:&v21];
    id v6 = v21;
    if (v6)
    {
      v7 = [v3 lastPathComponent];
      NSLog(&cfstr_UnableToOpenMi.isa, v7);

      id v8 = [v6 description];
      NSLog(&cfstr_Error_1.isa, v8);
    }
    if (v5)
    {
      v9 = (void *)MEMORY[0x263EFFA08];
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, objc_opt_class(), 0);
      id v20 = v6;
      double v15 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v14 fromData:v5 error:&v20];
      id v16 = v20;

      if (v16)
      {
        objc_super v17 = [v3 lastPathComponent];
        NSLog(&cfstr_UnableToOpenMi.isa, v17);

        v18 = [v16 description];
        NSLog(&cfstr_Error_1.isa, v18);
      }
    }
    else
    {
      double v15 = 0;
      id v16 = v6;
    }
  }
  else
  {
    double v15 = 0;
  }

  return v15;
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
  v5 = [(MicaPlayer *)self path];
  id v6 = (void *)[v5 copy];

  v7 = [(MicaPlayer *)self rootLayer];
  id v8 = objc_msgSend(v7, "mp_deepCopyLayer");

  v9 = [(MicaPlayer *)self publishedObjects];
  uint64_t v10 = [(MicaPlayer *)self rootLayer];
  uint64_t v11 = +[MicaPlayer updatePublishedObjects:v9 toReferenceLayersInTree:v8 ratherThanLayersInTree:v10];

  uint64_t v12 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [(MicaPlayer *)self retinaScale];
  uint64_t v13 = objc_msgSend(v12, "initWithPath:retinaScale:rootLayer:publishedObjects:", v6, v8, v11);

  return v13;
}

+ (id)updatePublishedObjects:(id)a3 toReferenceLayersInTree:(id)a4 ratherThanLayersInTree:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v28 = [MEMORY[0x263EFF9A0] dictionary];
  if (v7 && [v7 count])
  {
    uint64_t v10 = objc_msgSend(v9, "mp_allLayersInTree");
    id v24 = v9;
    id v26 = objc_msgSend(v9, "mp_allAnimationsInTree");
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
          v19 = v10;
          id v20 = v11;
          if ((isKindOfClass & 1) != 0
            || (objc_opt_class(), v21 = objc_opt_isKindOfClass(), id v20 = v25, v19 = v26, (v21 & 1) != 0))
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
    [(MicaPlayer *)self pause];
    [(MicaPlayer *)self setPlaybackTime:0.0];
    [(MicaPlayer *)self moveAndResizeWithinParentLayer:v11 usingGravity:v8 animate:0];
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
    [(MicaPlayer *)self pause];
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
  [(MicaPlayer *)self retinaScale];
  -[CALayer mp_moveAndResizeWithinParentLayer:usingGravity:geometryFlipped:retinaScale:animate:](rootLayer, "mp_moveAndResizeWithinParentLayer:usingGravity:geometryFlipped:retinaScale:animate:", v10, v9, 1, v5);
}

- (id)publishedLayerWithKey:(id)a3 required:(BOOL)a4
{
  v4 = [(MicaPlayer *)self publishedObjectWithKey:a3 required:a4];
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
  if (![(MicaPlayer *)self isPlaying])
  {
    double v3 = CACurrentMediaTime();
    [(MicaPlayer *)self playbackTime];
    [(CALayer *)self->_rootLayer setBeginTime:v3 - v4 / self->_preferredPlaybackSpeed];
    [(CALayer *)self->_rootLayer setTimeOffset:0.0];
    *(float *)&double v5 = self->_preferredPlaybackSpeed;
    [(CALayer *)self->_rootLayer setSpeed:v5];
    [(MicaPlayer *)self startPlayTimerIfNeeded];
    [(MicaPlayer *)self notifyDelegateDidStartPlaying];
  }
}

- (void)pause
{
  if ([(MicaPlayer *)self isPlaying])
  {
    [(MicaPlayer *)self playbackTime];
    -[CALayer setTimeOffset:](self->_rootLayer, "setTimeOffset:");
    [(CALayer *)self->_rootLayer setBeginTime:0.0];
    [(CALayer *)self->_rootLayer setSpeed:0.0];
    [(MicaPlayer *)self stopPlayTimer];
    [(MicaPlayer *)self notifyDelegateDidStopPlaying];
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
  if ([(MicaPlayer *)self isPlaying])
  {
    rootLayer = self->_rootLayer;
    *(float *)&double v5 = v4;
    [(CALayer *)rootLayer setSpeed:v5];
  }
}

- (double)playbackTime
{
  if ([(MicaPlayer *)self isPlaying])
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
  BOOL v5 = [(MicaPlayer *)self isPlaying];
  double v6 = 0.0;
  if (v5)
  {
    double v6 = CACurrentMediaTime() - a3;
    a3 = 0.0;
  }
  [(CALayer *)self->_rootLayer setBeginTime:v6];
  [(CALayer *)self->_rootLayer setTimeOffset:a3];
  [(MicaPlayer *)self notifyDelegateDidChangePlaybackTime];
}

- (BOOL)isPlaybackAtEnd
{
  [(MicaPlayer *)self playbackTime];
  double v4 = v3;
  [(MicaPlayer *)self documentDuration];
  return v4 >= v5 + -0.001;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  if ([(MicaPlayer *)self isTimerNeeded])
  {
    [(MicaPlayer *)self startPlayTimerIfNeeded];
  }
  else
  {
    [(MicaPlayer *)self stopPlayTimer];
  }
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
      [v8 micaPlayerDidStartPlaying:self];
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
      [v8 micaPlayerDidStopPlaying:self];
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
      objc_msgSend(v8, "micaPlayerDidChangePlaybackTime:isPlaybackAtEnd:", self, -[MicaPlayer isPlaybackAtEnd](self, "isPlaybackAtEnd"));
    }
  }
}

- (void)notifyDelegateDidChangePlaybackTimeIsPlaybackAtEnd:(BOOL)a3
{
  BOOL v3 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    char v7 = WeakRetained;
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)p_delegate);
      [v10 micaPlayerDidChangePlaybackTime:self isPlaybackAtEnd:v3];
    }
  }
}

- (BOOL)isTimerNeeded
{
  if ([(MicaPlayer *)self isPlaying])
  {
    [(MicaPlayer *)self documentDuration];
    if (v3 == INFINITY)
    {
      double v5 = [(MicaPlayer *)self delegate];
      if (v5)
      {
        id v6 = [(MicaPlayer *)self delegate];
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
    if ([(MicaPlayer *)self isTimerNeeded])
    {
      objc_initWeak(&location, self);
      double v3 = (void *)MEMORY[0x263EFFA20];
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __36__MicaPlayer_startPlayTimerIfNeeded__block_invoke;
      v6[3] = &unk_2643E5D98;
      objc_copyWeak(&v7, &location);
      char v4 = [v3 scheduledTimerWithTimeInterval:1 repeats:v6 block:0.0333333333];
      playTimer = self->_playTimer;
      self->_playTimer = v4;

      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

void __36__MicaPlayer_startPlayTimerIfNeeded__block_invoke(uint64_t a1, void *a2)
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
  BOOL v4 = [(MicaPlayer *)self isPlaybackAtEnd];
  if (v4)
  {
    if (self->_loopDuringPlayback) {
      [(MicaPlayer *)self setPlaybackTime:0.0];
    }
    else {
      [(MicaPlayer *)self pause];
    }
  }
  [(MicaPlayer *)self notifyDelegateDidChangePlaybackTimeIsPlaybackAtEnd:v4];
}

- (MicaPlayerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MicaPlayerDelegate *)WeakRetained;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NSDictionary)publishedObjects
{
  return self->_publishedObjects;
}

- (void)setPublishedObjects:(id)a3
{
}

- (CALayer)rootLayer
{
  return self->_rootLayer;
}

- (void)setRootLayer:(id)a3
{
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
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong((id *)&self->_publishedObjects, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end