@interface CSEndpointerSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)disableEndpointer;
- (CSEndpointerSettings)initWithCoder:(id)a3;
- (CSEndpointerSettings)initWithDisableEndpointer:(BOOL)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CSEndpointerSettings

- (BOOL)disableEndpointer
{
  return self->_disableEndpointer;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL disableEndpointer = self->_disableEndpointer;
  id v4 = a3;
  id v5 = +[NSNumber numberWithBool:disableEndpointer];
  [v4 encodeObject:v5 forKey:@"CSEndpointerSettings:::disableEndpointer"];
}

- (CSEndpointerSettings)initWithCoder:(id)a3
{
  id v4 = [a3 decodeBoolForKey:@"CSEndpointerSettings:::disableEndpointer"];
  return [(CSEndpointerSettings *)self initWithDisableEndpointer:v4];
}

- (id)description
{
  v3 = +[NSMutableString string];
  id v4 = v3;
  if (self->_disableEndpointer) {
    CFStringRef v5 = @"YES";
  }
  else {
    CFStringRef v5 = @"NO";
  }
  [v3 appendFormat:@"[BOOL disableEndpointer = %@]", v5];
  return v4;
}

- (CSEndpointerSettings)initWithDisableEndpointer:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSEndpointerSettings;
  result = [(CSEndpointerSettings *)&v5 init];
  if (result) {
    result->_BOOL disableEndpointer = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end