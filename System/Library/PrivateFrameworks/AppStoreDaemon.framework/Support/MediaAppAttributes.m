@interface MediaAppAttributes
@end

@implementation MediaAppAttributes

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchBundleID, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_platformAttributesDict, 0);
  objc_storeStrong((id *)&self->_platformAttributes, 0);
}

@end