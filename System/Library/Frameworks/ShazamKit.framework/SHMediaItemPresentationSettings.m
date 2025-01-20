@interface SHMediaItemPresentationSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)openResultInBrowserOnFailure;
- (SHMediaItemPresentationSettings)initWithCoder:(id)a3;
- (SHMediaItemPresentationSettings)initWithSettings:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SHMediaItemPresentationSettings

- (SHMediaItemPresentationSettings)initWithSettings:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SHMediaItemPresentationSettings;
  v5 = [(SHMediaItemPresentationSettings *)&v8 init];
  if (v5)
  {
    v6 = [v4 valueForKey:@"openResultInBrowserOnFailure"];
    v5->_openResultInBrowserOnFailure = [v6 BOOLValue];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SHMediaItemPresentationSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SHMediaItemPresentationSettings *)self initWithSettings:MEMORY[0x263EFFA78]];
  char v6 = [v4 decodeBoolForKey:@"openResultInBrowserOnFailure"];

  v5->_openResultInBrowserOnFailure = v6;
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[SHMediaItemPresentationSettings openResultInBrowserOnFailure](self, "openResultInBrowserOnFailure"), @"openResultInBrowserOnFailure");
}

- (BOOL)openResultInBrowserOnFailure
{
  return self->_openResultInBrowserOnFailure;
}

@end