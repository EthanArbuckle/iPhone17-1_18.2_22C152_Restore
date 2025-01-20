@interface AIAudiogramAxis
- (AIAudiogramAxis)initWithAxis:(unint64_t)a3 values:(id)a4;
- (AIRecognizedText)maxValue;
- (AIRecognizedText)minValue;
- (BOOL)isEqual:(id)a3;
- (NSArray)values;
- (id)description;
- (unint64_t)axis;
- (void)setAxis:(unint64_t)a3;
- (void)setValues:(id)a3;
@end

@implementation AIAudiogramAxis

- (AIAudiogramAxis)initWithAxis:(unint64_t)a3 values:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)AIAudiogramAxis;
  v7 = [(AIAudiogramAxis *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(AIAudiogramAxis *)v7 setAxis:a3];
    [(AIAudiogramAxis *)v8 setValues:v6];
  }

  return v8;
}

- (AIRecognizedText)minValue
{
  v2 = [(AIAudiogramAxis *)self values];
  v3 = [v2 firstObject];

  return (AIRecognizedText *)v3;
}

- (AIRecognizedText)maxValue
{
  v2 = [(AIAudiogramAxis *)self values];
  v3 = [v2 lastObject];

  return (AIRecognizedText *)v3;
}

- (id)description
{
  unint64_t v3 = [(AIAudiogramAxis *)self axis];
  v4 = @"y";
  if (!v3) {
    v4 = @"x";
  }
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)AIAudiogramAxis;
  id v6 = v4;
  v7 = [(AIAudiogramAxis *)&v11 description];
  v8 = [(AIAudiogramAxis *)self values];
  v9 = [v5 stringWithFormat:@"%@ (%@ axis) %@", v7, v6, v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__4;
    v22 = __Block_byref_object_dispose__4;
    id v23 = v4;
    unint64_t v5 = [(AIAudiogramAxis *)self axis];
    if (v5 != [(id)v19[5] axis]) {
      goto LABEL_6;
    }
    id v6 = [(AIAudiogramAxis *)self values];
    uint64_t v7 = [v6 count];
    v8 = [(id)v19[5] values];
    uint64_t v9 = [v8 count];

    if (v7 == v9)
    {
      uint64_t v14 = 0;
      v15 = &v14;
      uint64_t v16 = 0x2020000000;
      char v17 = 1;
      objc_super v10 = [(AIAudiogramAxis *)self values];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __27__AIAudiogramAxis_isEqual___block_invoke;
      v13[3] = &unk_2650590B0;
      v13[4] = &v18;
      v13[5] = &v14;
      [v10 enumerateObjectsUsingBlock:v13];

      BOOL v11 = *((unsigned char *)v15 + 24) != 0;
      _Block_object_dispose(&v14, 8);
    }
    else
    {
LABEL_6:
      BOOL v11 = 0;
    }
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void __27__AIAudiogramAxis_isEqual___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v8 = a2;
  uint64_t v9 = [v7 values];
  id v10 = [v9 objectAtIndex:a3];

  if (v10 != v8)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (unint64_t)axis
{
  return self->_axis;
}

- (void)setAxis:(unint64_t)a3
{
  self->_axis = a3;
}

- (NSArray)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
}

- (void).cxx_destruct
{
}

@end