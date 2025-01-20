@interface DOCTagStringRenderingRequest
+ (id)requestForChainedTags:(id)a3 tagDimension:(double)a4 text:(id)a5 textAttributes:(id)a6;
+ (id)requestForTag:(id)a3 tagDimension:(double)a4 text:(id)a5 textAttributes:(id)a6 variant:(unint64_t)a7;
- (DOCTagStringRenderingRequest)init;
- (NSDictionary)textAttributes;
- (NSString)text;
- (double)tagBaselineAdjustment;
- (double)tagToTitleSpacing;
- (id)_UIImageCacheKeyWithAdditionalComponents:(id)a3;
- (void)setTagBaselineAdjustment:(double)a3;
- (void)setTagToTitleSpacing:(double)a3;
- (void)setText:(id)a3;
- (void)setTextAttributes:(id)a3;
@end

@implementation DOCTagStringRenderingRequest

+ (id)requestForTag:(id)a3 tagDimension:(double)a4 text:(id)a5 textAttributes:(id)a6 variant:(unint64_t)a7
{
  v11 = (__CFString *)a5;
  id v12 = a6;
  id v13 = a3;
  v14 = [(id)objc_opt_class() requestForTag:v13 tagDimension:a7 variant:a4];

  if (v14)
  {
    if (v11) {
      v15 = v11;
    }
    else {
      v15 = &stru_26DF49380;
    }
    [v14 setText:v15];
    if (v12) {
      id v16 = v12;
    }
    else {
      id v16 = (id)MEMORY[0x263EFFA78];
    }
    [v14 setTextAttributes:v16];
  }

  return v14;
}

+ (id)requestForChainedTags:(id)a3 tagDimension:(double)a4 text:(id)a5 textAttributes:(id)a6
{
  v9 = (__CFString *)a5;
  id v10 = a6;
  id v11 = a3;
  id v12 = [(id)objc_opt_class() requestForChainedTags:v11 tagDimension:a4];

  if (v12)
  {
    if (v9) {
      id v13 = v9;
    }
    else {
      id v13 = &stru_26DF49380;
    }
    [v12 setText:v13];
    if (v10) {
      id v14 = v10;
    }
    else {
      id v14 = (id)MEMORY[0x263EFFA78];
    }
    [v12 setTextAttributes:v14];
  }

  return v12;
}

- (DOCTagStringRenderingRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)DOCTagStringRenderingRequest;
  result = [(DOCTagRenderingRequest *)&v3 init];
  if (result)
  {
    result->_tagToTitleSpacing = 8.0;
    result->_tagBaselineAdjustment = 0.0;
  }
  return result;
}

- (id)_UIImageCacheKeyWithAdditionalComponents:(id)a3
{
  v13[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [NSNumber numberWithDouble:self->_tagBaselineAdjustment];
  v13[0] = v5;
  v6 = [NSNumber numberWithDouble:self->_tagBaselineAdjustment];
  v13[1] = v6;
  v7 = [(DOCTagStringRenderingRequest *)self text];
  v13[2] = v7;
  v8 = [(DOCTagStringRenderingRequest *)self textAttributes];
  v13[3] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:4];
  v12.receiver = self;
  v12.super_class = (Class)DOCTagStringRenderingRequest;
  id v10 = [(DOCTagRenderingRequest *)&v12 _UIImageCacheKeyWithAdditionalComponents:v9];

  if ([v4 count]) {
    [v10 addObjectsFromArray:v4];
  }

  return v10;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSDictionary)textAttributes
{
  return self->_textAttributes;
}

- (void)setTextAttributes:(id)a3
{
}

- (double)tagToTitleSpacing
{
  return self->_tagToTitleSpacing;
}

- (void)setTagToTitleSpacing:(double)a3
{
  self->_tagToTitleSpacing = a3;
}

- (double)tagBaselineAdjustment
{
  return self->_tagBaselineAdjustment;
}

- (void)setTagBaselineAdjustment:(double)a3
{
  self->_tagBaselineAdjustment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textAttributes, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end