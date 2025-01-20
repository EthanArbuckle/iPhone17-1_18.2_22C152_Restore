@interface AUViewController
- (NSExtensionContext)context;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)setContext:(id)a3;
@end

@implementation AUViewController

- (void)beginRequestWithExtensionContext:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AUViewController;
  id v4 = a3;
  [(AUViewController *)&v5 beginRequestWithExtensionContext:v4];
  -[AUViewController setContext:](self, "setContext:", v4, v5.receiver, v5.super_class);
}

- (NSExtensionContext)context
{
  return (NSExtensionContext *)objc_getProperty(self, a2, 976, 1);
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end