@interface AVPlaybackSpeedCollection
+ (AVPlaybackSpeedCollection)collectionWithSpeeds:(id)a3;
+ (id)defaultSpeedFromList:(id)a3;
+ (id)keyPathsForValuesAffectingDisplaySpeeds;
+ (id)keyPathsForValuesAffectingSelectedSpeed;
- (AVPlaybackSpeed)selectedSpeed;
- (NSArray)speeds;
- (id)_descriptionWithInternalState:(void *)a1;
- (id)_initInternalWithSpeeds:(id)a3;
- (id)activeSpeed;
- (id)debugDescription;
- (id)delegate;
- (id)description;
- (id)displaySpeeds;
- (id)internalDescription;
- (void)selectNextPlaybackSpeed:(id)a3;
- (void)selectSpeed:(id)a3;
- (void)setActiveSpeed:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation AVPlaybackSpeedCollection

+ (AVPlaybackSpeedCollection)collectionWithSpeeds:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initInternalWithSpeeds:v4];

  return (AVPlaybackSpeedCollection *)v5;
}

- (id)_initInternalWithSpeeds:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVPlaybackSpeedCollection;
  v6 = [(AVPlaybackSpeedCollection *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_speeds, a3);
    uint64_t v8 = +[AVPlaybackSpeedCollection defaultSpeedFromList:v5];
    activeSpeed = v7->_activeSpeed;
    v7->_activeSpeed = (AVPlaybackSpeed *)v8;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSpeed, 0);
  objc_storeStrong((id *)&self->_speeds, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (id)activeSpeed
{
  return self->_activeSpeed;
}

+ (id)defaultSpeedFromList:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v13 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
      objc_msgSend(v8, "rate", (void)v12);
      if (v9 == 1.0) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v10 = v8;

    if (v10) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  objc_msgSend(v3, "firstObject", (void)v12);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v10;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  uint64_t v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    uint64_t v6 = obj;
  }
}

- (id)description
{
  return -[AVPlaybackSpeedCollection _descriptionWithInternalState:](self, 0);
}

- (id)_descriptionWithInternalState:(void *)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a2) {
      [a1 displaySpeeds];
    }
    else {
    uint64_t v4 = [a1 speeds];
    }
    v23.receiver = a1;
    v23.super_class = (Class)AVPlaybackSpeedCollection;
    uint64_t v5 = objc_msgSendSuper2(&v23, sel_description);
    uint64_t v6 = [v5 stringByAppendingFormat:@" [\n"];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = v4;
    uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        uint64_t v10 = 0;
        objc_super v11 = v6;
        do
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(obj);
          }
          long long v12 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
          if (a2) {
            [v12 internalDescription];
          }
          else {
          long long v13 = [v12 description];
          }
          long long v14 = [a1 activeSpeed];

          if (v12 == v14) {
            long long v15 = @"\t%@ - active\n";
          }
          else {
            long long v15 = @"\t%@\n";
          }
          uint64_t v6 = objc_msgSend(v11, "stringByAppendingFormat:", v15, v13);

          ++v10;
          objc_super v11 = v6;
        }
        while (v8 != v10);
        uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v8);
    }

    v16 = [v6 stringByAppendingFormat:@"]"];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)debugDescription
{
  return -[AVPlaybackSpeedCollection _descriptionWithInternalState:](self, 0);
}

- (id)internalDescription
{
  return -[AVPlaybackSpeedCollection _descriptionWithInternalState:](self, 1);
}

- (id)displaySpeeds
{
  id v3 = [(AVPlaybackSpeedCollection *)self speeds];
  if (([v3 containsObject:self->_activeSpeed] & 1) == 0)
  {
    uint64_t v4 = [v3 arrayByAddingObject:self->_activeSpeed];

    id v3 = (void *)v4;
  }

  return v3;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setActiveSpeed:(id)a3
{
  uint64_t v5 = (AVPlaybackSpeed *)a3;
  activeSpeed = self->_activeSpeed;
  p_activeSpeed = &self->_activeSpeed;
  if (activeSpeed != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_activeSpeed, a3);
    uint64_t v5 = v8;
  }
}

- (void)selectNextPlaybackSpeed:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(AVPlaybackSpeedCollection *)self speeds];
  uint64_t v5 = [(AVPlaybackSpeedCollection *)self selectedSpeed];
  if (v5)
  {
    uint64_t v6 = [v4 indexOfObject:v5];
    if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_7;
    }
    uint64_t v7 = objc_msgSend(v4, "objectAtIndex:", (v6 + 1) % (unint64_t)objc_msgSend(v4, "count"));
  }
  else
  {
    uint64_t v7 = [v4 firstObject];
  }
  uint64_t v8 = v7;
  if (v7)
  {
    [(AVPlaybackSpeedCollection *)self selectSpeed:v7];
    goto LABEL_9;
  }
LABEL_7:
  uint64_t v8 = _AVLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = [v5 description];
    uint64_t v10 = [(AVPlaybackSpeedCollection *)self description];
    int v11 = 138412546;
    long long v12 = v9;
    __int16 v13 = 2112;
    long long v14 = v10;
    _os_log_error_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_ERROR, "Error: Internal inconsistency. Selected speed was not found in playback speed collection.\n%@\n%@", (uint8_t *)&v11, 0x16u);
  }
LABEL_9:
}

- (void)selectSpeed:(id)a3
{
  id v6 = a3;
  if (-[NSArray containsObject:](self->_speeds, "containsObject:"))
  {
    id v4 = [(AVPlaybackSpeedCollection *)self selectedSpeed];

    if (v4 != v6)
    {
      [(AVPlaybackSpeedCollection *)self setActiveSpeed:v6];
      uint64_t v5 = [(AVPlaybackSpeedCollection *)self delegate];
      [v5 playbackSpeedCollection:self selectedPlaybackSpeedDidChangeTo:v6];
    }
  }
}

- (AVPlaybackSpeed)selectedSpeed
{
  id v3 = self->_activeSpeed;
  id v4 = v3;
  if (self && v3)
  {
    uint64_t v5 = [(AVPlaybackSpeedCollection *)self speeds];
    int v6 = [v5 containsObject:v4];

    if (v6 && ![(AVPlaybackSpeed *)self->_activeSpeed isSynthesized])
    {
      uint64_t v7 = self->_activeSpeed;
      goto LABEL_8;
    }
  }
  else
  {
  }
  uint64_t v7 = 0;
LABEL_8:

  return v7;
}

- (NSArray)speeds
{
  return self->_speeds;
}

+ (id)keyPathsForValuesAffectingDisplaySpeeds
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"speeds", @"activeSpeed", 0);
}

+ (id)keyPathsForValuesAffectingSelectedSpeed
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"activeSpeed"];
}

@end