@interface PHPickerUpdateConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)_didSetEdgesWithoutContentMargins;
- (BOOL)_didSetMinimumSelectionLimit;
- (BOOL)_didSetSelectionLimit;
- (BOOL)_isValidConfiguration;
- (BOOL)isEqual:(id)a3;
- (NSDirectionalRectEdge)edgesWithoutContentMargins;
- (NSInteger)selectionLimit;
- (PHPickerUpdateConfiguration)init;
- (PHPickerUpdateConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)minimumSelectionLimit;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEdgesWithoutContentMargins:(NSDirectionalRectEdge)edgesWithoutContentMargins;
- (void)setMinimumSelectionLimit:(int64_t)a3;
- (void)setSelectionLimit:(NSInteger)selectionLimit;
@end

@implementation PHPickerUpdateConfiguration

- (int64_t)minimumSelectionLimit
{
  return self->_minimumSelectionLimit;
}

- (BOOL)_didSetMinimumSelectionLimit
{
  return self->__didSetMinimumSelectionLimit;
}

- (BOOL)_didSetSelectionLimit
{
  return self->__didSetSelectionLimit;
}

- (BOOL)_didSetEdgesWithoutContentMargins
{
  return self->__didSetEdgesWithoutContentMargins;
}

- (NSDirectionalRectEdge)edgesWithoutContentMargins
{
  return self->_edgesWithoutContentMargins;
}

- (NSInteger)selectionLimit
{
  return self->_selectionLimit;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  unint64_t edgesWithoutContentMargins = self->_edgesWithoutContentMargins;
  id v7 = a3;
  v6 = [v4 numberWithUnsignedInteger:edgesWithoutContentMargins];
  [v7 encodeObject:v6 forKey:@"PHPickerUpdateConfigurationCoderEdgesWithoutContentMarginsKey"];

  [v7 encodeInteger:self->_selectionLimit forKey:@"PHPickerUpdateConfigurationCoderSelectionLimitKey"];
  [v7 encodeInteger:self->_minimumSelectionLimit forKey:@"PHPickerUpdateConfigurationCoderMinimumSelectionLimitKey"];
  [v7 encodeBool:self->__didSetEdgesWithoutContentMargins forKey:@"PHPickerUpdateConfigurationCoderDidSetEdgesWithoutContentMarginsKey"];
  [v7 encodeBool:self->__didSetSelectionLimit forKey:@"PHPickerUpdateConfigurationCoderDidSetSelectionLimitKey"];
  [v7 encodeBool:self->__didSetMinimumSelectionLimit forKey:@"PHPickerUpdateConfigurationCoderDidSetMinimumSelectionLimitKey"];
}

- (PHPickerUpdateConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PHPickerUpdateConfiguration;
  v5 = [(PHPickerUpdateConfiguration *)&v8 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHPickerUpdateConfigurationCoderEdgesWithoutContentMarginsKey"];
    v5->_unint64_t edgesWithoutContentMargins = [v6 unsignedIntegerValue];

    v5->_selectionLimit = [v4 decodeIntegerForKey:@"PHPickerUpdateConfigurationCoderSelectionLimitKey"];
    v5->_minimumSelectionLimit = [v4 decodeIntegerForKey:@"PHPickerUpdateConfigurationCoderMinimumSelectionLimitKey"];
    v5->__didSetEdgesWithoutContentMargins = [v4 decodeBoolForKey:@"PHPickerUpdateConfigurationCoderDidSetEdgesWithoutContentMarginsKey"];
    v5->__didSetSelectionLimit = [v4 decodeBoolForKey:@"PHPickerUpdateConfigurationCoderDidSetSelectionLimitKey"];
    v5->__didSetMinimumSelectionLimit = [v4 decodeBoolForKey:@"PHPickerUpdateConfigurationCoderDidSetMinimumSelectionLimitKey"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init(PHPickerUpdateConfiguration);
  *((void *)result + 3) = self->_edgesWithoutContentMargins;
  *((void *)result + 2) = self->_selectionLimit;
  *((void *)result + 4) = self->_minimumSelectionLimit;
  *((unsigned char *)result + 8) = self->__didSetEdgesWithoutContentMargins;
  *((unsigned char *)result + 9) = self->__didSetSelectionLimit;
  *((unsigned char *)result + 10) = self->__didSetMinimumSelectionLimit;
  return result;
}

- (BOOL)_isValidConfiguration
{
  int64_t selectionLimit = self->_selectionLimit;
  BOOL v4 = selectionLimit >= 0;
  if (selectionLimit < 0)
  {
    v5 = PLPickerGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217C33000, v5, OS_LOG_TYPE_ERROR, "selection limit is negative", buf, 2u);
    }
  }
  if (self->_minimumSelectionLimit < 0)
  {
    v6 = PLPickerGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)objc_super v8 = 0;
      _os_log_impl(&dword_217C33000, v6, OS_LOG_TYPE_ERROR, "lower selection limit is negative", v8, 2u);
    }

    return 0;
  }
  return v4;
}

- (void)setMinimumSelectionLimit:(int64_t)a3
{
  self->_minimumSelectionLimit = a3;
  self->__didSetMinimumSelectionLimit = 1;
}

- (void)setSelectionLimit:(NSInteger)selectionLimit
{
  self->_int64_t selectionLimit = selectionLimit;
  self->__didSetSelectionLimit = 1;
}

- (void)setEdgesWithoutContentMargins:(NSDirectionalRectEdge)edgesWithoutContentMargins
{
  self->_unint64_t edgesWithoutContentMargins = edgesWithoutContentMargins;
  self->__didSetEdgesWithoutContentMargins = 1;
}

- (unint64_t)hash
{
  unint64_t v2 = self->_selectionLimit - self->_edgesWithoutContentMargins + 32 * self->_edgesWithoutContentMargins;
  int64_t v3 = self->_minimumSelectionLimit - v2 + 32 * v2;
  uint64_t v4 = self->__didSetEdgesWithoutContentMargins - v3 + 32 * v3;
  uint64_t v5 = self->__didSetSelectionLimit - v4 + 32 * v4;
  return self->__didSetMinimumSelectionLimit - v5 + 32 * v5 + 887503681;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PHPickerUpdateConfiguration *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
LABEL_15:

    return v7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v7 = 0;
    goto LABEL_15;
  }
  uint64_t v5 = v4;
  v6 = (objc_class *)objc_opt_class();
  if (v5)
  {
    if (objc_opt_isKindOfClass())
    {
      BOOL v7 = self->_edgesWithoutContentMargins == v5->_edgesWithoutContentMargins
        && self->_selectionLimit == v5->_selectionLimit
        && self->_minimumSelectionLimit == v5->_minimumSelectionLimit
        && self->__didSetEdgesWithoutContentMargins == v5->__didSetEdgesWithoutContentMargins
        && self->__didSetSelectionLimit == v5->__didSetSelectionLimit
        && self->__didSetMinimumSelectionLimit == v5->__didSetMinimumSelectionLimit;

      goto LABEL_15;
    }
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSStringFromClass(v6);
    objc_claimAutoreleasedReturnValue();
  }
  v11 = (PHPickerUpdateConfiguration *)_PFAssertFailHandler();
  return [(PHPickerUpdateConfiguration *)v11 init];
}

- (PHPickerUpdateConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)PHPickerUpdateConfiguration;
  id result = [(PHPickerUpdateConfiguration *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_int64_t selectionLimit = xmmword_217C61970;
    result->_minimumSelectionLimit = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end