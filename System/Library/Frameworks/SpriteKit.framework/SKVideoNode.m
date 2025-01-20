@interface SKVideoNode
+ (BOOL)supportsSecureCoding;
+ (SKVideoNode)videoNodeWithAVPlayer:(AVPlayer *)player;
+ (SKVideoNode)videoNodeWithFileNamed:(NSString *)videoFile;
+ (SKVideoNode)videoNodeWithURL:(NSURL *)videoURL;
+ (SKVideoNode)videoNodeWithVideoFileNamed:(NSString *)videoFile;
+ (SKVideoNode)videoNodeWithVideoURL:(NSURL *)videoURL;
+ (id)debugHierarchyPropertyDescriptions;
+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
- (AVPlayer)_player;
- (BOOL)isEqualToNode:(id)a3;
- (CGPoint)anchorPoint;
- (CGSize)size;
- (SKVideoNode)init;
- (SKVideoNode)initWithAVPlayer:(AVPlayer *)player;
- (SKVideoNode)initWithCoder:(NSCoder *)aDecoder;
- (SKVideoNode)initWithFileNamed:(NSString *)videoFile;
- (SKVideoNode)initWithURL:(NSURL *)url;
- (SKVideoNode)initWithVideoFileNamed:(NSString *)videoFile;
- (SKVideoNode)initWithVideoURL:(NSURL *)url;
- (id)description;
- (void)_didMakeBackingNode;
- (void)_makeBackingNode;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pause;
- (void)play;
- (void)setAnchorPoint:(CGPoint)anchorPoint;
- (void)setPaused:(BOOL)a3;
- (void)setSize:(CGSize)size;
- (void)set_player:(id)a3;
@end

@implementation SKVideoNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  skcVideoNode = (id *)self->_skcVideoNode;
  if (skcVideoNode)
  {
    v4 = SKCVideoNode::getPlayer(skcVideoNode);
    v5 = v4;
    if (self->_isUsingKVO && v4 != 0)
    {
      [v4 removeObserver:self forKeyPath:@"rate"];
      [v5 removeObserver:self forKeyPath:@"currentItem"];
    }
  }
  else
  {
    v5 = 0;
  }

  v7.receiver = self;
  v7.super_class = (Class)SKVideoNode;
  [(SKNode *)&v7 dealloc];
}

- (AVPlayer)_player
{
  return (AVPlayer *)SKCVideoNode::getPlayer((id *)self->_skcVideoNode);
}

- (void)set_player:(id)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SKVideoNode;
  [(SKNode *)&v10 encodeWithCoder:v4];
  [v4 encodeObject:self->_videoFileName forKey:@"_videoFileName"];
  [v4 encodeObject:self->_videoFileURL forKey:@"_videoFileURL"];
  v5 = (void *)MEMORY[0x263F08D40];
  [(SKVideoNode *)self size];
  double v7 = v6;
  [(SKVideoNode *)self size];
  v9 = objc_msgSend(v5, "valueWithCGRect:", 0.0, 0.0, v7, v8);
  [v4 encodeObject:v9 forKey:@"_bounds"];
}

- (SKVideoNode)init
{
  v5.receiver = self;
  v5.super_class = (Class)SKVideoNode;
  v2 = [(SKNode *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SKVideoNode *)v2 commonInit];
  }
  return v3;
}

- (SKVideoNode)initWithCoder:(NSCoder *)aDecoder
{
  id v4 = aDecoder;
  v24.receiver = self;
  v24.super_class = (Class)SKVideoNode;
  objc_super v5 = [(SKNode *)&v24 initWithCoder:v4];
  double v6 = v5;
  if (v5)
  {
    [(SKVideoNode *)v5 commonInit];
    double v7 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bounds"];
    [v7 CGRectValue];
    double v9 = v8;
    double v11 = v10;

    [(SKNode *)v6 xScale];
    double v13 = v12;
    [(SKNode *)v6 yScale];
    -[SKVideoNode setSize:](v6, "setSize:", v9 * v13, v11 * v14);
    uint64_t v15 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_videoFileName"];
    videoFileName = v6->_videoFileName;
    v6->_videoFileName = (NSString *)v15;

    uint64_t v17 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_videoFileURL"];
    videoFileURL = v6->_videoFileURL;
    v6->_videoFileURL = (NSURL *)v17;

    if (v6->_videoFileName)
    {
      v19 = SKGetResourceBundle();
      v20 = [v19 URLForResource:v6->_videoFileName withExtension:0];
    }
    else
    {
      v21 = v6->_videoFileURL;
      if (v21) {
        v20 = v21;
      }
      else {
        v20 = 0;
      }
    }
    v22 = [MEMORY[0x263EFA470] assetWithURL:v20];
    SKCVideoNode::loadAVAsset((SKCVideoNode *)v6->_skcVideoNode, v22);
  }
  return v6;
}

