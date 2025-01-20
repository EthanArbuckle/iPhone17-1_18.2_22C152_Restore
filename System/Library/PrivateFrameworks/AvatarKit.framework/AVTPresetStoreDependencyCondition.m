@interface AVTPresetStoreDependencyCondition
- (AVTPreset)presetOfOtherCategory;
- (NSString)specificPresetIdentifier;
- (id)displayString;
- (void)setPresetOfOtherCategory:(id)a3;
- (void)setSpecificPresetIdentifier:(id)a3;
@end

@implementation AVTPresetStoreDependencyCondition

- (id)displayString
{
  v3 = NSString;
  specificPresetIdentifier = self->_specificPresetIdentifier;
  v5 = AVTPresetCategoryToString([(AVTPreset *)self->_presetOfOtherCategory category]);
  uint64_t v6 = [(AVTPreset *)self->_presetOfOtherCategory identifier];
  v7 = (void *)v6;
  if (specificPresetIdentifier) {
    [v3 stringWithFormat:@"%@ is \"%@\" and self is \"%@\"", v5, v6, self->_specificPresetIdentifier];
  }
  else {
  v8 = [v3 stringWithFormat:@"%@ is \"%@\"", v5, v6, v10];
  }

  return v8;
}

- (AVTPreset)presetOfOtherCategory
{
  return self->_presetOfOtherCategory;
}

- (void)setPresetOfOtherCategory:(id)a3
{
}

- (NSString)specificPresetIdentifier
{
  return self->_specificPresetIdentifier;
}

- (void)setSpecificPresetIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specificPresetIdentifier, 0);
  objc_storeStrong((id *)&self->_presetOfOtherCategory, 0);
}

@end