@interface FMTrack
- (FMMixParameters)mixParameters;
- (FMTrack)initWithClips:(id)a3 mixParameters:(id)a4;
- (NSArray)clips;
- (id)description;
- (void)setClips:(id)a3;
- (void)setMixParameters:(id)a3;
@end

@implementation FMTrack

- (FMTrack)initWithClips:(id)a3 mixParameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FMTrack;
  v9 = [(FMTrack *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clips, a3);
    objc_storeStrong((id *)&v10->_mixParameters, a4);
  }

  return v10;
}

- (id)description
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  objc_msgSend_clips(self, a2, v2, v3, v4);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v28, (uint64_t)v32, 16);
  if (v6)
  {
    uint64_t v11 = v6;
    uint64_t v12 = *(void *)v29;
    v13 = @"\nFMClips:";
    uint64_t v14 = 1;
    do
    {
      uint64_t v15 = 0;
      v16 = v13;
      do
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(obj);
        }
        v17 = NSString;
        v18 = objc_msgSend_description(*(void **)(*((void *)&v28 + 1) + 8 * v15), v7, v8, v9, v10);
        v22 = objc_msgSend_stringWithFormat_(v17, v19, @"\n%d %@"), v20, v21, v14 + v15, v18);
        objc_msgSend_stringByAppendingString_(v16, v23, (uint64_t)v22, v24, v25);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v15;
        v16 = v13;
      }
      while (v11 != v15);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v28, (uint64_t)v32, 16);
      uint64_t v14 = (v14 + v15);
    }
    while (v11);
  }
  else
  {
    v13 = @"\nFMClips:";
  }

  return v13;
}

- (NSArray)clips
{
  return self->_clips;
}

- (void)setClips:(id)a3
{
}

- (FMMixParameters)mixParameters
{
  return self->_mixParameters;
}

- (void)setMixParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mixParameters, 0);
  objc_storeStrong((id *)&self->_clips, 0);
}

@end