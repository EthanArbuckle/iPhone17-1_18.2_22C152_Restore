@interface MediaApp
@end

@implementation MediaApp

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_href, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end