- (SKVideoNode)initWithVideoURL:(NSURL *)url
{
  id v4 = url;
  v9.receiver = self;
  v9.super_class = (Class)SKVideoNode;
  objc_super v5 = [(SKNode *)&v9 init];
  double v6 = v5;
  if (v5)
  {
    [(SKVideoNode *)v5 commonInit];
    if (v4)
    {
      double v7 = [MEMORY[0x263EFA470] assetWithURL:v4];
      SKCVideoNode::loadAVAsset((SKCVideoNode *)v6->_skcVideoNode, v7);
    }
  }

  return v6;
}

- (SKVideoNode)initWithVideoFileNamed:(NSString *)videoFile
{
  id v4 = videoFile;
  v11.receiver = self;
  v11.super_class = (Class)SKVideoNode;
  objc_super v5 = [(SKNode *)&v11 init];
  double v6 = v5;
  if (v5)
  {
    [(SKVideoNode *)v5 commonInit];
    double v7 = SKGetResourceBundle();
    double v8 = [v7 URLForResource:v4 withExtension:0];

    if (v8)
    {
      objc_super v9 = [MEMORY[0x263EFA470] assetWithURL:v8];
      SKCVideoNode::loadAVAsset((SKCVideoNode *)v6->_skcVideoNode, v9);
    }
  }

  return v6;
}

- (SKVideoNode)initWithFileNamed:(NSString *)videoFile
{
  objc_super v5 = videoFile;
  v12.receiver = self;
  v12.super_class = (Class)SKVideoNode;
  double v6 = [(SKNode *)&v12 init];
  double v7 = v6;
  if (v6)
  {
    [(SKVideoNode *)v6 commonInit];
    objc_storeStrong((id *)&v7->_videoFileName, videoFile);
    double v8 = SKGetResourceBundle();
    objc_super v9 = [v8 URLForResource:v5 withExtension:0];

    if (v9)
    {
      double v10 = [MEMORY[0x263EFA470] assetWithURL:v9];
      SKCVideoNode::loadAVAsset((SKCVideoNode *)v7->_skcVideoNode, v10);
    }
  }

  return v7;
}

- (SKVideoNode)initWithURL:(NSURL *)url
{
  id v4 = url;
  v9.receiver = self;
  v9.super_class = (Class)SKVideoNode;
  objc_super v5 = [(SKNode *)&v9 init];
  double v6 = v5;
  if (v5)
  {
    [(SKVideoNode *)v5 commonInit];
    if (v4)
    {
      double v7 = [MEMORY[0x263EFA470] assetWithURL:v4];
      SKCVideoNode::loadAVAsset((SKCVideoNode *)v6->_skcVideoNode, v7);
    }
  }

  return v6;
}

- (SKVideoNode)initWithAVPlayer:(AVPlayer *)player
{
  id v4 = player;
  v8.receiver = self;
  v8.super_class = (Class)SKVideoNode;
  objc_super v5 = [(SKNode *)&v8 init];
  double v6 = v5;
  if (v5)
  {
    [(SKVideoNode *)v5 commonInit];
    if (v4)
    {
      SKCVideoNode::setPlayer((id *)v6->_skcVideoNode, v4);
      v6->_isUsingKVO = 1;
      [(AVPlayer *)v4 addObserver:v6 forKeyPath:@"rate" options:1 context:0];
      [(AVPlayer *)v4 addObserver:v6 forKeyPath:@"currentItem" options:1 context:0];
    }
  }

  return v6;
}

+ (SKVideoNode)videoNodeWithVideoFileNamed:(NSString *)videoFile
{
  v3 = [a1 videoNodeWithFileNamed:videoFile];

  return (SKVideoNode *)v3;
}

