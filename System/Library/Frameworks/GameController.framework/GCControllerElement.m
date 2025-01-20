@interface GCControllerElement
- (BOOL)_commitPendingValueOnQueue:(id)a3;
- (BOOL)_setPendingValueIfChanged:(float)a3;
- (BOOL)_setValue:(float)a3;
- (BOOL)_setValue:(float)a3 queue:(id)a4;
- (BOOL)isAnalog;
- (BOOL)isBoundToSystemGesture;
- (BOOL)mappableToSystemGestures;
- (BOOL)remappable;
- (BOOL)updatePending;
- (GCControllerElement)collection;
- (GCControllerElement)init;
- (GCDevice)device;
- (GCSystemGestureState)preferredSystemGestureState;
- (NSSet)aliases;
- (NSString)localizedName;
- (NSString)nameLocalizationKey;
- (NSString)primaryAlias;
- (NSString)sfSymbolsName;
- (NSString)unmappedLocalizedName;
- (NSString)unmappedNameLocalizationKey;
- (NSString)unmappedSfSymbolsName;
- (float)deadzone;
- (float)pendingValue;
- (float)value;
- (int)getAndResetTimesPressed;
- (int)remappingKey;
- (void)_resetPendingValue;
- (void)_setPendingValue:(float)a3;
- (void)setAliases:(id)a3;
- (void)setBoundToSystemGesture:(BOOL)a3;
- (void)setCollection:(id)a3;
- (void)setDeadzone:(float)a3;
- (void)setDevice:(id)a3;
- (void)setLocalizedName:(NSString *)localizedName;
- (void)setMappableToSystemGestures:(BOOL)a3;
- (void)setNameLocalizationKey:(id)a3;
- (void)setPendingValue:(float)a3;
- (void)setPreferredSystemGestureState:(GCSystemGestureState)preferredSystemGestureState;
- (void)setPrimaryAlias:(id)a3;
- (void)setRemappable:(BOOL)a3;
- (void)setRemappingKey:(int)a3;
- (void)setSfSymbolsName:(NSString *)sfSymbolsName;
- (void)setUnmappedLocalizedName:(NSString *)unmappedLocalizedName;
- (void)setUnmappedNameLocalizationKey:(id)a3;
- (void)setUnmappedSfSymbolsName:(NSString *)unmappedSfSymbolsName;
- (void)setUpdatePending:(BOOL)a3;
@end

@implementation GCControllerElement

- (GCControllerElement)init
{
  v6.receiver = self;
  v6.super_class = (Class)GCControllerElement;
  v2 = [(GCControllerElement *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    aliases = v2->_aliases;
    v2->_aliases = (NSMutableSet *)v3;
  }
  return v2;
}

- (void)setDevice:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_device, obj);
    id v6 = objc_loadWeakRetained((id *)&self->_collection);
    v5 = obj;
    if (v6)
    {
      v7 = v6;
      v8 = (GCControllerElement *)objc_loadWeakRetained((id *)&self->_collection);

      v5 = obj;
      if (v8 != self)
      {
        id v9 = objc_loadWeakRetained((id *)&self->_collection);
        [v9 setDevice:obj];

        v5 = obj;
      }
    }
  }
}

- (int)getAndResetTimesPressed
{
  return 0;
}

- (float)value
{
  return 0.0;
}

- (BOOL)isAnalog
{
  return 1;
}

- (BOOL)_setPendingValueIfChanged:(float)a3
{
  [(GCControllerElement *)self value];
  float v6 = *(float *)&v5;
  if (*(float *)&v5 != a3)
  {
    *(float *)&double v5 = a3;
    [(GCControllerElement *)self _setPendingValue:v5];
  }
  return v6 != a3;
}

- (void)_setPendingValue:(float)a3
{
  if (self->_updatePending)
  {
    if (fabsf(a3) > fabsf(self->_pendingValue)) {
      self->_pendingValue = a3;
    }
  }
  else
  {
    self->_pendingValue = a3;
    self->_updatePending = 1;
  }
}

- (void)_resetPendingValue
{
  self->_pendingValue = 0.0;
  self->_updatePending = 0;
}

