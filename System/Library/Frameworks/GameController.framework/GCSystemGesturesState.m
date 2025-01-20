@interface GCSystemGesturesState
+ (BOOL)supportsSecureCoding;
- (GCSystemGesturesState)init;
- (GCSystemGesturesState)initWithCoder:(id)a3;
- (GCSystemGesturesState)initWithEnabledSystemGestures:(id)a3 disabledSystemGestures:(id)a4 bundleIdentifier:(id)a5;
- (NSSet)disabledSystemGestureInputNames;
- (NSSet)enabledSystemGestureInputNames;
- (NSString)bundleIdentifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setDisabledSystemGestureInputNames:(id)a3;
- (void)setEnabledSystemGestureInputNames:(id)a3;
@end

@implementation GCSystemGesturesState

- (GCSystemGesturesState)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = [(GCSystemGesturesState *)self initWithEnabledSystemGestures:v3 disabledSystemGestures:v4 bundleIdentifier:@"N/A"];

  return v5;
}

- (GCSystemGesturesState)initWithEnabledSystemGestures:(id)a3 disabledSystemGestures:(id)a4 bundleIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)GCSystemGesturesState;
  v12 = [(GCSystemGesturesState *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_disabledSystemGestureInputNames, a4);
    objc_storeStrong((id *)&v13->_enabledSystemGestureInputNames, a3);
    objc_storeStrong((id *)&v13->_bundleIdentifier, a5);
  }

  return v13;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@ (%@) enabled: %@ disabled: %@>", objc_opt_class(), self->_bundleIdentifier, self->_enabledSystemGestureInputNames, self->_disabledSystemGestureInputNames];
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSSet)disabledSystemGestureInputNames
{
  return self->_disabledSystemGestureInputNames;
}

- (void)setDisabledSystemGestureInputNames:(id)a3
{
}

- (NSSet)enabledSystemGestureInputNames
{
  return self->_enabledSystemGestureInputNames;
}

- (void)setEnabledSystemGestureInputNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledSystemGestureInputNames, 0);
  objc_storeStrong((id *)&self->_disabledSystemGestureInputNames, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCSystemGesturesState)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(GCSystemGesturesState *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = +[NSSet setWithObjects:](&off_26D2B4E80, "setWithObjects:", v6, objc_opt_class(), 0);
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"_disabledSystemGestureInputNames"];
    disabledSystemGestureInputNames = v5->_disabledSystemGestureInputNames;
    v5->_disabledSystemGestureInputNames = (NSSet *)v8;

    uint64_t v10 = objc_opt_class();
    id v11 = +[NSSet setWithObjects:](&off_26D2B4E80, "setWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"_enabledSystemGestureInputNames"];
    enabledSystemGestureInputNames = v5->_enabledSystemGestureInputNames;
    v5->_enabledSystemGestureInputNames = (NSSet *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  disabledSystemGestureInputNames = self->_disabledSystemGestureInputNames;
  id v5 = a3;
  [v5 encodeObject:disabledSystemGestureInputNames forKey:@"_disabledSystemGestureInputNames"];
  [v5 encodeObject:self->_enabledSystemGestureInputNames forKey:@"_enabledSystemGestureInputNames"];
  [v5 encodeObject:self->_bundleIdentifier forKey:@"_bundleIdentifier"];
}

@end