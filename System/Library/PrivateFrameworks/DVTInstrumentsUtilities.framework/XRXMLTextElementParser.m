@interface XRXMLTextElementParser
- (void)_handleCompletion;
@end

@implementation XRXMLTextElementParser

- (void)_handleCompletion
{
  parent = self->super.super.parent;
  [self elementName:a2 value:v2 value2:v3 value3:v4];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [parent setValue:self forElementName:v9];
}

@end