- (BOOL)_commitPendingValueOnQueue:(id)a3
{
  id v4 = a3;
  if (self->_updatePending)
  {
    float pendingValue = self->_pendingValue;
    [(GCControllerElement *)self value];
    BOOL v7 = pendingValue != *(float *)&v6;
    if (pendingValue != *(float *)&v6)
    {
      *(float *)&double v6 = self->_pendingValue;
      [(GCControllerElement *)self _setValue:v4 queue:v6];
    }
    [(GCControllerElement *)self _resetPendingValue];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_setValue:(float)a3
{
  return -[GCControllerElement _setValue:queue:](self, "_setValue:queue:", &_dispatch_main_q);
}

- (BOOL)_setValue:(float)a3 queue:(id)a4
{
  return 0;
}

- (NSSet)aliases
{
  v2 = (void *)[(NSMutableSet *)self->_aliases copy];

  return (NSSet *)v2;
}

- (void)setAliases:(id)a3
{
  [(NSMutableSet *)self->_aliases setSet:a3];
  if (self->_primaryAlias)
  {
    aliases = self->_aliases;
    -[NSMutableSet addObject:](aliases, "addObject:");
  }
}

- (NSString)primaryAlias
{
  return self->_primaryAlias;
}

- (void)setPrimaryAlias:(id)a3
{
  double v5 = (NSString *)a3;
  primaryAlias = self->_primaryAlias;
  if (primaryAlias != v5)
  {
    v8 = v5;
    BOOL v7 = [(NSString *)primaryAlias isEqualToString:v5];
    double v5 = v8;
    if (!v7)
    {
      if (self->_primaryAlias)
      {
        -[NSMutableSet removeObject:](self->_aliases, "removeObject:");
        double v5 = v8;
      }
      if (v5) {
        [(NSMutableSet *)self->_aliases addObject:v8];
      }
      objc_storeStrong((id *)&self->_primaryAlias, a3);
      double v5 = v8;
    }
  }
}

- (void)setUnmappedSfSymbolsName:(NSString *)unmappedSfSymbolsName
{
  id v4 = unmappedSfSymbolsName;
  double v5 = (NSString *)[(NSString *)v4 copy];
  double v6 = self->_unmappedSfSymbolsName;
  self->_unmappedSfSymbolsName = v5;

  BOOL v7 = (NSString *)[(NSString *)v4 copy];
  sfSymbolsName = self->_sfSymbolsName;
  self->_sfSymbolsName = v7;
}

- (NSString)localizedName
{
  localizedName = self->_localizedName;
  if (localizedName)
  {
    uint64_t v3 = localizedName;
  }
  else if (self->_nameLocalizationKey)
  {
    _GCFConvertStringToLocalizedString();
    uint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (NSString)unmappedLocalizedName
{
  unmappedLocalizedName = self->_unmappedLocalizedName;
  if (unmappedLocalizedName)
  {
    uint64_t v3 = unmappedLocalizedName;
  }
  else if (self->_unmappedNameLocalizationKey)
  {
    _GCFConvertStringToLocalizedString();
    uint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)setUnmappedNameLocalizationKey:(id)a3
{
  id v4 = a3;
  double v5 = (NSString *)[v4 copy];
  unmappedNameLocalizationKey = self->_unmappedNameLocalizationKey;
  self->_unmappedNameLocalizationKey = v5;

  BOOL v7 = (NSString *)[v4 copy];
  nameLocalizationKey = self->_nameLocalizationKey;
  self->_nameLocalizationKey = v7;
}

- (GCControllerElement)collection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collection);

  return (GCControllerElement *)WeakRetained;
}

- (void)setCollection:(id)a3
{
}

- (GCDevice)device
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);

  return (GCDevice *)WeakRetained;
}

- (BOOL)updatePending
{
  return self->_updatePending;
}

- (void)setUpdatePending:(BOOL)a3
{
  self->_updatePending = a3;
}

- (float)pendingValue
{
  return self->_pendingValue;
}

- (void)setPendingValue:(float)a3
{
  self->_float pendingValue = a3;
}

- (float)deadzone
{
  return self->_deadzone;
}

- (void)setDeadzone:(float)a3
{
  self->_deadzone = a3;
}

- (BOOL)isBoundToSystemGesture
{
  return self->_boundToSystemGesture;
}

- (void)setBoundToSystemGesture:(BOOL)a3
{
  self->_boundToSystemGesture = a3;
}

- (GCSystemGestureState)preferredSystemGestureState
{
  return self->_preferredSystemGestureState;
}

- (void)setPreferredSystemGestureState:(GCSystemGestureState)preferredSystemGestureState
{
  self->_preferredSystemGestureState = preferredSystemGestureState;
}

- (NSString)sfSymbolsName
{
  return self->_sfSymbolsName;
}

- (void)setSfSymbolsName:(NSString *)sfSymbolsName
{
}

- (void)setLocalizedName:(NSString *)localizedName
{
}

- (NSString)unmappedSfSymbolsName
{
  return self->_unmappedSfSymbolsName;
}

- (void)setUnmappedLocalizedName:(NSString *)unmappedLocalizedName
{
}

- (BOOL)remappable
{
  return self->_remappable;
}

- (void)setRemappable:(BOOL)a3
{
  self->_remappable = a3;
}

- (int)remappingKey
{
  return self->_remappingKey;
}

- (void)setRemappingKey:(int)a3
{
  self->_remappingKey = a3;
}

- (BOOL)mappableToSystemGestures
{
  return self->_mappableToSystemGestures;
}

- (void)setMappableToSystemGestures:(BOOL)a3
{
  self->_mappableToSystemGestures = a3;
}

- (NSString)unmappedNameLocalizationKey
{
  return self->_unmappedNameLocalizationKey;
}

- (NSString)nameLocalizationKey
{
  return self->_nameLocalizationKey;
}

- (void)setNameLocalizationKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_unmappedNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_unmappedLocalizedName, 0);
  objc_storeStrong((id *)&self->_unmappedSfSymbolsName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_sfSymbolsName, 0);
  objc_storeStrong((id *)&self->_primaryAlias, 0);
  objc_destroyWeak((id *)&self->_device);
  objc_destroyWeak((id *)&self->_collection);

  objc_storeStrong((id *)&self->_aliases, 0);
}

@end