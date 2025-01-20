@interface CAMSubjectAreaChangeMonitoringCommand
- (BOOL)_isEnabled;
- (CAMSubjectAreaChangeMonitoringCommand)initWithCoder:(id)a3;
- (CAMSubjectAreaChangeMonitoringCommand)initWithSubjectAreaChangeMonitoringEnabled:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMSubjectAreaChangeMonitoringCommand

- (CAMSubjectAreaChangeMonitoringCommand)initWithSubjectAreaChangeMonitoringEnabled:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMSubjectAreaChangeMonitoringCommand;
  v4 = [(CAMCaptureCommand *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->__enabled = a3;
    v6 = v4;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMSubjectAreaChangeMonitoringCommand;
  v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[24] = [(CAMSubjectAreaChangeMonitoringCommand *)self _isEnabled];
  return v4;
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

- (void)executeWithContext:(id)a3
{
  id v4 = [a3 currentVideoDevice];
  objc_msgSend(v4, "setSubjectAreaChangeMonitoringEnabled:", -[CAMSubjectAreaChangeMonitoringCommand _isEnabled](self, "_isEnabled"));
}

- (CAMSubjectAreaChangeMonitoringCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMSubjectAreaChangeMonitoringCommand;
  v5 = [(CAMCaptureCommand *)&v8 init];
  if (v5)
  {
    v5->__enabled = [v4 decodeBoolForKey:@"CAMSubjectAreaChangeMonitoringEnabled"];
    objc_super v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMSubjectAreaChangeMonitoringCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMSubjectAreaChangeMonitoringCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), @"CAMSubjectAreaChangeMonitoringEnabled");
}

@end