@interface AXVKMultiSectionFeatureWrapper
- (AXVKMultiSectionFeatureWrapper)initWithFeature:(id)a3;
- (BOOL)isEqual:(id)a3;
- (GEOMultiSectionFeature)feature;
- (double)creationTime;
- (id)description;
- (id)featureName;
- (unint64_t)hash;
- (void)dealloc;
- (void)setCreationTime:(double)a3;
- (void)setFeature:(id)a3;
@end

@implementation AXVKMultiSectionFeatureWrapper

- (AXVKMultiSectionFeatureWrapper)initWithFeature:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXVKMultiSectionFeatureWrapper;
  v5 = [(AXVKMultiSectionFeatureWrapper *)&v9 init];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = GEOMultiSectionFeatureRetain();
      feature = v5->_feature;
      v5->_feature = (GEOMultiSectionFeature *)v6;
    }
    v5->_creationTime = CFAbsoluteTimeGetCurrent();
  }

  return v5;
}

- (void)dealloc
{
  if (self->_feature) {
    GEOMultiSectionFeatureRelease();
  }
  v3.receiver = self;
  v3.super_class = (Class)AXVKMultiSectionFeatureWrapper;
  [(AXVKMultiSectionFeatureWrapper *)&v3 dealloc];
}

- (void)setFeature:(id)a3
{
  id v4 = (GEOMultiSectionFeature *)a3;
  feature = self->_feature;
  if (feature != v4)
  {
    v8 = v4;
    if (feature) {
      GEOMultiSectionFeatureRelease();
    }
    uint64_t v6 = v8;
    if (v8)
    {
      GEOMultiSectionFeatureRetain();
      uint64_t v6 = (GEOMultiSectionFeature *)objc_claimAutoreleasedReturnValue();
    }
    v7 = self->_feature;
    self->_feature = v6;

    id v4 = v8;
  }
}

- (GEOMultiSectionFeature)feature
{
  return self->_feature;
}

- (id)featureName
{
  v2 = [(GEOMultiSectionFeature *)self->_feature feature];
  uint64_t v3 = [v2 name];

  if (v3)
  {
    id v4 = [NSString stringWithUTF8String:v3];
  }
  else
  {
    id v4 = @"Unknown";
  }

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(AXVKMultiSectionFeatureWrapper *)self featureName];
  uint64_t v6 = [v3 stringWithFormat:@"%@:%p: %@", v4, self, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (AXVKMultiSectionFeatureWrapper *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(AXVKMultiSectionFeatureWrapper *)self feature];
      v7 = [(AXVKMultiSectionFeatureWrapper *)v5 feature];
      BOOL v8 = AXVKMultiSectionFeatureEqualToMultiSectionFeature(v6, v7);
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  return (unint64_t)(self->_creationTime
                          + (double)(unint64_t)(53 * AXVKMultiSectionFeatureHash(self->_feature) + 2809));
}

- (double)creationTime
{
  return self->_creationTime;
}

- (void)setCreationTime:(double)a3
{
  self->_creationTime = a3;
}

- (void).cxx_destruct
{
}

@end