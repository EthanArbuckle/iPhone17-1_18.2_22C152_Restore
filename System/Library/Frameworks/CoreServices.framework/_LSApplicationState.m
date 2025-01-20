@interface _LSApplicationState
+ (BOOL)supportsSecureCoding;
- (BOOL)isAlwaysAvailable;
- (BOOL)isBlocked;
- (BOOL)isDowngraded;
- (BOOL)isInstalled;
- (BOOL)isPlaceholder;
- (BOOL)isRemovedSystemApp;
- (BOOL)isRestricted;
- (BOOL)isRestrictedWithStateProvider:(id)a3;
- (BOOL)isValid;
- (NSString)bundleIdentifier;
- (_LSApplicationState)initWithBundleIdentifier:(id)a3 stateFlags:(unint64_t)a4 ratingRank:(int)a5 installType:(unint64_t)a6;
- (_LSApplicationState)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)installType;
- (void)addStateFlag:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _LSApplicationState

- (void).cxx_destruct
{
}

- (BOOL)isDowngraded
{
  return self->_installType - 7 < 3;
}

- (BOOL)isInstalled
{
  return (LOBYTE(self->_stateFlags) >> 4) & 1;
}

- (_LSApplicationState)initWithBundleIdentifier:(id)a3 stateFlags:(unint64_t)a4 ratingRank:(int)a5 installType:(unint64_t)a6
{
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_LSApplicationState;
  v11 = [(_LSApplicationState *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    bundleIdentifier = v11->_bundleIdentifier;
    v11->_bundleIdentifier = (NSString *)v12;

    v11->_stateFlags = a4;
    v11->_ratingRank = a5;
    v11->_installType = a6;
  }

  return v11;
}

- (BOOL)isRestricted
{
  +[LSApplicationRestrictionsManager sharedInstance]();
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  v4 = -[LSApplicationRestrictionsManager defaultStateProvider](v3);
  LOBYTE(self) = [(_LSApplicationState *)self isRestrictedWithStateProvider:v4];

  return (char)self;
}

- (BOOL)isRestrictedWithStateProvider:(id)a3
{
  id v4 = a3;
  if ([(_LSApplicationState *)self isPlaceholder] && (self->_stateFlags & 0x20) != 0)
  {
    char v8 = 1;
  }
  else
  {
    int ratingRank = self->_ratingRank;
    v6 = +[LSApplicationRestrictionsManager sharedInstance]();
    v7 = -[LSApplicationRestrictionsManager maximumRating](v6);
    if (ratingRank <= (int)[v7 intValue])
    {
      v9 = +[LSApplicationRestrictionsManager sharedInstance]();
      char v8 = -[LSApplicationRestrictionsManager isApplicationRestricted:checkFlags:stateProvider:]((uint64_t)v9, self->_bundleIdentifier, self->_stateFlags, v4);
    }
    else
    {
      char v8 = 1;
    }
  }
  return v8;
}

- (BOOL)isPlaceholder
{
  return (LOBYTE(self->_stateFlags) >> 3) & 1;
}

- (BOOL)isValid
{
  return (LOBYTE(self->_stateFlags) >> 2) & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  bundleIdentifier = self->_bundleIdentifier;
  id v5 = a3;
  [v5 encodeObject:bundleIdentifier forKey:@"bundleIdentifier"];
  [v5 encodeInteger:self->_stateFlags forKey:@"_LSAppStateFlags"];
  [v5 encodeInt:self->_ratingRank forKey:@"ratingRank"];
  [v5 encodeInteger:self->_installType forKey:@"installType"];
}

- (_LSApplicationState)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"bundleIdentifier");
  uint64_t v6 = [v4 decodeIntegerForKey:@"_LSAppStateFlags"];
  uint64_t v7 = [v4 decodeIntForKey:@"ratingRank"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"installType"];
  if (v5)
  {
    v9 = [(_LSApplicationState *)self initWithBundleIdentifier:v5 stateFlags:v6 ratingRank:v7 installType:v8];
  }
  else
  {
    id v10 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F281F8], 4865, (uint64_t)"-[_LSApplicationState initWithCoder:]", 147, 0);
    [v4 failWithError:v10];

    v9 = 0;
  }

  return v9;
}

- (BOOL)isAlwaysAvailable
{
  return (LOBYTE(self->_stateFlags) >> 1) & 1;
}

- (BOOL)isRemovedSystemApp
{
  return 0;
}

- (BOOL)isBlocked
{
  return 0;
}

- (unint64_t)installType
{
  return self->_installType;
}

- (void)addStateFlag:(unint64_t)a3
{
  self->_stateFlags |= a3;
}

- (id)description
{
  v3 = NSString;
  bundleIdentifier = self->_bundleIdentifier;
  if ([(_LSApplicationState *)self isValid]) {
    id v5 = &stru_1ECB1A570;
  }
  else {
    id v5 = @"INVALID";
  }
  if ([(_LSApplicationState *)self isPlaceholder]) {
    uint64_t v6 = @"placeholder";
  }
  else {
    uint64_t v6 = &stru_1ECB1A570;
  }
  if ([(_LSApplicationState *)self isInstalled]) {
    uint64_t v7 = @"installed";
  }
  else {
    uint64_t v7 = &stru_1ECB1A570;
  }
  if ([(_LSApplicationState *)self isBlocked]) {
    uint64_t v8 = @"(blocked)";
  }
  else {
    uint64_t v8 = &stru_1ECB1A570;
  }
  if ([(_LSApplicationState *)self isRemovedSystemApp]) {
    v9 = @"(removedSystemApp)";
  }
  else {
    v9 = &stru_1ECB1A570;
  }
  BOOL v10 = [(_LSApplicationState *)self isRestricted];
  v11 = @"(restricted)";
  if (!v10) {
    v11 = &stru_1ECB1A570;
  }
  return (id)[v3 stringWithFormat:@"%@ <%@%@%@ %@%@%@>", bundleIdentifier, v5, v6, v7, v8, v9, v11];
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

@end