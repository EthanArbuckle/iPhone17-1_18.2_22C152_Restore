@interface XRXMLCollapsedStringElementParser
- (void)_handleCompletion;
@end

@implementation XRXMLCollapsedStringElementParser

- (void)_handleCompletion
{
  parent = self->super.super.parent;
  [self collapsedStringValue:a2 withOptions:v2 withLocale:v3 withCollapseWhitespace:v4];
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  v11 = [self elementName:v7 withValue:v8 forKey:v9];
  [parent setValue:v12 forElementName:(uint64_t)v14];
}

@end