+ (SKVideoNode)videoNodeWithVideoURL:(NSURL *)videoURL
{
  v3 = [a1 videoNodeWithURL:videoURL];

  return (SKVideoNode *)v3;
}

+ (SKVideoNode)videoNodeWithFileNamed:(NSString *)videoFile
{
  id v4 = videoFile;
  objc_super v5 = (void *)[objc_alloc((Class)a1) initWithFileNamed:v4];

  return (SKVideoNode *)v5;
}

+ (SKVideoNode)videoNodeWithURL:(NSURL *)videoURL
{
  id v4 = videoURL;
  objc_super v5 = (void *)[objc_alloc((Class)a1) initWithURL:v4];

  return (SKVideoNode *)v5;
}

+ (SKVideoNode)videoNodeWithAVPlayer:(AVPlayer *)player
{
  v3 = player;
  id v4 = [[SKVideoNode alloc] initWithAVPlayer:v3];

  return v4;
}

- (BOOL)isEqualToNode:(id)a3
{
  id v4 = (SKVideoNode *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      v21.receiver = self;
      v21.super_class = (Class)SKVideoNode;
      if (![(SKNode *)&v21 isEqualToNode:v5]) {
        goto LABEL_13;
      }
      [(SKVideoNode *)self anchorPoint];
      double v7 = v6;
      double v9 = v8;
      [(SKVideoNode *)v5 anchorPoint];
      BOOL v11 = 0;
      if (v7 != v12) {
        goto LABEL_14;
      }
      if (v9 != v10) {
        goto LABEL_14;
      }
      [(SKVideoNode *)self size];
      double v14 = v13;
      double v16 = v15;
      [(SKVideoNode *)v5 size];
      BOOL v11 = 0;
      if (v14 != v18 || v16 != v17) {
        goto LABEL_14;
      }
      videoFileName = self->_videoFileName;
      if (videoFileName == v5->_videoFileName || -[NSString isEqualToString:](videoFileName, "isEqualToString:")) {
        BOOL v11 = self->_videoFileURL == v5->_videoFileURL;
      }
      else {
LABEL_13:
      }
        BOOL v11 = 0;
LABEL_14:

      goto LABEL_15;
    }
    BOOL v11 = 0;
  }
LABEL_15:

  return v11;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SKNode *)self name];
  [(SKNode *)self position];
  objc_super v5 = NSStringFromCGPoint(v11);
  [(SKVideoNode *)self size];
  double v6 = NSStringFromCGSize(v12);
  [(SKNode *)self zRotation];
  double v8 = [v3 stringWithFormat:@"<SKVideoNode> name:'%@' position:%@ size:%@ rotation:%.2f", v4, v5, v6, v7];

  return v8;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"rate"]
    || [v10 isEqualToString:@"currentItem"])
  {
    SKCNode::setDirty((SKCNode *)self->_skcVideoNode);
    SKCNode::recomputeFlags((SKCNode *)self->_skcVideoNode, 1);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SKVideoNode;
    [(SKVideoNode *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)_makeBackingNode
{
}

- (void)_didMakeBackingNode
{
  self->_skcVideoNode = [(SKNode *)self _backingNode];
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKVideoNode;
  -[SKNode setPaused:](&v6, sel_setPaused_);
  skcVideoNode = (SKCVideoNode *)self->_skcVideoNode;
  if (v3) {
    SKCVideoNode::pause(skcVideoNode);
  }
  else {
    SKCVideoNode::play(skcVideoNode);
  }
}

- (void)play
{
}

- (void)pause
{
}

- (void)setSize:(CGSize)size
{
  BOOL v3 = size.width == *MEMORY[0x263F001B0];
  if (size.height != *(double *)(MEMORY[0x263F001B0] + 8)) {
    BOOL v3 = 0;
  }
  skcVideoNode = (SKCNode *)self->_skcVideoNode;
  *((unsigned char *)skcVideoNode + 560) = v3;
  *(float *)&unsigned int v5 = size.width;
  *(float *)&unsigned int v6 = size.height;
  long long v7 = __PAIR64__(v6, v5);
  SKCNode::setSize(skcVideoNode, &v7);
}

- (CGSize)size
{
  float64x2_t v2 = vcvtq_f64_f32(*(float32x2_t *)((char *)self->_skcVideoNode + 336));
  double v3 = v2.f64[1];
  result.width = v2.f64[0];
  result.height = v3;
  return result;
}

- (CGPoint)anchorPoint
{
  float64x2_t v2 = vcvtq_f64_f32(*(float32x2_t *)((char *)self->_skcVideoNode + 352));
  double v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.y = v3;
  return result;
}

- (void)setAnchorPoint:(CGPoint)anchorPoint
{
  skcVideoNode = (SKCNode *)self->_skcVideoNode;
  *(float *)&unsigned int v4 = anchorPoint.x;
  *(float *)&unsigned int v5 = anchorPoint.y;
  long long v6 = __PAIR64__(v5, v4);
  SKCNode::setAnchor(skcVideoNode, &v6);
}

+ (id)debugHierarchyPropertyDescriptions
{
  v12[3] = *MEMORY[0x263EF8340];
  float64x2_t v2 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFB78];
  double v3 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  Mutable = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(Mutable, @"propertyName", @"size");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"CGSize");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeSize");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"CGf, CGf");
  v12[0] = Mutable;
  unsigned int v5 = CFDictionaryCreateMutable(0, 7, v2, v3);
  CFDictionaryAddValue(v5, @"propertyName", @"anchorPoint");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"CGPoint");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypePoint");
  CFDictionaryAddValue(v5, @"propertyFormat", @"CGf, CGf");
  v12[1] = v5;
  long long v6 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v6, @"propertyName", @"visualRepresentation");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"CGImage");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  CFDictionaryAddValue(v6, @"propertyFormat", @"public.data");
  uint64_t valuePtr = 8;
  CFNumberRef v7 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v6, @"visibility", v7);
  CFRelease(v7);
  uint64_t valuePtr = 1;
  CFNumberRef v8 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v6, @"propertyOptions", v8);
  CFRelease(v8);
  v12[2] = v6;
  double v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:3];

  return v9;
}

