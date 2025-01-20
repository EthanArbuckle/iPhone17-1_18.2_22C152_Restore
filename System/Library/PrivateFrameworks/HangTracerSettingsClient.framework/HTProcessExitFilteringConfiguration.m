@interface HTProcessExitFilteringConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)configurationAllowingAllProcesses:(BOOL)a3 criticalProcesses:(BOOL)a4 processNames:(id)a5 reasons:(unint64_t)a6 subReasons:(id)a7;
+ (id)configurationFromPrefs:(id)a3;
- (BOOL)allowsAllProcesses;
- (BOOL)allowsCriticalProcesses;
- (BOOL)isEqual:(id)a3;
- (HTProcessExitFilteringConfiguration)initWithCoder:(id)a3;
- (NSArray)allowedProcessNames;
- (NSDictionary)allowedSubReasons;
- (id)description;
- (unint64_t)allowedReasons;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowedProcessNames:(id)a3;
- (void)setAllowedReasons:(unint64_t)a3;
- (void)setAllowedSubReasons:(id)a3;
- (void)setAllowsAllProcesses:(BOOL)a3;
- (void)setAllowsCriticalProcesses:(BOOL)a3;
@end

@implementation HTProcessExitFilteringConfiguration

+ (id)configurationAllowingAllProcesses:(BOOL)a3 criticalProcesses:(BOOL)a4 processNames:(id)a5 reasons:(unint64_t)a6 subReasons:(id)a7
{
  BOOL v9 = a4;
  BOOL v10 = a3;
  id v11 = a7;
  id v12 = a5;
  v13 = objc_alloc_init(HTProcessExitFilteringConfiguration);
  [(HTProcessExitFilteringConfiguration *)v13 setAllowsAllProcesses:v10];
  [(HTProcessExitFilteringConfiguration *)v13 setAllowsCriticalProcesses:v9];
  if (v12) {
    id v14 = v12;
  }
  else {
    id v14 = (id)MEMORY[0x263EFFA68];
  }
  [(HTProcessExitFilteringConfiguration *)v13 setAllowedProcessNames:v14];

  [(HTProcessExitFilteringConfiguration *)v13 setAllowedReasons:a6];
  [(HTProcessExitFilteringConfiguration *)v13 setAllowedSubReasons:v11];

  return v13;
}

+ (id)configurationFromPrefs:(id)a3
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HTProcessExitFilteringConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"allowsAllProcesses"];
  uint64_t v6 = [v4 decodeBoolForKey:@"allowsCriticalProcesses"];
  v7 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"allowedProcessNames"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowedReasons"];
  uint64_t v9 = objc_opt_class();
  BOOL v10 = [v4 decodeDictionaryWithKeysOfClass:v9 objectsOfClass:objc_opt_class() forKey:@"allowedSubReasons"];

  +[HTProcessExitFilteringConfiguration configurationAllowingAllProcesses:criticalProcesses:processNames:reasons:subReasons:](HTProcessExitFilteringConfiguration, "configurationAllowingAllProcesses:criticalProcesses:processNames:reasons:subReasons:", v5, v6, v7, [v8 unsignedLongLongValue], v10);
  id v11 = (HTProcessExitFilteringConfiguration *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL allowsAllProcesses = self->_allowsAllProcesses;
  id v6 = a3;
  [v6 encodeBool:allowsAllProcesses forKey:@"allowsAllProcesses"];
  [v6 encodeBool:self->_allowsCriticalProcesses forKey:@"allowsCriticalProcesses"];
  [v6 encodeObject:self->_allowedProcessNames forKey:@"allowedProcessNames"];
  uint64_t v5 = [NSNumber numberWithUnsignedLongLong:self->_allowedReasons];
  [v6 encodeObject:v5 forKey:@"allowedReasons"];

  [v6 encodeObject:self->_allowedSubReasons forKey:@"allowedSubReasons"];
}

- (id)description
{
  v2 = @"YES";
  if (self->_allowsAllProcesses) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  if (!self->_allowsCriticalProcesses) {
    v2 = @"NO";
  }
  return (id)[NSString stringWithFormat:@"all processes:      %@\ncritical processes: %@\nprocess names:      %@\nreasons:            %llu\nsub-reasons:        %@", v3, v2, self->_allowedProcessNames, self->_allowedReasons, self->_allowedSubReasons];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HTProcessExitFilteringConfiguration *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      BOOL v6 = [(HTProcessExitFilteringConfiguration *)self allowsAllProcesses];
      if (v6 == [(HTProcessExitFilteringConfiguration *)v5 allowsAllProcesses]
        && (BOOL v7 = [(HTProcessExitFilteringConfiguration *)self allowsCriticalProcesses],
            v7 == [(HTProcessExitFilteringConfiguration *)v5 allowsCriticalProcesses]))
      {
        uint64_t v9 = [(HTProcessExitFilteringConfiguration *)self allowedProcessNames];
        BOOL v10 = [(HTProcessExitFilteringConfiguration *)v5 allowedProcessNames];
        if ([v9 isEqual:v10]
          && (unint64_t v11 = [(HTProcessExitFilteringConfiguration *)self allowedReasons],
              v11 == [(HTProcessExitFilteringConfiguration *)v5 allowedReasons]))
        {
          id v12 = [(HTProcessExitFilteringConfiguration *)self allowedSubReasons];
          v13 = [(HTProcessExitFilteringConfiguration *)v5 allowedSubReasons];
          char v8 = [v12 isEqual:v13];
        }
        else
        {
          char v8 = 0;
        }
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = self->_allowsCriticalProcesses ^ self->_allowsAllProcesses;
  uint64_t v4 = [(NSArray *)self->_allowedProcessNames hash];
  allowedSubReasons = self->_allowedSubReasons;
  unint64_t v6 = v4 ^ self->_allowedReasons ^ v3;
  return v6 ^ [(NSDictionary *)allowedSubReasons hash];
}

- (BOOL)allowsAllProcesses
{
  return self->_allowsAllProcesses;
}

- (void)setAllowsAllProcesses:(BOOL)a3
{
  self->_BOOL allowsAllProcesses = a3;
}

- (BOOL)allowsCriticalProcesses
{
  return self->_allowsCriticalProcesses;
}

- (void)setAllowsCriticalProcesses:(BOOL)a3
{
  self->_allowsCriticalProcesses = a3;
}

- (NSArray)allowedProcessNames
{
  return self->_allowedProcessNames;
}

- (void)setAllowedProcessNames:(id)a3
{
}

- (unint64_t)allowedReasons
{
  return self->_allowedReasons;
}

- (void)setAllowedReasons:(unint64_t)a3
{
  self->_allowedReasons = a3;
}

- (NSDictionary)allowedSubReasons
{
  return self->_allowedSubReasons;
}

- (void)setAllowedSubReasons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedSubReasons, 0);

  objc_storeStrong((id *)&self->_allowedProcessNames, 0);
}

@end