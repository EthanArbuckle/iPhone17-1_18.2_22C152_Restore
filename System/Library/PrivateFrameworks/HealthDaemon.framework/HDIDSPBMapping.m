@interface HDIDSPBMapping
@end

@implementation HDIDSPBMapping

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseClass, 0);

  objc_storeStrong((id *)&self->_requestClass, 0);
}

@end