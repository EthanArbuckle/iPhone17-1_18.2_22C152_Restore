@interface CIBurstImageSet
+ (id)burstImageSet;
+ (id)burstImageSetWithOptions:(id)a3;
+ (id)defaultVersionString;
- (BOOL)isAction;
- (BOOL)isPortrait;
- (CIBurstImageSet)init;
- (CIBurstImageSet)initWithOptions:(id)a3;
- (id)allImageIdentifiers;
- (id)bestImageIdentifiers;
- (id)burstId;
- (id)coverImageIdentifier;
- (id)imageClusterForIdentifier:(id)a3;
- (id)imageClusterForIndex:(unint64_t)a3;
- (id)statsForImageWithIdentifier:(id)a3;
- (unint64_t)imageClusterCount;
- (void)addImageFromIOSurface:(__IOSurface *)a3 properties:(id)a4 identifier:(id)a5 completionBlock:(id)a6;
- (void)dealloc;
- (void)setLoggingListener:(void *)a3 withUserInfo:(void *)a4;
@end

@implementation CIBurstImageSet

+ (id)burstImageSet
{
  v2 = objc_alloc_init(CIBurstImageSet);

  return v2;
}

+ (id)burstImageSetWithOptions:(id)a3
{
  v3 = [[CIBurstImageSet alloc] initWithOptions:a3];

  return v3;
}

- (void)dealloc
{
  priv = self->_priv;
  if (priv) {

  }
  v4.receiver = self;
  v4.super_class = (Class)CIBurstImageSet;
  [(CIBurstImageSet *)&v4 dealloc];
}

- (CIBurstImageSet)init
{
  v4.receiver = self;
  v4.super_class = (Class)CIBurstImageSet;
  v2 = [(CIBurstImageSet *)&v4 init];
  if (v2) {
    v2->_priv = [[CIBurstImageSetInternal alloc] initWithOptions:0];
  }
  return v2;
}

- (CIBurstImageSet)initWithOptions:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CIBurstImageSet;
  objc_super v4 = [(CIBurstImageSet *)&v6 init];
  if (v4) {
    v4->_priv = [[CIBurstImageSetInternal alloc] initWithOptions:a3];
  }
  return v4;
}

+ (id)defaultVersionString
{
  return +[CIBurstImageSetInternal defaultVersionString];
}

- (id)burstId
{
  return [(CIBurstImageSetInternal *)self->_priv burstId];
}

- (void)addImageFromIOSurface:(__IOSurface *)a3 properties:(id)a4 identifier:(id)a5 completionBlock:(id)a6
{
}

- (id)bestImageIdentifiers
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([(CIBurstImageSetInternal *)self->_priv bestImageIdentifiersArray]
    && [(NSArray *)[(CIBurstImageSetInternal *)self->_priv bestImageIdentifiersArray] count])
  {
    priv = self->_priv;
    return [(CIBurstImageSetInternal *)priv bestImageIdentifiersArray];
  }
  else
  {
    [(CIBurstImageSet *)self secondsSinceStart];
    double v6 = v5;
    id v7 = [(CIBurstImageSetInternal *)self->_priv bestImageIdentifiers];
    if ([(CIBurstImageSetInternal *)self->_priv burstLogFileName])
    {
      v22 = (void *)MEMORY[0x199702DB0]();
      v8 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
      objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", v6), @"BurstSet_TimeDoneCapturing");
      id v23 = v7;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithArray:v7];
      v10 = NSNumber;
      [(CIBurstImageSet *)self secondsSinceStart];
      objc_msgSend(v8, "setObject:forKey:", objc_msgSend(v10, "numberWithDouble:"), @"BurstSet_TimeDone");
      [v8 setObject:v9 forKey:kBurstDoc_BestImageIds[0]];
      v11 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", -[CIBurstImageSet allImageIdentifiers](self, "allImageIdentifiers"));
      [v8 setObject:v11 forKey:kBurstDoc_AllImageIdentifiers[0]];
      v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v25 != v15) {
              objc_enumerationMutation(v11);
            }
            uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            id v18 = [(CIBurstImageSet *)self statsForImageWithIdentifier:v17];
            if (v18) {
              objc_msgSend(v12, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", v18), v17);
            }
            else {
              puts("   initWithBurstImageSet - Error: stats not found");
            }
          }
          uint64_t v14 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v14);
      }
      [v8 setObject:v12 forKey:kBurstDoc_AllImageStats[0]];
      if ([(CIBurstImageSetInternal *)self->_priv burstLogFileName])
      {
        v19 = [(CIBurstImageSetInternal *)self->_priv burstLogFileName];
        [v8 setObject:v19 forKey:kBurstDoc_LogFile[0]];
      }
      objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", -[CIBurstImageSetInternal maxNumPendingFrames](self->_priv, "maxNumPendingFrames")), @"BurstSet_Setting_MaxNumPendingFrames");
      objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[CIBurstImageSetInternal enableAnalysis](self->_priv, "enableAnalysis") ^ 1), @"BurstSet_Setting_DisableAnalysis");
      objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[CIBurstImageSetInternal enableFaceCore](self->_priv, "enableFaceCore") ^ 1), @"BurstSet_Setting_DisableFaceCore");
      objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", -[CIBurstImageSetInternal dummyAnalysisCount](self->_priv, "dummyAnalysisCount")), @"BurstSet_Setting_DummyAnalysisCount");
      objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[CIBurstImageSetInternal isFaceDetectionForced](self->_priv, "isFaceDetectionForced")), @"BurstSet_Setting_ForceFaceDetection");
      objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[CIBurstImageSetInternal enableDumpYUV](self->_priv, "enableDumpYUV")), @"BurstSet_Setting_EnableDumpYUV");
      objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[CIBurstImageSetInternal isAction](self->_priv, "isAction")), @"BurstSet_IsAction");
      objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[CIBurstImageSetInternal isPortrait](self->_priv, "isPortrait")), @"BurstSet_IsPortrait");
      uint64_t v20 = objc_msgSend(-[CIBurstImageSetInternal burstDocumentDirectory](self->_priv, "burstDocumentDirectory"), "stringByAppendingPathExtension:", @"xml");
      if ([(CIBurstImageSetInternal *)self->_priv burstCoverSelection]) {
        v21 = [(CIBurstImageSetInternal *)self->_priv burstCoverSelection];
      }
      else {
        v21 = @"nil";
      }
      id v7 = v23;
      [v8 setObject:v21 forKey:@"BurstSet_CoverImage"];
      [v8 writeToFile:v20 atomically:1];
    }
    return v7;
  }
}

