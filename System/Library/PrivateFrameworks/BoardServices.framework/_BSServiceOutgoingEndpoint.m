@interface _BSServiceOutgoingEndpoint
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation _BSServiceOutgoingEndpoint

- (unint64_t)hash
{
  size_t v3 = xpc_hash(self->_endpoint);
  return [(NSUUID *)self->_oneshot hash] ^ v3 ^ self->_targetPID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eDesc, 0);
  objc_storeStrong((id *)&self->_oneshot, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (xpc_object_t *)a3;
  BOOL v5 = xpc_equal(self->_endpoint, v4[1]) && BSEqualObjects() && self->_targetPID == *((_DWORD *)v4 + 8);

  return v5;
}

- (id)description
{
  return self->_eDesc;
}

@end