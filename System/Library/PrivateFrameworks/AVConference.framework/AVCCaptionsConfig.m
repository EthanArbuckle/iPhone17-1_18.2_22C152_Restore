@interface AVCCaptionsConfig
+ (BOOL)isValidUsage:(unsigned __int8)a3;
+ (id)stringFromUsage:(unsigned __int8)a3;
- (NSLocale)locale;
- (id)description;
- (unsigned)usage;
- (void)dealloc;
- (void)setLocale:(id)a3;
- (void)setUsage:(unsigned __int8)a3;
@end

@implementation AVCCaptionsConfig

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)AVCCaptionsConfig;
  [(AVCCaptionsConfig *)&v3 dealloc];
}

+ (id)stringFromUsage:(unsigned __int8)a3
{
  if ((a3 - 1) > 2) {
    objc_super v3 = "Unknown";
  }
  else {
    objc_super v3 = off_1E6DB5978[(char)(a3 - 1)];
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%s(%hhu)", v3, a3);
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)AVCCaptionsConfig;
  return (id)[NSString stringWithFormat:@"{ %@ locale=%@ usage=%@ }", -[AVCCaptionsConfig description](&v3, sel_description), self->_locale, +[AVCCaptionsConfig stringFromUsage:](AVCCaptionsConfig, "stringFromUsage:", self->_usage)];
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (unsigned)usage
{
  return self->_usage;
}

- (void)setUsage:(unsigned __int8)a3
{
  self->_usage = a3;
}

+ (BOOL)isValidUsage:(unsigned __int8)a3
{
  return (a3 - 1) < 3;
}

@end