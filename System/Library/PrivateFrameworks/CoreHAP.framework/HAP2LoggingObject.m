@interface HAP2LoggingObject
- (id)description;
@end

@implementation HAP2LoggingObject

- (id)description
{
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%p", self);
  if (shouldLogPrivateInformation_onceToken != -1) {
    dispatch_once(&shouldLogPrivateInformation_onceToken, &__block_literal_global_21212);
  }
  if (!shouldLogPrivateInformation_shouldLogPrivateInformation)
  {
    uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%u", objc_msgSend(v2, "hash"));

    v2 = (void *)v3;
  }
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [v4 stringWithFormat:@"<%@: %@>", v6, v2];

  return v7;
}

@end