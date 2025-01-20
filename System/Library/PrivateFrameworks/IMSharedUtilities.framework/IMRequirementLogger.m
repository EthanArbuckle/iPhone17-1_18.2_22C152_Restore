@interface IMRequirementLogger
+ (id)sharedInstance;
+ (void)__setSingleton__im:(id)a3;
- (BOOL)throwFailures;
- (IMRequirementFailed_t)requirementDidFail:(const char *)a3;
- (IMRequirementLogger)init;
- (const)categoryOverride;
- (id)description;
- (unsigned)loggingLevel;
- (void)dealloc;
- (void)setCategoryOverride:(const char *)a3;
- (void)setLoggingLevel:(unsigned __int8)a3;
- (void)setThrowFailures:(BOOL)a3;
- (void)updateSettingsFromUserDefaults;
@end

@implementation IMRequirementLogger

+ (void)__setSingleton__im:(id)a3
{
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A07E3258;
  block[3] = &unk_1E5A10168;
  block[4] = a1;
  if (qword_1EB4A6180 != -1) {
    dispatch_once(&qword_1EB4A6180, block);
  }
  v2 = (void *)qword_1E94FF4E8;

  return v2;
}

- (IMRequirementLogger)init
{
  v5.receiver = self;
  v5.super_class = (Class)IMRequirementLogger;
  v2 = [(IMRequirementLogger *)&v5 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_loggingLevel = 2;
    [(IMRequirementLogger *)v2 updateSettingsFromUserDefaults];
  }
  return v3;
}

- (void)updateSettingsFromUserDefaults
{
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  -[IMRequirementLogger setThrowFailures:](self, "setThrowFailures:", [v3 BOOLForKey:@"throw-requirement-failures"]);

  v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v6 = [v4 valueForKey:@"requirements-logging-level"];

  objc_super v5 = v6;
  if (v6)
  {
    [(IMRequirementLogger *)self setLoggingLevel:IMLoggingLevelFromString((uint64_t)v6)];
    objc_super v5 = v6;
  }
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)IMRequirementLogger;
  v4 = [(IMRequirementLogger *)&v8 description];
  if ([(IMRequirementLogger *)self throwFailures]) {
    objc_super v5 = @"YES";
  }
  else {
    objc_super v5 = @"NO";
  }
  id v6 = [v3 stringWithFormat:@"%@: throwFailures: %@, category override: %s", v4, v5, -[IMRequirementLogger categoryOverride](self, "categoryOverride")];

  return v6;
}

- (const)categoryOverride
{
  v2 = self;
  objc_sync_enter(v2);
  categoryOverride = v2->_categoryOverride;
  objc_sync_exit(v2);

  return categoryOverride;
}

- (void)setCategoryOverride:(const char *)a3
{
  obj = self;
  objc_sync_enter(obj);
  v4 = obj;
  categoryOverride = (char *)obj->_categoryOverride;
  if (categoryOverride)
  {
    free(categoryOverride);
    v4 = obj;
    obj->_categoryOverride = 0;
  }
  if (a3)
  {
    size_t v6 = strnlen(a3, 0x100uLL);
    v7 = (char *)malloc_type_malloc(v6 + 1, 0x870126A9uLL);
    objc_super v8 = strncpy(v7, a3, 0x100uLL);
    v4 = obj;
    obj->_categoryOverride = v8;
  }
  objc_sync_exit(v4);
}

- (void)dealloc
{
  categoryOverride = (char *)self->_categoryOverride;
  if (categoryOverride)
  {
    free(categoryOverride);
    self->_categoryOverride = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)IMRequirementLogger;
  [(IMRequirementLogger *)&v4 dealloc];
}

- (IMRequirementFailed_t)requirementDidFail:(const char *)a3
{
  objc_super v5 = [(IMRequirementLogger *)self categoryOverride];
  if (v5) {
    a3 = v5;
  }
  BOOL v6 = [(IMRequirementLogger *)self throwFailures];
  unsigned int v7 = [(IMRequirementLogger *)self loggingLevel];
  uint64_t v8 = 256;
  if (!v6) {
    uint64_t v8 = 0;
  }
  unint64_t v9 = v8 | ((unint64_t)v7 << 16) | 1;
  v10 = (char *)a3;
  result.var1 = v9;
  result.var2 = BYTE1(v9);
  result.var3 = BYTE2(v9);
  result.var0 = v10;
  return result;
}

- (unsigned)loggingLevel
{
  return self->_loggingLevel;
}

- (void)setLoggingLevel:(unsigned __int8)a3
{
  self->_loggingLevel = a3;
}

- (BOOL)throwFailures
{
  return self->_throwFailures;
}

- (void)setThrowFailures:(BOOL)a3
{
  self->_throwFailures = a3;
}

@end