@interface ExtensionRequestMetadata
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation ExtensionRequestMetadata

- (unint64_t)hash
{
  return (unint64_t)[(NSUUID *)self->_requestIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v5 = [(NSUUID *)self->_requestIdentifier isEqual:v4[3]];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEvent, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end