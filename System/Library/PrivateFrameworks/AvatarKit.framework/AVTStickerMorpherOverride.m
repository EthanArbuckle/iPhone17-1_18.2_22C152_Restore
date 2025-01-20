@interface AVTStickerMorpherOverride
+ (id)morpherOverrideFromDictionary:(id)a3;
- (AVTStickerMorpherOverride)initWithNodeNames:(id)a3 morphTargetName:(id)a4 weight:(float)a5;
- (NSString)morphTargetName;
- (float)weight;
- (id)description;
- (id)nodeNames;
- (void)applyToAvatar:(id)a3 inHierarchy:(id)a4 reversionContext:(id)a5;
@end

@implementation AVTStickerMorpherOverride

+ (id)morpherOverrideFromDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"node"];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 objectForKeyedSubscript:@"geometry"];
  }
  v7 = v6;

  v8 = [AVTStickerMorpherOverride alloc];
  v9 = [v3 objectForKeyedSubscript:@"morpher"];
  v10 = [v3 objectForKeyedSubscript:@"value"];
  [v10 floatValue];
  v11 = -[AVTStickerMorpherOverride initWithNodeNames:morphTargetName:weight:](v8, "initWithNodeNames:morphTargetName:weight:", v7, v9);

  return v11;
}

- (id)description
{
  id v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p | %@[%@] = %f>", v5, self, self->_nodeNames, self->_morphTargetName, self->_weight];

  return v6;
}

- (AVTStickerMorpherOverride)initWithNodeNames:(id)a3 morphTargetName:(id)a4 weight:(float)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVTStickerMorpherOverride;
  v11 = [(AVTStickerMorpherOverride *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(&v11->_nodeNames, a3);
    objc_storeStrong((id *)&v12->_morphTargetName, a4);
    v12->_weight = a5;
  }

  return v12;
}

- (void)applyToAvatar:(id)a3 inHierarchy:(id)a4 reversionContext:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = [a3 nodesMatchingStickerPattern:self->_nodeNames inHierarchy:a4 options:1 includingDerivedNodes:1];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    char v12 = 0;
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v9);
        }
        v15 = [*(id *)(*((void *)&v23 + 1) + 8 * i) morpher];
        uint64_t v16 = [v15 _weightIndexForTargetNamed:self->_morphTargetName];
        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v17 = v16;
          if (!((v8 == 0) | v12 & 1))
          {
            [v15 weightForTargetAtIndex:v16];
            float v19 = v18;
            v20 = [AVTStickerMorpherOverride alloc];
            *(float *)&double v21 = v19;
            v22 = [(AVTStickerMorpherOverride *)v20 initWithNodeNames:self->_nodeNames morphTargetName:self->_morphTargetName weight:v21];
            [v8 saveMorpherOverride:v22];

            char v12 = 1;
          }
          [v15 setWeight:v17 forTargetAtIndex:self->_weight];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }
}

- (id)nodeNames
{
  return self->_nodeNames;
}

- (NSString)morphTargetName
{
  return self->_morphTargetName;
}

- (float)weight
{
  return self->_weight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_morphTargetName, 0);
  objc_storeStrong(&self->_nodeNames, 0);
}

@end