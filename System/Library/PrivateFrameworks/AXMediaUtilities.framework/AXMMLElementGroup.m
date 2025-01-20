@interface AXMMLElementGroup
- (AXMMLElementGroup)init;
- (AXMVisionFeature)feature;
- (BOOL)includeChildren;
- (BOOL)topLevel;
- (CGRect)frame;
- (NSMutableArray)subfeatures;
- (double)confidence;
- (id)childFeatures;
- (id)description;
- (id)featureLabel;
- (id)textLabel;
- (void)setConfidence:(double)a3;
- (void)setFeature:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setIncludeChildren:(BOOL)a3;
- (void)setSubfeatures:(id)a3;
- (void)setTopLevel:(BOOL)a3;
@end

@implementation AXMMLElementGroup

- (AXMMLElementGroup)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXMMLElementGroup;
  v2 = [(AXMMLElementGroup *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(AXMMLElementGroup *)v2 setTopLevel:1];
    [(AXMMLElementGroup *)v3 setIncludeChildren:1];
    -[AXMMLElementGroup setFrame:](v3, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v4 = [MEMORY[0x1E4F1CA48] array];
    [(AXMMLElementGroup *)v3 setSubfeatures:v4];
  }
  return v3;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)AXMMLElementGroup;
  v3 = [(AXMMLElementGroup *)&v8 description];
  v4 = [(AXMMLElementGroup *)self feature];
  v5 = [(AXMMLElementGroup *)self subfeatures];
  objc_super v6 = [v3 stringByAppendingFormat:@"\n%@\n%@", v4, v5];

  return v6;
}

- (id)featureLabel
{
  v3 = [(AXMMLElementGroup *)self feature];
  v4 = [v3 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(AXMMLElementGroup *)self feature];
    objc_super v6 = [v5 value];
    uint64_t v7 = [v6 length];

    if (v7)
    {
      objc_super v8 = [(AXMMLElementGroup *)self feature];
      v9 = [v8 value];

      goto LABEL_6;
    }
  }
  else
  {
  }
  v9 = [(AXMMLElementGroup *)self textLabel];
LABEL_6:

  return v9;
}

- (id)textLabel
{
  v3 = [(AXMMLElementGroup *)self subfeatures];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    unint64_t v5 = 0;
    objc_super v6 = &stru_1F0E72D10;
    while (1)
    {
      uint64_t v7 = [(AXMMLElementGroup *)self subfeatures];
      objc_super v8 = [v7 objectAtIndex:v5];

      v9 = [v8 featureLabel];
      v10 = [(AXMMLElementGroup *)self subfeatures];
      unint64_t v11 = [v10 count] - 1;

      if (v5 < v11) {
        break;
      }
      ++v5;
LABEL_19:
      __AXMStringForVariables(v6, v12, v13, v14, v15, v16, v17, v18, v9);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v29 = [(AXMMLElementGroup *)self subfeatures];
      unint64_t v30 = [v29 count];

      objc_super v6 = v28;
      if (v5 >= v30) {
        goto LABEL_22;
      }
    }
    v19 = [(AXMMLElementGroup *)self subfeatures];
    v20 = [v19 objectAtIndex:++v5];

    v21 = [v8 feature];
    uint64_t v22 = [v21 uiClass];
    if (v22 == 5
      || ([v8 feature],
          v33 = objc_claimAutoreleasedReturnValue(),
          [v33 uiClass] == 16))
    {
      v23 = [v20 feature];
      if ([v23 uiClass] == 11)
      {

        if (v22 != 5) {
      }
        }
      else
      {
        v24 = [v20 feature];
        uint64_t v32 = [v24 uiClass];

        if (v22 != 5) {
        if (v32 != 17)
        }
          goto LABEL_18;
      }
      v21 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      v25 = [v9 stringByTrimmingCharactersInSet:v21];

      v26 = [v20 featureLabel];
      v27 = [v26 stringByTrimmingCharactersInSet:v21];

      if (![v27 rangeOfString:v25 options:1])
      {

        v25 = 0;
      }
    }
    else
    {
      v27 = v33;
      v25 = v9;
    }

    v9 = v25;
LABEL_18:

    goto LABEL_19;
  }
  v28 = &stru_1F0E72D10;
LABEL_22:

  return v28;
}

- (id)childFeatures
{
  v2 = [(AXMMLElementGroup *)self subfeatures];
  v3 = objc_msgSend(v2, "ax_mappedArrayUsingBlock:", &__block_literal_global_17);

  return v3;
}

uint64_t __34__AXMMLElementGroup_childFeatures__block_invoke(uint64_t a1, void *a2)
{
  return [a2 feature];
}

- (AXMVisionFeature)feature
{
  return self->_feature;
}

- (void)setFeature:(id)a3
{
}

- (NSMutableArray)subfeatures
{
  return self->_subfeatures;
}

- (void)setSubfeatures:(id)a3
{
}

- (BOOL)topLevel
{
  return self->_topLevel;
}

- (void)setTopLevel:(BOOL)a3
{
  self->_topLevel = a3;
}

- (BOOL)includeChildren
{
  return self->_includeChildren;
}

- (void)setIncludeChildren:(BOOL)a3
{
  self->_includeChildren = a3;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subfeatures, 0);

  objc_storeStrong((id *)&self->_feature, 0);
}

@end