@interface JFXMetadataValidator
- (JFXMetadataValidator)init;
- (int64_t)faceDataDetectedFacesCount;
- (unint64_t)lastARFrameHasFaceAnchors;
- (unint64_t)lastARFrameIsFaceTracked;
- (void)reset;
- (void)setFaceDataDetectedFacesCount:(int64_t)a3;
- (void)setLastARFrameHasFaceAnchors:(unint64_t)a3;
- (void)setLastARFrameIsFaceTracked:(unint64_t)a3;
- (void)validateARImageData:(id)a3;
- (void)validateFaceTrackedARFrame:(id)a3;
@end

@implementation JFXMetadataValidator

- (JFXMetadataValidator)init
{
  v3.receiver = self;
  v3.super_class = (Class)JFXMetadataValidator;
  result = [(JFXMetadataValidator *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_faceDataDetectedFacesCount = xmmword_234D617A0;
    result->_lastARFrameIsFaceTracked = 2;
  }
  return result;
}

- (void)validateARImageData:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    v5 = JFXLog_metadata();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[JFXMetadataValidator validateARImageData:](v5);
    }
  }
  v6 = [v4 faceData];

  if (!v6)
  {
    v10 = JFXLog_metadata();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[JFXMetadataValidator validateARImageData:](v10);
    }
    goto LABEL_11;
  }
  v7 = [v4 faceData];
  v8 = [v7 detectedFaces];
  uint64_t v9 = [v8 count];

  if ([(JFXMetadataValidator *)self faceDataDetectedFacesCount] != v9)
  {
    [(JFXMetadataValidator *)self setFaceDataDetectedFacesCount:v9];
    v10 = JFXLog_metadata();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      uint64_t v12 = v9;
      _os_log_impl(&dword_234C41000, v10, OS_LOG_TYPE_DEFAULT, "The number of detected faces has changed: %lu", (uint8_t *)&v11, 0xCu);
    }
LABEL_11:
  }
}

- (void)validateFaceTrackedARFrame:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [a3 anchors];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v4);
        }
        int v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v11 isTracked]) {
            uint64_t v7 = 1;
          }
          uint64_t v8 = 1;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);

    if (v8) {
      goto LABEL_20;
    }
  }
  else
  {

    uint64_t v7 = 0;
  }
  if ([(JFXMetadataValidator *)self lastARFrameHasFaceAnchors])
  {
    uint64_t v12 = JFXLog_metadata();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_234C41000, v12, OS_LOG_TYPE_DEFAULT, "frames no longer contain face anchors", v15, 2u);
    }
    uint64_t v8 = 0;
LABEL_23:

    goto LABEL_24;
  }
  uint64_t v8 = 0;
LABEL_20:
  if (v8 != [(JFXMetadataValidator *)self lastARFrameHasFaceAnchors])
  {
    uint64_t v12 = JFXLog_metadata();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_234C41000, v12, OS_LOG_TYPE_DEFAULT, "frames now contain face anchors", v15, 2u);
    }
    goto LABEL_23;
  }
LABEL_24:
  [(JFXMetadataValidator *)self setLastARFrameHasFaceAnchors:v8];
  if (!v7 && [(JFXMetadataValidator *)self lastARFrameIsFaceTracked])
  {
    uint64_t v13 = JFXLog_metadata();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      v14 = "frames are no longer face-tracked";
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if (v7 != [(JFXMetadataValidator *)self lastARFrameIsFaceTracked])
  {
    uint64_t v13 = JFXLog_metadata();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      v14 = "frames are now face-tracked";
LABEL_31:
      _os_log_impl(&dword_234C41000, v13, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
    }
LABEL_32:
  }
  -[JFXMetadataValidator setLastARFrameIsFaceTracked:](self, "setLastARFrameIsFaceTracked:", v7, *(void *)v15);
}

- (void)reset
{
  [(JFXMetadataValidator *)self setFaceDataDetectedFacesCount:0x7FFFFFFFFFFFFFFFLL];
  [(JFXMetadataValidator *)self setLastARFrameHasFaceAnchors:2];
  [(JFXMetadataValidator *)self setLastARFrameIsFaceTracked:2];
}

- (int64_t)faceDataDetectedFacesCount
{
  return self->_faceDataDetectedFacesCount;
}

- (void)setFaceDataDetectedFacesCount:(int64_t)a3
{
  self->_faceDataDetectedFacesCount = a3;
}

- (unint64_t)lastARFrameHasFaceAnchors
{
  return self->_lastARFrameHasFaceAnchors;
}

- (void)setLastARFrameHasFaceAnchors:(unint64_t)a3
{
  self->_lastARFrameHasFaceAnchors = a3;
}

- (unint64_t)lastARFrameIsFaceTracked
{
  return self->_lastARFrameIsFaceTracked;
}

- (void)setLastARFrameIsFaceTracked:(unint64_t)a3
{
  self->_lastARFrameIsFaceTracked = a3;
}

- (void)validateARImageData:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138543362;
  v2 = @"ARImageData contains nil face data";
  _os_log_error_impl(&dword_234C41000, log, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v1, 0xCu);
}

- (void)validateARImageData:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_234C41000, log, OS_LOG_TYPE_ERROR, "ARImageData is nil.", v1, 2u);
}

@end