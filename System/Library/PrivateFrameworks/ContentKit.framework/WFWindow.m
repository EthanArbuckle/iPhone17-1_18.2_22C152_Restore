@interface WFWindow
+ (BOOL)supportsSecureCoding;
+ (id)allWindows;
+ (id)allWindowsForBundleIdentifiers:(id)a3;
- (BOOL)boundsLoaded;
- (BOOL)isHidden;
- (BOOL)isOnScreen;
- (CGRect)bounds;
- (CGSize)size;
- (NSNumber)windowIndex;
- (NSString)applicationName;
- (NSString)bundleIdentifier;
- (NSString)name;
- (WFImage)image;
- (WFWindow)initWithCoder:(id)a3;
- (int)processIdentifier;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBoundsLoaded:(BOOL)a3;
- (void)setBoundsNeedReloading;
- (void)setWindowIndex:(id)a3;
@end

@implementation WFWindow

+ (id)allWindowsForBundleIdentifiers:(id)a3
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)allWindows
{
  return (id)MEMORY[0x263EFFA68];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowIndex, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (void)setBoundsLoaded:(BOOL)a3
{
  self->_boundsLoaded = a3;
}

- (BOOL)boundsLoaded
{
  return self->_boundsLoaded;
}

- (void)setWindowIndex:(id)a3
{
}

- (NSNumber)windowIndex
{
  return self->_windowIndex;
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WFWindow;
  [(WFWindow *)&v2 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFWindow *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  v6 = [(WFWindow *)self applicationName];
  [v4 encodeObject:v6 forKey:@"applicationName"];

  v7 = objc_msgSend(NSNumber, "numberWithInt:", -[WFWindow processIdentifier](self, "processIdentifier"));
  [v4 encodeObject:v7 forKey:@"processIdentifier"];

  id v8 = [(WFWindow *)self windowIndex];
  [v4 encodeObject:v8 forKey:@"windowIndex"];
}

- (WFWindow)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFWindow *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationName"];
    applicationName = v5->_applicationName;
    v5->_applicationName = (NSString *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"processIdentifier"];
    v5->_processIdentifier = [v10 unsignedIntValue];

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"windowIndex"];
    windowIndex = v5->_windowIndex;
    v5->_windowIndex = (NSNumber *)v11;

    v13 = v5;
  }

  return v5;
}

- (WFImage)image
{
  return self->_image;
}

- (BOOL)isHidden
{
  return 0;
}

- (BOOL)isOnScreen
{
  return 1;
}

- (CGSize)size
{
  [(WFWindow *)self bounds];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)setBoundsNeedReloading
{
  self->_boundsLoaded = 0;
}

- (CGRect)bounds
{
  if (!self->_boundsLoaded) {
    self->_boundsLoaded = 1;
  }
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSString)bundleIdentifier
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end