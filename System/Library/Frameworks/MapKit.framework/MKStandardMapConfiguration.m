@interface MKStandardMapConfiguration
+ (BOOL)_overlayRequiresModernMap:(id)a3;
+ (BOOL)_overlaySupportsElevation:(id)a3;
+ (BOOL)_overlaysRequireModernMap:(id)a3;
+ (BOOL)_overlaysSupportElevation:(id)a3;
+ (BOOL)supportsSecureCoding;
- (BOOL)_allowsTerrainModePromotion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToStandardMapConfiguration:(id)a3;
- (MKStandardMapConfiguration)init;
- (MKStandardMapConfiguration)initWithCoder:(id)a3;
- (MKStandardMapConfiguration)initWithElevationStyle:(MKMapElevationStyle)elevationStyle;
- (MKStandardMapConfiguration)initWithElevationStyle:(MKMapElevationStyle)elevationStyle emphasisStyle:(MKStandardMapEmphasisStyle)emphasisStyle;
- (MKStandardMapConfiguration)initWithEmphasisStyle:(MKStandardMapEmphasisStyle)emphasisStyle;
- (MKStandardMapEmphasisStyle)emphasisStyle;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_addObserver:(id)a3 options:(unint64_t)a4 context:(void *)a5;
- (void)_removeObserver:(id)a3 context:(void *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setEmphasisStyle:(MKStandardMapEmphasisStyle)emphasisStyle;
@end

@implementation MKStandardMapConfiguration

- (MKStandardMapEmphasisStyle)emphasisStyle
{
  return self->_emphasisStyle;
}

- (BOOL)_allowsTerrainModePromotion
{
  return (unint64_t)(self->_emphasisStyle - 103) < 0xFFFFFFFFFFFFFFFELL;
}

- (void)_removeObserver:(id)a3 context:(void *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MKStandardMapConfiguration;
  id v6 = a3;
  [(MKMapConfiguration *)&v7 _removeObserver:v6 context:a4];
  [(MKStandardMapConfiguration *)self removeObserver:v6, @"emphasisStyle", a4, v7.receiver, v7.super_class forKeyPath context];
}

- (void)_addObserver:(id)a3 options:(unint64_t)a4 context:(void *)a5
{
  v9.receiver = self;
  v9.super_class = (Class)MKStandardMapConfiguration;
  id v8 = a3;
  [(MKMapConfiguration *)&v9 _addObserver:v8 options:a4 context:a5];
  [(MKStandardMapConfiguration *)self addObserver:v8, @"emphasisStyle", a4, a5, v9.receiver, v9.super_class forKeyPath options context];
}

- (MKStandardMapConfiguration)initWithElevationStyle:(MKMapElevationStyle)elevationStyle
{
  v4 = [(MKStandardMapConfiguration *)self init];
  v5 = v4;
  if (v4) {
    [(MKMapConfiguration *)v4 setElevationStyle:elevationStyle];
  }
  return v5;
}

- (MKStandardMapConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)MKStandardMapConfiguration;
  return [(MKMapConfiguration *)&v3 initWithElevationStyle:0];
}

- (MKStandardMapConfiguration)initWithEmphasisStyle:(MKStandardMapEmphasisStyle)emphasisStyle
{
  result = [(MKStandardMapConfiguration *)self init];
  if (result) {
    result->_emphasisStyle = emphasisStyle;
  }
  return result;
}

- (MKStandardMapConfiguration)initWithElevationStyle:(MKMapElevationStyle)elevationStyle emphasisStyle:(MKStandardMapEmphasisStyle)emphasisStyle
{
  id v6 = [(MKStandardMapConfiguration *)self init];
  objc_super v7 = v6;
  if (v6)
  {
    v6->_emphasisStyle = emphasisStyle;
    [(MKMapConfiguration *)v6 setElevationStyle:elevationStyle];
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MKStandardMapConfiguration;
  id v4 = a3;
  [(MKMapConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_emphasisStyle, @"MKStandardMapConfigurationEmphasisStyle", v5.receiver, v5.super_class);
}

- (MKStandardMapConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MKStandardMapConfiguration;
  objc_super v5 = [(MKMapConfiguration *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_emphasisStyle = [v4 decodeIntegerForKey:@"MKStandardMapConfigurationEmphasisStyle"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MKStandardMapConfiguration;
  id result = [(MKMapConfiguration *)&v5 copyWithZone:a3];
  *((void *)result + 4) = self->_emphasisStyle;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(MKStandardMapConfiguration *)self isEqualToStandardMapConfiguration:v4];

  return v5;
}

- (BOOL)isEqualToStandardMapConfiguration:(id)a3
{
  id v4 = a3;
  if (v4
    && (v14.receiver = self,
        v14.super_class = (Class)MKStandardMapConfiguration,
        [(MKMapConfiguration *)&v14 isEqual:v4])
    && (int64_t emphasisStyle = self->_emphasisStyle, emphasisStyle == [v4 emphasisStyle]))
  {
    id v6 = [(MKStandardMapConfiguration *)self pointOfInterestFilter];
    objc_super v7 = [v4 pointOfInterestFilter];
    unint64_t v8 = v6;
    unint64_t v9 = v7;
    if (v8 | v9 && (int v10 = [(id)v8 isEqual:v9], (id)v9, (id)v8, !v10))
    {
      LOBYTE(v12) = 0;
    }
    else
    {
      BOOL v11 = [(MKStandardMapConfiguration *)self showsTraffic];
      int v12 = v11 ^ [v4 showsTraffic] ^ 1;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

+ (BOOL)_overlayRequiresModernMap:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 _requiresModernMap];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (BOOL)_overlaysRequireModernMap:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(a1, "_overlayRequiresModernMap:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

+ (BOOL)_overlaySupportsElevation:(id)a3
{
  id v4 = a3;
  BOOL v5 = ([a1 _overlayRequiresModernMap:v4] & 1) == 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [v4 elevations] != 0;

  return v5;
}

+ (BOOL)_overlaysSupportElevation:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (!objc_msgSend(a1, "_overlaySupportsElevation:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (void)setEmphasisStyle:(MKStandardMapEmphasisStyle)emphasisStyle
{
  self->_int64_t emphasisStyle = emphasisStyle;
}

@end