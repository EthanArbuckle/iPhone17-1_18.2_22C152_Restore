@interface HREMediaPlaybackActionMap
+ (id)actionMapWithState:(int64_t)a3 volume:(id)a4 playbackArchive:(id)a5;
+ (id)emptyMap;
+ (id)statelessActionMapWithVolume:(id)a3 playbackArchive:(id)a4;
- (HFPlaybackArchive)playbackArchive;
- (HREMediaPlaybackActionMap)initWithState:(int64_t)a3 volume:(id)a4 playbackArchive:(id)a5;
- (NSNumber)targetVolume;
- (id)addingCondition:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)flattenedMapEvaluatedForObject:(id)a3;
- (id)mergeWithActionMaps:(id)a3;
- (int64_t)targetPlaybackState;
- (void)mergeMap:(id)a3 intoMap:(id)a4;
- (void)setPlaybackArchive:(id)a3;
- (void)setTargetPlaybackState:(int64_t)a3;
- (void)setTargetVolume:(id)a3;
@end

@implementation HREMediaPlaybackActionMap

- (HREMediaPlaybackActionMap)initWithState:(int64_t)a3 volume:(id)a4 playbackArchive:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HREMediaPlaybackActionMap;
  v10 = [(HREActionMap *)&v13 initWithCondition:0 childMaps:0];
  v11 = v10;
  if (v10)
  {
    [(HREMediaPlaybackActionMap *)v10 setTargetPlaybackState:a3];
    [(HREMediaPlaybackActionMap *)v11 setTargetVolume:v8];
    [(HREMediaPlaybackActionMap *)v11 setPlaybackArchive:v9];
  }

  return v11;
}

+ (id)emptyMap
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__HREMediaPlaybackActionMap_emptyMap__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_268944D48 != -1) {
    dispatch_once(&qword_268944D48, block);
  }
  v2 = (void *)_MergedGlobals_1;

  return v2;
}

uint64_t __37__HREMediaPlaybackActionMap_emptyMap__block_invoke(uint64_t a1)
{
  _MergedGlobals_1 = [*(id *)(a1 + 32) statelessActionMapWithVolume:0 playbackArchive:0];

  return MEMORY[0x270F9A758]();
}

+ (id)actionMapWithState:(int64_t)a3 volume:(id)a4 playbackArchive:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = (void *)[objc_alloc((Class)a1) initWithState:a3 volume:v9 playbackArchive:v8];

  return v10;
}

+ (id)statelessActionMapWithVolume:(id)a3 playbackArchive:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithState:0 volume:v7 playbackArchive:v6];

  return v8;
}

- (id)addingCondition:(id)a3
{
  return self;
}

- (id)mergeWithActionMaps:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = objc_msgSend(v4, "na_filter:", &__block_literal_global_15);

    if (objc_msgSend(v5, "na_all:", &__block_literal_global_3_10))
    {
      id v6 = +[HREMediaPlaybackActionMap statelessActionMapWithVolume:0 playbackArchive:0];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __49__HREMediaPlaybackActionMap_mergeWithActionMaps___block_invoke_3;
      v11[3] = &unk_264CF4B28;
      v11[4] = self;
      id v7 = v6;
      id v12 = v7;
      objc_msgSend(v5, "na_each:", v11);
      [(HREMediaPlaybackActionMap *)self mergeMap:self intoMap:v7];
      id v8 = v12;
      id v9 = (HREMediaPlaybackActionMap *)v7;
    }
    else
    {
      NSLog(&cfstr_CannotMergeMap.isa, self, v5);
      id v9 = self;
    }
    id v4 = v5;
  }
  else
  {
    id v9 = self;
  }

  return v9;
}

uint64_t __49__HREMediaPlaybackActionMap_mergeWithActionMaps___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[HREActionMap emptyMap];
  int v4 = [v2 isEqual:v3];

  return v4 ^ 1u;
}

uint64_t __49__HREMediaPlaybackActionMap_mergeWithActionMaps___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __49__HREMediaPlaybackActionMap_mergeWithActionMaps___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) mergeMap:a2 intoMap:*(void *)(a1 + 40)];
}

- (id)flattenedMapEvaluatedForObject:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HREMediaPlaybackActionMap;
  v3 = [(HREActionMap *)&v5 flattenedMapEvaluatedForObject:a3];

  return v3;
}

- (void)mergeMap:(id)a3 intoMap:(id)a4
{
  id v12 = a3;
  id v5 = a4;
  id v6 = [v12 playbackArchive];

  if (v6)
  {
    id v7 = [v12 playbackArchive];
    id v8 = (void *)[v7 copy];
    [v5 setPlaybackArchive:v8];
  }
  if ([v12 targetPlaybackState]) {
    objc_msgSend(v5, "setTargetPlaybackState:", objc_msgSend(v12, "targetPlaybackState"));
  }
  id v9 = [v12 targetVolume];

  if (v9)
  {
    v10 = [v12 targetVolume];
    v11 = (void *)[v10 copy];
    [v5 setTargetVolume:v11];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)HREMediaPlaybackActionMap;
  id v4 = [(HREActionMap *)&v13 copyWithZone:a3];
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  objc_msgSend(v7, "setTargetPlaybackState:", -[HREMediaPlaybackActionMap targetPlaybackState](self, "targetPlaybackState"));
  id v8 = [(HREMediaPlaybackActionMap *)self targetVolume];
  id v9 = (void *)[v8 copy];
  [v7 setTargetVolume:v9];

  v10 = [(HREMediaPlaybackActionMap *)self playbackArchive];
  v11 = (void *)[v10 copy];
  [v7 setPlaybackArchive:v11];

  return v5;
}

- (int64_t)targetPlaybackState
{
  return self->_targetPlaybackState;
}

- (void)setTargetPlaybackState:(int64_t)a3
{
  self->_targetPlaybackState = a3;
}

- (NSNumber)targetVolume
{
  return self->_targetVolume;
}

- (void)setTargetVolume:(id)a3
{
}

- (HFPlaybackArchive)playbackArchive
{
  return self->_playbackArchive;
}

- (void)setPlaybackArchive:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackArchive, 0);

  objc_storeStrong((id *)&self->_targetVolume, 0);
}

@end