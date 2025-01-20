@interface IDSDestinationStrings
- (IDSDestinationStrings)initWithCoder:(id)a3;
@end

@implementation IDSDestinationStrings

- (IDSDestinationStrings)initWithCoder:(id)a3
{
  v5 = objc_msgSend_decodeObjectForKey_(a3, a2, @"kIDSDestinationStringSetKey", v3);
  objc_msgSend_destinationWithStrings_(IDSDestination, v6, (uint64_t)v5, v7);
  v8 = (IDSDestinationStrings *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end