@interface XRXMLBooleanElementParser
- (void)_handleCompletion;
@end

@implementation XRXMLBooleanElementParser

- (void)_handleCompletion
{
  BOOL v5 = [self->super.accumulator rangeOfString:a2 options:v2 range:v3] == NSNotFound;
  parent = self->super.super.parent;
  [NSNumber numberWithBool:v5];
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  v14 = [self elementName:v10 withValue:v11 forKey:v12];
  [parent setValue:v15 forElementName:v17];
}

@end