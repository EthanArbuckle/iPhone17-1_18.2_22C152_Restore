@interface JFXSharedMediaDataReaderManager
- (JFXARMetadataMediaReader)sharedARMetadataReader;
- (JFXARMetadataMediaReader)weakSharedARMetadataReader;
- (JFXDepthDataMediaReader)sharedDepthDataReader;
- (JFXDepthDataMediaReader)weakSharedDepthDataReader;
- (JFXPlayableElement)playableElement;
- (JFXSharedMediaDataReaderManager)initWithPlayableElement:(id)a3;
- (void)setPlayableElement:(id)a3;
- (void)setWeakSharedARMetadataReader:(id)a3;
- (void)setWeakSharedDepthDataReader:(id)a3;
- (void)sharedARMetadataReader;
- (void)sharedDepthDataReader;
@end

@implementation JFXSharedMediaDataReaderManager

- (JFXSharedMediaDataReaderManager)initWithPlayableElement:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)JFXSharedMediaDataReaderManager;
  v6 = [(JFXSharedMediaDataReaderManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_playableElement, a3);
  }

  return v7;
}

- (JFXARMetadataMediaReader)sharedARMetadataReader
{
  v3 = [(JFXSharedMediaDataReaderManager *)self weakSharedARMetadataReader];
  if (v3)
  {
    v4 = JFXLog_DebugMediaDataReader();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[JFXSharedMediaDataReaderManager sharedARMetadataReader]();
    }

    id v5 = v3;
  }
  else
  {
    v6 = NSString;
    v7 = [(JFXSharedMediaDataReaderManager *)self playableElement];
    v8 = [v7 uuid];
    objc_super v9 = [v6 stringWithFormat:@"%@_%@", @"sharedARMetadataReader", v8];

    v10 = +[JFXMediaDataReaderFactory sharedInstance];
    v11 = [(JFXSharedMediaDataReaderManager *)self playableElement];
    id v5 = [v10 createARMetadataReaderWithCreationAttributesProvider:v11 name:v9];

    if (v5)
    {
      [(JFXSharedMediaDataReaderManager *)self setWeakSharedARMetadataReader:v5];
      v12 = JFXLog_DebugMediaDataReader();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[JFXSharedMediaDataReaderManager sharedARMetadataReader]();
      }
    }
  }

  return (JFXARMetadataMediaReader *)v5;
}

- (JFXDepthDataMediaReader)sharedDepthDataReader
{
  v3 = [(JFXSharedMediaDataReaderManager *)self weakSharedDepthDataReader];
  if (v3)
  {
    v4 = JFXLog_DebugMediaDataReader();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[JFXSharedMediaDataReaderManager sharedDepthDataReader]();
    }

    id v5 = v3;
  }
  else
  {
    v6 = NSString;
    v7 = [(JFXSharedMediaDataReaderManager *)self playableElement];
    v8 = [v7 uuid];
    objc_super v9 = [v6 stringWithFormat:@"%@_%@", @"sharedDepthDataReader", v8];

    v10 = +[JFXMediaDataReaderFactory sharedInstance];
    v11 = [(JFXSharedMediaDataReaderManager *)self playableElement];
    id v5 = [v10 createDepthDataReaderWithCreationAttributesProvider:v11 name:v9];

    if (v5)
    {
      [(JFXSharedMediaDataReaderManager *)self setWeakSharedDepthDataReader:v5];
      v12 = JFXLog_DebugMediaDataReader();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[JFXSharedMediaDataReaderManager sharedARMetadataReader]();
      }
    }
  }

  return (JFXDepthDataMediaReader *)v5;
}

- (JFXPlayableElement)playableElement
{
  return self->_playableElement;
}

- (void)setPlayableElement:(id)a3
{
}

- (JFXARMetadataMediaReader)weakSharedARMetadataReader
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakSharedARMetadataReader);
  return (JFXARMetadataMediaReader *)WeakRetained;
}

- (void)setWeakSharedARMetadataReader:(id)a3
{
}

- (JFXDepthDataMediaReader)weakSharedDepthDataReader
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakSharedDepthDataReader);
  return (JFXDepthDataMediaReader *)WeakRetained;
}

- (void)setWeakSharedDepthDataReader:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakSharedDepthDataReader);
  objc_destroyWeak((id *)&self->_weakSharedARMetadataReader);
  objc_storeStrong((id *)&self->_playableElement, 0);
}

- (void)sharedARMetadataReader
{
  OUTLINED_FUNCTION_3_2();
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_2_3(v0, v1), "playableElement");
  v3 = [v2 uuid];
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_2(&dword_234C41000, v4, v5, "return existing shared ARMetadataMediaReader reader %@ for playable element id %@", v6, v7, v8, v9, v10);
}

- (void)sharedDepthDataReader
{
  OUTLINED_FUNCTION_3_2();
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_2_3(v0, v1), "playableElement");
  v3 = [v2 uuid];
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_2(&dword_234C41000, v4, v5, "return existing shared DepthReader %@ for playable element id %@", v6, v7, v8, v9, v10);
}

@end