@interface CHTextInputProtoSettings
+ (id)sharedSettings;
- (BOOL)autoLineBreakEnabled;
- (BOOL)autoLineBreakRequireWeakCursor;
- (BOOL)isScribbleActive;
- (BOOL)lineBreakVerticalBarGestureEnabled;
- (BOOL)lineBreakVerticalBarUpToDelete;
- (BOOL)preventLeftoverCharsInSubwordGestures;
- (double)autoLineBreakAreaWidthFactor;
- (double)autoLineBreakDualBreakVerticalDistance;
- (double)autoLineBreakMinVerticalDistance;
- (double)subwordGestureEndingSpeedRange;
- (double)subwordGestureSpeedThreshold;
@end

@implementation CHTextInputProtoSettings

+ (id)sharedSettings
{
  if (qword_1EA3C9128 == -1)
  {
    v2 = (void *)qword_1EA3C9120;
  }
  else
  {
    dispatch_once(&qword_1EA3C9128, &unk_1F2012B10);
    v2 = (void *)qword_1EA3C9120;
  }
  return v2;
}

- (BOOL)isScribbleActive
{
  id v2 = sub_1C492FA68();
  v8 = objc_msgSend_sharedSettings(v2, v3, v4, v5, v6, v7);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = sub_1C49ED118;
    v20 = &unk_1E64E1048;
    v22 = &v23;
    id v21 = v8;
    v9 = (void (**)(void))MEMORY[0x1C8786E90](&v17);
    if (objc_msgSend_isMainThread(MEMORY[0x1E4F29060], v10, v11, v12, v13, v14, v17, v18, v19, v20)) {
      v9[2](v9);
    }
    else {
      dispatch_sync(MEMORY[0x1E4F14428], v9);
    }
    BOOL v15 = *((unsigned char *)v24 + 24) != 0;

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)autoLineBreakEnabled
{
  return self->_autoLineBreakEnabled;
}

- (BOOL)autoLineBreakRequireWeakCursor
{
  return self->_autoLineBreakRequireWeakCursor;
}

- (double)autoLineBreakMinVerticalDistance
{
  return self->_autoLineBreakMinVerticalDistance;
}

- (double)autoLineBreakDualBreakVerticalDistance
{
  return self->_autoLineBreakDualBreakVerticalDistance;
}

- (double)autoLineBreakAreaWidthFactor
{
  return self->_autoLineBreakAreaWidthFactor;
}

- (BOOL)lineBreakVerticalBarGestureEnabled
{
  return self->_lineBreakVerticalBarGestureEnabled;
}

- (BOOL)lineBreakVerticalBarUpToDelete
{
  return self->_lineBreakVerticalBarUpToDelete;
}

- (double)subwordGestureEndingSpeedRange
{
  return self->_subwordGestureEndingSpeedRange;
}

- (double)subwordGestureSpeedThreshold
{
  return self->_subwordGestureSpeedThreshold;
}

- (BOOL)preventLeftoverCharsInSubwordGestures
{
  return self->_preventLeftoverCharsInSubwordGestures;
}

@end