+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  v32[3] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  if ([v9 isEqualToString:@"visualRepresentation"])
  {
    a6 = [v10 createDebugHierarchyVisualRepresentation];
    v29 = @"propertyFormat";
    uint64_t v30 = *MEMORY[0x263F01AE0];
    *a5 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    goto LABEL_24;
  }
  id v11 = v10;
  id v12 = v9;
  if (![v12 length]) {
    goto LABEL_14;
  }
  NSSelectorFromString((NSString *)v12);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((unint64_t)[v12 length] < 2)
    {
      double v17 = [v12 uppercaseString];
    }
    else
    {
      double v14 = [v12 substringToIndex:1];
      double v15 = [v14 uppercaseString];
      double v16 = [v12 substringFromIndex:1];
      double v17 = [v15 stringByAppendingString:v16];
    }
    double v18 = [@"is" stringByAppendingString:v17];
    NSSelectorFromString(v18);
    if (objc_opt_respondsToSelector()) {
      objc_super v13 = v18;
    }
    else {
      objc_super v13 = 0;
    }

    if (v13) {
      goto LABEL_6;
    }
LABEL_14:
    if (a6)
    {
      id v19 = v11;
      v20 = (__CFString *)v12;
      v28 = v19;
      if (v19)
      {
        objc_super v21 = [NSString stringWithFormat:@"%@", v19];
      }
      else
      {
        objc_super v21 = &stru_26BEEFD10;
      }
      if (v20) {
        v22 = v20;
      }
      else {
        v22 = &stru_26BEEFD10;
      }
      v23 = v22;
      v31[0] = @"propertyName";
      v31[1] = @"objectDescription";
      v32[0] = v23;
      v32[1] = v21;
      v31[2] = @"errorDescription";
      v32[2] = &stru_26BEEFD10;
      objc_super v24 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];
      v25 = [MEMORY[0x263F087E8] errorWithDomain:@"DebugHierarchyErrorDomain" code:100 userInfo:v24];

      id v26 = v25;
      *a6 = v26;

      objc_super v13 = 0;
      a6 = 0;
    }
    else
    {
      objc_super v13 = 0;
    }
    goto LABEL_23;
  }
  objc_super v13 = (NSString *)v12;
  if (!v13) {
    goto LABEL_14;
  }
LABEL_6:
  a6 = [v11 valueForKey:v13];
LABEL_23:

LABEL_24:

  return a6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_videoFileURL, 0);

  objc_storeStrong((id *)&self->_videoFileName, 0);
}

@end