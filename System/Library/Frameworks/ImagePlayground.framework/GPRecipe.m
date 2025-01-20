@interface GPRecipe
- (BOOL)sourceImageIsSketch;
- (GPDrawOnImageRecipe)drawOnImageRecipe;
- (GPRecipe)initWithEncodedRecipe:(id)a3 prompt:(id)a4 contextElements:(id)a5;
- (GPRecipe)initWithEncodedRecipe:(id)a3 prompts:(id)a4 contextElements:(id)a5;
- (GPRecipe)initWithPromptElements:(id)a3 sourceImage:(id)a4;
- (NSArray)promptElements;
- (NSData)additionalMetadata;
- (UIImage)sourceImage;
- (void)setAdditionalMetadata:(id)a3;
- (void)setDrawOnImageRecipe:(id)a3;
- (void)setPromptElements:(id)a3;
- (void)setSourceImage:(id)a3;
- (void)setSourceImageIsSketch:(BOOL)a3;
@end

@implementation GPRecipe

- (GPRecipe)initWithPromptElements:(id)a3 sourceImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GPRecipe;
  v8 = [(GPRecipe *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(GPRecipe *)v8 setPromptElements:v6];
    [(GPRecipe *)v9 setSourceImage:v7];
  }

  return v9;
}

- (GPRecipe)initWithEncodedRecipe:(id)a3 prompt:(id)a4 contextElements:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([v9 length])
  {
    v12 = [[GPPromptElement alloc] initWithText:v9];
    [v11 addObject:v12];
  }
  [v11 addObjectsFromArray:v10];
  v13 = [(GPRecipe *)self initWithPromptElements:v11 sourceImage:0];
  v14 = v13;
  if (v13) {
    [(GPRecipe *)v13 setAdditionalMetadata:v8];
  }

  return v14;
}

- (GPRecipe)initWithEncodedRecipe:(id)a3 prompts:(id)a4 contextElements:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v17, "length", (void)v22))
        {
          v18 = [[GPPromptElement alloc] initWithText:v17];
          [v11 addObject:v18];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }

  [v11 addObjectsFromArray:v10];
  v19 = [(GPRecipe *)self initWithPromptElements:v11 sourceImage:0];
  v20 = v19;
  if (v19) {
    [(GPRecipe *)v19 setAdditionalMetadata:v8];
  }

  return v20;
}

- (NSData)additionalMetadata
{
  return self->_additionalMetadata;
}

- (void)setAdditionalMetadata:(id)a3
{
}

- (NSArray)promptElements
{
  return self->_promptElements;
}

- (void)setPromptElements:(id)a3
{
}

- (UIImage)sourceImage
{
  return (UIImage *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSourceImage:(id)a3
{
}

- (BOOL)sourceImageIsSketch
{
  return self->_sourceImageIsSketch;
}

- (void)setSourceImageIsSketch:(BOOL)a3
{
  self->_sourceImageIsSketch = a3;
}

- (GPDrawOnImageRecipe)drawOnImageRecipe
{
  return self->_drawOnImageRecipe;
}

- (void)setDrawOnImageRecipe:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawOnImageRecipe, 0);
  objc_storeStrong((id *)&self->_sourceImage, 0);
  objc_storeStrong((id *)&self->_promptElements, 0);

  objc_storeStrong((id *)&self->_additionalMetadata, 0);
}

@end