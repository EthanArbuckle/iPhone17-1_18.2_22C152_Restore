@interface JFXTrackedEffectProperties
+ (BOOL)supportsSecureCoding;
- (BOOL)isTrackingDisabled;
- (JFXTrackedEffectProperties)init;
- (JFXTrackedEffectProperties)initWithCoder:(id)a3;
- (JFXTrackedEffectPropertiesDelegate)delegate;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)currentTrackingType;
- (int64_t)internalTrackingType;
- (void)enableTrackingState:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableTracking:(BOOL)a3;
- (void)setInternalTrackingType:(int64_t)a3;
- (void)setTrackingType:(int64_t)a3;
@end

@implementation JFXTrackedEffectProperties

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (JFXTrackedEffectProperties)init
{
  v5.receiver = self;
  v5.super_class = (Class)JFXTrackedEffectProperties;
  v2 = [(JFXTrackedEffectProperties *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(JFXTrackedEffectProperties *)v2 setTrackingType:0];
    [(JFXTrackedEffectProperties *)v3 setDisableTracking:0];
    [(JFXTrackedEffectProperties *)v3 setInternalTrackingType:[(JFXTrackedEffectProperties *)v3 currentTrackingType]];
  }
  return v3;
}

- (JFXTrackedEffectProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)JFXTrackedEffectProperties;
  objc_super v5 = [(JFXTrackedEffectProperties *)&v7 init];
  if (v5)
  {
    -[JFXTrackedEffectProperties setTrackingType:](v5, "setTrackingType:", [v4 decodeIntegerForKey:@"kJFXTrackedEffectProperties_typeKey"]);
    -[JFXTrackedEffectProperties setDisableTracking:](v5, "setDisableTracking:", [v4 decodeBoolForKey:@"kJFXTrackedEffectProperties_disableKey"]);
    [(JFXTrackedEffectProperties *)v5 setInternalTrackingType:[(JFXTrackedEffectProperties *)v5 currentTrackingType]];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setTrackingType:", -[JFXTrackedEffectProperties trackingType](self, "trackingType"));
  objc_msgSend(v4, "setDisableTracking:", -[JFXTrackedEffectProperties isTrackingDisabled](self, "isTrackingDisabled"));
  objc_msgSend(v4, "setInternalTrackingType:", -[JFXTrackedEffectProperties internalTrackingType](self, "internalTrackingType"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[JFXTrackedEffectProperties trackingType](self, "trackingType"), @"kJFXTrackedEffectProperties_typeKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[JFXTrackedEffectProperties isTrackingDisabled](self, "isTrackingDisabled"), @"kJFXTrackedEffectProperties_disableKey");
}

- (void)setTrackingType:(int64_t)a3
{
  if ([(JFXTrackedEffectProperties *)self internalTrackingType] != a3)
  {
    [(JFXTrackedEffectProperties *)self setInternalTrackingType:a3];
    id v5 = [(JFXTrackedEffectProperties *)self delegate];
    [v5 trackedEffectProperties:self didChangeTrackingType:1 didChangeEnabled:0];
  }
}

- (int64_t)currentTrackingType
{
  if ([(JFXTrackedEffectProperties *)self isTrackingDisabled]) {
    return 0;
  }
  return [(JFXTrackedEffectProperties *)self internalTrackingType];
}

- (void)enableTrackingState:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(JFXTrackedEffectProperties *)self isTrackingDisabled] == a3)
  {
    [(JFXTrackedEffectProperties *)self setDisableTracking:!v3];
    id v5 = [(JFXTrackedEffectProperties *)self delegate];
    [v5 trackedEffectProperties:self didChangeTrackingType:0 didChangeEnabled:1];
  }
}

- (BOOL)isTrackingDisabled
{
  return self->_disableTracking;
}

- (void)setDisableTracking:(BOOL)a3
{
  self->_disableTracking = a3;
}

- (JFXTrackedEffectPropertiesDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (JFXTrackedEffectPropertiesDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)internalTrackingType
{
  return self->_internalTrackingType;
}

- (void)setInternalTrackingType:(int64_t)a3
{
  self->_internalTrackingType = a3;
}

- (void).cxx_destruct
{
}

@end