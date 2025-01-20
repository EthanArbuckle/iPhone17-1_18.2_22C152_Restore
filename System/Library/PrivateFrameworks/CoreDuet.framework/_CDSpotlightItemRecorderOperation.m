@interface _CDSpotlightItemRecorderOperation
@end

@implementation _CDSpotlightItemRecorderOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end