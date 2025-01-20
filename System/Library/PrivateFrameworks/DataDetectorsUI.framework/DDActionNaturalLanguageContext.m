@interface DDActionNaturalLanguageContext
- (NSArray)associatedResults;
- (NSString)bundleIdentifier;
- (NSString)leadingText;
- (NSString)trailingText;
- (__DDResult)result;
- (void)dealloc;
- (void)setAssociatedResults:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setLeadingText:(id)a3;
- (void)setResult:(__DDResult *)a3;
- (void)setTrailingText:(id)a3;
@end

@implementation DDActionNaturalLanguageContext

- (void)setResult:(__DDResult *)a3
{
  result = self->_result;
  if (result != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      result = self->_result;
    }
    if (result) {
      CFRelease(result);
    }
    self->_result = a3;
  }
}

- (__DDResult)result
{
  return self->_result;
}

- (void)dealloc
{
  result = self->_result;
  if (result) {
    CFRelease(result);
  }
  v4.receiver = self;
  v4.super_class = (Class)DDActionNaturalLanguageContext;
  [(DDActionNaturalLanguageContext *)&v4 dealloc];
}

- (NSString)leadingText
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLeadingText:(id)a3
{
}

- (NSString)trailingText
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTrailingText:(id)a3
{
}

- (NSArray)associatedResults
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAssociatedResults:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedResults, 0);
  objc_storeStrong((id *)&self->_trailingText, 0);
  objc_storeStrong((id *)&self->_leadingText, 0);
}

@end