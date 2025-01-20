@interface PHContentEditingOutputRequestOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)isAsyncAdjustment;
- (BOOL)isOnlyChangingOriginalChoice;
- (BOOL)preferHEICForRenderedImages;
- (PHContentEditingOutputRequestOptions)initWithCoder:(id)a3;
- (id)description;
- (int64_t)playbackStyle;
- (void)encodeWithCoder:(id)a3;
- (void)setAsyncAdjustment:(BOOL)a3;
- (void)setOnlyChangingOriginalChoice:(BOOL)a3;
- (void)setPlaybackStyle:(int64_t)a3;
- (void)setPreferHEICForRenderedImages:(BOOL)a3;
@end

@implementation PHContentEditingOutputRequestOptions

- (void)setPreferHEICForRenderedImages:(BOOL)a3
{
  self->_preferHEICForRenderedImages = a3;
}

- (BOOL)preferHEICForRenderedImages
{
  return self->_preferHEICForRenderedImages;
}

- (void)setPlaybackStyle:(int64_t)a3
{
  self->_playbackStyle = a3;
}

- (int64_t)playbackStyle
{
  return self->_playbackStyle;
}

- (BOOL)isOnlyChangingOriginalChoice
{
  return self->_onlyChangingOriginalChoice;
}

- (void)setAsyncAdjustment:(BOOL)a3
{
  self->_asyncAdjustment = a3;
}

- (BOOL)isAsyncAdjustment
{
  return self->_asyncAdjustment;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL asyncAdjustment = self->_asyncAdjustment;
  id v5 = a3;
  [v5 encodeBool:asyncAdjustment forKey:@"asyncAdjustment"];
  [v5 encodeBool:self->_onlyChangingOriginalChoice forKey:@"onlyChangingOriginalChoice"];
  [v5 encodeInteger:self->_playbackStyle forKey:@"playbackStyle"];
  [v5 encodeBool:self->_preferHEICForRenderedImages forKey:@"preferHEICForRenderedImages"];
}

- (PHContentEditingOutputRequestOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PHContentEditingOutputRequestOptions;
  id v5 = [(PHContentEditingOutputRequestOptions *)&v7 init];
  if (v5)
  {
    v5->_BOOL asyncAdjustment = [v4 decodeBoolForKey:@"asyncAdjustment"];
    v5->_onlyChangingOriginalChoice = [v4 decodeBoolForKey:@"onlyChangingOriginalChoice"];
    v5->_playbackStyle = [v4 decodeIntegerForKey:@"playbackStyle"];
    v5->_preferHEICForRenderedImages = [v4 decodeBoolForKey:@"preferHEICForRenderedImages"];
  }

  return v5;
}

- (void)setOnlyChangingOriginalChoice:(BOOL)a3
{
  if (a3) {
    self->_BOOL asyncAdjustment = 1;
  }
  self->_onlyChangingOriginalChoice = a3;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = (void *)v5;
  objc_super v7 = @"Y";
  if (self->_asyncAdjustment) {
    v8 = @"Y";
  }
  else {
    v8 = @"N";
  }
  if (!self->_onlyChangingOriginalChoice) {
    objc_super v7 = @"N";
  }
  v9 = [v3 stringWithFormat:@"<%@ %p> async: %@, onlyOriginalChoice: %@, ", v5, self, v8, v7];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end