- (id)coverImageIdentifier
{
  id result = (id)objc_msgSend(-[CIBurstImageSet bestImageIdentifiers](self, "bestImageIdentifiers"), "count");
  if (result)
  {
    if ([(CIBurstImageSetInternal *)self->_priv burstLogFileName])
    {
      uint64_t v4 = objc_msgSend(-[CIBurstImageSetInternal burstDocumentDirectory](self->_priv, "burstDocumentDirectory"), "stringByAppendingPathExtension:", @"xml");
      double v5 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithContentsOfFile:v4];
      if ([(CIBurstImageSetInternal *)self->_priv burstCoverSelection]) {
        double v6 = [(CIBurstImageSetInternal *)self->_priv burstCoverSelection];
      }
      else {
        double v6 = @"nil";
      }
      [v5 setObject:v6 forKey:@"BurstSet_CoverImage"];
    }
    priv = self->_priv;
    return [(CIBurstImageSetInternal *)priv burstCoverSelection];
  }
  return result;
}

- (id)imageClusterForIdentifier:(id)a3
{
  return [(CIBurstImageSetInternal *)self->_priv imageClusterForIdentifier:a3];
}

- (unint64_t)imageClusterCount
{
  v2 = [(CIBurstImageSetInternal *)self->_priv clusterArray];

  return [(NSMutableArray *)v2 count];
}

- (id)imageClusterForIndex:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[(NSMutableArray *)[(CIBurstImageSetInternal *)self->_priv clusterArray] objectAtIndex:a3];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  double v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(v3, "burstImages"), "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v6 = objc_msgSend(v4, "burstImages", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "imageId"));
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
  return v5;
}

- (id)allImageIdentifiers
{
  return [(CIBurstImageSetInternal *)self->_priv allImageIdentifiers];
}

- (id)statsForImageWithIdentifier:(id)a3
{
  uint64_t v4 = [(CIBurstImageSetInternal *)self->_priv statsByImageIdentifier];

  return (id)[(NSMutableDictionary *)v4 objectForKey:a3];
}

- (void)setLoggingListener:(void *)a3 withUserInfo:(void *)a4
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  size_t v4 = 64;
  BurstLoggingSetCallback(a3, (uint64_t)a4);
  sysctlbyname("kern.osversion", v5, &v4, 0, 0);
  BurstLoggingMessage("BURST ANALYSIS VERSION = %s (%s)\n", (const char *)[(id)kCIBurstImageSet_VersionString UTF8String], v5);
}

- (BOOL)isPortrait
{
  return [(CIBurstImageSetInternal *)self->_priv isPortrait];
}

- (BOOL)isAction
{
  return [(CIBurstImageSetInternal *)self->_priv isAction];
}

@end