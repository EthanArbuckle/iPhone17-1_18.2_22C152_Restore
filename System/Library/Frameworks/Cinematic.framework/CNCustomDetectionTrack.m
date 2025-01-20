@interface CNCustomDetectionTrack
- (BOOL)_integrityCheck;
- (CNCustomDetectionTrack)initWithDetections:(NSArray *)detections smooth:(BOOL)applySmoothing;
- (NSArray)allDetections;
- (void)_integrityCheck;
@end

@implementation CNCustomDetectionTrack

- (CNCustomDetectionTrack)initWithDetections:(NSArray *)detections smooth:(BOOL)applySmoothing
{
  BOOL v4 = applySmoothing;
  id v6 = +[CNDetection _copyInternalFromDetections:detections];
  v7 = (void *)[objc_alloc(MEMORY[0x263F5F298]) initWithDetections:v6];
  v8 = v7;
  if (v4) {
    [v7 applyDetectionSmoothing];
  }
  v11.receiver = self;
  v11.super_class = (Class)CNCustomDetectionTrack;
  v9 = [(CNDetectionTrack *)&v11 _initWithInternal:v8];

  return v9;
}

- (NSArray)allDetections
{
  if ([(CNCustomDetectionTrack *)self _integrityCheck])
  {
    v3 = [(CNCustomDetectionTrack *)self _internalCustomTrack];
    BOOL v4 = [v3 allDetections];
    id v5 = +[CNDetection _copyDetectionsFromInternal:v4];
  }
  else
  {
    id v5 = (id)MEMORY[0x263EFFA68];
  }

  return (NSArray *)v5;
}

- (BOOL)_integrityCheck
{
  v3 = [(CNDetectionTrack *)self internalTrack];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v5 = _CNLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      [(CNCustomDetectionTrack *)self _integrityCheck];
    }
  }
  return isKindOfClass & 1;
}

- (void)_integrityCheck
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [a1 internalTrack];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  int v9 = 138412546;
  v10 = v5;
  __int16 v11 = 2112;
  v12 = v8;
  _os_log_debug_impl(&dword_243267000, a2, OS_LOG_TYPE_DEBUG, "%@ has unexpected internal type %@", (uint8_t *)&v9, 0x16u);
}

@end